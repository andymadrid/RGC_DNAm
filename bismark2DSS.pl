# script to convert bismark coverage output file to format for DSS
open (IN1,$ARGV[0]);
while (<IN1>) {
$file = $_;
$file =~ s/\n//g;
$file =~ /([\d]+)\./;
$fh = $1;
$out = "$fh\.cov\.forDSS\.txt";
open (IN2,$file);
open (OUT,">$out");
print OUT "chr\tpos\tN\tX\n";
while (<IN2>) {
@l = split;
$tot = $l[4]+$l[5];
print OUT "$l[0]\t$l[1]\t$tot\t$l[4]\n";
}
close OUT;
}
