use Date::Calc qw(Today Add_Delta_Days);
use Time::Local;

sub get_today
{
	my ($year,$month,$day) = Today();
	$month = sprintf("%02d", $month);
	$day = sprintf("%02d", $day);
	my $result = "$year-$month-$day";
	return $result;
}

sub get_yesterday
{
	my ($year,$month,$day) = Today();
	my ($year2,$month2,$day2) = Add_Delta_Days($year,$month,$day,-1); #yesterday
	$month2 = sprintf("%02d", $month2);
	$day2 = sprintf("%02d", $day2);
	my $result = "$year2-$month2-$day2";
	return $result;
}

sub get_tomorrow
{
	my ($year,$month,$day) = Today();
	my ($year3,$month3,$day3) = Add_Delta_Days($year,$month,$day,1); #tomorrow
	$month3 = sprintf("%02d", $month3);
	$day3 = sprintf("%02d", $day3);
	my $result = "$year3-$month3-$day3";
	return $result;
}

sub get_2daysbefore
{
	my ($year,$month,$day) = Today();
	my ($year2,$month2,$day2) = Add_Delta_Days($year,$month,$day,-2); #the day before yesterday
	$month2 = sprintf("%02d", $month2);
	$day2 = sprintf("%02d", $day2);
	my $result = "$year2-$month2-$day2";
	return $result;
}

sub get_ndaysbefore
{
	my $offset = shift;
	my ($year,$month,$day) = Today();
	my ($year2,$month2,$day2) = Add_Delta_Days($year,$month,$day,-$offset); #the day before yesterday
	$month2 = sprintf("%02d", $month2);
	$day2 = sprintf("%02d", $day2);
	my $result = "$year2-$month2-$day2";
	return $result;
}

sub get_ndays_after_date
{
	my $date1 = shift;
	my $offset = shift;
	my ($year,$month,$day) = split(/-/,$date1);
	my ($year2,$month2,$day2) = Add_Delta_Days($year,$month,$day,$offset); #the day before yesterday
	$month2 = sprintf("%02d", $month2);
	$day2 = sprintf("%02d", $day2);
	my $result = "$year2-$month2-$day2";
	return $result;
}

sub get_timestamp_from_epoch
{
        my $epoch = shift;
        my @date = localtime($epoch);
        my $year = $date[5] + 1900;
        my $month = sprintf("%02d", $date[4]+ 1);
        my $day = sprintf("%02d", $date[3]);
        my $hour = sprintf("%02d", $date[2]);
        my $min = sprintf("%02d", $date[1]);
        my $sec = sprintf("%02d", $date[0]);

        my $time = "$year-$month-$day $hour:$min:$sec";

        return $time;
}

sub get_epoch_from_timestamp #input format yyyy-MM-dd hh:mm:ss
{
	my $time = shift;
	my ($year, $mon, $day, $hour, $min, $sec) = split( /\D/, $time);
	$mon =~ s/^0+//g;
	$mon --;
	$day =~ s/^0+//g;
	$hour =~ s/^0//;
	$min =~ s/^0//;
	$sec =~ s/^0//;
	my $utime = timelocal($sec,$min,$hour,$day,$mon,$year);

	return $utime;
}

sub get_1st_day_of_month
{
	my $yesterday = get_yesterday();
	my ($year1,$mon1,$day1) = split(/-/,$yesterday);
	my $date = "$year1-$mon1-01";
	return $date;
}

sub get_1st_day_of_this_month
{
        my $date1 = shift;
        my ($year1,$mon1,$day1) = split(/-/,$date1);
        my $date = "$year1-$mon1-01";
        return $date;
}

sub get_1st_day_of_next_month
{
        my $date1 = shift;

        my ($year1,$mon1,$day1) = split(/-/,$date1);

        $mon1 =~ s/^0//;

        my $year2 = $year1;
        my $mon2 = $mon1;

        $mon2++;
        if($mon2 > 12)
        {
                $year2 ++;
                $mon2 = 1;
        }
        $mon2 = sprintf("%02d", $mon2);

        my $date2 = "$year2-$mon2-01";
        return $date2;
}

1;
