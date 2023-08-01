tex_source:=presentation.tex
presentation:=${tex_source:.tex=.pdf}

.PHONY: all
all: ${presentation}

${presentation}: ${tex_source}
	xelatex --shell-escape ${tex_source}

.PHONY: clean
clean:
	rm -vf ${tex_source:.tex=}.{pdf,log,aux,lof,nav,out,snm,toc,vrb}

.PHONY: distclean
distclean: clean
	rm -vrf ./_minted-presentation

.PHONY: re
re: clean all
