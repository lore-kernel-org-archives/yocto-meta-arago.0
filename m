Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.8329.1637060451726148750
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 03:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mf28AzJg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGB0opH016469;
	Tue, 16 Nov 2021 05:00:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060450;
	bh=23W3w9bDTYfjpSxD46bdptNtgtr6b8QzZUraOGsvUKM=;
	h=From:To:Subject:Date;
	b=mf28AzJgd8O7K1opcXq9u63FIBiNjAEc9AAzELTmdrdQKLuV8VQQqJUfOPIxOnxWf
	 Sc19+3lFhQfZi+FcmVvh/7Yu5HyK0vPuabz382WisXUIk1UqtFJa+HRV9AvZiIifbU
	 oD6ew9/eaHFb2xL61Xttx8VqvmiSrJ3g2HRdEXNw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGB0oC4104054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 05:00:50 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 05:00:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 05:00:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGB0ojW083203;
	Tue, 16 Nov 2021 05:00:50 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] conf: arago: Add j7200 hs platform support
Date: Tue, 16 Nov 2021 11:00:50 +0000
Message-ID: <20211116110050.45990-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add kernel type for j7200 hs platform

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c90da316..67468cc0 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -54,6 +54,7 @@ KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_am64xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES_j7200-hs-evm = "Image fitImage"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"
-- 
2.17.1

