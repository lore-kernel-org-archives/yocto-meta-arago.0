Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C7C47DDB
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:29:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.78898.1705940975040970240
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 08:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WjG6wFvv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTYMX095855
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705940974;
	bh=qVe9CoxmmQ3juPsxDxwSyo8cHNCtbESX3xoMuDShG78=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WjG6wFvvXc+PzH50omepWKAaLewFcMCE2kcazR2kVzVdZzfqYcx7Z4szWeN3Lh/y+
	 HfA6/kNrbDHPOS2Zot/RYe4Oo/QS7mj7qgBsU/Oz78Whox2VuOgNclb2wcJ43lMDk7
	 3ta1D6MiNOFSpGCsWyNrgzNPAEdjqvo/r1imp+Uk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MGTYOx107783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:34 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 10:29:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 10:29:33 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTWA9020359;
	Mon, 22 Jan 2024 10:29:33 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] gstreamer1.0-plugins-good: Maintain same set of patches for all machines
Date: Mon, 22 Jan 2024 21:59:16 +0530
Message-ID: <20240122162917.822825-2-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122162917.822825-1-r-ravikumar@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 16:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15078

This will make it easier to maintain and it will be easier if we decide
to have TI fork for gstreamer.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../gstreamer1.0-plugins-good_1.20.%.bbappend | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index e14a3c93..7ad943f6 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -3,25 +3,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRC_URI:append = " \
     file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
-"
-
-SRC_URI:append:j721s2 = " \
     file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
 "
 
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


