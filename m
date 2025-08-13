Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDECCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:52:01 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1577.1755103911573732455
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iBCV+/KW;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGpphw1743604
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755103911;
	bh=SK4DxIc4krIUpJ4ho1KIlrbvdawq8l3xv26c8DekkgA=;
	h=From:To:CC:Subject:Date;
	b=iBCV+/KWU1OS1LnbpSR8ChpjrNz3MgrepjNfdTbZzP7/I77ZMaBF1moAtDYKHNJ3c
	 kMunOT4+s1+GqDNMEYt7gR80XnlYotyEh4XMA3SOsNKc0jbQ1LsDabqYEAWrfF+Uxu
	 RNZW1YJwfjZ4l5Bl4X8EqGBLBKH4XM30EYh8UtdY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGpo5n527009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:51:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:51:50 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGpo9w2292823;
	Wed, 13 Aug 2025 11:51:50 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 0/5] Enable hardware acceleration on chromium
Date: Wed, 13 Aug 2025 11:51:43 -0500
Message-ID: <20250813165148.220012-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16361

Dear Maintainers,

This patch series enables hardware acceleration using the open source
V4L2 Wave521cl codec on the chromium browser. This covers the html5 
player tag for videos encoded in H.264 format, but does not address 
WebRTC or hardware accelerated encoding on Chromium.

This patch series is expected to work on the following Texas Instruments devices:
am62a, am62p, j721s2, and j784s4.

It has been tested and works on the following devices:
am62p and j784s4.

Link for video used for testing:
http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4

Regards, Thorsten Lannynd

Thorsten Lannynd (5):
  meta-arago-distro: chromium: upgrade to 132.0.6834.83
  meta-arago-distro: chromium: enable V4L2 stateful decoder
  meta-arago-distro: chromium: Allow GPU sandbox access to V4L2
  meta-arago-distro: chromium: Fix V4L2 Stateful decoder
  meta-arago-distro: chromium: add patches to chromium recipe

 ...dbox-allow-access-to-PowerVR-GPU-fro.patch |   0
 ...pu-v4l2-enable-V4L2-stateful-decoder.patch |  34 +++++
 ...dbox-Allow-GPU-sandbox-access-to-V4L.patch |  55 ++++++++
 ...2-Fix-OUTPUT-queue-streaming-in-V4L2.patch | 123 ++++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc |  10 +-
 ...mium-ozone-wayland_132.0.6834.83.bbappend} |   0
 6 files changed, 221 insertions(+), 1 deletion(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland-130.0.6723.91 => chromium-ozone-wayland-132.0.6834.83}/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch (100%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_130.0.6723.91.bbappend => chromium-ozone-wayland_132.0.6834.83.bbappend} (100%)


