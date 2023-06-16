Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1ADEB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 00:17:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.33911.1686874626898844006
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 17:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qjZr/CKO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0H2oR037413;
	Thu, 15 Jun 2023 19:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686874622;
	bh=jybrfa0zYViORp9bjp3BrbbdvhsH4ZPR4jiUqyRR4z8=;
	h=From:To:CC:Subject:Date;
	b=qjZr/CKOhlCnZ5ZrpjAb/LUvmY3PNTtOgLgduJkBkSyEurf0LWLzXLMnA/iiTWwzO
	 nVRDvq4UTARsUv24XRi2lzvL/LBpSEI0pchok/gyASagJz4VJ1BrtMZGs5gHL1ye3N
	 QZtSIoQlb+t//Sudq4m9EQQRlfKO0kiEnWkkJJBA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0H23J030168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 19:17:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:17:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:17:02 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0H1fn015810;
	Thu, 15 Jun 2023 19:17:01 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] arago.conf: set weston-init packageconfig
Date: Thu, 15 Jun 2023 19:14:54 -0500
Message-ID: <20230616001453.1321068-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 00:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14642

From: Randolph Sapp <rs@ti.com>

Set the weston-init PACKAGECONFIG string to "" to prevent the xwayland
config from being loaded.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This is to preempt the new xwayland PACKAGECONFIG option from the
backported set I submitted to oe-core.

 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b6fd8548..ba467bd1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -95,6 +95,9 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 
 PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 
+# Set this to empty string to prevent xwayland config from being added
+PACKAGECONFIG:pn-weston-init = ""
+
 # Enable testing for opencl and vulkan with piglit
 PACKAGECONFIG:append:pn-piglit = " ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
-- 
2.41.0


