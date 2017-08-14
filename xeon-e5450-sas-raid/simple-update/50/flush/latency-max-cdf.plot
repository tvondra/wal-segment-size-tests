set terminal postscript eps size 8,4 enhanced color dl 3.0 font 'Helvetica,12' linewidth 1
set output 'latency-max-cdf.eps'

set title "latency maximum CDF (simple-update flush scale 50)" font ",14"
set ylabel "percent (%)"
set bmargin at screen 0.10
set key out horiz bot center

set grid xtics lc rgb "#888888" lw 2 lt 0

set logscale x

plot './1/percentiles.csv' using 5:1 title '1MB' with lines lt 1 lc "red" lw 2, \
     './2/percentiles.csv' using 5:1 title '2MB' with lines lt 1 lc "green" lw 2, \
     './4/percentiles.csv' using 5:1 title '4MB' with lines lt 1 lc "blue" lw 2, \
     './8/percentiles.csv' using 5:1 title '8MB' with lines lt 1 lc "orange" lw 2, \
     './16/percentiles.csv' using 5:1 title '16MB' with lines lt 1 lc "black" lw 2, \
     './32/percentiles.csv' using 5:1 title '32MB' with lines lt 0 lc "red" lw 2, \
     './64/percentiles.csv' using 5:1 title '64MB' with lines lt 0 lc "green" lw 2, \
     './128/percentiles.csv' using 5:1 title '128MB' with lines lt 0 lc "blue" lw 2, \
     './256/percentiles.csv' using 5:1 title '256MB' with lines lt 0 lc "orange" lw 2, \
     './512/percentiles.csv' using 5:1 title '512MB' with lines lt 0 lc "black" lw 2, \
     './1024/percentiles.csv' using 5:1 title '1024MB' with lines lt 0 lc "pink" lw 2
