Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.14413.1636717521445109707
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 03:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kaYc3rtj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACBjJxG110653;
	Fri, 12 Nov 2021 05:45:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636717519;
	bh=2BDLvgk33pn1/M9CNVxXqPWv8LHGOn3wDlec8KqxPtk=;
	h=From:To:Subject:Date;
	b=kaYc3rtj+RClYr0nMRjTMKH+PzhwET4vn4DYq+PGmPHu78x7eVx7kr8Nd3zwOz1uU
	 AnTqTVdSoKx1c79tfJNK3CuWrk5SMX5EK6bUWdwAze1yiDTnH15mjE8xwWsaH8LeBO
	 +1W3dbR24RNcL1iiLy0stZFyCXaEawgc9cOKk0T0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACBjJPo018086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 05:45:19 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 05:45:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 05:45:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACBjJNp054441;
	Fri, 12 Nov 2021 05:45:19 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV for K3 Image Gen
Date: Fri, 12 Nov 2021 11:45:19 +0000
Message-ID: <20211112114519.59963-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This patch adds AUTOREV support for K3 Image gen to be in consistent
with ti-linux-fw

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index f1e0bc52..71b09f71 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -16,6 +16,9 @@ SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 # Point to the latest ti linux firmware
 TI_LINUX_FW_SRCREV = "${AUTOREV}"
 
+# Point to the latest ti k3 image gen
+K3_IMAGE_GEN_SRCREV = "${AUTOREV}"
+
 # Point to latest nightly metadata
 #TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 #TI_RTOS_METADATA_PROTOCOL = "git"
-- 
2.17.1

