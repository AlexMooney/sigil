.PHONY: all

all: sigil.png

%.png: %.pov
	povray $<
