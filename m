Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4057CCA0ED1
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.25575.1755304603499166476
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jugsPZKo;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aecX2709534;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=lkJv9r6sIXILcX+NN+dUjZSYSr05iZGHlJTqlqrgJIs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jugsPZKoeTDi7AdN2DN1k1HS/9vEB0uIgwMDZN9tgZezw/h6pHev1mM3YXNXVMAY+
	 uD90lFR3Fi+jCb0m57eXKQYllkJtvNXnc5Hb0UsK/1S+yn3FTgFbZrktzet6PblZOG
	 bxT8GyeeUvrrW+1r/uow3bLluh2jVe4iB/zq0H+k=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0ae042794009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:40 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0aduv1743917;
	Fri, 15 Aug 2025 19:36:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 5/5] kas: regenerate all configs to include yamllint fixes
Date: Fri, 15 Aug 2025 19:36:20 -0500
Message-ID: <20250816003620.2112669-6-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816003620.2112669-1-rs@ti.com>
References: <20250816003620.2112669-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 16 Aug 2025 00:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16486

From: Randolph Sapp <rs@ti.com>

Regenerate all the configs to include fixes for yamllint.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 kas/arago-kirkstone-chromium-config.yml       |  2 +-
 kas/arago-kirkstone-config.yml                |  2 +-
 kas/arago-kirkstone-next-config.yml           |  1 +
 kas/arago-kirkstone-wip-config.yml            |  2 +-
 kas/arago-master-chromium-config.yml          |  2 +-
 kas/arago-master-config.yml                   |  2 +-
 kas/arago-master-next-config.yml              |  1 +
 kas/arago-master-selinux-config.yml           |  1 +
 kas/arago-master-wip-config.yml               |  2 +-
 kas/arago-scarthgap-10x-config.yml            |  1 +
 kas/arago-scarthgap-10x-next-config.yml       |  1 +
 kas/arago-scarthgap-chromium-config.yml       |  2 +-
 kas/arago-scarthgap-config.yml                |  2 +-
 kas/arago-scarthgap-flutter-config.yml        |  1 +
 kas/arago-scarthgap-next-config.yml           |  1 +
 kas/arago-scarthgap-selinux-config.yml        |  1 +
 kas/arago-scarthgap-wip-config.yml            |  2 +-
 kas/coresdk/coresdk-09.00.00.006-config.yml   |  2 +-
 kas/coresdk/coresdk-09.00.00.007-config.yml   |  2 +-
 kas/coresdk/coresdk-09.00.00.011-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.001-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.003-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.007-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.008-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.008-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.009-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.010-config.yml   |  2 +-
 kas/coresdk/coresdk-09.03.05-config.yml       |  2 +-
 kas/coresdk/coresdk-10.00.07-config.yml       |  2 +-
 kas/coresdk/coresdk-10.01.08-config.yml       |  2 +-
 kas/coresdk/coresdk-10.01.10-config.yml       |  2 +-
 .../coresdk-10.01.10-selinux-config.yml       |  1 +
 kas/coresdk/coresdk-11.00.09-config.yml       |  2 +-
 kas/coresdk/coresdk-11.00.15-config.yml       |  2 +-
 kas/coresdk/coresdk-11.01.05-config.yml       |  2 +-
 kas/distroless-kirkstone-config.yml           |  4 +-
 kas/distroless-master-config.yml              |  4 +-
 kas/distroless-scarthgap-config.yml           |  4 +-
 kas/poky-kirkstone-config.yml                 |  2 +-
 kas/poky-master-config.yml                    |  2 +-
 kas/poky-master-wip-config.yml                |  2 +-
 kas/poky-scarthgap-config.yml                 |  2 +-
 kas/poky-scarthgap-wip-config.yml             |  2 +-
 ...rocessor-sdk-analytics-09.00.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.00.01-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.01.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.02.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-10.00.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-10.01.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-11.00.00-config.yml |  2 +-
 ...essor-sdk-analytics-11.01.07.05-config.yml |  2 +-
 ...k-analytics-selinux-11.01.07.05-config.yml |  1 +
 .../processor-sdk-gateway-10_00.yml           |  1 +
 .../processor-sdk-linux-09_00_00_06.yml       |  1 +
 .../processor-sdk-linux-09_00_00_07.yml       |  1 +
 .../processor-sdk-linux-09_01_00_06.yml       |  1 +
 .../processor-sdk-linux-09_01_00_07.yml       |  1 +
 .../processor-sdk-linux-09_02_00_04.yml       |  1 +
 .../processor-sdk-linux-09_02_00_05.yml       |  1 +
 .../processor-sdk-linux-09_03_06_05.yml       |  2 +-
 .../processor-sdk-linux-10_00_07_06.yml       |  1 +
 .../processor-sdk-linux-10_00_08_06.yml       |  1 +
 .../processor-sdk-linux-10_01_08_01.yml       |  1 +
 ...rocessor-sdk-09.00.00-am62xxsip-config.yml |  2 +-
 .../processor-sdk-09.00.00-config.yml         |  2 +-
 .../processor-sdk-09.01.00-am65xx-config.yml  |  2 +-
 .../processor-sdk-09.01.00-config.yml         |  2 +-
 .../processor-sdk-09.01.00-legacy-config.yml  |  2 +-
 ...processor-sdk-09.02.00.08-am64x-config.yml |  2 +-
 ...rocessor-sdk-09.03.05.02-legacy-config.yml |  2 +-
 ...ocessor-sdk-11.00.05.02-am62lxx-config.yml |  2 +-
 ...ocessor-sdk-11.00.15.05-am62lxx-config.yml |  2 +-
 ...essor-sdk-kirkstone-09.02.01.09-config.yml |  2 +-
 ...essor-sdk-kirkstone-09.02.01.10-config.yml |  2 +-
 ...-kirkstone-chromium-09.02.01.09-config.yml |  2 +-
 ...-kirkstone-chromium-09.02.01.10-config.yml |  2 +-
 ...essor-sdk-scarthgap-10.00.07.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-10.01.10.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-11.00.09.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-11.01.05.03-config.yml |  2 +-
 ...-scarthgap-chromium-10.00.07.04-config.yml |  2 +-
 ...-scarthgap-chromium-10.01.10.04-config.yml |  2 +-
 ...-scarthgap-chromium-11.00.09.04-config.yml |  2 +-
 ...-scarthgap-chromium-11.01.05.03-config.yml |  2 +-
 ...sdk-scarthgap-nonqt-11.01.05.03-config.yml |  2 +-
 ...k-scarthgap-selinux-11.00.09.04-config.yml |  1 +
 ...k-scarthgap-selinux-11.01.05.03-config.yml |  1 +
 kas/templates/bblayers.conf.yml               |  6 +--
 kas/templates/local-arago64-v2.conf.yml       | 44 +++++++++----------
 kas/templates/local-arago64-v3.conf.yml       | 44 +++++++++----------
 kas/templates/local-poky-v2.conf.yml          | 42 +++++++++---------
 kas/templates/local-poky-v3.conf.yml          | 42 +++++++++---------
 kas/templates/local-v2.conf.yml               | 36 +++++++--------
 kas/templates/local-v3.conf.yml               | 36 +++++++--------
 94 files changed, 212 insertions(+), 196 deletions(-)

