Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592E5C88C83
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8310.1686168314396010938
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DDd24qrt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5Bku002229;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=BGhjst7LgE50k8ENymCmeVpum2BANcJA6XVVTtfUkPA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DDd24qrtZhHzucDaA/ie8EuG/eclfoZ18fT/X+2+j7bpbTs0SGKhGIS1kBUVgiDBc
	 e6DrfGdPCz1qVtpMNPnVqK8UtRBgQfS7sm1NB7d1UQ16Y3gT9YRRkhjJqj/58ccWJx
	 zBL2d1lKJwdGOJSwoq2hMIot1F5/iIYbihc9Oafs=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5Bsb036869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL3125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 07/15] oe-layertool-setup: guard all cd calls
Date: Wed, 7 Jun 2023 15:04:56 -0500
Message-ID: <20230607200504.3810426-8-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14523

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Make the scrip exit early if any cd calls fail in the main process.
Return 1 in the case a function fails to cd.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index a87a423..6908fe2 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -386,9 +386,8 @@ configure_repo() {
 clone_repo() {
     # check if the repo already exists.  if so then fetch the latest updates,
     # else clone it
-    if [ -d "$sourcedir/$name" ]
+    if cd "$sourcedir/$name" 2> /dev/null
     then
-        cd "$sourcedir/$name"
         "$scriptdir/git_retry.sh" fetch --all
     else
         if ! "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
@@ -405,7 +404,7 @@ get_repo_branch() {
 
     while [ "$found" = "0" ]
     do
-        cd "$sourcedir/$name"
+        cd "$sourcedir/$name" || return 1
 
         # Get a unique list of branches for the user to chose from
         # Also delete the origin/HEAD line that the -r option returns
@@ -448,7 +447,7 @@ EOM
 }
 
 checkout_branch() {
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
 
     # Check if a local branch already exists to track the remote branch.
     # If not then create a tracking branch and checkout the branch
@@ -474,7 +473,7 @@ checkout_branch() {
 }
 
 checkout_commit() {
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
     if [ "$commit" != "HEAD" ]
     then
         git checkout $commit
@@ -483,7 +482,7 @@ checkout_commit() {
 
 get_repo_commit() {
   # prompt for what commit to use with HEAD as default
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
 cat << EOM
 
 
@@ -517,7 +516,7 @@ EOM
 }
 
 verify_layers() {
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     for l in $repo_layers
     do
         if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
@@ -555,7 +554,7 @@ select_layers() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     # Get a count of how many layers there are
     count=$(find "$name" -name "layer.conf" | grep -c layer.conf)
 
@@ -646,7 +645,7 @@ get_oecorelayerconf() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     confs=$(find . -name "bblayers.conf.sample")
 
     done="n"
@@ -701,7 +700,7 @@ get_oecorelocalconf() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     confs=$(find . -name "local.conf.sample")
 
     done="n"
@@ -970,9 +969,9 @@ mkdir -p "$oebase"
 
 # retrive the absolute path to the oebase directory incase
 # a relative path is passed in
-cd "$oebase"
+cd "$oebase" || exit 1
 oebase=$(pwd)
-cd -
+cd - || exit 1
 
 # Populate the following variables depending on the value of oebase
 sourcedir="$oebase/sources"
@@ -1031,7 +1030,7 @@ config_oecorelocalconf
 if [ -n "$outputfile" ]
 then
     # make sure that the directory for the output file exists
-    cd "$oebase"
+    cd "$oebase" || exit 1
     dir=$(dirname "$outputfile")
     if [ ! -d "$dir" ]
     then
-- 
2.40.1


