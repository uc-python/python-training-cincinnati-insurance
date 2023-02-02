slides: html

NBFILES=$(wildcard notebooks/*-*.ipynb)
HTMLFILES=$(patsubst notebooks/%.ipynb,slides/%.slides.html,$(NBFILES))

html: $(HTMLFILES)

$(HTMLFILES): slides/%.slides.html: notebooks/%.ipynb
	bash scripts/generate_slides.sh $<

clean:
	rm -rf slides/
