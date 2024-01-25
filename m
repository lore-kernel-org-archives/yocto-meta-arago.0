Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677EBC48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 07:57:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12124.1706169438095457515
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 23:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=N+6AsQlv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vHMS068527
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706169437;
	bh=wuID1gMrXA2Akx2E8NpIpyhLsxzF8cB71J8YmaeOiNw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N+6AsQlvcLyR99YxrN77yb8MSF7k/QsqUFuOkfLP2/puOIiob4dWM7fmoAn1VmaBr
	 6xEZdCw0JSh9MPX4W21x/B6Kiegdee3XNqTGuDzmq1JOwGZo5wiPmmH5/jWbm5FyqI
	 R4Mr77zpoYHPslvdBKB+9rOSIy//Y8fdsq6fhYKs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40P7vHFM044793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:17 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 01:57:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 01:57:16 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vGFx086209;
	Thu, 25 Jan 2024 01:57:16 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v3 1/2]  gstreamer1.0-plugins-good: Maintain same set of patches for all machines
Date: Thu, 25 Jan 2024 13:27:09 +0530
Message-ID: <20240125075710.843604-2-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125075710.843604-1-r-ravikumar@ti.com>
References: <20240125075710.843604-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 07:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15094

This will make it easier to maintain and it will be easier if we decide
to have TI fork for gstreamer.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 ...2-Changes-for-DMA-Buf-import-j721s2.patch} |  0
 ...nce-to-contiguous-format-if-support.patch} |  0
 .../gstreamer1.0-plugins-good_1.20.%.bbappend | 23 +++----------------
 3 files changed, 3 insertions(+), 20 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch => 0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0002-v4l2-Give-preference-to-contiguous-format-if-support.patch => 0004-v4l2-Give-preference-to-contiguous-format-if-support.patch} (100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index e14a3c93..2a1a6e68 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -3,25 +3,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRC_URI:append = " \
     file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
+    file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
 "
 
-SRC_URI:append:j721s2 = " \
-    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-"
-
-SRC_URI:append:j784s4 = " \
-    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-"
-
-SRC_URI:append:am62axx = " \
-    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-"
-
-SRC_URI:append:am62pxx = " \
-    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-"
-PR:append = ".arago0"
+PR:append = ".arago1"
-- 
2.34.1


