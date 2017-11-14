#!/usr/bin/perl
use strict;

my %pat;
my $flag;
open in, $ARGV[0];
while (<in>) {
  chomp;

  $pat{$_} = 1;
}
close in;

open file, $ARGV[1];
while (<file>) {
  chomp;

  if (/^>([^ ]+) ?/) {
    my $id = $1;
    $flag = 0;
    if ($pat{$id}) {
      print ">$id\n";
      $flag = 1;
    }
  } elsif ($flag == 1) {
    print;
    print "\n";
  }
}
close file;
