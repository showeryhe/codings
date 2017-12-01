from nltk.book import*

def pct(word, text):
	fdist = FreqDist(text)
	pct = fdist.freq(word) * 100
	return pct
	
print(pct(text1, 'the'))
