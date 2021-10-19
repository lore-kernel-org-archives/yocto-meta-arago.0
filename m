Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10901.1634654973636666456
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GcSLUakV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19JEnVDX068402;
	Tue, 19 Oct 2021 09:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634654971;
	bh=h1FqoO14CYL1RpEVu1zhQkWZojJNEJreBJk95axbmcM=;
	h=From:To:Subject:Date;
	b=GcSLUakVXvcQizcyBhmwqea7BgdSDFC00vX/QNvkgIphEW+ThS3uXtcoOkCHd/zBy
	 CfUug7nNuwFPNnjK8cNUn8C1ULPioOhGwEaNTtVO6sos7q+tI8LP8K66qV+YW8BnUw
	 2OeFF/s5qwPPJ/bRTtZ69WYSkg+Fo7xsuQApbFAU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19JEnVKs066736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 09:49:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 09:49:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 09:49:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19JEnV38123708;
	Tue, 19 Oct 2021 09:49:31 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV support for ti-linux-fw
Date: Tue, 19 Oct 2021 14:49:31 +0000
Message-ID: <20211019144931.48650-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add AUTOREV support to ti-linux-fw for nightly builds.
There is corresponding change in ti-linux-fw.inc. The patch will be
posted in meta-ti

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index ca2aa9ad..f1e0bc52 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -13,6 +13,9 @@ SRCREV_pn-ltp-ddt = "${AUTOREV}"
 #SRCREV_pn-optee-test = "${AUTOREV}"
 SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 
+# Point to the latest ti linux firmware
+TI_LINUX_FW_SRCREV = "${AUTOREV}"
+
 # Point to latest nightly metadata
 #TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 #TI_RTOS_METADATA_PROTOCOL = "git"
-- 
2.17.1

