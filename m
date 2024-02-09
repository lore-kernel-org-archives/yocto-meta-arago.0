Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47373C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:56:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20645.1707505004402990145
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 10:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o5hMXDuQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419IugU7130058;
	Fri, 9 Feb 2024 12:56:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707505002;
	bh=1yCwfDrfh8MqUdFuQnrkhg+KD8VskSDvDUQNA2Gvias=;
	h=From:To:CC:Subject:Date;
	b=o5hMXDuQzs1gbylJJFeEgIbW553cPVtTjgf2GbrEgguIhaH103BuEdFYgmHUrqV2g
	 Rs9WHm/BJi5u0gp92PUYS4comv5146EUgQBBpyI/TUpLlsxojZQoFpneCjA2zi+5yg
	 eLcvpZaZIFZ4T+3phy3x/silssqLp7TuJPmVl3ck=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419Iugc2010310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 12:56:42 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 12:56:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 12:56:42 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419IugLd047828;
	Fri, 9 Feb 2024 12:56:42 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 0/4] cleanup old/add new chromium
Date: Fri, 9 Feb 2024 12:56:31 -0600
Message-ID: <20240209185635.32675-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 18:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15154

From: Darren Etheridge <detheridge@ti.com>

Sending again (no changes in patch series) but it never made it to
meta-arago list.

Patch series to add IMG PowerVR GPU accelerated Chromium support into
Kirkstone.

Patch 1 and 4 clean up some of the old Chromium cruft that was left in
the kirkstone branch that I can't imagine can possibly be useful now.

Then patch 2 and 3 add in a new dynamic layer to provide GPU support to
Chromium by allowing the PowerVR libraries to be used from within the
Chromium sandbox.   Also apply an upstream Chromium patch to stop
Chromium from segfaulting immediately on startup if no input devices are
detected.
The dynamic layer will append chromium-ozone-wayland to the
IMAGE_INSTALL for tisdk-default-image if the meta-browser layer is
detected.

Currently we need to pin the meta-browser layer to chromium v111 as there are
problems with the GPU integration in newer versions.  This pinning will
be taken care of as part of oe-layersetup once we decide if it becomes a
new "chromium" configuration, or if we add these layers into the normal
kirkstone configurations.  Downside is build time increases
considerably and image size increases.

All of this working depends on IMG PowerVR DDK23.3 being available in
meta-ti - Randolph sent these patches for review last week.

v2 - fixed typo in patch 2 subject line

Darren Etheridge (4):
  meta-arago: distro: chromium: remove old dynamic layer
  meta-arago: distro: add a bbapend to patch the chromium browser
  meta-arago: images: update tisdk-default-image to include chromium
  meta-arago: tisdk-default-image: remove old chromium logic

 meta-arago-distro/conf/layer.conf             |  4 +-
 .../chromium-75.0.3770.80-SIOCGSTAMP.patch    | 15 ----
 .../chromium-ozone-wayland/pulse.patch        | 47 ------------
 .../chromium-ozone-wayland_%.bbappend         |  8 --
 ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
 ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 +++++++++++++++++++
 ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
 .../images/tisdk-default-image.bbappend       |  3 +
 .../images/tisdk-default-image.bb             | 10 ---
 9 files changed, 139 insertions(+), 82 deletions(-)
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend

-- 
2.36.1


