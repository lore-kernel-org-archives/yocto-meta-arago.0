Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89F4EB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:38:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.17689.1686760719230925978
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g2Bj8OEY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcQOa049695;
	Wed, 14 Jun 2023 11:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686760706;
	bh=wLrC+/nHVZuNxKPRnSXjQYMBqfNQ7JwisVLok366R2w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g2Bj8OEYMT/MbEBMOgm4vDSKUsdZ3FkbK7dWRk3W70V1XOhX6L9h6YrAfQIUpfTlw
	 k8Rnvj0zijON0K/QUohXtvjZHG2+V2/JOBWIz6gSnBZQtOB6rPlaLzle0g4Utb/yzK
	 ZkUKqUMLW/9N/2ufVdxvoC3xm2bnRZZm7dAo7NQ8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EGcQ6S090241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 11:38:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 11:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 11:38:26 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcPZY060182;
	Wed, 14 Jun 2023 11:38:26 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 3/4] arago.conf: add serial-getty-generator to systemd
Date: Wed, 14 Jun 2023 11:38:13 -0500
Message-ID: <20230614163814.3562779-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14625

From: Randolph Sapp <rs@ti.com>

Use systemd's built-in getty generator instead of the OE-Core variant.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2606ca39..fcbb3f74 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -68,7 +68,7 @@ VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAG
 DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
 
 # Distro-specific package configuration
-PACKAGECONFIG:append:pn-systemd = " coredump"
+PACKAGECONFIG:append:pn-systemd = " coredump serial-getty-generator"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
-- 
2.41.0


