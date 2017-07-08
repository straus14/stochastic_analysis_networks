BEGIN {}
{
    if ($3 == "dropped:count") {
#	print $4;
	dropped = $4;
    }
    if ($3 == "created:last") {
#	print $4;
	num = $4;
    }
    if ($3 == "mu") {
#	print $4;
	mu = $4;
    }
}
END {
    printf "%+6s : %-12s\n", mu, dropped/num;
}
