Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB8FC3600E
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1881.1742494250234264771
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kdLMKT9j;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAno6684442
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494249;
	bh=UlC6Vf3yH7gL9+lDWt0kpaF+96iLQbXP8JZnt0CmCjs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kdLMKT9jykzDsVS9+GwXTupTRvmfZSDU8vxWmPziP+ktko8a9OV4Y/gbg6VexaPsE
	 ZPoJ/QXPptaAZvXtrY86M0t5WjmoNbO4KFllB5jMNA/YuXCHup64pHK0EA6/ULBHOb
	 ejlXo8jKzYnZM0mytbzSXPD1r1xVpjqJNgsfkd3g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnIi049397
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmgb085697;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-0000qW-Ra; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 14/26] libdrm: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:35 -0500
Message-ID: <20250320181047.18035-15-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16115

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../drm/{libdrm_%.bbappend => libdrm-arago.inc}     |  2 +-
 .../recipes-graphics/drm/libdrm_%.bbappend          | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)
 copy meta-arago-distro/recipes-graphics/drm/{libdrm_%.bbappend => libdrm-arago.inc} (87%)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
similarity index 87%
copy from meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
copy to meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
index ea8b5ca1..68496668 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/libdrm:"
 
 SRC_URI += " \
 file://0001-Add-option-to-run-a-test-indefinitely.patch \
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index ea8b5ca1..7a9bed64 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -1,11 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+LIBDRM_ARAGO = ""
+LIBDRM_ARAGO:arago = "libdrm-arago.inc"
 
-SRC_URI += " \
-file://0001-Add-option-to-run-a-test-indefinitely.patch \
-file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
-file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
-file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
-file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
-"
-
-PR:append = ".arago4"
+require ${LIBDRM_ARAGO}
-- 
2.17.1


