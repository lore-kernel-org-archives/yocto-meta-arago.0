Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B734C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:12:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1938.1742494357014424225
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yYfcVbC8;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KICaMV075614
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494356;
	bh=3aAFc8MHOvbQhJLHNJ95LIMCIQGCm4gq12Qt68n/mws=;
	h=From:To:Subject:Date;
	b=yYfcVbC8mGA8rgggvLntbCaoAQSaGGOx6f4aWLBjMDyOm9gYIXEGwZps94IZU0gwZ
	 +TzokJJuaDYqhf/VWQFfkQvefd/RYUgaA/4KQs8ly9OW4tQvoYgapKBCdsLRfyQsYT
	 ADpvOomt010R5oBs707tRCvlh6UpT6hCRUHbBXV0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KICa9Z050324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:12:36 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:12:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:12:35 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KICZPJ128218;
	Thu, 20 Mar 2025 13:12:35 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKNf-0001bL-Ng; Thu, 20 Mar 2025 13:12:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] bootstrap-initrd: Add COMPATIBLE_MACHINE
Date: Thu, 20 Mar 2025 13:12:35 -0500
Message-ID: <20250320181235.6114-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16130

All Arago images have a COMPATIBLE_MACHINE setting that limits them to just ti-soc.
Since this package depends on one of the images, we need the same setting.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 50cf218e..0753a6aa 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "Prebuilt initramfs with apps for bootstraping new board"
 
 LICENSE = "MIT"
 
+COMPATIBLE_MACHINE = "ti-soc"
+
 CLEANBROKEN = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.17.1


