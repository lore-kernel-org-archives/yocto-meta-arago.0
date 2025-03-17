Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B0C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 21:01:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2241.1742245271091680733
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 14:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ncb/rx2U;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HL17YC2923818
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 16:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742245267;
	bh=Vj+UhjoTxw3VEP+Fc2KhMzaZzD7IKFNJ6YIBA7xKNWU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ncb/rx2UIs3NDtrzjT0QnIJby9PlALr3PJcwaTD2To1Ah867QF+oydL5jZDCmO2Ga
	 0EXK5nojBCBAiq75mvQOVnBxzsQ7KIvNndauJy+G7QfKoAX5xM/undwwoAD+QJTua2
	 yfdFLlVxJwrbyQ0kq/hjNWw47/+m/i6N5DpzPfIA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HL17BE020985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 16:01:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 16:01:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 16:01:06 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HL16Ja061285;
	Mon, 17 Mar 2025 16:01:06 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <a-christidis@ti.com>, <afd@ti.com>
Subject: [meta-arago][scarthgap][PATCH 2/2] systemd: remove sync-clocks service
Date: Mon, 17 Mar 2025 16:00:29 -0500
Message-ID: <20250317210038.3983636-3-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317210038.3983636-1-rs@ti.com>
References: <20250317210038.3983636-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16076

From: Randolph Sapp <rs@ti.com>

This is already handled by the kernel with RTC_SYSTOHC and any of the
userspace time synchronization daemons we have (systemd-timesyncd).

This is handled only when an NTP sync occurs normally, so that the
system RTC is updated to the proper time outright and doesn't create
potential issues with the time sync daemon drift tracking between boots.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../systemd/systemd/sync-clocks.service            | 14 --------------
 .../recipes-core/systemd/systemd_%.bbappend        |  5 -----
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service b/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
deleted file mode 100644
index b11d05ad..00000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=Synchronize System and HW clocks
-DefaultDependencies=no
-Wants=sysinit.target
-Conflicts=shutdown.target
-After=getty.target
-
-[Service]
-Type=oneshot
-ExecStart=/sbin/hwclock --systohc
-StandardOutput=syslog
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 428a16f7..4e41d90d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -10,7 +10,6 @@ SRC_URI:append = " \
     file://15-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
-    file://sync-clocks.service \
     file://timesyncd.conf \
     file://37-can-j7.rules \
     file://37-can-am62.rules \
@@ -32,10 +31,6 @@ do_install:append() {
     install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
-    install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
-    install -m 0644 ${WORKDIR}/sync-clocks.service ${D}${sysconfdir}/systemd/system/
-    ln -sf ../sync-clocks.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/sync-clocks.service
-
     # Allow automount from udev
     install -m 0644 ${D}${systemd_system_unitdir}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/
     sed -i 's/MountFlags=slave/MountFlags=shared/g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-- 
2.48.1


