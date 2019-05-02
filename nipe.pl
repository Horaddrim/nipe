#!/usr/bin/perl

#########################################################
# Nipe developed by Heitor Gouvêa                       #
# This work is licensed under MIT License               #
# Copyright (c) 2015-2018 Heitor Gouvêa                 #
#                                                       #
# [+] AUTOR:        Heitor Gouvêa                       #
# [+] EMAIL:        hi@heitorgouvea.me                  #
# [+] SITE:         https://heitorgouvea.me             #
# [+] GITHUB:       https://github.com/GouveaHeitor     #
# [+] TWITTER:      @GouveaHeitor                       #
#########################################################

use Switch;
use lib "./lib/";
use Nipe::Stop;
use Nipe::Start;
use Nipe::CheckIp;
use Nipe::Functions;
use Nipe::Nodes;

sub main {
	my $command = $ARGV[0];

	switch ($command) {
		case "stop" {
			Nipe::Stop -> new();
		}

		case "start" {
			Nipe::Start -> new();
		}

		case "status" {
			Nipe::CheckIp -> new();
		}

		case "nodes" {
			my $sub_command = $ARGV[1];
			switch ($sub_command) {
				case "list" {
					Nipe::Nodes -> list_nodes();
				}
			}
			return 0;
		}

		case "restart" {
			Nipe::Stop -> new();
			Nipe::Start -> new();
		}

		case "install" {
			Nipe::Functions -> install();
		}

		Nipe::Functions -> help();
	}
}

main();
exit;
