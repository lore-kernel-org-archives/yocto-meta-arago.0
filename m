Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98E2C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:49:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.25529.1739980176579599900
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 07:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uah43kQ/;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFnY7O2008209
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 09:49:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739980174;
	bh=RPfoE6FvXXveQnkE5N5aj20j4lqInQ8gcMsRTknwqcU=;
	h=From:To:CC:Subject:Date;
	b=Uah43kQ/sZyRaMn4Er+5xXMqiFzc0VSRo+HdHVG7CCRp7R6zlUFYoZIU4fE/m8zcm
	 BKn+xRFPrvQBNbRjrVk2N3YgYLwV53XnrPEKV2R++TsRbVVw9TFPtSe3v70XN7COsX
	 qskZlKqMvl56BreK3mwYSJoLGsSNVF5B+B9x06dU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFnYYE022365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 09:49:34 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 09:49:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 09:49:33 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JFnXT2072515;
	Wed, 19 Feb 2025 09:49:33 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH]  configs/arago-scarthgap-wip-config: qt5 -> qt6
Date: Wed, 19 Feb 2025 09:49:28 -0600
Message-ID: <20250219154928.2737135-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 15:49:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15861

From: Randolph Sapp <rs@ti.com>

Move the scarthgap-wip config to use qt6 instead of qt5 for testing. Use
the 9.6 branch for now builds since this is the latest supported version
tested against scarthgap.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-scarthgap-wip-config.json             | 8 ++++----
 .../arago-scarthgap-wip-config/bblayers.conf.sample       | 2 +-
 configs/arago-scarthgap-wip-config.txt                    | 2 +-
 kas/arago-scarthgap-wip-config.yml                        | 6 +++---
 src/configs/arago-scarthgap-wip-config.xml                | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.json
index 4c6d8ce..8115a1f 100644
--- a/bitbake-setup/arago-scarthgap-wip-config.json
+++ b/bitbake-setup/arago-scarthgap-wip-config.json
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
diff --git a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index dfa65b0..7a542f4 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index 7f4fc3f..4c3a6be 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
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
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index 031ed52..9a90fc3 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -24,7 +24,7 @@
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


