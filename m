Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B6C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 16:03:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.26066.1739980983987819710
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 08:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XVTnhwd2;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JG2uIl338830
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 10:02:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739980976;
	bh=2rxTUqVHcNg8iXruvyfrDGknv6zgS8xqkQgI5J4FQcI=;
	h=From:To:CC:Subject:Date;
	b=XVTnhwd2+cuUGfFvz2hXlelngFVM5ZU7icWuOlPzy5XI8ziLCC+CzrwTM/myTBoPU
	 R327f4LXHoKUki6tbqCanRyg6yXH9aeoAlSVLwepA6jwFsUrkcIT13tRiTBvH0wCp2
	 tc1ihH7WBKYQi+m1WUUL+yztx6BXu9+gDIaaPYbo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JG2uHg001313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 10:02:56 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 10:02:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 10:02:55 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JG2tlN089731;
	Wed, 19 Feb 2025 10:02:55 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH] configs/arago-scarthgap-*-config: qt5 -> qt6
Date: Wed, 19 Feb 2025 10:02:50 -0600
Message-ID: <20250219160250.2744040-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 16:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15863

From: Randolph Sapp <rs@ti.com>

Move the rest of the scarthgap configs to use qt6 instead of qt5 not
that scarthgap-wip and scarthgap-next have been tested. Use the 9.6
branch for now builds since this is the latest supported version tested
against scarthgap.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-scarthgap-chromium-config.json        | 8 ++++----
 bitbake-setup/arago-scarthgap-config.json                 | 8 ++++----
 bitbake-setup/arago-scarthgap-selinux-config.json         | 8 ++++----
 .../arago-scarthgap-chromium-config/bblayers.conf.sample  | 2 +-
 .../templates/arago-scarthgap-config/bblayers.conf.sample | 2 +-
 .../arago-scarthgap-selinux-config/bblayers.conf.sample   | 2 +-
 configs/arago-scarthgap-chromium-config.txt               | 2 +-
 configs/arago-scarthgap-config.txt                        | 2 +-
 configs/arago-scarthgap-selinux-config.txt                | 2 +-
 kas/arago-scarthgap-chromium-config.yml                   | 6 +++---
 kas/arago-scarthgap-config.yml                            | 6 +++---
 kas/arago-scarthgap-selinux-config.yml                    | 6 +++---
 src/configs/arago-scarthgap-chromium-config.xml           | 2 +-
 src/configs/arago-scarthgap-config.xml                    | 2 +-
 src/configs/arago-scarthgap-selinux-config.xml            | 2 +-
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
index ad18b57..a0fb0d3 100644
--- a/bitbake-setup/arago-scarthgap-chromium-config.json
+++ b/bitbake-setup/arago-scarthgap-chromium-config.json
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
-        "rev": "scarthgap"
+        "rev": "6.9"
       },
-      "path": "meta-qt5"
+      "path": "meta-qt6"
     },
     "meta-virtualization": {
       "git-remote": {
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
index d732a67..18af746 100644
--- a/bitbake-setup/arago-scarthgap-config.json
+++ b/bitbake-setup/arago-scarthgap-config.json
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
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
index 304cf22..918aa42 100644
--- a/bitbake-setup/arago-scarthgap-selinux-config.json
+++ b/bitbake-setup/arago-scarthgap-selinux-config.json
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
-        "rev": "scarthgap"
+        "rev": "6.9"
       },
-      "path": "meta-qt5"
+      "path": "meta-qt6"
     },
     "meta-virtualization": {
       "git-remote": {
diff --git a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
index 29beb7d..80b4c62 100644
--- a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
@@ -13,7 +13,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-browser/meta-chromium
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/conf/templates/arago-scarthgap-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-scarthgap-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
index 094ec81..12aeae1 100644
--- a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
@@ -13,7 +13,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-selinux
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 9f500fa..1d4cbd0 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 6513be5..32fc5f4 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index d27bada..681be86 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index 9e2bbb0..1cad9d5 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -22,9 +22,9 @@ repos:
     layers:
       meta-chromium:
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "scarthgap"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index 87864ec..9d79113 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
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
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index ea839f3..717a55b 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -19,9 +19,9 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "scarthgap"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index c581453..f81380c 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index 3f5d6b0..a1381e1 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index 1246f61..42fde7c 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -24,7 +24,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
-- 
2.48.1


