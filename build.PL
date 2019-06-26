#!perl
#####################################################################
#
# author:   Jidor Tang, github_id: tlqtangok
# co-author:    Jesson Liu, github: LjessonS 
#
# first written by Jidor Tang <tlqtangok at 126 dot com> at 2018-11-10
#
######
=pod

Copyright 2018-2019 Jidor Tang 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut 
#####################################################################
#
# this script is used to build out execuated file intelligently for
# different platform, one need first install the dependency-packages.
#

use strict;
use feature qw(say); 

&main(); 

### sub list ### 
sub main()
{
	my $platform = &get_platform(); 
	&ck_dependency($platform); 
	my $cmd_build = &gen_build_statement($platform);
	
	say "- run build cmd for $platform\n\t$cmd_build ..."; 
	system($cmd_build); 


	my $cmd_git_push = &gen_git_push_cmd($platform); 
	my $cmd_set_version_on_srv = &gen_cmd_set_server_version_("tfr.PL");

	say $cmd_set_version_on_srv; 
    #say $cmd_git_push; 
}

sub gen_git_push_cmd($)
{
	my $platform = shift; 
	my $cmd = ""; 
	if ($platform eq "win")
	{
		$cmd .= ""; 
		$cmd .= qq{- now, run on linux:\n}; 
		$cmd .= "\t". q{git_push_no_pw tfr.PL build.PL ./rel/win/tfr.exe && cp tfr.PL $perl_p && cd $perl_p && git_push tfr.PL && cd - }; 
	}
	return $cmd; 
}
sub gen_cmd_set_server_version_($)
{
	my $tor_fn = shift; 
	open my $tor_fc_fp, "<", $tor_fn or die; 
	my @tor_fc = <$tor_fc_fp>; 
	close $tor_fc_fp; 

	@tor_fc = grep m/^my..VERSION_/ , @tor_fc; 

	my $version_ = $tor_fc[0]; 
	my $version_key = $tor_fc[1]; 

	$version_ = (split m/\"/, $version_)[1]; 
	$version_key = (split m/\"/, $version_key)[1]; 



	my $cmd_set_version_on_server =  qq{\n\tredis-cli -h localhost set $version_key $version_};
	return $cmd_set_version_on_server; 


}
sub ck_module($, $)
{
	my $m_name = shift; 
	my $platform = shift; 

	my $magic_num = 1234; 
	my $cml_ck_redis_module = qq{perl -M'$m_name' -e 'print $magic_num'};
	$cml_ck_redis_module = qq{perl -M"$m_name" -e "print $magic_num"} if $platform eq "win";

	my $res = qx{$cml_ck_redis_module}; 
	
	chomp($res); 

	die "- no module $m_name, please install it\n" if $res != $magic_num; 

}
sub ck_dependency($)
{
	my $platform = shift;
	die "- no pp, please install pp\n" if  (`which pp` !~ m/pp/); 

	my @arr_module = qw(
	pp
	Redis
	Term::ReadKey	
	Term::ProgressBar
	); 
	for my $e_m_name (@arr_module)
	{
		&ck_module($e_m_name, $platform); 
	}
}

sub gen_build_statement($p)
{
	my $platform = shift; 
	
	my $cmd_build = qq(pp tfr.PL -o ./rel/$platform/tfr); 
	$cmd_build = qq(pp tfr.PL -o ./rel/$platform/tfr.exe) if $platform eq "win"; 

	  
	return $cmd_build; 
}

sub get_platform()
{
	my $error_msg = "- no support platform"."\n"; 
	my $platform = "linux";  # pi, win
	if ($^O eq "linux")
	{
		my $issue_platform = `cat /etc/issue`; 

		if ($issue_platform =~ m/Rasp/i)
		{
			$platform = "pi"; 

		}
		elsif ($issue_platform =~ m/Ubuntu/i || qx{ cat /proc/version } =~ m/centos/i )
		{
			$platform = "linux"; 
		}
		else
		{
			die "$error_msg"; 
		}


	}
	elsif ($^O eq "MSWin32")
	{

		$platform = "win"; 

	}
	elsif ($^O eq "darwin")
	{
		$platform = "darwin"; 
	}

}
