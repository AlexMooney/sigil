# Model of Sigil, City of Doors

Some simple models to get a feel for what the sky would look like if you were standing in Sigil.

Looking from left to right animation (not yet in makefile):
```bash
for clk in $(seq 0 10 180); do povray -Osigil.${clk}.pov +k${clk} sigil.pov; done
```