diff --git a/kas/arago-kirkstone-chromium-config.yml b/kas/arago-kirkstone-chromium-config.yml
index 5998939..32ceaac 100644
--- a/kas/arago-kirkstone-chromium-config.yml
+++ b/kas/arago-kirkstone-chromium-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -70,4 +71,3 @@ repos:
     branch: "kirkstone"
     layers:
       meta:
-
diff --git a/kas/arago-kirkstone-config.yml b/kas/arago-kirkstone-config.yml
index b568e1e..cb04d57 100644
--- a/kas/arago-kirkstone-config.yml
+++ b/kas/arago-kirkstone-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -63,4 +64,3 @@ repos:
     branch: "kirkstone"
     layers:
       meta:
-
diff --git a/kas/arago-kirkstone-next-config.yml b/kas/arago-kirkstone-next-config.yml
index 352d920..a14cd93 100644
--- a/kas/arago-kirkstone-next-config.yml
+++ b/kas/arago-kirkstone-next-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-kirkstone-wip-config.yml b/kas/arago-kirkstone-wip-config.yml
index e2b3c90..ee64760 100644
--- a/kas/arago-kirkstone-wip-config.yml
+++ b/kas/arago-kirkstone-wip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -63,4 +64,3 @@ repos:
     branch: "kirkstone"
     layers:
       meta:
