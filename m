Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3607DC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 20:05:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.31.1710965133783800219
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 13:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bid1KWxv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42KK5WDu027342;
	Wed, 20 Mar 2024 15:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710965132;
	bh=RxW8cZ61maRWSAo95+DPt98Lb5bgVxP3cQOec/xOaSc=;
	h=From:To:Subject:Date;
	b=bid1KWxvfkoQ3TGD+djX0L+ToqJpYW8MVl4vHdGKCOSs9XsN3xdMikonGFdTafP+q
	 3ZNF0jhxUK98Ri/EJy8DzKt99hRlWwnLqANgz3t00ejQ62QrrC9PK0mI96V2KHw0Vw
	 n6ehdrj33XsaJb1/TOf1q+9uVY6hxRbMJmePMPsQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42KK5WdC009659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 15:05:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 15:05:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 15:05:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42KK5VnT130338;
	Wed, 20 Mar 2024 15:05:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rn2Bn-0006GW-JC; Wed, 20 Mar 2024 15:05:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] README: update with scarthgap specific info
Date: Wed, 20 Mar 2024 15:05:31 -0500
Message-ID: <20240320200531.24045-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Mar 2024 20:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15245

All READMEs were still mentioning master, update that.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/README  | 14 +++++++-------
 meta-arago-distro/README | 16 ++++++++--------
 meta-arago-extras/README | 14 +++++++-------
 meta-arago-test/README   | 12 ++++++------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index bb586c14..8d40e48e 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -1,30 +1,30 @@
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
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 Send pull requests to meta-arago@lists.yoctoproject.org
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 49e9d9e1..8712de4e 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,34 +1,34 @@
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
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 URI: git://git.yoctoproject.org/meta-arago
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arago-extras
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 5b6e8a15..58ac7df2 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,30 +1,30 @@
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
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 Send pull requests to meta-arago@lists.yoctoproject.org
diff --git a/meta-arago-test/README b/meta-arago-test/README
index 8f1f9993..5aa96cd2 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -1,25 +1,25 @@
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
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
-- 
2.17.1


