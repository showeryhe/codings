/* initialzation of the parameters */
p:=2;
n:=16;
q:=4;
k:=4;

Z:=Integers();

/* the base fields */
Fq<t>:=FiniteField(p, n div (2*k));
Fq2:=ext<Fq|2>;
Fq2X<X>:=PolynomialRing(Fq2);

/* initialization of the field */

j:=0;
while j eq 0 do
	a:=Random(Fq2);
	h0<X>:=Fq2X!X^2+a;
	h1<X>:=Fq2X!1;
	T:=Factorization(h1*X^q+h0);	
	i:=0;
	while i lt #T and j eq 0 do
		i:=i+1;
		if Degree(T[i][1]) eq k then
			Ik<X>:=T[i][1];
			j:=j+1;
		end if;
	end while;
end while;

gen:=rep{X+a: a in Fq2|IsPrimitive(ext<Fq2|Ik>!X+a)};

Fq2int:=function(x)
	z:=[Integers()!y: y in Eltseq(x)];
	return Seqint(z, p);
end function;

Fq2Xint:=function(f)
	return Seqint([Fq2int(x): x in Coefficients(Fq2X!(f mod Ik))], q^2);
end function;

LOG:=Matrix(Integers(), p^n, 2, []);

/* Initialization of consts in Fq2 */
d:=(p^n-1) div (q^2-1);
beta:=Fq2X!(gen^d mod Ik);
for i in [1..q^2-1] do
	LOG[Fq2Xint(beta^i), 1]:=i*d;
end for;

/* the initialization of M */
g:=Fq2.1;
M:=[* *];
/* TYPE I */
for x in Fq2 do
	for y in Fq2 do
		if (not x in Fq) and (not y in Fq) and (x*y ne One(Fq2)) then
				M:=Append(M, Matrix(Fq2, 2, 2, [1, x, y, 1]));
		end if;
	end for;
end for;
/* TYPE III and IV */
for x in Fq do
	for y in Fq do
			M:=Append(M, Matrix(Fq2, 2, 2, [0, 1, g, y*g]));
			M:=Append(M, Matrix(Fq2, 2, 2, [0, 1, 1+x*g, y*g]));
			M:=Append(M, Matrix(Fq2, 2, 2, [1, 0, x*g, g]));
			M:=Append(M, Matrix(Fq2, 2, 2, [1, 0, x*g, 1+y*g]));
			if x ne Zero(Fq) and y ne Zero(Fq) and x ne y then
				M:=Append(M, Matrix(Fq2, 2, 2, [1, x, g, y*g]));
			end if;
	end for;
end for;

MC:=Matrix(Fq2, #M, 1, []);
/* Initilization of H */
H:=Matrix(Z, #M, q^2+1, []); // The last column is used to compute
i:=0;
while i lt #M do
	i:=i+1;
	m:=M[i];
	MC[i,1]:=One(Fq2);
	/* dealing with (x:1) in PG(1, q) */
	for x in Fq do
		if -m[2,1]*x+m[1,1] ne 0 then
			t:=-(m[2,2]*x-m[1,2])/(-m[2,1]*x+m[1,1]);
			H[i,Fq2int(t)+1]:=1;
			MC[i,1]:=MC[i,1]*(-m[2,1]*x+m[1,1]);
		else
			MC[i,1]:=MC[i,1]*(-(m[2,2]*x-m[1,2]));
		end if;
	end for;
	/* the (1:0) in PG(1, q) */
	if m[2,1] ne 0 then
		t:=m[2,2]/m[2,1];
		H[i,Fq2int(t)+1]:=1;
		MC[i,1]:=MC[i,1]*(-m[2,1]);
	else
		MC[i,1]:=MC[i,1]*(-m[2,2]);
	end if;
end while;

/* construction of system of equation
 * in order to get the Log of linear polynomials
 */
 
C:=Matrix(Integers(p^n-1), q^2+1, q^2+1, []);	// the matrix of coefficients
const:=Matrix(Integers(p^n-1), q^2+1, 1, []);

// column matrix of logarithm of constants Log(Fq2k, elt in Fq2)

i:=0;	// to go through all m's
r:=0;	// the mark of rank

while r lt q^2+1 and i lt #M do
	i:=i+1;
	v:=Matrix(Z, 1, q^2+1, [<1, q^2+1, -1>]);
	m:=M[i]; a:=m[1,1]; b:=m[1,2]; c:=m[2,1]; d:=m[2,2];
	N:=(a^q*h0+b^q*h1)*(c*X+d)-(a*X+b)*(c^q*h0+d^q*h1); // for convenience to be defined as function
	F:=Factorization(N);
	j:=0;
	while j lt #F do
		j:=j+1;
		if Degree(F[j][1]) eq 1 then
			v[1, Fq2Xint(F[j][1]-X)+1]:=Z!F[j][2];
		else j:=#F+1; // no linear factorization then return
		end if;
	end while;
	if j eq #F then // found linear factorization, then check for the linear independer i in [1..q^2+1] do // Sparse Matrix
		for tmp in [1..q^2+1] do	
			C[r+1, tmp]:=v[1, tmp]-H[i,tmp];
		end for;
		if Rank(C) eq r then
			for tmp in [1..q^2+1] do
				C[r+1, tmp]:=0;
			end for;
		else
			r:=r+1;
			const[r, 1]:=-LOG[Fq2int(LeadingCoefficient(N)), 1]+LOG[Fq2int(MC[i, 1]), 1]+LOG[Fq2int(LeadingCoefficient(h1)),1];
		end if;
	end if;
end while;

Pri:=function(C, const, gen)
	Ctmp:=C;
	ctmp:=const;
	tmp:=Fq2Xint(gen-X)+1;
	for i in [1..q^2+1] do
		ctmp[i, 1]:=ctmp[i, 1]-Ctmp[i, tmp];
	end for;
	RemoveColumn(~Ctmp, tmp);
	return Ctmp, ctmp;
end function;

Gaussian:=function(C, const)
	Ctmp:=C;
	ctmp:=const;
	i:=0;
	while i lt NumberOfColumns(C)-1 do
		i:=i+1;
		j:=i-1;
		while j lt NumberOfColumns(C) do
			j:=j+1;
			P:=Ctmp[j, i];
			if P ne 0 then
				k:=j;
				j:=NumberOfColumns(C);
			end if;
		end while;
		if P eq 0 then
			print "non-invertible";
			i:=NumberOfColumns(C)+1;
		else
			SwapRows(~Ctmp, i, k);
			SwapRows(~ctmp, i, k);
			print "to eliminate";
			print Ctmp;
			print "====";			
			P:=Ctmp[i, i];
			for tmp in [i+1..NumberOfRows(C)] do
				c:=Ctmp[tmp, i];
				if c ne 0 and IsUnit(P) then
					Ctmp[tmp]:=Ctmp[tmp] - c*(P^(-1))*Ctmp[i];
					ctmp[tmp,1]:=ctmp[tmp,1] - c*(P^-1)*ctmp[i,1];
				elif c ne 0 then
					Ctmp[tmp]:=P*Ctmp[tmp] - c*Ctmp[i];
					ctmp[tmp,1]:=P*ctmp[tmp,1] - c*ctmp[i,1];
				end if;
			end for;
		end if;
	end while;
	return Ctmp, ctmp;
end function;
			
if r gt q^2-1 then
	C;
	Ctmp, ctmp:=Gaussian(C, const);
else
	print "fail";
end if;

