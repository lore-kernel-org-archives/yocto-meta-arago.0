Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88BFC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:03:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.18900.1749049374541875383
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 08:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mJJl23G+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554F2p5Z795018;
	Wed, 4 Jun 2025 10:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749049371;
	bh=zN+Y6xQqJK6Xyzh3fSIVpVY15OTUCLgnZzzkOIV1iQY=;
	h=From:To:Subject:Date;
	b=mJJl23G+qcIwdY0pkiPj7JMYCccjB48rfagvijp9HVgQ16g2fQA4xD2ccnZ7blxtI
	 y9GSjWMvZk7r1YbpdoGZzfnJ01sS7pwyBOSN9Z85a4LMVppofUQ9Mr31ARsGLKheL4
	 4UXLWIWo9c2YrYErlidO6YOHH6e8T3QBozK6fZ4U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554F2pJx427428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 10:02:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 10:02:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 10:02:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554F2oeA2118417;
	Wed, 4 Jun 2025 10:02:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uMpdi-0001cW-In; Wed, 04 Jun 2025 10:02:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/2] configs/arago-scarthgap-wip: Add meta-lts-mixins scarthgap/rust
Date: Wed, 4 Jun 2025 10:02:49 -0500
Message-ID: <20250604150250.6187-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jun 2025 15:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16251

We are needing the latest version of rust for our Chromium builds, start
using the mixin layer to pull it in.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-scarthgap-wip-config.json         | 11 +++++++++++
 .../arago-scarthgap-wip-config/bblayers.conf.sample   |  1 +
 configs/arago-scarthgap-wip-config.txt                |  1 +
 kas/arago-scarthgap-wip-config.yml                    |  4 ++++
 src/configs/arago-scarthgap-wip-config.xml            |  3 +++
 5 files changed, 20 insertions(+)

diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.json
index 8115a1f..51bb3f1 100644
--- a/bitbake-setup/arago-scarthgap-wip-config.json
+++ b/bitbake-setup/arago-scarthgap-wip-config.json
@@ -68,6 +68,17 @@
       },
       "path": "meta-openembedded"
     },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
index 4f26d30..641ea97 100644
--- a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
@@ -20,6 +20,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 7a542f4..4036320 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -8,6 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=met
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index 4c3a6be..ac4a685 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -34,6 +34,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-wip"
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index 9a90fc3..9339bd8 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -40,6 +40,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-wip' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
-- 
2.17.1


