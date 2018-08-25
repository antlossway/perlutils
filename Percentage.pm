use strict;
#use warnings;
use Math::Random::MT qw(rand);

sub pick_choice
{
	my $arg1 = shift;
	my %proportion = %$arg1;
	my %x;
	foreach my $key (keys %proportion)
	{
		if($proportion{$key} ne "" and $proportion{$key} > 0)
		{
			$x{$key} = -log(1 - rand)/$proportion{$key};
		}
	}

	my $result = find_index_with_min_value(\%x);

	return $result;
}

sub find_index_with_min_value
{
    # what index has the lowest value in a list?
	my $arg = shift;
	my %list = %$arg;

	my $min;
	
	foreach my $key (sort{$list{$a} <=> $list{$b}} keys %list)
	{
		$min = "$key";
		last;
	}

#debug
#	print "index_with_min_value return $min\n";
	return $min;
}

1;
