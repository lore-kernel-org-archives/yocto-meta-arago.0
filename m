Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DF1C7EE43
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8314.1686168314604781058
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PN5XzeV5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5BhS023389;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=JJ2EEgLLKfiPCvsfXef5bAYXhpwKDFS7+dzpgJ/APSE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PN5XzeV5sW5bGz8vGjjetXntt/r6E0hdlDlj6rdnXMRONKmoH/UqdKUj6DoapPA+v
	 MDnZa42HZfa7UnSn+7tXJGKxl2V8VByqEKC400oDrw8uXDRDxtR3hvinGAyr4juqwf
	 MUvPR7WftC9sjnxKD0UxBbnjmXSDwkrXcFVmSrII=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5BGx030614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:10 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AKx125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 03/15] oe-layertool-setup: fix all the printf calls
Date: Wed, 7 Jun 2023 15:04:52 -0500
Message-ID: <20230607200504.3810426-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14526

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

You aren't supposed to use a variable in the printf format definition.
It kinda defeats the purpose of using printf.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 3faf00c..3e6ac4e 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -338,12 +338,12 @@ configure_repo() {
 
     # Check if the repo with $name was already seen.  Use the , at the end
     # of the grep to avoid matching similar named repos.
-    temp=$(printf '%s\n' $output | grep -e "^$name,")
+    temp=$(printf '%s\n' "$output" | grep -e "^$name,")
 
     if [ -n "$temp" ]
     then
         echo "This repository ($name) has already been configured with the following values:"
-        printf '\t%s\n' $temp
+        printf '\t%s\n' "$temp"
         echo "Skipping configuring duplicate repository"
         return 1
     fi
@@ -422,7 +422,7 @@ get_repo_branch() {
         do
             branches="$branches"$(echo $b | sed 's:.*origin/::g')"\n"
         done
-        branches=$(printf "$branches\n" | sort | uniq)
+        branches=$(printf '%s\n' "$branches" | sort | uniq)
 
 cat << EOM
 
@@ -503,12 +503,12 @@ EOM
     tags=$(git tag)
     if [ -z "$tags" ]
     then
-        printf "\tNo tags found\n"
+        printf '\t%s\n' "No tags found"
     else
         # Format the tags nicely
         for t in $tags
         do
-            printf "\t* $t\n"
+            printf '\t%s\n' "* $t"
         done
     fi
 cat << EOM
@@ -597,7 +597,7 @@ EOM
 
     for l in $t_layers
     do
-        printf "\t"$(echo $l | sed "s:${name}\/::")"\n"
+        printf '\t%s\n' "$(echo $l | sed "s:${name}\/::")"
     done
 
 cat << EOM
@@ -673,7 +673,7 @@ EOM
 
         for f in $confs
         do
-            printf "\t$f\n"
+            printf '\t%s\n' "$f"
         done
 
 cat << EOM
@@ -728,7 +728,7 @@ EOM
 
         for f in $confs
         do
-            printf "\t$f\n"
+            printf '\t%s\n' "$f"
         done
 
 cat << EOM
@@ -777,7 +777,7 @@ BBLAYERS += " \\
 EOM
     for l in $layers
     do
-        printf "\t$l \\%b" "\n" >> $confdir/bblayers.conf
+        printf '\t%s \\\n' "$l" >> $confdir/bblayers.conf
     done
     echo "\"" >> $confdir/bblayers.conf
 }
@@ -1048,7 +1048,7 @@ then
     then
         mkdir -p $dir
     fi
-    printf '%s\n' $output > $outputfile
+    printf '%s\n' "$output" > $outputfile
     echo "Output file is $outputfile"
 fi
 
-- 
2.40.1


