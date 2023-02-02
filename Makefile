slides: images html

IMAGESIN=$(wildcard notebooks/images/*)
IMAGESOUT=$(patsubst notebooks/%,slides/%,$(IMAGESIN))

images: $(IMAGESOUT)

$(IMAGESOUT): slides/images/%: notebooks/images/%
	mkdir -p slides/images
	cp $< $@

NBFILES=$(wildcard notebooks/*-*.ipynb)
HTMLFILES=$(patsubst notebooks/%.ipynb,slides/%.slides.html,$(NBFILES))

html: $(HTMLFILES)

$(HTMLFILES): slides/%.slides.html: notebooks/%.ipynb
	bash scripts/generate_slides.sh $<

clean:
	rm -rf slides/
