# Load in C1.fasta
open(FIN, "C1.fasta") or die "Cannot find C1.fasta\n";
open(FOUT,">C1.json");

print FOUT "{\"data\":\"";
$n = 0;
while ($s = <FIN>) {
	$s =~ />(.*)/;
	$t = $1;
	$t =~ s/\s//g;
	$seq = <FIN>;
	$seq =~ s/\s//g;
	if (length($seq) != 100){
		die "Please ensure there are 100 sites in C1.fasta!\n";
	}
	print FOUT "\t\t<sequence spec='Sequence' totalcount='4' taxon='$t' value='$seq'/>\n";
	$n++;
}
print FOUT "\"}\n";

# Check rows and columns
if ($n != 20){
	die "Please ensure there are 20 taxa in C1.fasta!\n";
}

close FOUT;
close FIN;

print STDERR "Saved to C1.json\n";

