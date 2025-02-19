Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB6AC021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:55:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.25707.1739980542417763445
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 07:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WGjcqiFd;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFtetm337656
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 09:55:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739980540;
	bh=GELxa8yWC1lxju5P4ikWtrxLQnLGPG0KtVVc5srImBw=;
	h=From:To:CC:Subject:Date;
	b=WGjcqiFdg5ojJ7+0MqLq9i4ToLNnGCiQiiWhuUmZ6XF6bQcxCNGt/m/7jTmROAkff
	 LJNDVZJsuHuz+EbO9XcC9/xZ+VQTBWlaW7ga60aBFpx/3MWvmqirsKRSjKJxjG2Mh1
	 MdaXzrQxLF5RnOBkquKQdjFsU3bmDt9E1GhYEZNc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFteII026056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 09:55:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 09:55:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 09:55:39 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JFtdoO120451;
	Wed, 19 Feb 2025 09:55:39 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH]  configs/arago-scarthgap-next-config: qt5 -> qt6
Date: Wed, 19 Feb 2025 09:55:32 -0600
Message-ID: <20250219155532.2740419-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 15:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15862

From: Randolph Sapp <rs@ti.com>

Move the scarthgap-next config to use qt6 instead of qt5 for testing now
that scarthgap-wip has been verified. Use the 9.6 branch for now builds
since this is the latest supported version tested against scarthgap.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-scarthgap-next-config.json            | 8 ++++----
 .../arago-scarthgap-next-config/bblayers.conf.sample      | 2 +-
 configs/arago-scarthgap-next-config.txt                   | 3 ++-
 kas/arago-scarthgap-next-config.yml                       | 6 +++---
 src/configs/arago-scarthgap-next-config.xml               | 2 +-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
index fa2fdfe..f6d48e6 100644
--- a/bitbake-setup/arago-scarthgap-next-config.json
+++ b/bitbake-setup/arago-scarthgap-next-config.json
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
-        "rev": "scarthgap"
+        "rev": "6.9"
       },
-      "path": "meta-qt5"
+      "path": "meta-qt6"
     },
     "meta-virtualization": {
       "git-remote": {
diff --git a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index f4aac69..5cd1104 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -13,7 +13,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
@@ -32,6 +32,7 @@ LOCALCONF:BRANCH:recipe-cnm-wave-fw_git.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-goodix-fw_git.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-linux-ti-staging_6.12.bb = "ti-linux-6.12.y-cicd"
 LOCALCONF:BRANCH:recipe-linux-ti-staging-rt_6.12.bb = "ti-linux-6.12.y-cicd"
+LOCALCONF:BRANCH:recipe-linux-ti-staging-systest_6.12.bb = "ti-linux-6.12.y-cicd"
 LOCALCONF:BRANCH:recipe-prueth-fw_5.6.15.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-pruhsr-fw_2.17.25.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-pruprp-fw_2.17.25.bb = "ti-linux-firmware-next"
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index c6dc88c..6fa24c7 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -15,9 +15,9 @@ repos:
       meta-arago-extras:
       meta-arago-test:
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "scarthgap"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index f98a1a8..8368784 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -25,7 +25,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
-- 
2.48.1


