set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'BlockProbsPS.eps'

set xrange [0:10]
set yrange [10**(-5):0.33]

set ylabel "B(3,{/Symbol m})" font "Helvetica,16"
set xlabel "{/Symbol m}^{-1}" font "Helvetica,16"

set logscale y

set multiplot

#red solid
set style line 1 lt 1 lw 2 lc rgb "#0000ff"
#blue dashed
set style line 3 lt 3 lw 2 lc rgb "#0000ff"

# rho:
r(x) = x/15
# p_0 star:
p(x) = 1/(1+3*r(x)+((3*r(x))**2)/2+((3*r(x))**3)/6*(1-(r(x)**4))/(1-r(x)))
# p_s+K star:
f(x) = (9/2)*(r(x)**6)*p(x)

plot "blockProbsPS.txt" using 1:3 pt 1 title "Simulation", \
     f(x) with lines ls 1 title "Reference"

unset multiplot