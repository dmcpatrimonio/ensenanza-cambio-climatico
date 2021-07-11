# This Makefile provides sensible defaults for projects
# based on Pandoc and Jekyll, such as:
# - Dockerized runs of Pandoc and Jekyll with separate
#   variables for version numbers = easy update!
# - Lean CSL checkouts without committing to the repo
# - Website built on the gh-pages branch
# - Bibliography path compatible with Jekyll-Scholar

# Global variables and setup {{{1
# ================
VPATH = _lib
vpath %.bib _bibliography
vpath %.yaml .:_spec
vpath default.% .:_lib
vpath reference.% .:_lib

DEFAULTS := defaults.yaml _metadata.yaml references.bib
JEKYLL-VERSION := 4.2.0
PANDOC-VERSION := 2.14
JEKYLL/PANDOC := docker run --rm -v "`pwd`:/srv/jekyll" \
	-h "0.0.0.0:127.0.0.1" -p "4000:4000" \
	palazzo/jekyll-tufte:$(JEKYLL-VERSION)-$(PANDOC-VERSION)
PANDOC/CROSSREF := docker run --rm -v "`pwd`:/data" \
	-u "`id -u`:`id -g`" pandoc/crossref:$(PANDOC-VERSION)
PANDOC/LATEX := docker run --rm -v "`pwd`:/data" \
	-u "`id -u`:`id -g`" palazzo/pandoc-ebgaramond:$(PANDOC-VERSION)

# Targets and recipes {{{1
# ===================
%.pdf : %.md references.bib _latex.yaml
	$(PANDOC/LATEX) -d _latex.yaml \
		-M _metadata.yaml -o $@ $<
	@echo "$< > $@"

%.docx : %.md $(DEFAULTS)
	$(PANDOC/CROSSREF) -d _spec/defaults.yaml \
		-M _metadata.yaml -o $@ $<
	@echo "$< > $@"

.PHONY : _site
_site :
	@$(JEKYLL/PANDOC) /bin/bash -c \
	"chmod 777 /srv/jekyll && jekyll build"

# Install and cleanup {{{1
# ===================
.PHONY : serve
serve :
	@$(JEKYLL/PANDOC) jekyll serve

# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
