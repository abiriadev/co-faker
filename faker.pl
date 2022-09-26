#!/bin/env perl
use feature qw[say];

my @counts = (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 4, 4, 9, 11);
my $range = 1500;
my $foldername = "seeds";

system("rm -rf $foldername");
system("mkdir -p $foldername");

system(qw[rm -rf .git]);
system(qw[git init]);

for my $i (1..$range) {
	my $count = $counts[rand @counts];

	for (1..$count) {
		my $filename = "seeds/${i}-$_";

		say $filename;

		system("touch $filename");

		system("git add $filename");
		system("git commit -m \"$filename\" --date=\"$i day ago\"");
	}
}
