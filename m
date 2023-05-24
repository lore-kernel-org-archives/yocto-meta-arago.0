Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C3AC7EE37
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1296.1684951891960970720
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PC2j6wHR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOIE020816;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=bbQEscaiLqLHL9MfhOBLFQVYyZWgEESlYfXCCL/7NwY=;
	h=From:To:CC:Subject:Date;
	b=PC2j6wHRKBR1wNjPWOe8dME832SalhR13U/5BGslDrYgJTLMPkdRTmyUGbVivCCQe
	 LukACujILCMhZ/lpk3Oa0tPjUPdit+7eTxvLSfm7xxr8qaHEmMQKbDn4bkA0txxwo8
	 imv+s5yoLsOe9xjq1gJ1OFt4L7/zN5KaggF1KVHQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBOYg067931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOpx005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 0/7] Rootless Weston and Weston patch cleanup
Date: Wed, 24 May 2023 13:11:15 -0500
Message-ID: <20230524181122.35202-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14466

From: Randolph Sapp <rs@ti.com>

Running Weston as root is generally a bad idea and currently breaks
interactions with the dbus interface and a handful of applications with
this newer version of Weston. Let's roll everything back to using the
standard weston-init package with some appends for those users running
touchscreens.

This also cleans up a lot of lingering patches from dunfell for Weston
which are no longer applicable.

Randolph Sapp (7):
  weston-init: drop all the old append logic
  weston: drop Fix-touch-screen-crash patch
  weston: drop allow-visual_id-to-be-0 patch
  weston: add notice about select-plane patch
  weston: add weston user to the render group
  weston: drop the fix-virtual-keyboard-display-issue patch
  weston-init: add a simple touchscreen calibration check

 .../wayland/weston-init.bbappend              |  15 +-
 .../recipes-graphics/wayland/weston-init/init | 129 ------------------
 .../wayland/weston-init/runWeston             |  39 ------
 .../wayland/weston-init/ti43x/weston.ini      |  16 ---
 .../wayland/weston-init/wayland_env.sh        |  12 --
 .../weston-init/weston-launch-calibrator.sh   |  13 ++
 .../wayland/weston-init/weston.ini            |   8 ++
 .../0002-weston-Allow-visual_id-to-be-0.patch |  34 -----
 ...al-keyboard-display-issue-for-QT5-ap.patch |  41 ------
 ...-weston-Fix-touch-screen-crash-issue.patch |  39 ------
 .../wayland/weston_10.0.2.bbappend            |  13 +-
 11 files changed, 34 insertions(+), 325 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch

-- 
2.40.1


