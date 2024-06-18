Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75438C2BA1A
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 12:25:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.85207.1718713514051989219
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 05:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=APf2p0UI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ICP9Zm008128;
	Tue, 18 Jun 2024 07:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718713509;
	bh=h+btS9/PtZtihU2q3dY+GBkkt1AJh7le9DhF2pPFrOE=;
	h=From:To:CC:Subject:Date;
	b=APf2p0UImLvcOUu/vaAGakk/2+i7bpdxT0Tfbj5Lyn7VNMn9EBvjCp7rEA39nJ0ed
	 KV2PrLY1y1vvcY9uXjSAD31o+QmGPIoZNnSo7joAszfc2ysT2iMvZH3QM2n1lSRhA+
	 vpjoFhkohdYOHf8hc/91nETh/ylRk9lRRE5/VxcY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ICP9Vr006245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 07:25:09 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 07:25:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 07:25:08 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ICP70S130563;
	Tue, 18 Jun 2024 07:25:08 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Kartheek <s-adivi@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] recipes-qt: qt5: Add xkbcommon to qtbase PACKAGECONFIG
Date: Tue, 18 Jun 2024 17:54:53 +0530
Message-ID: <20240618122453.1131089-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Jun 2024 12:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15399

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

- For QT apps to use physical keyboard, xkbcommon has to be added in
PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev which at
present is an invalid PACKAGECONFIG & hence was dropped from meta-arago [1].

- Hence, add xkbcommon to PACKAGECONFIG which will enable the use of
physical keyboard in QT apps.

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=de16946741249265a38acb7bb503b39a0c2b4175

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v2: Add xkbcommon in PACKAGECONFIG to all platforms instead of making it k3 machine specific

 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 8ae8110b..4ecfd7ed 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
+PACKAGECONFIG:append = " xkbcommon"
+
 PR:append = ".arago17"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
-- 
2.34.1