-
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index f2ba0e8..c5744fd 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -70,4 +71,3 @@ repos:
     branch: "master"
     layers:
       meta:
-
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index c3f1696..e792358 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -64,4 +65,3 @@ repos:
     branch: "master"
     layers:
       meta:
-
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index cd4931d..f8fdeb3 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
index d1d3656..2eed1b7 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index 1b90f07..afe29c4 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -64,4 +65,3 @@ repos:
     branch: "master"
     layers:
       meta:
-
diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarthgap-10x-config.yml
index 747b4a1..7e773be 100644
--- a/kas/arago-scarthgap-10x-config.yml
+++ b/kas/arago-scarthgap-10x-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-scarthgap-10x-next-config.yml
index 2fd06a3..d9e7fca 100644
--- a/kas/arago-scarthgap-10x-next-config.yml
+++ b/kas/arago-scarthgap-10x-next-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index 231374c..f7ad0af 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -76,4 +77,3 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
-
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index 975023c..fd160ad 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -69,4 +70,3 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
-
diff --git a/kas/arago-scarthgap-flutter-config.yml b/kas/arago-scarthgap-flutter-config.yml
index d131a8f..6ba2cb5 100644
--- a/kas/arago-scarthgap-flutter-config.yml
+++ b/kas/arago-scarthgap-flutter-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index 0410b72..1621044 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index 4192974..ba965b5 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index 20c4448..18738b5 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -69,4 +70,3 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.00.00.006-config.yml b/kas/coresdk/coresdk-09.00.00.006-config.yml
index 9b983cf..f475c70 100644
--- a/kas/coresdk/coresdk-09.00.00.006-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.006-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -66,4 +67,3 @@ repos:
     commit: "f20a12ead2d5890e88e7f4ce149a777de47edc48"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.00.00.007-config.yml b/kas/coresdk/coresdk-09.00.00.007-config.yml
index b42873f..0f48178 100644
--- a/kas/coresdk/coresdk-09.00.00.007-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.007-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -66,4 +67,3 @@ repos:
     commit: "200c2783b3f8546f561382fff6bd5268680d403a"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.00.00.011-config.yml b/kas/coresdk/coresdk-09.00.00.011-config.yml
index 9099cbf..aaa562c 100644
--- a/kas/coresdk/coresdk-09.00.00.011-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.011-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -66,4 +67,3 @@ repos:
     commit: "be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.01.00.001-config.yml b/kas/coresdk/coresdk-09.01.00.001-config.yml
index 8e8b7a4..d0d0b56 100644
--- a/kas/coresdk/coresdk-09.01.00.001-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.001-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -67,4 +68,3 @@ repos:
     commit: "2572b32e729831762790ebfbf930a1140657faea"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.01.00.003-config.yml b/kas/coresdk/coresdk-09.01.00.003-config.yml
index 0a83da7..e6daaa0 100644
--- a/kas/coresdk/coresdk-09.01.00.003-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.003-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -67,4 +68,3 @@ repos:
     commit: "56503e3e80603de3b69acef2f6d32836bc9e5e5d"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.01.00.007-config.yml b/kas/coresdk/coresdk-09.01.00.007-config.yml
index 6075cbb..dbde65b 100644
--- a/kas/coresdk/coresdk-09.01.00.007-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.007-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -67,4 +68,3 @@ repos:
     commit: "8726ae02d760270f9e7fe7ef5715d8f7553371ce"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.01.00.008-config.yml b/kas/coresdk/coresdk-09.01.00.008-config.yml
index 34478a2..94a5d7b 100644
--- a/kas/coresdk/coresdk-09.01.00.008-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.008-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -67,4 +68,3 @@ repos:
     commit: "11da43b58e19583a9bc16044309610cfb2e86469"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.02.00.008-config.yml b/kas/coresdk/coresdk-09.02.00.008-config.yml
