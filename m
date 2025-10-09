Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC10CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:27:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.7828.1760034455762364661
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 11:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nveZJ5E5;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599IRYoa592571;
	Thu, 9 Oct 2025 13:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760034454;
	bh=rNSobxL4hIy8LAuifcST/j/jVp8y0eWdxMfeblaEghI=;
	h=From:To:Subject:Date;
	b=nveZJ5E5T+IYstoN+NjbskpuN20kKIEHpnLgIYCiKl07YzNNrCIAFCdg0knsPXHou
	 zANncXKCzt+AQZkmIAo0LSPBeRZDubHUwczMWLpl0IuyKDJhHLEULhksBkCWmAbpxJ
	 af1z9jXWgvxenXBgBtvDDrD9Z0SALtRqZP/bhwsU=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599IRY9U1104560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 13:27:34 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 13:27:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 13:27:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599IRYnv430708;
	Thu, 9 Oct 2025 13:27:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v6vMU-0003Bp-9Q; Thu, 09 Oct 2025 13:27:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Remove meta-clang from arago-master-wip builds
Date: Thu, 9 Oct 2025 13:27:34 -0500
Message-ID: <20251009182734.11941-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Oct 2025 18:27:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16679

With the addition of clang in oe-core, the need for the meta-clang layer
is dwindling.  Take this time to remove it for testing so we can verify
if we can remove it for all master configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-master-wip-config.conf.json | 13 +------------
 configs/arago-master-wip-config.txt             |  1 -
 kas/arago-master-wip-config.yml                 |  4 ----
 src/configs/arago-master-wip-config.xml         |  3 ---
 4 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/bitbake-setup/arago-master-wip-config.conf.json b/bitbake-setup/arago-master-wip-config.conf.json
index 6fae0fa..7e225eb 100644
--- a/bitbake-setup/arago-master-wip-config.conf.json
+++ b/bitbake-setup/arago-master-wip-config.conf.json
@@ -90,17 +90,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -118,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index de143bd..84bc59f 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -11,7 +11,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index afe29c4..a96f82f 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -56,10 +56,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index fe52c8c..3a621f3 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -60,9 +60,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
-- 
2.17.1


