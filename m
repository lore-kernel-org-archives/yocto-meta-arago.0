Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F9FC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:10:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5593.1686078638167538303
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ObzdpLhY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356JAY7A030767;
	Tue, 6 Jun 2023 14:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686078634;
	bh=baTt4EntHbLdMlsDACOHaHsCNqzs4+SErCUSpGcdGW0=;
	h=From:To:CC:Subject:Date;
	b=ObzdpLhYkEw7VC/DBO+RBw4Qr8t16Q000LL7M4VkcjjdbzNVZoK2G5W+ZQtX2U1Br
	 E4sMOrycmhLDfrDxYmesaFGSCi00wZWm53n1GC2/bcooq7ylj4u1/oa+YHYyyRWupB
	 sShoox4c2u+eUEjBDLp7E7qeyeLQr/bzTJnLzWTU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356JAYwE076789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 14:10:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:10:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:10:33 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356JAXt1026255;
	Tue, 6 Jun 2023 14:10:33 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <detheridge@ti.com>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] arago.conf: make things more readable and fix the virtuals
Date: Tue, 6 Jun 2023 14:10:19 -0500
Message-ID: <20230606191019.702649-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:10:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14498

From: Randolph Sapp <rs@ti.com>

Make things more readable and reliable by useing the built in boolean
check instead of python's type casting. Drop the array indexing in favor
of a more direct if else statememnt.

Also fix the virtual provider for login manager. There should only be 1
login provider and it should be shadow-base for systemd *or* busybox for
sysVinit systemd.

Also explicitly remove the sysvinit distro feature if ARAGO_SYSVINIT
isn't set, because whatever arago inherits expects sysvinit for some
reason. This should fix the duplicate init.d and systemd service files
we've been seeing.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9164657c..6390a916 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -59,13 +59,14 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
-VIRTUAL-RUNTIME_login_manager = "busybox shadow"
-
-DISTRO_FEATURES:append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
+VIRTUAL-RUNTIME_dev_manager = "${@ 'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
+VIRTUAL-RUNTIME_init_manager = "${@ 'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
+VIRTUAL-RUNTIME_initscripts = "${@ 'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
+VIRTUAL-RUNTIME_initramfs = "${@ 'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
+VIRTUAL-RUNTIME_login_manager = "${@ 'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
+
+DISTRO_FEATURES:append = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
+DISTRO_FEATURES:remove = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump"
-- 
2.40.1


