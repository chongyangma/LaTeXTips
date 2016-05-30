DRAFT = draft
FINAL = final

BIB_SOURCES = paper.bib

PAPER_SOURCES = paper.tex abstract.tex tips.tex
DRAFT_SOURCES = draft.tex $(PAPER_SOURCES)
FINAL_SOURCES = final.tex $(PAPER_SOURCES)

TEX = pdflatex -interaction nonstopmode
BIB = bibtex

all: $(DRAFT).pdf $(FINAL).pdf

$(DRAFT).pdf : $(DRAFT_SOURCES) $(DRAFT).bbl
	$(TEX) $(DRAFT)
	$(TEX) $(DRAFT)

$(DRAFT).aux : $(DRAFT_SOURCES)
	$(TEX) $(DRAFT)

$(DRAFT).bbl : $(DRAFT_SOURCES) $(BIB_SOURCES) $(DRAFT).aux
	$(BIB) $(DRAFT)

$(FINAL).pdf : $(FINAL_SOURCES) $(FINAL).bbl
	$(TEX) $(FINAL)
	$(TEX) $(FINAL)

$(FINAL).aux : $(FINAL_SOURCES)
	$(TEX) $(FINAL)

$(FINAL).bbl : $(FINAL_SOURCES) $(BIB_SOURCES) $(FINAL).aux
	$(BIB) $(FINAL)

clean:
	rm -f $(DRAFT).pdf $(DRAFT).out $(DRAFT).dvi $(DRAFT).bbl $(DRAFT).aux $(DRAFT).blg $(DRAFT).log $(FINAL).pdf $(FINAL).out $(FINAL).dvi $(FINAL).bbl $(FINAL).aux $(FINAL).blg $(FINAL).log
