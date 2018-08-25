package Dup;
use strict;
use Redis;
use Digest::MD5 qw(md5 md5_hex md5_base64);

use Exporter qw(import);
our @EXPORT = qw/check_dup check_dup2/;

my $redis_cfg = "/home/router/etc/redis.cfg";

sub get_redisconfig()
{
	my %param;
	open(my $cfg, "<",  "$redis_cfg") or die "can't open $redis_cfg:$!";
	while(my $line = <$cfg>)
	{
		chomp($line);
		next if ($line =~ /^#/);
		my($key,$value) = split(/=/,$line);
		$param{$key} = $value;
	}
	close($cfg);

	my $host = $param{"host"};
	my $port = $param{"port"};

	my $result = "$host:$port";
	return $result;
}

my $redis_server = get_redisconfig();

my $r = Redis->new(		reconnect => 	60, 
						every => 		1_000_000,
						cnx_timeout =>	60,
						read_timeout =>	10,
						server =>		$redis_server
					);


sub check_dup
{
        my $b_number = shift;
        my $tpoa = shift;
        my $xms = shift;
        my $md5 = md5_hex("s".$b_number.$tpoa.$xms);
        $r -> incr($md5); #if key does not exists, value set to 0
        $r -> expire($md5,36000); #10 hours

        my $check = $r -> get($md5);

        return ($md5, $check);
}


1;
