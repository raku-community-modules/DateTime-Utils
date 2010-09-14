use v6;
use Test;

BEGIN { @*INC.unshift: 'lib' }

plan 1;

use DateTime::Utils;

# Try currently implemented strftime() formats
my $g1 = DateTime.new(:year(1582), :month(10), :day(4),
                   :hour(13),   :minute(2), :second(3.654321), 
                   :timezone(-28800) );

my $need = "Mon, 04 Oct 1582 13:02:03 -0800";

is rfc2822($g1), $need, 'rfc2822 format'; # test 1

