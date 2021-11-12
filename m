Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3667.1636759806213875986
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 15:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v8q8beT3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNU52R064230;
	Fri, 12 Nov 2021 17:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636759805;
	bh=ZBABvUP9+fse6TksB+einzzfNSvexO+4LMf54exLvjo=;
	h=From:To:Subject:Date;
	b=v8q8beT3Us/mkTZcuAxBGZ9G6CEfthJMjwboBczf87ZcsfoVkMZlPWcMMbMjdkae1
	 kr1ev3aEGMxrPQjdFuK2+S7Q89VCtz31PIwJbeHp02NtJ2/uRdzd1Y6ePh0kCLcyEg
	 S7qOexVgfBurGZ3uahVMo67lMFEI8pyTjkXIYA3I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACNU4JH050984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 17:30:04 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 17:30:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 17:30:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNU3Zr035554;
	Fri, 12 Nov 2021 17:30:03 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x hs platform
Date: Fri, 12 Nov 2021 23:30:02 +0000
Message-ID: <20211112233002.26126-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add kernel types for am64x hs platform

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1a96a472..c90da316 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -52,6 +52,7 @@ KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES_am64xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
-- 
2.17.1

