Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3109C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 19:37:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5041.1712086619017644697
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 12:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=b6+81jhf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 432JavYA037261;
	Tue, 2 Apr 2024 14:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712086617;
	bh=BZHIZhSorbksd1iXeCYtdx8UZsLlQMH1yMwkFf+nDIM=;
	h=From:To:Subject:Date;
	b=b6+81jhfRaTPYs5gwRKDDGWRg/zaAQM+RABsa0xyA09suHig9os543bnTs+LyeWJg
	 yc5S04Mf9J94KQNxiUDfhkYS1jUpgS2FouI7/GTlesZkkbzE8PaGPP5/u07x3+BG+i
	 M3uFK02p2Lp+wmfdUVGN/BBsaD+WGkPC6034EOJs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 432JavQc004838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Apr 2024 14:36:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Apr 2024 14:36:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 Apr 2024 14:36:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 432JauJt021304;
	Tue, 2 Apr 2024 14:36:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rrjwG-0003Xl-K0; Tue, 02 Apr 2024 14:36:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v2] README: update with scarthgap specific info
Date: Tue, 2 Apr 2024 14:36:56 -0500
Message-ID: <20240402193656.13582-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Apr 2024 19:37:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15257

Update the READMEs with the current available scarthgap branches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rollback the layers to master that do not have scarthgap branches
yet.

 meta-arago-demos/README  | 10 +++++-----
 meta-arago-distro/README | 12 ++++++------
 meta-arago-extras/README | 10 +++++-----
 meta-arago-test/README   | 10 +++++-----
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index bb586c14..fb213cca 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -1,15 +1,15 @@
 meta-arago-demos provides demo applications to showcase in TI SDK products
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 5.0+) and tracks
+the stable/maintenance branches (currently "scarthgap") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
@@ -19,7 +19,7 @@ revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 49e9d9e1..aab046c5 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,15 +1,15 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 5.0+) and tracks
+the stable/maintenance branches (currently "scarthgap") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
@@ -19,7 +19,7 @@ revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
@@ -28,7 +28,7 @@ branch: master
 revision: HEAD
 
 URI: git://git.yoctoproject.org/meta-arago
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arago-extras
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 5b6e8a15..6ea69514 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,15 +1,15 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 5.0+) and tracks
+the stable/maintenance branches (currently "scarthgap") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
@@ -19,7 +19,7 @@ revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
diff --git a/meta-arago-test/README b/meta-arago-test/README
index 8f1f9993..1baa235e 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -1,15 +1,15 @@
 meta-arago-test provides an additional packagegroup ti-test and some of the recipes that go into that group
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 5.0+) and tracks
+the stable/maintenance branches (currently "scarthgap") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
@@ -19,7 +19,7 @@ revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
-- 
2.17.1


