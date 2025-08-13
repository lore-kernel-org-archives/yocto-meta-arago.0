Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC6CCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:52:01 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1529.1755103912669459711
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=N8riePEA;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGpqXt2191832
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755103912;
	bh=o9Fi1emYi5XLe66SdIzkXKW+wDoEFwC7L8VWQ/OiT7o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N8riePEAthkuxNZy436VCf94M55vsYE+9Nnj7a1k34b09qOuas0o6XbDTJjA/M7U4
	 B5xyt70hzEoNeQt+1eAobWiF447FAr8nLchEXcar36To6WbuVh6o4GFuRji/WI7FlO
	 l1j3sWZlv16Owblq56mmoUWURG4lAtbf9jt2w9OI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGpqL6527018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:52 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:51:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:51:51 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGpo9x2292823;
	Wed, 13 Aug 2025 11:51:51 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/5] meta-arago-distro: chromium: upgrade to 132.0.6834.83
Date: Wed, 13 Aug 2025 11:51:44 -0500
Message-ID: <20250813165148.220012-2-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813165148.220012-1-t-lannynd@ti.com>
References: <20250813165148.220012-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16362

Upgrade the files to chromium v132.0.6834.83 to match the
version we are using in scarthgap/master. This patch is 
needed to make sure the patch is applied correctly by 
keeping the version number consistent.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...omium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch | 0
 .../chromium/chromium-ozone-wayland-arago.inc              | 7 ++++++-
 ...ppend => chromium-ozone-wayland_132.0.6834.83.bbappend} | 0
 3 files changed, 6 insertions(+), 1 deletion(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland-130.0.6723.91 => chromium-ozone-wayland-132.0.6834.83}/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_130.0.6723.91.bbappend => chromium-ozone-wayland_132.0.6834.83.bbappend} (100%)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-130.0.6723.91/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-130.0.6723.91/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index 3573c112..d28acc9e 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,6 +1,11 @@
 PR:append = ".arago0"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland-130.0.6723.91:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland-132.0.6834.83:"
+
+PACKAGECONFIG[use-v4l2] = "use_v4l2_codec=true,use_v4l2_codec=false"
+PACKAGECONFIG:append = " proprietary-codecs use-v4l2"
+
+CHROMIUM_EXTRA_ARGS:append = " ${@bb.utils.contains('PACKAGECONFIG', 'use-v4l2', '--ozone-platform-hint=wayland --enable-features=AcceleratedVideoDecoder,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL', '', d)}"
 
 SRC_URI:append = " \
                   file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_132.0.6834.83.bbappend
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_132.0.6834.83.bbappend

