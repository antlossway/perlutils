
sub get_datetime_now
{
        my @date = localtime();
        my $year = $date[5] + 1900;
        my $month = sprintf("%02d", $date[4]+ 1);
        my $day = sprintf("%02d", $date[3]);
	my $hour = sprintf("%02d", $date[2]);
	my $min = sprintf("%02d", $date[1]);
	my $sec = sprintf("%02d", $date[0]);

        my $now = "$year"."-"."$month"."-"."$day"." $hour:$min:$sec";

        return $now;
}

sub mylog
{
	my $line = shift;
	my $now = get_datetime_now();
	warn "$now: $line";
}

1;
