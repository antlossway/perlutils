#!/usr/local/perl5/bin/perl

use strict;
my $bgcolor = "#66829a";
sub bgcolor
{
	if($bgcolor eq "#dfe5ea")
        {
                $bgcolor = "#c8d7dc";
        }
        else
        {
                $bgcolor = "#dfe5ea";
        }
        return $bgcolor;
}

sub html_start
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<html>\n<head>\n<title>\n</title>\n</head>\n";
	print HTML "<p>\n";
	close(HTML);
}

sub html_end
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "</html>";
	close(HTML);
}

sub html_title
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<br>\n";
	print HTML "<b>$content</b>\n";
	print HTML "<br>\n";
	close(HTML);
}

sub html_text
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<p>$content\n";
	close(HTML);
}

sub html_text_italic
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<i>$content\n</i>";
	close(HTML);
}

sub html_text_br
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<p>$content\n";
	print HTML "<br>\n";
	close(HTML);
}

sub html_table_start
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<table>\n";
	close(HTML);
}

sub html_table_end
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "</table>\n";
	print HTML "<br>\n";
	close(HTML);
}

sub html_th
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<th align=\"right\">$content</th>\n";
	close(HTML);
}

sub html_th_red
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<th align=\"right\"><div style=\"color: red;\">$content</div></th>\n";
	close(HTML);
}

sub html_th_left
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<th align=\"left\">$content</th>\n";
	close(HTML);
}

sub html_tr_start
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<tr bgcolor=\"".&bgcolor."\">\n";
	close(HTML);
}

sub html_tr_end
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "</tr>\n";
	close(HTML);
}

sub html_td
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<td align=\"right\">$content</td>\n";
	close(HTML);
}

sub html_td_red
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<td align=\"right\"><div style=\"color: red;\">$content</div></td>\n";
	close(HTML);
}

sub html_td_green
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<td align=\"right\"><div style=\"color: green;\">$content</div></td>\n";
	close(HTML);
}

sub html_td_left
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<td align=\"left\">$content</td>\n";
	close(HTML);
}

sub html_ul_start
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<UL>\n";
	close(HTML);
}

sub html_ul_end
{
	my $html_report = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "</UL><br>\n";
	close(HTML);
}

sub html_li
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<LI>$content<br>\n";
	close(HTML);
}
sub html_h4
{
	my $html_report = shift;
	my $content = shift;
	open(HTML, ">>$html_report") or die "can't open $html_report:$!";;
	print HTML "<h4>$content</h4>\n";
	close(HTML);
}

1;