index ded28b8..a8d2c61 100644
--- a/kas/coresdk/coresdk-09.02.00.008-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.008-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -72,4 +73,3 @@ repos:
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.02.00.009-config.yml b/kas/coresdk/coresdk-09.02.00.009-config.yml
index 64d406a..11f7268 100644
--- a/kas/coresdk/coresdk-09.02.00.009-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.009-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -72,4 +73,3 @@ repos:
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.02.00.010-config.yml b/kas/coresdk/coresdk-09.02.00.010-config.yml
index 80ad97b..db7ae4d 100644
--- a/kas/coresdk/coresdk-09.02.00.010-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.010-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -72,4 +73,3 @@ repos:
     commit: "8a502301209ef144932ef5071c1a9b738db23270"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-09.03.05-config.yml b/kas/coresdk/coresdk-09.03.05-config.yml
index c530bfe..ad88f14 100644
--- a/kas/coresdk/coresdk-09.03.05-config.yml
+++ b/kas/coresdk/coresdk-09.03.05-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -72,4 +73,3 @@ repos:
     commit: "13b13b81b91f618c13cf972067c47bd810de852f"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-10.00.07-config.yml b/kas/coresdk/coresdk-10.00.07-config.yml
index 28f15db..a88507d 100644
--- a/kas/coresdk/coresdk-10.00.07-config.yml
+++ b/kas/coresdk/coresdk-10.00.07-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-10.01.08-config.yml b/kas/coresdk/coresdk-10.01.08-config.yml
index b0b2995..1dba410 100644
--- a/kas/coresdk/coresdk-10.01.08-config.yml
+++ b/kas/coresdk/coresdk-10.01.08-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "a051a066da2874b95680d0353dfa18c1d56b2670"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-10.01.10-config.yml b/kas/coresdk/coresdk-10.01.10-config.yml
index 39f14eb..d53df18 100644
--- a/kas/coresdk/coresdk-10.01.10-config.yml
+++ b/kas/coresdk/coresdk-10.01.10-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-10.01.10-selinux-config.yml b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
index 8bc71f6..fd56f64 100644
--- a/kas/coresdk/coresdk-10.01.10-selinux-config.yml
+++ b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/coresdk/coresdk-11.00.09-config.yml b/kas/coresdk/coresdk-11.00.09-config.yml
index c840738..7bf095f 100644
--- a/kas/coresdk/coresdk-11.00.09-config.yml
+++ b/kas/coresdk/coresdk-11.00.09-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-11.00.15-config.yml b/kas/coresdk/coresdk-11.00.15-config.yml
index 55551ea..df91e62 100644
--- a/kas/coresdk/coresdk-11.00.15-config.yml
+++ b/kas/coresdk/coresdk-11.00.15-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "29d920f4c2249df7a69f00100924b4525e03c0d9"
     layers:
       meta:
-
diff --git a/kas/coresdk/coresdk-11.01.05-config.yml b/kas/coresdk/coresdk-11.01.05-config.yml
index b3c5f8e..def71c9 100644
--- a/kas/coresdk/coresdk-11.01.05-config.yml
+++ b/kas/coresdk/coresdk-11.01.05-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
     layers:
       meta:
-
diff --git a/kas/distroless-kirkstone-config.yml b/kas/distroless-kirkstone-config.yml
index e7b9781..78be0a1 100644
--- a/kas/distroless-kirkstone-config.yml
+++ b/kas/distroless-kirkstone-config.yml
@@ -1,11 +1,10 @@
+---
 header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
     - ./templates/local-v2.conf.yml
 
-target: 
-
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
@@ -32,4 +31,3 @@ repos:
     branch: "kirkstone"
     layers:
       meta:
-
diff --git a/kas/distroless-master-config.yml b/kas/distroless-master-config.yml
index c493d31..082c9a7 100644
--- a/kas/distroless-master-config.yml
+++ b/kas/distroless-master-config.yml
@@ -1,11 +1,10 @@
+---
 header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
     - ./templates/local-v3.conf.yml
 
-target: 
-
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
@@ -32,4 +31,3 @@ repos:
     branch: "master"
     layers:
       meta:
