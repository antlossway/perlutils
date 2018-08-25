package MyTool;
use strict;

use Exporter qw(import);
our @EXPORT = qw/commify get_mtime_epoch file_age/;

sub commify
{
        my $text = reverse $_[0];
        $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
        return scalar reverse $text;
}

sub get_mtime_epoch
{
	my $file = shift;

	my @stats = stat($file);

	my $mtime_epoch = $stats[9];

	return $mtime_epoch

}

sub file_age
{
        my $file = shift;
        my $mod_time = (stat($file))[9];

        my $now = time();

        my $age = $now - $mod_time;
        return $age;
}

1;
