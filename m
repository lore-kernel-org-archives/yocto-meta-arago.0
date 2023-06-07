Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39239C87FE2
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8313.1686168314515104534
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eXRLKBSo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5Bv0002227;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=+iWhz9Bx6mBdtqwulw4Ef52fduATUucrofXi5IH6R9Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eXRLKBSoeCG5vQbfZa4ssajuD8h8kDyRYR9XVLEbbz+Je+R5nwIoULHqzCX1uVHSO
	 /fcdr/f+O0mTYz07rJlqnqnlHTbel4K5wWXq1uDD4nDqyUnUGiDIUGCokNnFeuyqtu
	 fo9Nl1ruig+OI60iB+Lo2RWKZuZWRUDd+1EG+5fM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5B4Q070112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:10 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL2125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 06/15] oe-layertool-setup: check exit code directly
Date: Wed, 7 Jun 2023 15:04:55 -0500
Message-ID: <20230607200504.3810426-7-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14529

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Shellcheck:
Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
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
2.40.1