-
diff --git a/kas/distroless-scarthgap-config.yml b/kas/distroless-scarthgap-config.yml
index cda7779..fe21b7f 100644
--- a/kas/distroless-scarthgap-config.yml
+++ b/kas/distroless-scarthgap-config.yml
@@ -1,11 +1,10 @@
+---
 header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
     - ./templates/local-v2.conf.yml
 
-target: 
-
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
@@ -32,4 +31,3 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
-
diff --git a/kas/poky-kirkstone-config.yml b/kas/poky-kirkstone-config.yml
index cec518a..474f7b8 100644
--- a/kas/poky-kirkstone-config.yml
+++ b/kas/poky-kirkstone-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -46,4 +47,3 @@ repos:
     layers:
       meta-arago-extras:
       meta-arago-test:
-
diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
index 6c0dec8..61b54fa 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-master-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -46,4 +47,3 @@ repos:
     layers:
       meta-arago-extras:
       meta-arago-test:
-
diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.yml
index 671b864..301ce93 100644
--- a/kas/poky-master-wip-config.yml
+++ b/kas/poky-master-wip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -46,4 +47,3 @@ repos:
     layers:
       meta-arago-extras:
       meta-arago-test:
-
diff --git a/kas/poky-scarthgap-config.yml b/kas/poky-scarthgap-config.yml
index 19a24c9..d93e57f 100644
--- a/kas/poky-scarthgap-config.yml
+++ b/kas/poky-scarthgap-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -46,4 +47,3 @@ repos:
     layers:
       meta-arago-extras:
       meta-arago-test:
-
diff --git a/kas/poky-scarthgap-wip-config.yml b/kas/poky-scarthgap-wip-config.yml
index b828c74..83bfac3 100644
--- a/kas/poky-scarthgap-wip-config.yml
+++ b/kas/poky-scarthgap-wip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -39,4 +40,3 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
index 6666ca0..bd28716 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -76,4 +77,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "c0acda7c6920b9f9f3ebccd5c9ce19f52934a51f"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
index 30b7044..ece38f1 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -76,4 +77,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "5ad5799ae51dfd335b6dc4a87200fb96e8b86d7e"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
index e706a64..a2ae0d3 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -77,4 +78,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fa42c52098a72461921dd3fb848ff1271bdb7425"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
index 1df0228..03c9147 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -77,4 +78,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "0de8484d01ea85a7c366e6b56b1119613321dddb"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
index 9402478..f045088 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "a3b8006957fbc31f8375a5989be7c42b2ba2959b"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
index 528fde9..552a3d9 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -83,4 +84,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "41499d7bcc8d37862b93c0d56cf782f9182d0be1"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
index ac6ddb9..1e09702 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -84,4 +85,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "81d1b80b2a314814c6d900e82ea2da93eee3f57d"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.yml
index c1fec79..2993b0d 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -90,4 +91,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "11.01.07.05"
-
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.yml
index e7dcfe1..05d8def 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
index 82526b9..289e0b6 100644
--- a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
+++ b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
index 82d65d4..0f01fba 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
index 4cd1b75..04a4c1b 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
index 5898f41..de0b4e4 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
index aee6c3a..11c284b 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
index 8a13d50..be8c29d 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
index 4d3ee44..68e5992 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
index aa137e0..59dd673 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -77,4 +78,3 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "am57x-9.x"
     commit: "0eed214c0ff621f4d03700a647a1b4f1a02b5a7c"
-
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
index 52a446d..798993d 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
index 6c78bdc..725eae0 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
index 7968206..84a8283 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
index 3ee04bf..9b4b5ed 100644
--- a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -77,4 +78,3 @@ repos:
     commit: "be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-09.00.00-config.yml b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
index 66f0fe4..935dfcf 100644
--- a/kas/processor-sdk/processor-sdk-09.00.00-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -77,4 +78,3 @@ repos:
     commit: "f20a12ead2d5890e88e7f4ce149a777de47edc48"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
