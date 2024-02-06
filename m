Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E477C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:58:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.28483.1707242325054410974
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 09:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xVCVs95g;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 416Hwh0a029819;
	Tue, 6 Feb 2024 11:58:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707242323;
	bh=pTEC3XEgVb0MHd9UVpg9DOxQzw2I8mZ+3b6LI0jiV+g=;
	h=From:To:CC:Subject:Date;
	b=xVCVs95g2zfFhSde07PGSpFhNfKDrIw7kyknwzfIaIxf2px4PbrUbR9wxxkbOq155
	 JkZ9mXYFOvcMnTtXXAaF89Ww3E/dqNfIMS4kJAJuUe/nP30CL5hRuXQ41m/U2xij6S
	 aQQLZ+SvMaIrU8BbC9ZjH8tIwoJrdsK3ZvieXB/U=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 416HwhxU039856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 11:58:43 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 11:58:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 11:58:43 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 416HwhcP064292;
	Tue, 6 Feb 2024 11:58:43 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCH  0/4] cleanup old/add new chromium
Date: Tue, 6 Feb 2024 11:58:37 -0600
Message-ID: <20240206175841.32717-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Feb 2024 17:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15117

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


