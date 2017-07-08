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
}
END {
    print dropped/num;
}