index 347ba16..270af62 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "8726ae02d760270f9e7fe7ef5715d8f7553371ce"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-config.yml b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
index 0e9191c..fc3ea8f 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "87d730d9c1778c7f892b096878f338f36d6877f4"
-
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
index 8440d20..cb33f87 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "2572b32e729831762790ebfbf930a1140657faea"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
index 79bddb5..21c52e5 100644
--- a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "02ce7e60b449c72def00f26afc549034cbd82ba9"
-
diff --git a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
index f0f347e..f63dac0 100644
--- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "e42b6a40a3a01e328966bb5ee1bb3e0993975b15"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
index 53f3256..0704456 100644
--- a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
+++ b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -73,4 +74,3 @@ repos:
     commit: "fc46705cc629a151f85717a57f7d789de8fd9b64"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
index 43bb3cc..39379d5 100644
--- a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
+++ b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -76,4 +77,3 @@ repos:
     commit: "29d920f4c2249df7a69f00100924b4525e03c0d9"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
index 262d16a..0afd710 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -82,4 +83,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "09.02.00.03"
-
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
index 870ee1c..9a0b258 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -82,4 +83,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fdb683aa69d4d70aca17c2d53be3f900ae9d5e72"
-
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.yml
index fbb6207..3bec2ef 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -89,4 +90,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "09.02.00.03"
-
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.yml
index aed9179..797980b 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -89,4 +90,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fdb683aa69d4d70aca17c2d53be3f900ae9d5e72"
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
index 7cfd6de..99e2797 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
index 95d90b5..e04b7ea 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -78,4 +79,3 @@ repos:
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
index 889e273..68c1aa0 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -81,4 +82,3 @@ repos:
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
index 49ccaf9..d1aa027 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -86,4 +87,3 @@ repos:
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.yml
index 390c41e..198c7d8 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -90,4 +91,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "10.00.00.04"
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.yml
index 9695648..3cda86a 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -90,4 +91,3 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "10.01.10.04"
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.yml
index d22fbf7..2287442 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -88,4 +89,3 @@ repos:
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.yml
index 3a99adc..34b37b9 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -93,4 +94,3 @@ repos:
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
index 1724b07..c7d239f 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
@@ -81,4 +82,3 @@ repos:
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
     layers:
       meta:
-
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.yml
index 1b52ba8..e4fe1c0 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.yml
index 12a5b09..3b6bb3f 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
   includes:
diff --git a/kas/templates/bblayers.conf.yml b/kas/templates/bblayers.conf.yml
index 17f30de..44501b3 100644
--- a/kas/templates/bblayers.conf.yml
+++ b/kas/templates/bblayers.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,11 +6,10 @@ bblayers_conf_header:
   oe-layersetup-bblayers-conf-template: |
     # This template file was created by taking the oe-core/meta/conf/bblayers.conf
     # file and removing the BBLAYERS section at the end.
-    
+
     # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
     # changes incompatibly
     LCONF_VERSION = "5"
-    
+
     BBPATH = "${TOPDIR}"
     BBFILES ?= ""
-
diff --git a/kas/templates/local-arago64-v2.conf.yml b/kas/templates/local-arago64-v2.conf.yml
index c6781be..e8b0a00 100644
--- a/kas/templates/local-arago64-v2.conf.yml
+++ b/kas/templates/local-arago64-v2.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,10 +55,10 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/arago-tmp"
-    
+
     # By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside
     #DEPLOY_DIR = "${TOPDIR}/deploy"
-    
+
     #
     # Machine Selection
     #
@@ -65,7 +66,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -79,7 +80,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -88,7 +89,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "x86_64"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -109,7 +110,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the debugging tweaks.
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
-    
+
     #
     # Additional image features
     #
@@ -120,17 +121,17 @@ local_conf_header:
     #   - 'image-swab' to perform host system intrusion detection
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -151,31 +152,30 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     DISTRO   = "arago"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-    
+
     # Enable local PR service for binary feeds
     PRSERV_HOST = "localhost:0"
-    
+
     # Enable hash equiv server
     BB_SIGNATURE_HANDLER = "OEEquivHash"
     BB_HASHSERVE = "auto"
-    
+
     # It is recommended to activate "buildhistory" for testing the PR service
     INHERIT += "buildhistory"
     BUILDHISTORY_COMMIT = "1"
