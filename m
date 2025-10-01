Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808B4CCA471
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:31:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.4678.1759343475459526450
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Oct 2025 11:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EjLNmGJl;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591IVCOL2726677;
	Wed, 1 Oct 2025 13:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759343472;
	bh=H68Cvh3M+reluv9gN+KSqCKH2RXVGNc6WCbJrge/VYA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EjLNmGJl/ds5FOVG3XQhYmJ5KUZIM6KZxbjN6wgTKoa8W1GdlkJppr5WxszlELj9Q
	 odMO66tWrpgHiWsVdWJ6p3HOB/weawdWurfiAX7EoHFnHNP+T7h4ejCkNcdPTKrFFD
	 yivV9528wmPS1mx0OWMc2zf7OQ8lxY//03NrOxwY=
Received: from DLEE215.ent.ti.com (dlee215.ent.ti.com [157.170.170.118])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591IVC1e3620305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Oct 2025 13:31:12 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 13:31:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 13:31:12 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591IVCFY971353;
	Wed, 1 Oct 2025 13:31:12 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <s-jain1@ti.com>
Subject: [meta-arago][scarthgap][PATCH 2/2] weston-init-arago: add weston-init to the rprovides
Date: Wed, 1 Oct 2025 13:31:02 -0500
Message-ID: <20251001183102.357345-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001183102.357345-1-rs@ti.com>
References: <20251001183102.357345-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Oct 2025 18:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16658

From: Randolph Sapp <rs@ti.com>

I made this conflict with the core version of weston-init, but I forgot
to say it's actually a runtime provider of the same package to resolve
any issues with core package groups.

Fixes: d63830cd ("weston-init: weston-init -> weston-init-arago")
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
index 033c32f1..395e996e 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
@@ -65,7 +65,7 @@ FILES:${PN} += "\
     "
 
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
-RPROVIDES:${PN}:append = " virtual-emptty-conf"
+RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"
 RCONFLICTS:${PN} += "weston-init"
 
 USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
-- 
2.51.0


