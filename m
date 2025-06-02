Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D7C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 22:02:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.7731.1748901733784833920
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 15:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9jDdt+k;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 552M2BZ73318820;
	Mon, 2 Jun 2025 17:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748901731;
	bh=CVtoBoMsh4gbTKLsxIoJdHBOSUGjIx1LEhfUAWHgIQY=;
	h=From:To:CC:Subject:Date;
	b=F9jDdt+k1BNL6+IENsAwpJmsxjGUuvbwr2bOU1mSoDAp6FF9Ly4QDocokBYXlDEk5
	 oAd9l9Lim1kfZMFgWFdCCegtuHx35cD9iS+TqvqlWm7K+5KzGEokW4sDnzBoWmvPpv
	 p1U6c5tj59sx/llZyXJSUtd3EhgQrp7TJMIxxRrA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 552M2BT33266227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 2 Jun 2025 17:02:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Jun 2025 17:02:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Jun 2025 17:02:11 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 552M2BqB3666966;
	Mon, 2 Jun 2025 17:02:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vijayp@ti.com>
Subject: [meta-arago][master][PATCH] packagegroup-arago-tisdk-graphics: add mesa-demos and sdl2
Date: Mon, 2 Jun 2025 17:02:06 -0500
Message-ID: <20250602220206.2104408-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Jun 2025 22:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16248

From: Randolph Sapp <rs@ti.com>

Add the new mesa-demos package to this group so that users and scripts
can use eglinfo to query information about supported extensions and
configs for multiple platforms. It also adds vkgears and es2gears to
test Vulkan and GLES 2 respectively.

Add libsdl2 as it's a useful, minimal graphics toolkit that allows users
to build GLES and Vulkan applications with less boilerplate. We have a
few internal test applications that currently use it.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 52557e5c..9ad9e719 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -9,6 +9,8 @@ inherit packagegroup
 GFX_WAYLAND = "\
     weston-init \
     weston-examples \
+    mesa-demos \
+    libsdl2 \
 "
 
 RDEPENDS:${PN} = "\
-- 
2.49.0


