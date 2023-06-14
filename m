Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D369C001B1
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:35:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19197.1686764119729359283
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H6qsWnnq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ7Ev062386;
	Wed, 14 Jun 2023 12:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764107;
	bh=o3WW0b4tRaLrydi0gilOfVrHf5nzh+SgQh7rJiZMMZY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H6qsWnnqZ4e+M3fY/86jLki/q1t6a3h/enX70NUsxDXxzR046wO+FChnjZTf86VG3
	 Q6tQI07lIQ+JBDbM+P2AsWVo/Sohk9UOzaeZWyqUsoEPTZMJQnm71nLADUdMezZgNI
	 UBZ0TW3G3Ci+BNsrs+BhLr40AJpRX1486U4ZtqlU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHZ7rS078798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:35:07 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:35:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:35:06 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ6S6032184;
	Wed, 14 Jun 2023 12:35:06 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv3 1/4] arago.conf: make things more readable and fix the virtuals
Date: Wed, 14 Jun 2023 12:34:59 -0500
Message-ID: <20230614173502.4007809-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614173502.4007809-1-rs@ti.com>
References: <20230614173502.4007809-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14631

From: Randolph Sapp <rs@ti.com>

Make things more readable and reliable by using the built in boolean
check instead of python's type casting. Drop the array indexing in favor
of a more direct if else statement.

Also fix the virtual provider for login manager. There should only be 1
login provider and it should be shadow-base for systemd *or* busybox for
sysVinit systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 59ee9926..2606ca39 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -59,13 +59,13 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_login_manager = "busybox shadow"
+VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
+VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
+VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
+VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
+VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
 
-DISTRO_FEATURES:append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
+DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump"
-- 
2.41.0


