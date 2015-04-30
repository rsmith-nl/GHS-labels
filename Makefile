# Makefile for labels for chemicals
.SUFFIXES: .tex .pdf
.PHONY: clean backup

# All the LaTeX source files. Copy new files from template.tex,
# and add them here.
TEXF=ethanol.tex

# Targets, PostScript and PDF.
PDF=$(TEXF:.tex=.pdf)

all: $(PDF)

clean::
	rm -f $(PDF) *.aux *.log *.out

# Rule to create PDF files.
.tex.pdf:
	pdflatex --interaction batchmode $<
	rm -f $*.aux $*.log $*.out
