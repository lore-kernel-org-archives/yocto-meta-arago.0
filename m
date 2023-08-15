Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EADC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 18:12:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.141547.1692123153077798389
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 11:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pzgwAh1p;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FICTbo067700;
	Tue, 15 Aug 2023 13:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692123149;
	bh=yh2fr+aXYvj6mdh5dPE8XuatXEQUajTEAnYfPVDpG3U=;
	h=From:To:CC:Subject:Date;
	b=pzgwAh1pvfrnBtK86rNKprIPBbZuXO8McUVioWTq1QBIcslc+VBovCXVuc7LVql1v
	 45melyu2epX+U5aXO2/lERWVQUR8zAKQxNMteVZgcmvJN2lGCon+eILzXIw1yjeP5j
	 qTNxmRRt7HlR9pdEJXsxcVg7e+LhZtzqaVM0ByrA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FICTZB113848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 13:12:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 13:12:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 13:12:29 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FICTec092805;
	Tue, 15 Aug 2023 13:12:29 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [oe-layersetup][PATCH] configs: kirkstone+: add meta-clang preemptively
Date: Tue, 15 Aug 2023 13:11:40 -0500
Message-ID: <20230815181140.1252587-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 18:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14842

From: Randolph Sapp <rs@ti.com>

Preempt some of the layer changes that are coming that will have
explicit dependencies on meta-clang.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 configs/arago-kirkstone-config.txt      | 1 +
 configs/arago-kirkstone-next-config.txt | 1 +
 configs/arago-kirkstone-wip-config.txt  | 1 +
 configs/arago-master-config.txt         | 1 +
 configs/arago-master-next-config.txt    | 1 +
 configs/arago-master-wip-config.txt     | 1 +
 configs/poky-kirkstone-config.txt       | 1 +
 configs/poky-master-config.txt          | 1 +
 configs/poky-master-wip-config.txt      | 1 +
 9 files changed, 9 insertions(+)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index c2524a4..39ddeb4 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index fe0a97b..bc90869 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -17,6 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index b8a97f0..a560f41 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 7822511..e5aa236 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 74e8d78..748b39c 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -17,6 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index 71ab716..b588c0e 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
index dc94b1d..4d5378d 100644
--- a/configs/poky-kirkstone-config.txt
+++ b/configs/poky-kirkstone-config.txt
@@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
 
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index 5cb0383..03a3c83 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
 
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
index 3fa74bf..3766244 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
 
-- 
2.41.0


