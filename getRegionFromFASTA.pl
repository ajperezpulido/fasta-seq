#!/usr/bin/perl
use strict;

my $p1 = $ARGV[1];
my $p2 = $ARGV[2];
my $seq;

open in, $ARGV[0];
while (<in>) {
  chomp;

  if (/^>/) {
    print;
    print " $p1-$p2\n";
  } else {
    $_ =~ s/[ -0-9]//g;
    $seq .= $_;
  }
}
close in;

my $len = $p2 - $p1 + 1;
my $pat = substr $seq, $p1-1, $len;
print "$pat\n";

exit;
