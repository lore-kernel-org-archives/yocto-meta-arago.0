Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B528C87FE4
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8431.1686168314799506483
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A6bVqHkX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5CPg002239;
	Wed, 7 Jun 2023 15:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168312;
	bh=mDjzrDaOnFEXIHOFUl1bxuyMGIsXQI/ii/jyk8exmrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A6bVqHkX63xyVqr5rVFPhiCrNUccDukmprv/fixMcTxoOnccCjjFzFXNsThkRFH+/
	 gkhhhn3tRmEROp77qwQoGgswlYwUwegKiRPo2+DC3UQTy/NQxPmnPfjPWAgGLL2XGp
	 Ytr2yuK31pxJtQ4bYATkmjNrx7WJTdb5I1VtKIoE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5Cba070124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:12 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5ALA125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 14/15] oe-layertool-setup: fix multi-line printfs
Date: Wed, 7 Jun 2023 15:05:03 -0500
Message-ID: <20230607200504.3810426-15-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14532

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Replace multiple printf calls with one call and a good format.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 8694abd..2b05550 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -347,10 +347,10 @@ configure_repo() {
         get_repo_uri
     fi
 
-    printf '%s\n' ""
-    printf '%s\n' ""
-    printf '%s\n' "cloning repo $name"
-    printf '%s\n' ""
+    printf '%s\n' "" \
+                  "" \
+                  "cloning repo $name" \
+                  "" ;
 
     clone_repo
 
@@ -522,8 +522,8 @@ verify_layers() {
     do
         if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
         then
-            printf '%s\n' "ERROR: the $l layer in the $name repository could not be"
-            printf '%s\n' "       found.  Bailing out."
+            printf '%s\n' "ERROR: the $l layer in the $name repository could not be" \
+                          "       found.  Bailing out." ;
             exit 1
         fi
     done
@@ -793,8 +793,8 @@ EOM
     
     if [ -e "$confdir/local.conf" ]
     then
-        printf '%s\n' "WARNING: Found existing $confdir/local.conf"
-        printf '%s\n' "Saving a backup to $confdir/local.conf.bak" 
+        printf '%s\n' "WARNING: Found existing $confdir/local.conf" \
+                      "Saving a backup to $confdir/local.conf.bak";
         cp -f "$confdir/local.conf" "$confdir/local.conf.bak"
     fi
 
@@ -820,16 +820,16 @@ EOM
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
         {
-            printf '%s\n' "";
-            printf '%s\n' "#====================================================================";
-            printf '%s\n' "# LOCALCONF: settings from config file:";
-            printf '%s\n' "#   $inputfile";
-            printf '%s\n' "#";
-            printf '%s\n' "# Do not remove.";
-            printf '%s\n' "#--------------------------------------------------------------------";
+            printf '%s\n' "" \
+                          "#====================================================================" \
+                          "# LOCALCONF: settings from config file:" \
+                          "#   $inputfile" \
+                          "#" \
+                          "# Do not remove." \
+                          "#--------------------------------------------------------------------" ;
             cat "$oebase/tmp_append_local.conf";
-            printf '%s\n' "#====================================================================";
-            printf '%s\n' "";
+            printf '%s\n' "#====================================================================" \
+                          "" ;
         } >> "$confdir/local.conf"
         rm "$oebase/tmp_append_local.conf"
     fi
@@ -1024,9 +1024,9 @@ then
 
         save_layers
 
-        printf '%s\n' ""
-        printf '%s\n' ""
-        printf '%s\n' "Would you like to configure another repository? [y/n] "
+        printf '%s\n' "" \
+                      "" ;
+        printf '%s' "Would you like to configure another repository? [y/n] "
         read -r cont
     done
 fi
-- 
2.40.1


