Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D5FC87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 20:32:00 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.6296.1754339517348854672
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 13:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bylzhWry;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 574KVudH129085
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Aug 2025 15:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754339516;
	bh=fHYs50h60nmGpkCGiGjGv+XtF8VdP1u9fjBofDuyb1M=;
	h=From:To:CC:Subject:Date;
	b=bylzhWry7/xmeu9XF/alA5Ily8bIX5LHXRb4MB1S0l5VXxM5iaBu/VVSiZguSaBnK
	 lrRt30v6SLxOm+iXIJ7Tl2SX+RKvEpw3SI96n51EqB64/Z+7neyAHMyijGQw0ybU/9
	 XAk77mw9c8hXS9YOBnSKtttNXlyfPFIU0XB6AE8E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 574KVuOP2279132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Aug 2025 15:31:56 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 15:31:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 15:31:56 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 574KVuis699250;
	Mon, 4 Aug 2025 15:31:56 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-scarthgap-*: Update meta-lts-mixins SHA
Date: Mon, 4 Aug 2025 15:30:59 -0500
Message-ID: <20250804203059.2535032-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Aug 2025 20:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16351

Chromium v132 no longer builds with the HEAD of meta-lts-mixins.
Lock meta-lts-mixins sha to a088f40 working commit.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 configs/arago-scarthgap-chromium-config.txt     | 2 +-
 configs/arago-scarthgap-config.txt              | 2 +-
 configs/arago-scarthgap-next-config.txt         | 2 +-
 configs/arago-scarthgap-selinux-config.txt      | 2 +-
 configs/arago-scarthgap-wip-config.txt          | 2 +-
 kas/arago-scarthgap-chromium-config.yml         | 1 +
 kas/arago-scarthgap-config.yml                  | 1 +
 kas/arago-scarthgap-next-config.yml             | 1 +
 kas/arago-scarthgap-selinux-config.yml          | 1 +
 kas/arago-scarthgap-wip-config.yml              | 1 +
 src/configs/arago-scarthgap-chromium-config.xml | 2 +-
 src/configs/arago-scarthgap-config.xml          | 2 +-
 src/configs/arago-scarthgap-next-config.xml     | 2 +-
 src/configs/arago-scarthgap-selinux-config.xml  | 2 +-
 src/configs/arago-scarthgap-wip-config.xml      | 2 +-
 15 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 00982c0..a088f40 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -8,7 +8,7 @@ meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 9f688c9..865db75 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 75f194e..532b3a0 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -16,7 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index a82f733..f707fcc 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -8,7 +8,7 @@ meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index f69d272..78083d1 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=met
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index fb10504..21dca13 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -44,6 +44,7 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index ed1ae10..4a2afbe 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -37,6 +37,7 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index 752fbbc..22b7466 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -37,6 +37,7 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index ec61271..e4225ed 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -41,6 +41,7 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index ac4a685..3b4ac69 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -37,6 +37,7 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index faebe57..ffcb279 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -40,7 +40,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
             <layers/>
         </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index fb1d07f..ef42cc2 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -40,7 +40,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
             <layers/>
         </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index 6de478c..e71a2ad 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -41,7 +41,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
             <layers/>
         </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index 6ac6e66..aa99490 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -40,7 +40,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
             <layers/>
         </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index d546b89..ef074b2 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -40,7 +40,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
             <layers/>
         </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-wip' commit='HEAD'>

