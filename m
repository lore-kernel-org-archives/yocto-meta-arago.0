Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D6FE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:00:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.139835.1734645644843196382
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 14:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sObROyN7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJM0ioJ020393;
	Thu, 19 Dec 2024 16:00:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645644;
	bh=cSOiBAQMrSNWnf+u8bku4OEaHeylNBFlNrV7cAcPtpA=;
	h=From:To:Subject:Date;
	b=sObROyN782cge5XEBzwW1UkbT6mPK7JhWjH+9/EkfOwAgTM4LhzyT9ZlO5BLnFVGh
	 7m392YhjoiPbInjI6XF8659qndXEn4g1le5vjzKeMhE/2Q0MIe4OqO3H/YGLkHZ91W
	 ptRn+hPxw6Rq2u1JzLFq6sBHaSbkIepHsiOzliHI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJM0isH054802;
	Thu, 19 Dec 2024 16:00:44 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 16:00:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 16:00:43 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJM0hRx074787;
	Thu, 19 Dec 2024 16:00:43 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOZX-0007PS-Kx; Thu, 19 Dec 2024 16:00:43 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-scarthgap-*-config: Add meta-beagle
Date: Thu, 19 Dec 2024 16:00:43 -0600
Message-ID: <20241219220043.28438-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Dec 2024 22:00:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15674

Now that testing is complete, we can add the new meta-beagle layer
for all scarthgap configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-scarthgap-chromium-config/bblayers.conf.sample        | 1 +
 conf/templates/arago-scarthgap-config/bblayers.conf.sample      | 1 +
 conf/templates/arago-scarthgap-next-config/bblayers.conf.sample | 1 +
 .../arago-scarthgap-selinux-config/bblayers.conf.sample         | 1 +
 conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample  | 1 +
 configs/arago-scarthgap-chromium-config.txt                     | 2 +-
 configs/arago-scarthgap-config.txt                              | 2 +-
 configs/arago-scarthgap-next-config.txt                         | 2 +-
 configs/arago-scarthgap-selinux-config.txt                      | 2 +-
 configs/arago-scarthgap-wip-config.txt                          | 2 +-
 kas/arago-scarthgap-chromium-config.yml                         | 1 +
 kas/arago-scarthgap-config.yml                                  | 1 +
 kas/arago-scarthgap-next-config.yml                             | 1 +
 kas/arago-scarthgap-selinux-config.yml                          | 1 +
 kas/arago-scarthgap-wip-config.yml                              | 1 +
 src/configs/arago-scarthgap-chromium-config.xml                 | 1 +
 src/configs/arago-scarthgap-config.xml                          | 1 +
 src/configs/arago-scarthgap-next-config.xml                     | 1 +
 src/configs/arago-scarthgap-selinux-config.xml                  | 1 +
 src/configs/arago-scarthgap-wip-config.xml                      | 1 +
 20 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
index 87cb84f..3e5edee 100644
--- a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
@@ -23,6 +23,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-scarthgap-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-scarthgap-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
index e46cf86..51b8551 100644
--- a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
@@ -23,6 +23,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 31e1fa8..9a1bd08 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -8,7 +8,7 @@ meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c2
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 0e81d34..3275f35 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index d93b6d4..fef4338 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -16,7 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 1c6f6c6..17dc6a4 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -8,7 +8,7 @@ meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 7b67cde..8dd69c8 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=met
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index 10d03da..35e9e36 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -47,6 +47,7 @@ repos:
     branch: "scarthgap"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index 8cafad0..5ce2d76 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "scarthgap"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index 00ba86e..774ce6e 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "scarthgap-next"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index 02ded02..16235e8 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -44,6 +44,7 @@ repos:
     branch: "scarthgap"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index dd01791..4614b81 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "scarthgap-wip"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index de86b18..6ccf049 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index eeeffd6..5efd7cc 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index a91fbb2..44ce2be 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -45,6 +45,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index bb37f71..f0d8f14 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index 6395fa0..667bf89 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-wip' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-- 
2.17.1


