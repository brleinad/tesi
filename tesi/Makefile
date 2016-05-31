top_tesi.pdf: *.tex *.bib *.aux
	pdflatex top_tesi.tex

bib: *.tex *.bib *.bib
	pdflatex top_tesi.tex
	bibtex top_tesi.aux
	pdflatex top_tesi.tex
	pdflatex top_tesi.tex

clean: 
	rm -rf *.bbl *.lof *.aux *.pdf *.log *.toc

