Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E350AC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 19:24:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3399.1686338665550195993
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 12:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OZnuABXG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359JOL4O069720;
	Fri, 9 Jun 2023 14:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686338661;
	bh=33xadYiYgqHMXjcEMAyA5GBVCyja4WysJe44H0Z9izw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OZnuABXGvTFQi5hF8Z1Tfq7EN7XA1+LQi6AKoHH7bAgiYWiQT2vZ6h1gLDJ/vqUam
	 JduKk6lOcx7Bq4NCYv+0CrPjRg2uMeqvA+O/dSXkURdO2sAEzH02ZDE/FHksvhoscW
	 l6ofn/AP02EP5sL4Fl75pHWv8eND1rksg2VPQM78=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359JOLan090121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 14:24:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 14:24:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 14:24:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359JOLER060690;
	Fri, 9 Jun 2023 14:24:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 2/3] arago.conf: add serial-getty-generator to systemd
Date: Fri, 9 Jun 2023 14:24:14 -0500
Message-ID: <20230609192415.3210941-3-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230609192415.3210941-1-rs@ti.com>
References: <20230609192415.3210941-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 19:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14585

From: Randolph Sapp <rs@ti.com>

Use systemd's built-in getty generator instead of the OE-Core variant.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 03272511..7354a98e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -69,7 +69,7 @@ DISTRO_FEATURES:append = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT'))
 DISTRO_FEATURES:remove = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
 
 # Distro-specific package configuration
-PACKAGECONFIG:append:pn-systemd = " coredump"
+PACKAGECONFIG:append:pn-systemd = " coredump serial-getty-generator"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
-- 
2.41.0


