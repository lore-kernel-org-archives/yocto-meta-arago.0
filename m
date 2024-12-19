Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A905E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:44:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.130312.1734619488487199502
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 06:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vTxjlQqz;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJEikMS017701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 08:44:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734619486;
	bh=iGZboc9M60VHooKP5OYqffcVPFrJrZRTew47yCuEU2g=;
	h=From:To:Subject:Date;
	b=vTxjlQqzpO4H5Rp+gD7ogUmvuHgNQnZh8lWm/b/nSZVuKAQXCUfPxOMAdpsHt6OWD
	 lNAjGdrEevrRKVQ92wXST3lftjk1dRuS7qb4R6moJBR+L0n/hSmwPnHw56rHep4pZl
	 79VZBRpXOU6rOKxnqUUiD/AMHaVz3tV3Ck7AGXd0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJEikCd068035;
	Thu, 19 Dec 2024 08:44:46 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 08:44:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 08:44:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJEikw2116065;
	Thu, 19 Dec 2024 08:44:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOHle-0006tZ-7Z; Thu, 19 Dec 2024 08:44:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-master-*-config: Add meta-beagle
Date: Thu, 19 Dec 2024 08:44:46 -0600
Message-ID: <20241219144446.26465-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Dec 2024 14:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15672

Now that testing is complete, we can add the new meta-beagle layer
for all master configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../templates/arago-master-chromium-config/bblayers.conf.sample | 1 +
 conf/templates/arago-master-config/bblayers.conf.sample         | 1 +
 conf/templates/arago-master-next-config/bblayers.conf.sample    | 1 +
 conf/templates/arago-master-selinux-config/bblayers.conf.sample | 1 +
 configs/arago-master-chromium-config.txt                        | 2 +-
 configs/arago-master-config.txt                                 | 2 +-
 configs/arago-master-next-config.txt                            | 2 +-
 configs/arago-master-selinux-config.txt                         | 2 +-
 kas/arago-master-chromium-config.yml                            | 1 +
 kas/arago-master-config.yml                                     | 1 +
 kas/arago-master-next-config.yml                                | 1 +
 kas/arago-master-selinux-config.yml                             | 1 +
 src/configs/arago-master-chromium-config.xml                    | 1 +
 src/configs/arago-master-config.xml                             | 1 +
 src/configs/arago-master-next-config.xml                        | 1 +
 src/configs/arago-master-selinux-config.xml                     | 1 +
 16 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/conf/templates/arago-master-chromium-config/bblayers.conf.sample b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
index 87cb84f..3e5edee 100644
--- a/conf/templates/arago-master-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
@@ -23,6 +23,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-master-config/bblayers.conf.sample b/conf/templates/arago-master-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-master-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-master-next-config/bblayers.conf.sample b/conf/templates/arago-master-next-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-master-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-next-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/conf/templates/arago-master-selinux-config/bblayers.conf.sample b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
index e46cf86..51b8551 100644
--- a/conf/templates/arago-master-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
@@ -23,6 +23,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index 75df1ed..f15ab67 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -8,7 +8,7 @@ meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=me
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index bdbf9ef..1cde5d9 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 0fbdb62..210bd68 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -16,7 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
index 4b02b2d..ed4ecdd 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -8,7 +8,7 @@ meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index cc03637..bf8c5f3 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -46,6 +46,7 @@ repos:
     branch: "master"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 30b0833..6a21d96 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "master"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index 69b90b6..6514b9d 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "master-next"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
index af37fcf..922ab89 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -44,6 +44,7 @@ repos:
     branch: "master"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index 8e73d0f..9abaf97 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index 33a0210..8380a57 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index ebdbf53..0eee296 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -45,6 +45,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-next' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index f6cfc8b..6ecea87 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-- 
2.17.1


