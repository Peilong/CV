PROJECT= cv
TEX=pdflatex
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
		$(BUILDTEX)
		$(BIBTEX) $(PROJECT)
		$(BUILDTEX)
		$(BUILDTEX)
		#dvipdf $(PROJECT).dvi

WEBTEX=$(TEX) -jobname=$(PROJECT)-web "\def\webcv{}\input{$(PROJECT).tex}"

# Website copy (email spelled out): cv-web.pdf -> peilong-website/static/files/cv.pdf
web:
		$(WEBTEX)
		$(BIBTEX) $(PROJECT)-web
		$(WEBTEX)
		$(WEBTEX)

clean-all:
		rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~

clean:
		rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~

