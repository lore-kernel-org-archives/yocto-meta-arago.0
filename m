Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9A9C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 01:03:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3473.1686099836361803751
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 18:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q/KkbDb+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35713qvl026136;
	Tue, 6 Jun 2023 20:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686099832;
	bh=i7RytsPNsKA/OXlkd9DolLHAuFSUlTSVSpcYSP0dktU=;
	h=From:To:CC:Subject:Date;
	b=Q/KkbDb+WHqtVHQj5iMKDiMB4gVCIf2DdX5Q6iBQQtx1/M2FT6yv+nCB9IrBfWUH4
	 93ureTAhK8GfHVyGK9MnJPEYpj/kpDnc24E+7KRzwPwe5Lx+fkCJtlim+hvqPOkPnj
	 dVqc8br1RZMItnE8zhG5fflmd70mZMbHkR+7ObVs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35713qoG121147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 20:03:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 20:03:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 20:03:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35713ps2005356;
	Tue, 6 Jun 2023 20:03:51 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv4] arago-image.inc: fix the default systemd target
Date: Tue, 6 Jun 2023 20:03:49 -0500
Message-ID: <20230607010349.2877398-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 01:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14518

From: Randolph Sapp <rs@ti.com>

SYSTEMD_DEFAULT_TARGET is dynamically set based on the contents of
IMAGE_FEATURES. Would you like to know what doesn't get updated when we
use a bunch of package groups to dictate what is present in the image?

This makes systemd actually start graphical applications if the opengl
distro feature is set. This will need to be adjusted if further
graphical environments are added.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index d00c1f70..8e8eb114 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
 
 IMAGE_FEATURES += "package-management splash"
 
+# this is required to make sure the proper systemd default target gets set
+IMAGE_FEATURES += " \
+	${@bb.utils.contains("DISTRO_FEATURES", "wayland", "weston", "", d)} \
+"
+
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
-- 
2.40.1


