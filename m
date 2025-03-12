Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB52C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 23:27:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2439.1741822017380468391
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 16:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uVxHFiih;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CNQuOs1710967
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 18:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741822016;
	bh=AVNynFIv1ON00DT3vlmOvzKkR/2DkpcHRIVr/8lo6qw=;
	h=From:To:CC:Subject:Date;
	b=uVxHFiihCZUctRKUCMOoHB8fSocluElD3JPP4FylXzfcCGV8pdWPAB7R3X3TTX+In
	 1jD9MFAHFfd2Izr7Cg2W9pKR41PxXWHu0HWj/aQVk5SWhouSykpTS/NxH3QPfFOe36
	 z4liD1G/p7Xe8gN9F0amKz+emK6VF1PrHY+xsbu0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CNQuDu064500;
	Wed, 12 Mar 2025 18:26:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 18:26:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 18:26:55 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CNQtee023082;
	Wed, 12 Mar 2025 18:26:55 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <detheridge@ti.com>,
        <vijayp@ti.com>
Subject: [meta-arago][scarthgap][PATCH 0/2] Add display manager and required configs
Date: Wed, 12 Mar 2025 18:26:27 -0500
Message-ID: <20250312232628.1260171-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 23:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16012

From: Randolph Sapp <rs@ti.com>

Add emptty and relevant configs to replace weston-init. This is a modified
version of the proposal I made to oe-core to get around a sequencing bug that's
been around for a while, but has recently become an issue for us.

As it stands weston-init has no idea what drm devices it should wait on or bind
to. We could introduce a udev rule to track tidss and pvrsrvkm registered
devices and introduce systemd dependencies around those new .device units, or we
could add a proper display manager that's already capable of waiting for drm
devices and has the potential to handle hotplug events in the future.

I'm preferable to the second option instead of making rules and modifications to
the service file for multiple platform configs.

This series adds emptty as a display manager and converts our bbappend for
weston-init to a stand alone version of weston-init named weston-init-arago.
This package has the required config files for emptty to automatically login the
weston user like weston-init does.

This does remove the weston systemd unit and global weston socket. This was
probably for the best as it was not really standard behavior. It just made it
"easy" to run arbitrary GUI applications as root, which is never advised.

Randolph Sapp (2):
  emptty: add version 0.13.0
  weston-init: weston-init -> weston-init-arago

 meta-arago-distro/conf/distro/arago.conf      |  3 +-
 meta-arago-distro/conf/layer.conf             |  4 +-
 .../packagegroup-arago-tisdk-graphics.bb      |  2 +-
 .../recipes-graphics/emptty/emptty/init       | 26 +++++++
 .../recipes-graphics/emptty/emptty/pamconf    | 10 +++
 .../recipes-graphics/emptty/emptty_0.13.0.bb  | 78 +++++++++++++++++++
 .../wayland/weston-init-arago.bb              | 72 +++++++++++++++++
 .../beaglebone/weston.ini                     |  0
 .../wayland/weston-init-arago/emptty.conf     | 77 ++++++++++++++++++
 .../weston-launch-calibrator.sh               |  0
 .../weston.ini                                |  0
 .../wayland/weston-init.bbappend              | 14 ----
 12 files changed, 268 insertions(+), 18 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/init
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/beaglebone/weston.ini (100%)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/weston-launch-calibrator.sh (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/weston.ini (100%)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend

-- 
2.48.1