-
diff --git a/kas/templates/local-arago64-v3.conf.yml b/kas/templates/local-arago64-v3.conf.yml
index 3fa683e..91ee945 100644
--- a/kas/templates/local-arago64-v3.conf.yml
+++ b/kas/templates/local-arago64-v3.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,10 +55,10 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/arago-tmp"
-    
+
     # By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside
     #DEPLOY_DIR = "${TOPDIR}/deploy"
-    
+
     #
     # Machine Selection
     #
@@ -65,7 +66,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -79,7 +80,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -88,7 +89,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "x86_64"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -111,7 +112,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the empty root login settings for debugging/testing.
     EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
-    
+
     #
     # Additional image features
     #
@@ -122,17 +123,17 @@ local_conf_header:
     #   - 'image-swab' to perform host system intrusion detection
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -153,31 +154,30 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     DISTRO   = "arago"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-    
+
     # Enable local PR service for binary feeds
     PRSERV_HOST = "localhost:0"
-    
+
     # Enable hash equiv server
     BB_SIGNATURE_HANDLER = "OEEquivHash"
     BB_HASHSERVE = "auto"
-    
+
     # It is recommended to activate "buildhistory" for testing the PR service
     INHERIT += "buildhistory"
     BUILDHISTORY_COMMIT = "1"
-
diff --git a/kas/templates/local-poky-v2.conf.yml b/kas/templates/local-poky-v2.conf.yml
index 075f535..e881a03 100644
--- a/kas/templates/local-poky-v2.conf.yml
+++ b/kas/templates/local-poky-v2.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,7 +55,7 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/build/poky-tmp"
-    
+
     #
     # Machine Selection
     #
@@ -62,7 +63,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -76,7 +77,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -85,7 +86,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "x86_64"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -106,7 +107,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the debugging tweaks.
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
-    
+
     #
     # Additional image features
     #
@@ -117,17 +118,17 @@ local_conf_header:
     #   - 'image-swab' to perform host system intrusion detection
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -148,31 +149,30 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     DISTRO   = "poky"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-    
+
     # Enable local PR service for binary feeds
     PRSERV_HOST = "localhost:0"
-    
+
     # Enable hash equiv server
     BB_SIGNATURE_HANDLER = "OEEquivHash"
     BB_HASHSERVE = "auto"
-    
+
     # It is recommended to activate "buildhistory" for testing the PR service
     INHERIT += "buildhistory"
     BUILDHISTORY_COMMIT = "1"
-
diff --git a/kas/templates/local-poky-v3.conf.yml b/kas/templates/local-poky-v3.conf.yml
index 193a1ce..9260ed2 100644
--- a/kas/templates/local-poky-v3.conf.yml
+++ b/kas/templates/local-poky-v3.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,7 +55,7 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/build/poky-tmp"
-    
+
     #
     # Machine Selection
     #
@@ -62,7 +63,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -76,7 +77,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -85,7 +86,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "x86_64"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -108,7 +109,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the empty root login settings for debugging/testing.
     EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
-    
+
     #
     # Additional image features
     #
@@ -119,17 +120,17 @@ local_conf_header:
     #   - 'image-swab' to perform host system intrusion detection
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -150,31 +151,30 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     DISTRO   = "poky"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-    
+
     # Enable local PR service for binary feeds
     PRSERV_HOST = "localhost:0"
-    
+
     # Enable hash equiv server
     BB_SIGNATURE_HANDLER = "OEEquivHash"
     BB_HASHSERVE = "auto"
-    
+
     # It is recommended to activate "buildhistory" for testing the PR service
     INHERIT += "buildhistory"
     BUILDHISTORY_COMMIT = "1"
-
diff --git a/kas/templates/local-v2.conf.yml b/kas/templates/local-v2.conf.yml
index f33fd45..c1a8e21 100644
--- a/kas/templates/local-v2.conf.yml
+++ b/kas/templates/local-v2.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,7 +55,7 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/build/arago-tmp"
-    
+
     #
     # Machine Selection
     #
@@ -62,7 +63,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -76,7 +77,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -85,7 +86,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "i686"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -106,7 +107,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the debugging tweaks.
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
-    
+
     #
     # Additional image features
     #
