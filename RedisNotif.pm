package RedisNotif;
use strict;
use Redis;
use Data::Dumper;

use Exporter qw(import);
our @EXPORT = qw/notif_redis delete_part/;

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


sub notif_redis
{
	my $bnumber = shift;
	my $cid = shift;
	my $key = $bnumber .'ST:::'. $cid;
	my %info = $r->hgetall($key);
	my %part;
	if(exists($info{'PART'}))
	{
		%part = $r->hgetall($info{'PART'});
	}
	return(\%info,\%part);

}

sub delete_part
{
	my $part = shift;
	my $cid = shift;
	$r->hdel($part,$cid);
}

1;
