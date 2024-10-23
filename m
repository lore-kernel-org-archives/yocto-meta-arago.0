Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B40D0BB43
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 22:25:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.902.1729722300122810124
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 15:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RT1/Db7r;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NMOrEo038676;
	Wed, 23 Oct 2024 17:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729722293;
	bh=ng8T0JD/cU18STVHMobtX6Z4YNl+FZ8yex13CNTcDfc=;
	h=From:To:CC:Subject:Date;
	b=RT1/Db7r0lLEnhieq0NhIZI5SYuL6/xCADibS+pFiP4bflOYQ1QLpQgFbPvDwHAId
	 1gsVdyGgjUlcIOHvM9oXnwbjKi2wzaCGgCHGeigzqOYw0cFQXKIlikg3BCHQu4dCqB
	 20DejPJncpjhCQwaJu6KzvwEr/CLJKmBRi++TEtU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NMOrBp103283
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 17:24:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 17:24:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 17:24:53 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NMOqCv026798;
	Wed, 23 Oct 2024 17:24:53 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] recipes-core: packagegroup-arago-console: Add ti-rtos-firmware
Date: Thu, 24 Oct 2024 03:54:45 +0530
Message-ID: <20241023222445.3313892-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Oct 2024 22:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15582

Add ti-rtos-firmware in packagegroup-arago-console which
ensures that TI IPC firmwares are packaged in initramfs based
filesystems like tisdk-base-image for k3 platforms

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v2: Restrict the addition of ti-rtos-firmware for k3 platforms

 .../recipes-core/packagegroups/packagegroup-arago-console.bb  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index cd2960c1..76a98fa2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -66,6 +66,10 @@ ARAGO_SDK_PREREQ = "\
     freetype \
     "
 
+ARAGO_SDK_PREREQ:append:k3 = "\
+    ti-rtos-firmware \
+    "
+
 ARAGO_CONSOLE = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_EXTRA}', '',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', '${ARAGO_TSLIB}', d)} \
-- 
2.34.1


