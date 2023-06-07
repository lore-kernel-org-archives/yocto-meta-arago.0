Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FA6C87FDC
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8429.1686168314766396577
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RV3hR+Ia;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5B2O106640;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=OjMcsPdbQJyPmbKctV05wCFYGNyqoaFBHYnDGL/9m1g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RV3hR+Ia+K+bwgi7brYy2XIEV07isn+hgcLpbRdLXm07EI3Zj521k7WASFKFUVWYX
	 8HY4v/f0/QOTjHzGtDY7n2NLxQqg3keBsLsktS1DmaOkYw6YvZz7wVMLVFwVDXCW+J
	 +aft4tf9qlJkhQrPsP5W3LL1bmwnVza4kT+NQ1js=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5BKA036862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:10 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AKw125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 02/15] oe-layertool-setup: replace all x comparisons with -n/-z
Date: Wed, 7 Jun 2023 15:04:51 -0500
Message-ID: <20230607200504.3810426-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607200504.3810426-1-rs@ti.com>
References: <20230607200504.3810426-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 20:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14531

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Replace all the stray x$var comparisons with the proper -n/-z
equivalent.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 54 +++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index cd4e242..3faf00c 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -126,7 +126,7 @@ exit 1
 
 check_input() {
     # Check that at least -i or -f was used
-    if [ "$interactive" = "n" ] && [ "x$inputfile" = "x" ]
+    if [ "$interactive" = "n" ] && [ -z "$inputfile" ]
     then
         echo "ERROR: You must either use this script with the -i or -f options"
         usage
@@ -207,7 +207,7 @@ parse_repo_line() {
     temp_layers="none"
 
     # If layers= was used then set the layers variable, empty list would add all found layers
-    if [ "x$parsed_layers" != "x" ]
+    if [ -n "$parsed_layers" ]
     then
         temp_layers=""
         temp=$(echo $parsed_layers | cut -d= -f2)
@@ -223,10 +223,10 @@ parse_repo_line() {
 
     # Assign the layers.  If the temp_layers is empty then set the layers
     # to all and we will fill in the actual layers in the later steps.
-    if [ "x$temp_layers" = "x" ]
+    if [ -z "$temp_layers" ]
     then
         eval $prefix"repo_layers"="all"
-    elif [ "x$temp_layers" = "xnone" ]
+    elif [ "$temp_layers" = "none" ]
     then
         eval $prefix"repo_layers"="none"
     else
@@ -256,7 +256,7 @@ parse_input_file() {
         repo_layers=""
 
         # Skip empty lines
-        if [ "x$line" = "x" ]
+        if [ -z "$line" ]
         then
             continue
         fi
@@ -331,7 +331,7 @@ parse_input_file() {
 
 
 configure_repo() {
-    if [ "x$name" = "x" ]
+    if [ -z "$name" ]
     then
         get_repo_name
     fi
@@ -340,7 +340,7 @@ configure_repo() {
     # of the grep to avoid matching similar named repos.
     temp=$(printf '%s\n' $output | grep -e "^$name,")
 
-    if [ "x$temp" != "x" ]
+    if [ -n "$temp" ]
     then
         echo "This repository ($name) has already been configured with the following values:"
         printf '\t%s\n' $temp
@@ -348,7 +348,7 @@ configure_repo() {
         return 1
     fi
   
-    if [ "x$uri" = "x" ]
+    if [ -z "$uri" ]
     then
         get_repo_uri
     fi
@@ -360,28 +360,28 @@ configure_repo() {
 
     clone_repo
 
-    if [ "x$branch" = "x" ]
+    if [ -z "$branch" ]
     then
         get_repo_branch
     fi
 
     checkout_branch
 
-    if [ "x$commit" = "x" ]
+    if [ -z "$commit" ]
     then
         get_repo_commit
     fi
 
     checkout_commit
 
-    if [ "x$repo_layers" = "xall" ]
+    if [ "$repo_layers" = "all" ]
     then
         # Call select layers with the all option to select all layers
         select_layers "all"
-    elif [ "x$repo_layers" = "x" ]
+    elif [ -z "$repo_layers" ]
     then
         select_layers
-    elif [ "x$repo_layers" = "xnone" ]
+    elif [ "$repo_layers" = "none" ]
     then
         # Call select layers with the none option to not select any layers
         select_layers "none"
@@ -473,7 +473,7 @@ checkout_branch() {
     # any.  In the case of a clean checkout this should be already up to date,
     # but for an existing checkout this should be the changes that were
     # fetched earlier.
-    if [ "x$resethead" = "xy" ]
+    if [ "$resethead" = "y" ]
     then
         # Instead of merging, reset to remote branch to avoid conflicts due to rebase
         git reset --hard origin/$branch
@@ -484,7 +484,7 @@ checkout_branch() {
 
 checkout_commit() {
     cd $sourcedir/$name
-    if [ "x$commit" != "xHEAD" ]
+    if [ "$commit" != "HEAD" ]
     then
         git checkout $commit
     fi
@@ -501,7 +501,7 @@ The $name repository has the following tags available:
 
 EOM
     tags=$(git tag)
-    if [ "x$tags" = "x" ]
+    if [ -z "$tags" ]
     then
         printf "\tNo tags found\n"
     else
@@ -519,7 +519,7 @@ EOM
 
     read input
 
-    if [ "x$input" = "x" ]
+    if [ -z "$input" ]
     then
         commit="HEAD"
     fi
@@ -558,7 +558,7 @@ select_layers() {
     #If so prompt for which layers to configure
     #If there is only one then just configure that layer and don't prompt
 
-    if [ "x$arg1" = "xnone" ]
+    if [ "$arg1" = "none" ]
     then
         repo_layers=""
         return
@@ -583,7 +583,7 @@ select_layers() {
 
     t_layers=$(find $name -name "layer.conf" | sed 's:\/conf\/layer.conf::')
 
-    if [ "x$arg1" != "xall" ]
+    if [ "$arg1" != "all" ]
     then
         echo "arg1 = $arg1"
         # Prompt for which layers to configure
@@ -609,7 +609,7 @@ EOM
         read input
     fi
 
-    if [ "x$input" = "x" ]
+    if [ -z "$input" ]
     then
         repo_layers=$t_layers
     else
@@ -643,7 +643,7 @@ EOM
 
 get_oecorelayerconf() {
     # Check if the variable is already set.
-    if [ "x$OECORELAYERCONF" != "x" ]
+    if [ -n "$OECORELAYERCONF" ]
     then
         OECORELAYERCONFPATH=$scriptdir/$OECORELAYERCONF
 
@@ -697,7 +697,7 @@ EOM
 
 get_oecorelocalconf() {
     # Check if the variable is already set.
-    if [ "x$OECORELOCALCONF" != "x" ]
+    if [ -n "$OECORELOCALCONF" ]
     then
         OECORELOCALCONFPATH=$scriptdir/$OECORELOCALCONF
 
@@ -819,7 +819,7 @@ EOM
     fi
 
     # If command line option was not set use the old dldir
-    if [ "x$dldir" = "x" ]
+    if [ -z "$dldir" ]
     then
         dldir=$old_dldir
     fi
@@ -990,17 +990,17 @@ confdir="$builddir/conf"
 
 check_input
 
-if [ "x$inputfile" != "x" ]
+if [ -n "$inputfile" ]
 then
     parse_input_file
 
     print_motd
 fi
 
-if [ "x$interactive" = "xy" ]
+if [ "$interactive" = "y" ]
 then
     cont="y"
-    while [ "x$cont" = "xy" ] || [ "x$cont" = "xY" ]
+    while [ "$cont" = "y" ] || [ "$cont" = "Y" ]
     do
         # clean up the variables for each repo
         name=""
@@ -1039,7 +1039,7 @@ config_oecorelayerconf
 get_oecorelocalconf
 config_oecorelocalconf
 
-if [ "x$outputfile" != "x" ]
+if [ -n "$outputfile" ]
 then
     # make sure that the directory for the output file exists
     cd $oebase
-- 
2.40.1


