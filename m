Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D26EB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.3792.1686714317753976455
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h3hJWdEx;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b2f0a140b7so2360865a34.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714317; x=1689306317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyXWl1ACQlBNTPecPcVfIXUd7L0fkbRkVxZC9wSFzxE=;
        b=h3hJWdExR2iBGGriugPvo1QxPDENb5e18kKKJ7tNcI/gz2R/pjC6j4X4FRmHyax2cN
         PGTaxONtS1ejIP6k5x2VUNIP7hdH0k5zI0rwathDf9g56xQEkMz71K5tPt/LiAVrvnVw
         x1fKvDnymKUtmTRX2/DO/FfvK+7r42NgFhxIWeqy+7OdOGSn7IN+dy2AWwmb7PS6PVkz
         2eHpnI4Xtiq1r/Dk98l+mgvVSHGj42EvT+VBki33Ih0EyqZvPFahWeaUgDH97p2WIvJG
         iYVFAC+uOglNTyOhNH9d08yatSQr/+kqCamA3FgkkGx4PWo/c9nji0EMK4axEyaO2dsL
         28ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714317; x=1689306317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyXWl1ACQlBNTPecPcVfIXUd7L0fkbRkVxZC9wSFzxE=;
        b=IJeo1TRroL/6qItML99nwCQ5k0xlcuDs2XIm1jvujAXtctwpTwHd3ofITjG7EE4Tkt
         CgNCUMlIRAcHCfkq9Q+lmYffIfu7zQ8gZSOrTLkWzhzZ08mbFPLz5BHTFzFWBAuAKz3h
         s4nBOMzmDWP6WpDlTK/4DB9Bhv6zEpv2w1ubRzQLRWcLSGdoXt6JHigOBSa3rWwxDVGI
         pmEDWKshGUbpFkw6Ovr7WK5UoeOrrSbdPtfxlWBbIRFZS+2tHUvqSE2gelG23PQ/sVs0
         1YM94ASJ7VTZjRcO/oe4aDB9p2DJnm2EUCmMB5SJx1nSB+zIrj7+J/VrqamHHFfexfh/
         q4Mg==
X-Gm-Message-State: AC+VfDwKPn8iY5XcYqgtHxFfLuoBQQvp+cCBTwlTQyn5OgMcgwEStQna
	Djfy3pYzkjPfiyUsy/cbwFM=
X-Google-Smtp-Source: ACHHUZ7AjjC2jrkjWLW4zySNDn0Jxzu77RyBtBrf4AO0q99GlH0dYun0L45Eaq6seq0cZ5Lk4ez3jg==
X-Received: by 2002:a05:6830:1e47:b0:6b0:cfce:6d24 with SMTP id e7-20020a0568301e4700b006b0cfce6d24mr10799747otj.0.1686714317065;
        Tue, 13 Jun 2023 20:45:17 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:16 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 07/16] oe-layertool-setup: check exit code directly
Date: Tue, 13 Jun 2023 22:44:58 -0500
Message-ID: <20230614034507.598391-8-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14612

Shellcheck:
Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index ee93ec9..a87a423 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -262,15 +262,13 @@ parse_input_file() {
         fi
 
         # Skip comment lines
-        echo "$line" | grep -e "^#" > /dev/null
-        if [ "$?" = "0" ]
+        if echo "$line" | grep -q -e "^#"
         then
             continue
         fi
 
         # If the line starts with OECORE then parse the OECORE setting
-        echo "$line" | grep -e "^OECORE.*=" > /dev/null
-        if [ "$?" = "0" ]
+        if echo "$line" | grep -q -e "^OECORE.*="
         then
             parse_oecore_line "$line"
             output="${output}${line}\n"
@@ -278,8 +276,7 @@ parse_input_file() {
         fi
 
         # If the line starts with BITBAKE then parse the BITBAKE setting
-        echo "$line" | grep -e "^BITBAKE.*=" > /dev/null
-        if [ "$?" = "0" ]
+        if echo "$line" | grep -q -e "^BITBAKE.*="
         then
             parse_bitbake_line "$line"
             output="${output}${line}\n"
@@ -287,8 +284,7 @@ parse_input_file() {
         fi
 
         # If the line starts with LOCALCONF: then parse the LOCALCONF: setting
-        echo "$line" | grep -e "^LOCALCONF:.*" > /dev/null
-        if [ "$?" = "0" ]
+        if echo "$line" | grep -q -e "^LOCALCONF:.*"
         then
             parse_localconf_line "$line"
             output="${output}${line}\n"
@@ -296,8 +292,7 @@ parse_input_file() {
         fi
 
         # If the line starts with MOTD: then parse the MOTD: setting
-        echo "$line" | grep -e "^MOTD:.*" > /dev/null
-        if [ "$?" = "0" ]
+        if echo "$line" | grep -q -e "^MOTD:.*"
         then
             parse_motd_line "$line"
             continue
@@ -307,11 +302,9 @@ parse_input_file() {
         # it is a repository information line and parse it
         parse_repo_line "$line"
 
-        configure_repo
-
         # if the return from configure repo was non-zero then do not save
         # the output
-        if [ "$?" != "0" ]
+        if ! configure_repo
         then
             continue
         fi
@@ -398,8 +391,7 @@ clone_repo() {
         cd "$sourcedir/$name"
         "$scriptdir/git_retry.sh" fetch --all
     else
-        "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
-        if [ "$?" != "0" ]
+        if ! "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
         then
             echo "ERROR: Could not clone repository at $uri"
             exit 1
@@ -461,8 +453,7 @@ checkout_branch() {
     # Check if a local branch already exists to track the remote branch.
     # If not then create a tracking branch and checkout the branch
     # else just checkout the existing branch
-    git branch | grep "$branch" > /dev/null
-    if [ "$?" != "0" ]
+    if git branch | grep -q "$branch"
     then
         git checkout "origin/$branch" -b "$branch" --track
     else
@@ -1009,9 +1000,7 @@ then
         commit=""
         repo_layers=""
 
-        configure_repo
-
-        if [ "$?" != "0" ]
+        if ! configure_repo
         then
             continue
         fi
-- 
2.41.0


