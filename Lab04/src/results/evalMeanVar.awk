BEGIN {}
{
    ++i;
    val[i] = $1;
    sum += val[i];
    if (i>1) {
	if (val[i] < min) {
	    min = val[i];
	}
	else 
	if (val[i] > max) {
	    max = val[i];
	}  
    }
    else {
	min = val[i];
	max = val[i];
    }	
}
END {
    print "Found ",i," values";
    mean = sum/i;
    print "Min=",min," Mean=",mean," Max=",max;
    for(j=1; j<=i;++j) {
	var += (val[i]-mean)*(val[i]-mean);
    }
    var /= (i-1);
    sigma = sqrt(var);
    print "Varianz=",var, " Sigma=",sigma;
}