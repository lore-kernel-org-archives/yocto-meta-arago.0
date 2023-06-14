Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3789BC001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.3789.1686714315154491302
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HIAkTrTR;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-19f8af9aa34so4693792fac.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714314; x=1689306314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S6vJaaj+4qN6ckfzV7jrae73OZb4qEBQEeGuhmDtsg=;
        b=HIAkTrTRnixOI1CjBSGiCTT66Es0yvxuFOpzbRtuFOOo5lDIckk5DVAOpQyS578viv
         vyUdBGmH4qMpIXWgkh9bm9STQqGUI1UrxJTyB6AP+z0cWtptzmjT3K7dB1ei/lSNxv7p
         s1y5mD821dieFxW4KyWT1xIrhHH2kyLPoMr1308CSS8BQduMnK/UpeiJetbXRoNGJTw/
         LnLdBl4bSSAWdEThQIkwBJLCGS8T9Ec8mktwB/BrPimkgGmOLkULoWxL/rJ47YKIxgUU
         Hu5r9I2xc+BLuWAHA5ZXDwS9qXaMTouH/ywLWcal47qGnWNXA+DeppUdvTRY4dM+Chvu
         uUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714314; x=1689306314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S6vJaaj+4qN6ckfzV7jrae73OZb4qEBQEeGuhmDtsg=;
        b=X+I0pyD5d8/+oaJXtVljNSQ75Fz125eRIzGKSnDN/bN5LjTVLsIY7gW3smA3QAr951
         1FXRXr5wW8kJql5iaTJx4Csp+TTE6R7YE1tBqLgqdWNfKLdAOCdOJB0yumvfRUNepPhE
         NP1/6sBEvPKDtKyghEWfOPd1eJUQoeMMEX0fim2lsSaZxTXqgVC+aD1Mfs9RhkZJc35e
         pR4s3FN8GMUekm0boS3Se4LWwTYqv17dXfoT1elTdkPj5bX+e3PNdKALtuAzFxdl7iRV
         9KFBFzMMIE8MeGuMxkKrTtewu0oJG1/XMHdvyX40BkRg+HZyKThMnM3HOU5ZEoKbxf0+
         LQng==
X-Gm-Message-State: AC+VfDwen1sydHacOFsDEecN43wAIhY1CQIvBDqw//OITWyBFK5m4s4k
	bGPi8MQVRX0d4+lJuPZUdejaew6kNRphigkF
X-Google-Smtp-Source: ACHHUZ5Sz/U9zKDahL+7YLJI981o+MV93lIlMKroqflKH7SeDjHKgo/srB2cF74fIvqI3i7kj4h4cw==
X-Received: by 2002:a05:6870:3e4:b0:19a:6061:7e8d with SMTP id h36-20020a05687003e400b0019a60617e8dmr10511270oaf.24.1686714314407;
        Tue, 13 Jun 2023 20:45:14 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:14 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 03/16] oe-layertool-setup: replace all x comparisons with -n/-z
Date: Tue, 13 Jun 2023 22:44:54 -0500
Message-ID: <20230614034507.598391-4-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14608

Replace all the stray x$var comparisons with the proper -n/-z
equivalent.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
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
2.41.0


