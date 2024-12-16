Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790E9E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:58:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.58336.1734361113323242361
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 06:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lxcyzSD5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BGEwVMx100807;
	Mon, 16 Dec 2024 08:58:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734361111;
	bh=ZcitBRyXJKUFRTiMKQKJprBb7VK8FMTXthDkiCoqs2w=;
	h=From:To:Subject:Date;
	b=lxcyzSD52fMYpYYPo+kQryxdvBghbdAj+woM7JAYOJwvfND7Ulw8T0EdJjLLKK0UG
	 Fhx2D73vW+kGmtafiCJCHGRBrg4ROQoDNGAmoJTlBKitHmmTzJehenNFs39wSVPOUH
	 eCgBKaLL6em63NffChF7j/YI89rjvmMMoE28Yv7Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGEwVMf010294;
	Mon, 16 Dec 2024 08:58:31 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 08:58:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 08:58:31 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGEwVQb084334;
	Mon, 16 Dec 2024 08:58:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tNCYJ-0002x3-Cg; Mon, 16 Dec 2024 08:58:31 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-master-wip-config: Add meta-beagle for testing
Date: Mon, 16 Dec 2024 08:58:31 -0600
Message-ID: <20241216145831.11305-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Dec 2024 14:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15662

In order to fully test the new meta-beagle layer under meta-ti, we need
to add the layer to our arago-master-wip config.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/templates/arago-master-wip-config/bblayers.conf.sample | 1 +
 configs/arago-master-wip-config.txt                         | 2 +-
 kas/arago-master-wip-config.yml                             | 1 +
 src/configs/arago-master-wip-config.xml                     | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/templates/arago-master-wip-config/bblayers.conf.sample b/conf/templates/arago-master-wip-config/bblayers.conf.sample
index c091169..adbccbd 100644
--- a/conf/templates/arago-master-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-wip-config/bblayers.conf.sample
@@ -22,6 +22,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
     ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
     ##OEROOT##/../meta-arm/meta-arm
     ##OEROOT##/../meta-arm/meta-arm-toolchain
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index 3ca1ec9..a85e1fb 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-a
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index 4b2e145..429bb06 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -40,6 +40,7 @@ repos:
     branch: "master-wip"
     layers:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
 
   meta-arm:
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index 6148d25..74718d5 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -44,6 +44,7 @@
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-wip' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-- 
2.17.1


