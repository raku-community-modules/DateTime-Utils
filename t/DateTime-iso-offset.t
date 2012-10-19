use v6;
use Test;

#BEGIN { @*INC.unshift: 'lib' }

use DateTime::Utils;

plan 3;

my $offset = iso-offset('-0800');
is $offset, -28800, 'offset in seconds';

my $dt = DateTime.now(:timezone($offset));

is $dt.offset(), -28800, 'DateTime offset in seconds';

is strftime('%z', $dt), '-0800', 'strftime round robin';