@@ -119,17 +120,17 @@ local_conf_header:
     # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats image-prelink"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -150,22 +151,21 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     # Select a distribution from supported "arago", "angstrom-2010.x" or "poky"
     # By default, go with the "distroless" configuration, when not set
     #DISTRO   = "arago"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-
diff --git a/kas/templates/local-v3.conf.yml b/kas/templates/local-v3.conf.yml
index 07eb5af..3b572ff 100644
--- a/kas/templates/local-v3.conf.yml
+++ b/kas/templates/local-v3.conf.yml
@@ -1,3 +1,4 @@
+---
 header:
   version: 17
 
@@ -5,7 +6,7 @@ local_conf_header:
   oe-layersetup-local-conf-template: |
     # CONF_VERSION is increased each time build/conf/ changes incompatibly
     CONF_VERSION = "2"
-    
+
     #
     # Where to place downloads
     #
@@ -16,7 +17,7 @@ local_conf_header:
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
     DL_DIR = "${TOPDIR}/../downloads"
-    
+
     #
     # Where to place shared-state files
     #
@@ -29,7 +30,7 @@ local_conf_header:
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
     SSTATE_DIR = "${TOPDIR}/sstate-cache"
-    
+
     #
     # Shared-state files from other locations
     #
@@ -45,7 +46,7 @@ local_conf_header:
     #SSTATE_MIRRORS ?= "\
     #file://.* http://someserver.tld/share/sstate/ \n \
     #file://.* file:///some/local/dir/sstate/"
-    
+
     #
     # Where to place the build output
     #
@@ -54,7 +55,7 @@ local_conf_header:
     # this includes the extraction and compilation of many applications and the toolchain
     # which can use Gigabytes of hard disk space.
     TMPDIR = "${TOPDIR}/build/arago-tmp"
-    
+
     #
     # Machine Selection
     #
@@ -62,7 +63,7 @@ local_conf_header:
     # of emulated machines available which can boot and run in the QEMU emulator:
     #
     #MACHINE ?= "arago"
-    
+
     #
     # Package Management configuration
     #
@@ -76,7 +77,7 @@ local_conf_header:
     # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
     # We default to ipk:
     PACKAGE_CLASSES ?= "package_ipk"
-    
+
     #
     # SDK/ADT target architecture
     #
@@ -85,7 +86,7 @@ local_conf_header:
     # running the build on (i.e. building i686 packages on an x86_64 host._
     # Supported values are i686 and x86_64
     SDKMACHINE ?= "i686"
-    
+
     #
     # Extra image configuration defaults
     #
@@ -108,7 +109,7 @@ local_conf_header:
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
     # We default to enabling the empty root login settings for debugging/testing.
     EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
-    
+
     #
     # Additional image features
     #
@@ -121,17 +122,17 @@ local_conf_header:
     # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
     # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
     USER_CLASSES ?= "buildstats image-prelink"
-    
+
     # By default disable interactive patch resolution (tasks will just fail instead):
     PATCHRESOLVE = "noop"
-    
+
     # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
     # would like to add additional file system types you can uncomment the
     # following line and add the additional IMAGE_FSTYPES you want created
     # as part of the build flow.  Some common types are listed below and you
     # can remove the ones you do not want.
     # IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
-    
+
     #
     # Parallelism Options
     #
@@ -152,22 +153,21 @@ local_conf_header:
     # so you should not need to set this unless you are wanting to lower the number
     # allowed.
     #
-    
+
     # Select a distribution from supported "arago", "angstrom-2010.x" or "poky"
     # By default, go with the "distroless" configuration, when not set
     #DISTRO   = "arago"
-    
+
     # Set terminal types by default it expects gnome-terminal
     # but we chose xterm
     TERMCMD = "${XTERM_TERMCMD}"
     TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-    
+
     # Don't generate the mirror tarball for SCM repos, the snapshot is enough
     BB_GENERATE_MIRROR_TARBALLS = "0"
-    
+
     # Uncomment this to remove work directory after packaging to save disk space
     #INHERIT += "rm_work"
-    
+
     # Keep one set of images by default
     RM_OLD_IMAGE = "1"
-
-- 
2.50.1


