Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F45C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 00:52:49 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.12082.1739926359414758548
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 16:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nmXXS9ky;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0qbll113825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 18:52:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739926358;
	bh=GdceV+CydpP2YeJPzdGM0hloHLpd67QltVFtUVELgtE=;
	h=From:To:CC:Subject:Date;
	b=nmXXS9kyYyTglzW7CxsBLr7S/gYuEa/Cy0AJl9ofqVR6+ucS8dgY/7wxE96/GGajy
	 IHa9QeF+pdvq9zXo545duSMRGrKWLmWHAn393QaEHMhCvHpjktFP9w6MFX6WVXC1FX
	 5NA8dPzKKq7vPwREHTnuemHX3qJmuPXmdqxZp11g=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0qbNZ021861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 18:52:37 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 18:52:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 18:52:36 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J0qakQ115659;
	Tue, 18 Feb 2025 18:52:36 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH] configs/arago-master-*-config: qt5 -> qt6
Date: Tue, 18 Feb 2025 18:52:31 -0600
Message-ID: <20250219005231.2012998-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 00:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15856

From: Randolph Sapp <rs@ti.com>

Move the the rest of the master configs to use qt6 instead of qt5 now
that master-next has been verified. Use the dev branch for master builds
since there is no master branch upstream.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-master-chromium-config.json           | 8 ++++----
 bitbake-setup/arago-master-config.json                    | 8 ++++----
 bitbake-setup/arago-master-selinux-config.json            | 8 ++++----
 .../arago-master-chromium-config/bblayers.conf.sample     | 2 +-
 conf/templates/arago-master-config/bblayers.conf.sample   | 2 +-
 .../arago-master-selinux-config/bblayers.conf.sample      | 2 +-
 configs/arago-master-chromium-config.txt                  | 2 +-
 configs/arago-master-config.txt                           | 2 +-
 configs/arago-master-selinux-config.txt                   | 2 +-
 kas/arago-master-chromium-config.yml                      | 6 +++---
 kas/arago-master-config.yml                               | 6 +++---
 kas/arago-master-selinux-config.yml                       | 6 +++---
 src/configs/arago-master-chromium-config.xml              | 2 +-
 src/configs/arago-master-config.xml                       | 2 +-
 src/configs/arago-master-selinux-config.xml               | 2 +-
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/bitbake-setup/arago-master-chromium-config.json b/bitbake-setup/arago-master-chromium-config.json
index 29deaa9..82d7f1d 100644
--- a/bitbake-setup/arago-master-chromium-config.json
+++ b/bitbake-setup/arago-master-chromium-config.json
@@ -46,16 +46,16 @@
       },
       "path": "meta-browser"
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
diff --git a/bitbake-setup/arago-master-config.json b/bitbake-setup/arago-master-config.json
index 4881f08..38dc3e6 100644
--- a/bitbake-setup/arago-master-config.json
+++ b/bitbake-setup/arago-master-config.json
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
diff --git a/bitbake-setup/arago-master-selinux-config.json b/bitbake-setup/arago-master-selinux-config.json
index 27f049c..8d5d8b8 100644
--- a/bitbake-setup/arago-master-selinux-config.json
+++ b/bitbake-setup/arago-master-selinux-config.json
@@ -46,16 +46,16 @@
       },
       "path": "meta-selinux"
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
diff --git a/conf/templates/arago-master-chromium-config/bblayers.conf.sample b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
index 29beb7d..80b4c62 100644
--- a/conf/templates/arago-master-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
@@ -13,7 +13,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-browser/meta-chromium
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/conf/templates/arago-master-config/bblayers.conf.sample b/conf/templates/arago-master-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-master-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/conf/templates/arago-master-selinux-config/bblayers.conf.sample b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
index 094ec81..12aeae1 100644
--- a/conf/templates/arago-master-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
@@ -13,7 +13,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-selinux
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index df3f0ba..a64fbda 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 7a1a481..17d92cd 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
index 5cf0631..3ba46b2 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index 837ef0e..99168f6 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -21,9 +21,9 @@ repos:
     layers:
       meta-chromium:
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "master"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 5434891..b7855b8 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
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
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
index 46b32c7..41070ec 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -19,9 +19,9 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "master"
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "master"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index ec58ea9..acc5a51 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index 94f3ac1..d56ec9a 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index 0c5019f..5041fba 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
-- 
2.48.1


