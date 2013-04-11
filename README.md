# DateTime::Utils

## Introduction

A collection of libraries to enhance the DateTime object from Perl 6.
These were at one time part of the original DateTime class within Rakudo,
but were pulled out and made into separate libraries when we decided to keep
the Core as simple as possible.

## DateTime::Utils

Provides strftime(), iso-offset() and a RFC2822 constant.

```perl
  use DateTime::Utils;
  my $dt = DateTime.now(:timezone(iso-offset('-0800')));
  say "It's "~strftime('%T', $dt)~" at supernovus's place.";
  say "It's "~strftime('%T', $dt.in-timezone(iso-offset('+0200')))~" at masak's place.";

  say "In the RFC 2822 date-time format it is: " ~ strftime(RFC2822, $dt);
```

## DateTime::Math

Provides to-seconds(), from-seconds(), duration-from-to() and the ability
to perform certain math operations on DateTime objects.

```perl
  use DateTime::Math;

  ## Given $dt1 and $dt2 are both DateTime objects.

  my $days = from-seconds($dt2 - $dt1, 'd');
  say "The events where $days days apart";

  my $target = $dt1 + to-seconds(1, 'M');
  say "One month after $dt1 would be $target";

  my $hours = duration-from-to(3, 'y', 'h');
  say "3 years contains $hours hours.";
```

The math functions allowed are:

 * Seconds = DateTime + DateTime
 * Seconds = DateTime - DateTime
 * DateTime = DateTime + Seconds
 * DateTime = DateTime - Seconds

And comparisons:

 * DateTime cmp DateTime
 * DateTime <=> DateTime
 * DateTime == DateTime
 * DateTime != DateTime
 * DateTime <= DateTime
 * DateTime < DateTime
 * DateTime >= DateTime
 * DateTime > DateTime

Note that all of the math operations on DateTime objects are using the
POSIX time, which is stored as seconds, so it does not support sub-second
math at this time.

## TODO

Currently the names of months and days are hard coded as English strings.
The ability to have other languages added would be awesome.

## Authors

 * [Timothy Totten](https://github.com/supernovus/)
 * [Carl Mäsak](https://github.com/masak/)
 * [Kodi Arfer](https://github.com/Kodiologist/)

Anyone I'm missing that may have contributed, feel free to contact supernovus,
and I'll add you to the credits.

## License

[Artistic License 2.0](http://www.perlfoundation.org/artistic_license_2_0)

