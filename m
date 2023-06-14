Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D64FEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:35:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19076.1686764119678232191
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N04AmHqU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ7Zn087311;
	Wed, 14 Jun 2023 12:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764107;
	bh=MNeptcWyBQB6DKrwjQ3Xcval7/xrma0AG31Uq2NcIQY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N04AmHqU4mtN2RLp96KW3WkF4CcGHUTiXDSQ01zw5pN6wxRmuzBnts8Ky/cprUqJA
	 3gNa7RUu3d9xrM1UWZ4LeE60NbLCWGyrmAcGGr6UjAvshdeaLe/GlaVLym6jadAfb9
	 5mGHPb0PXFECdIIJ8cBD3gX9kY/GJ584q7RwOa4E=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHZ78L061274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:35:07 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:35:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:35:06 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ6S9032184;
	Wed, 14 Jun 2023 12:35:06 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv3 4/4] systemd: move packageconfig appends to distro config
Date: Wed, 14 Jun 2023 12:35:02 -0500
Message-ID: <20230614173502.4007809-5-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14630

From: Randolph Sapp <rs@ti.com>

Move the systemd PACKAGECONFIG append strings to the distro config.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                  | 2 +-
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index fcbb3f74..d0640c5a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -68,7 +68,7 @@ VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAG
 DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
 
 # Distro-specific package configuration
-PACKAGECONFIG:append:pn-systemd = " coredump serial-getty-generator"
+PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index a38ca124..3de94336 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -2,8 +2,6 @@ PR:append = ".arago6"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG:append = " networkd resolved"
-
 SRC_URI:append = " \
     file://local.rules \
     file://usb1-rules.sh \
-- 
2.41.0


