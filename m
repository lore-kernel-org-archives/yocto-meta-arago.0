Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6668.1644583097527839737
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fmqpXYIZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcEdH102019;
	Fri, 11 Feb 2022 06:38:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583094;
	bh=lf/xqHNX6qrqzvOk/9rOj7MmpmY2bin5JxEm+SCBxOQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fmqpXYIZTkx9xmXEeiWNA+WiRMObVHq/H7TsqqMoWGpWtjLUzCuLPqnu8tCBhpwCg
	 vbg+/1X5vwL+iixaSHPPxI3rTAQD5D+XPrEY+XMF85dDhibnx6c116bgl6Y3j6ZQ+t
	 iYcYmxpyJpafgUxsYhLRolow0C4kWImf2KTDvaT8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BCcEZe103504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:38:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:38:14 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcEAx127947;
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVBm-0003Co-Bg; Fri, 11 Feb 2022 06:38:14 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 1/3] Revert "linux-ti-staging: move docker.cfg to be accessible by rt/systest variants"
Date: Fri, 11 Feb 2022 06:38:12 -0600
Message-ID: <20220211123814.12258-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211123814.12258-1-reatmon@ti.com>
References: <20220211123814.12258-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit d2a3e95fd2e764567769352724f8d4ffee84ad43.

These patches add to the size of the base image.  We have plans on
reworking the images and will reapply this patch at that time.
---
 meta-arago-distro/recipes-kernel/linux/docker.inc               | 2 --
 .../recipes-kernel/linux/{files => linux-ti-staging}/docker.cfg | 0
 2 files changed, 2 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux/{files => linux-ti-staging}/docker.cfg (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
index 51eaf8d7..63a01ba2 100644
--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
+++ b/meta-arago-distro/recipes-kernel/linux/docker.inc
@@ -1,4 +1,2 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
 SRC_URI += "file://docker.cfg"
 KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux/files/docker.cfg
rename to meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
-- 
2.17.1

