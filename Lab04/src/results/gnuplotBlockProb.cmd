set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'BlockProbs.eps'

set ylabel "B(3,{/Symbol m})" font "Helvetica,16"
set xlabel "sorted repetitions" font "Helvetica,16"

plot "blockProbs.txt"
