Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2382C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:27:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1608.1686094071803359746
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LaikSIUU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356NRnig004113;
	Tue, 6 Jun 2023 18:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686094069;
	bh=L41S0bF/eVw904Jd3ioo7mqfWC9+mVFwQjCNkY566VQ=;
	h=From:To:CC:Subject:Date;
	b=LaikSIUUlYjGH+yDcUO43MIuhSgehRuGGitCgodx8Yf6wI/gf98e80kd2FSYTGgt5
	 kH4BSxgqS6wvVK3irwpLkX3Fegz9W9IqIop+AgFLyy+X6nG8BlBf1cWLyoRKjdUeya
	 m5Kq9Vu/u0Wg2H0SNLC2l71acKFTegO7gYdxrjo8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356NRn4O022936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 18:27:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 18:27:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 18:27:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356NRmE7005328;
	Tue, 6 Jun 2023 18:27:49 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2] arago-image.inc: fix the default systemd target
Date: Tue, 6 Jun 2023 18:27:46 -0500
Message-ID: <20230606232746.2730983-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:27:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14514

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
index d00c1f70..ce1f2ad7 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
 
 IMAGE_FEATURES += "package-management splash"
 
+# this is required to make sure the proper systemd default target gets set
+IMAGE_FEATURES += " \
+	${@bb.utils.filter("DISTRO_FEATURES", "weston", d)}
+"
+
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
-- 
2.40.1


