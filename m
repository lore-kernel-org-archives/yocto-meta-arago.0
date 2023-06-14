Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D782EEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:38:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17685.1686760718812238716
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yvnYafDx;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcQRU089443;
	Wed, 14 Jun 2023 11:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686760706;
	bh=MNeptcWyBQB6DKrwjQ3Xcval7/xrma0AG31Uq2NcIQY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yvnYafDxtTRfpBcAg7X0WtbfttoDCJysi8r+xQENR4wPVi2qRgzLG80IbydTErfEe
	 zA8JKvq8mVNsYJj/ySFAHP7JGsZoZdhf0Z1+3WFOAQkhh8EvCas9J9UvqEeA1FTYZq
	 K04FwYsNy9xb+qUQzdo/oRtyB25GyWPaxaxtABvA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EGcQ0b025192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 11:38:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 11:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 11:38:26 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcPZZ060182;
	Wed, 14 Jun 2023 11:38:26 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 4/4] systemd: move packageconfig appends to distro config
Date: Wed, 14 Jun 2023 11:38:14 -0500
Message-ID: <20230614163814.3562779-5-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614163814.3562779-1-rs@ti.com>
References: <20230614163814.3562779-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 16:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14622

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


