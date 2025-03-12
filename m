Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FFBC35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.38831.1741790742071002372
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xLaOegXL;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfSa1094859
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=33jjN6O8ICsIGnAhA+sLWDdajcf9YX9mT4QqJ6RwRz8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xLaOegXLlRMu9LCRyTgpNmjrX/yVQ2/jDVk0TITmimLzaPdF3chzk01G8aOc2Sfwh
	 JYunCRNFAyOYkS/BpT6LcVjLKVIHNvSCRIMhLtgtewI0Xj/eMyUMbAhFv8EbdszP5f
	 Q4JhYXf0qdJCN92zYnPesp6hM4ibl9bN93NfltD0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfld097203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjelA007009;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003qm-NK; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 06/10]  gstreamer1.0-plugins-good: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:36 -0500
Message-ID: <20250312144540.14210-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15993

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...pend => gstreamer1.0-plugins-good_1.24-arago.inc} |  2 +-
 .../gstreamer1.0-plugins-good_1.24.%.bbappend        | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.%.bbappend => gstreamer1.0-plugins-good_1.24-arago.inc} (83%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24-arago.inc
similarity index 83%
copy from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
copy to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24-arago.inc
index 30dd5c85..26549776 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/gstreamer1.0-plugins-good:"
 
 SRC_URI:append = " \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
index 30dd5c85..e2e8b043 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
@@ -1,10 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO = ""
+GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO:arago = "gstreamer1.0-plugins-good_1.24-arago.inc"
 
-SRC_URI:append = " \
-    file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
-    file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-    file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
-"
-
-PR:append = ".arago0"
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO}
-- 
2.17.1


