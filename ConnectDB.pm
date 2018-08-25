package ConnectDB;
use strict;
use DBI;
use Exporter qw(import);
our @EXPORT = qw/connectdb exec_sql exec_sql_debug/;

my $db_cfg = "/home/router/etc/db.cfg";
my (%dbparam, $user,$password,$host,$driver);

sub get_dbconfig()
{
	open(CFG, "<$db_cfg") or die "can't open $db_cfg:$!";
	while(my $line = <CFG>)
	{
		chomp($line);
		next if ($line =~ /^#/);
		my($key,$value) = split(/=/,$line);
		$dbparam{$key} = $value;
	}
	close(CFG);
	$user = $dbparam{'db_user'};
	$password = $dbparam{'db_passwd'};
	$host = $dbparam{'db_host'};
	$driver = $dbparam{'db_driver'};
}

### Database Configuration and connection
#print "$host:$user,$password,$driver\n";

sub connectdb
{
	&get_dbconfig();
	my $db;
	my $dsn = "DBI:$driver:database=router;host=$host";
	unless($db = DBI->connect($dsn,$user,$password))
	{
		warn DBI::errstr;
		exit;
	}
	return $db;
}

sub exec_sql
{
	my $db = shift;
	my $sql = shift;
	my $ref = $db -> prepare($sql);

	unless($ref -> execute(@_))
	{
		warn $sql;
		warn DBI::errstr;
		exit;
	}
	return $ref;
}

sub exec_sql_debug
{
	my $db = shift;
	my $sql = shift;
	print "$sql\n";
	my $ref = $db -> prepare($sql);

	unless($ref -> execute(@_))
	{
		warn $sql;
		warn DBI::errstr;
		exit;
	}
	return $ref;
}

1;
