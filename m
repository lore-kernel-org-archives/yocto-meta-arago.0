Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14579.1639175511626628613
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 14:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 742E240C82;
	Fri, 10 Dec 2021 22:31:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5p3PauSrt6U; Fri, 10 Dec 2021 22:31:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5E7E840C85;
	Fri, 10 Dec 2021 22:31:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0988D174713;
	Fri, 10 Dec 2021 17:31:47 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 3/3] build-oesdk.sh: allow overwriting machine on command line
Date: Fri, 10 Dec 2021 17:31:37 -0500
Message-Id: <1639175497-11553-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639175497-11553-1-git-send-email-denis@denix.org>
References: <1639175497-11553-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Allow passing a different machine on the command line overwriting what
was originally specified in the config file.

Cleanup parameter checks and add usage banner with available options.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 build-oesdk.sh | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 77c2019..3c0b0c2 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -16,7 +16,13 @@ then
 fi
 
 usage() {
-    echo "write something"
+    echo -n "Usage: "
+    echo -n `basename $0`
+    echo " [-h] [-s] [-m machine] -f config"
+    echo "   -f config    Config file to use for the build"
+    echo "   -m machine   Build for machine instead of what set in config"
+    echo "   -s           Skip all repositories checkouts"
+    echo "   -h           This help screen"
     exit 0
 }
 
@@ -24,27 +30,34 @@ usage() {
 # Main Script #
 ###############
 
-# Do not allow calling this script without passing the config file option
-if [ "$*" = "" ]
-then
-    log $error_log echo "You must specify at least one option on the command line"
-    log $error_log usage
-    exit 1
-fi
-
 # Parse input options
-while getopts :f:h:s arg
+while getopts :f:m:hs arg
 do
     case $arg in
         f ) inputfile="$OPTARG";;
+        m ) machine="$OPTARG";;
         s ) skipcheckout="true";;
         h ) usage;;
     esac
 done
 
+# Do not allow calling this script without passing the config file option
+if [ "$inputfile" = "" ]
+then
+    log $error_log echo "You must specify a config file to use"
+    log $error_log usage
+    exit 1
+fi
+
 # Parse the input config file to set the required build variables
 parse_config_file $inputfile
 
+if [ "$machine" != "" ]
+then
+    echo "Machine $machine was specified as a parameter on the command line"
+    MACHINES=$machine
+fi
+
 # Verify that the MANDATORY_INPUTS have been set.  We know there are some
 # values that absolutely need to be set or else you will end up
 # trashing your host configuration.
-- 
2.7.4

