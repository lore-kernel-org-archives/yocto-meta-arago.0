Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988A9C7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:03:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1206.1686092612378229447
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=maBhsvKe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356N3T2f102615;
	Tue, 6 Jun 2023 18:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686092609;
	bh=keHALI805bnQ2l/OZQ3AnDKuURkAslE/sZs8WdwIndM=;
	h=From:To:CC:Subject:Date;
	b=maBhsvKecx1S4YIk1jWtAA/F9Ef2zd3KFWCpGAxVcixz7Y6R3cydhuG+yHmaug9BD
	 S4K9wKCLiiQ80maCQ/9qrfwUGRRrV6A6WJPorfxEG0pDXBc0cYztGbYh7JHhwHMJNy
	 v4yf0uwrcwGHG8bajkPL31owdBiwrqkjkTZ5cYDM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356N3TaB045797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 18:03:29 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 18:03:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 18:03:28 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356N3S7N023822;
	Tue, 6 Jun 2023 18:03:28 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] arago-image.inc: fix the default systemd target
Date: Tue, 6 Jun 2023 18:03:20 -0500
Message-ID: <20230606230320.2678321-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:03:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14509

From: Randolph Sapp <rs@ti.com>

SYSTEMD_DEFAULT_TARGET is dynamically set based on the contents of
IMAGE_FEATURES. Would you like to know what doesn't get updated when we
use a bunch of package groups to dictate what is present in the image?

This makes systemd actually start graphical applications if the opengl
distro feature is set. It assumes the distro is using weston though. I'm
sure that will eventually be invalid when the package group contents
drift.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index d00c1f70..7104d87c 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
 
 IMAGE_FEATURES += "package-management splash"
 
+# this is required to make sure the proper systemd default target gets set
+IMAGE_FEATURES += " \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'weston', '',d)} \
+"
+
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
-- 
2.40.1


