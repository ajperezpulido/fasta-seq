#!/usr/bin/perl
use strict;

my $pat = $ARGV[0];
my $flag;

open file, $ARGV[1];
while (<file>) {
  chomp;

  if (/^>([^ \|\t]+)/) {
    my $id = $1;
    $flag = 0;
    if ($id eq $pat) {
      print ">$id\n";
      $flag = 1;
    }
  } elsif ($flag == 1) {
    print;
    print "\n";
  }
}
close file;
