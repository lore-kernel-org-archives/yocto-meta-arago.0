Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8075EC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 00:44:09 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.12118.1739925848487076647
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 16:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sEI8KsSU;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0i4Ur137885
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 18:44:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739925844;
	bh=GCZDM4wuMj65b+4uklwMxM4uoK0P4MN2OSIceD9zhT8=;
	h=From:To:CC:Subject:Date;
	b=sEI8KsSUd1b8L3PPnSWcffQt8ajAVZJjYCDtEVJymqkoCfcsEpkgvyM6LKjwgew4c
	 anpNQrkmUvfB/Dvoyb33qOGWX5gKkY8Qqk4i13YsHsvv8V47ehzZVoGlWbkLydWkro
	 KSsI6E4A2y/cWzWji7YmdNIQuR2WOrhIQfxZeFnU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0i3Ux000554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 18:44:04 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 18:44:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 18:44:03 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J0i3bF013043;
	Tue, 18 Feb 2025 18:44:03 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH] configs/arago-master-wip-config: qt5 -> qt6
Date: Tue, 18 Feb 2025 18:43:46 -0600
Message-ID: <20250219004346.2008672-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 00:44:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15854

From: Randolph Sapp <rs@ti.com>

Move the master config to use qt6 instead of qt5. Use the dev branch for
master builds since there is no master branch upstream.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-master-wip-config.json                | 8 ++++----
 .../arago-master-wip-config/bblayers.conf.sample          | 2 +-
 kas/arago-master-wip-config.yml                           | 6 +++---
 src/configs/arago-master-wip-config.xml                   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/bitbake-setup/arago-master-wip-config.json b/bitbake-setup/arago-master-wip-config.json
index 42885ed..cea3704 100644
--- a/bitbake-setup/arago-master-wip-config.json
+++ b/bitbake-setup/arago-master-wip-config.json
@@ -35,16 +35,16 @@
       },
       "path": "meta-arago"
     },
-    "meta-qt5": {
+    "meta-qt6": {
       "git-remote": {
         "remotes": {
           "origin": {
-            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "master"
+        "rev": "dev"
       },
-      "path": "meta-qt5"
+      "path": "meta-qt6"
     },
     "meta-virtualization": {
       "git-remote": {
diff --git a/conf/templates/arago-master-wip-config/bblayers.conf.sample b/conf/templates/arago-master-wip-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-master-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-wip-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index f994926..f1628d0 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -15,9 +15,9 @@ repos:
       meta-arago-extras:
       meta-arago-test:
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "master"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index ded9e5a..8a2d7f5 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
-- 
2.48.1


