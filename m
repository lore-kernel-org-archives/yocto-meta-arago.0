Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC77C88C84
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8317.1686168315235046767
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wIp5w+MK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5BqE106644;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=I6pAJYQmseZ7331O/poX4YJPaC18ET5DxkDKPu05gKk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wIp5w+MK1Kgo448b5MgbgYEqzn2k/w0e+zgC5Avm28rwCH2/e6KeGjcExbD2Ag4MA
	 opoi3+NG45XCqPxBM9Ofo/yPqQCkZxtOwCSBlcM8mmEbgJCol+oRk1QErLi9WkkW0v
	 LZ5YD2ir9NXiStlpd1QwDf0z9LIKMzIRCsGDYowA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5BAN030617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL1125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 05/15] oe-layertool-setup: only invoke read with -r
Date: Wed, 7 Jun 2023 15:04:54 -0500
Message-ID: <20230607200504.3810426-6-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14536

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Shellcheck:
read without -r will mangle backslashes.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index abe3f12..ee93ec9 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -246,7 +246,7 @@ parse_input_file() {
         rm "$oebase/tmp_motd"
     fi
 
-    while read line
+    while read -r line
     do
         # clean the parsing variables for each run
         name=""
@@ -434,7 +434,7 @@ $branches
 
 What branch would you like to checkout for the $name repository? 
 EOM
-        read input
+        read -r input
 
         # check that the branch is in the list of branches
         # NOTE: using a for loop here because I want exact matches.
@@ -517,7 +517,7 @@ You can either select one of these tags or specify your own commit SHA sum, or
 press ENTER to use the HEAD of the current branch.
 EOM
 
-    read input
+    read -r input
 
     if [ -z "$input" ]
     then
@@ -606,7 +606,7 @@ Please provide the list of layers you wish to use as a space separated list,
 or press enter to use all of the layers.
 EOM
 
-        read input
+        read -r input
     fi
 
     if [ -z "$input" ]
@@ -625,7 +625,7 @@ cat << EOM
 What is the name of the repository you want to configure?
 EOM
 
-    read name
+    read -r name
 }
 
 
@@ -637,7 +637,7 @@ cat << EOM
 What is the git clone uri of the $name repository?
 EOM
 
-    read uri
+    read -r uri
 }
 
 
@@ -681,7 +681,7 @@ Please select one of the above sample files to use as a template for
 configuring your build environment.
 EOM
 
-        read input
+        read -r input
 
         if [ -e "$input" ]
         then
@@ -736,7 +736,7 @@ Please select one of the above sample files to use as a template for
 configuring your build environment.
 EOM
 
-        read input
+        read -r input
 
         if [ -e "$input" ]
         then
@@ -1029,7 +1029,7 @@ then
         echo ""
         echo ""
         echo "Would you like to configure another repository? [y/n] "
-        read cont
+        read -r cont
     done
 fi
 
-- 
2.40.1


