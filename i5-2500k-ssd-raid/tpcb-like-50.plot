set terminal postscript eps size 8,4 enhanced color font 'Helvetica,12' linewidth 1
set output 'tpcb-like-50.eps'

set title "transactions per second (tpcb-like scale 50)" font ",14"
set ylabel "TPS"
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics

set yrange [0:*]

set bmargin at screen 0.10

set key out horiz bot center

# set grid xtics lc rgb "#888888" lw 2 lt 0

plot "tpcb-like-50.csv" using 2:xtic(1) title "flush" linecolor rgb "#CC0000", \
                   '' using 3 title "noflush" linecolor rgb "#000080"
