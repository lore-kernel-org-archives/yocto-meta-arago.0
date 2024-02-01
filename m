Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE921C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:55:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.188.1706806539296017177
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 08:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YqFbhuAr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411Gtca3109787;
	Thu, 1 Feb 2024 10:55:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706806538;
	bh=b8nmqxAs00YbJCPbFsmPxor1wkgnUD4X2+DDL1zw6l0=;
	h=From:To:CC:Subject:Date;
	b=YqFbhuArhDDLiyFuYw+gTaJhZjSYW0Ve0FQaj9F9ze0twaUoPid+nqc3IsST1ywNw
	 iNhJRypePdADwQQmt93LyA9JjfRsE5if3ZCuZFQTE6B51yqcgjuwaWzcwtuedUOaHw
	 +6rEf6wP8hIJpSCZoePaPYGKjJaVogzKu5gYKue8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411GtcGC054886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 10:55:38 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 10:55:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 10:55:37 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411Gtb3k087402;
	Thu, 1 Feb 2024 10:55:37 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone/master][PATCH] arago.conf: remove x11 again
Date: Thu, 1 Feb 2024 10:55:37 -0600
Message-ID: <20240201165537.3874417-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Feb 2024 16:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15100

From: Randolph Sapp <rs@ti.com>

We don't support x11, and while it can currently be enabled in tandem
with our graphics stack right now without explicitly causing issues on
it's own, Yocto still treats the presence of x11 as a distro feature to
mean that desktop GL is present.

This assumption leads to a lot of incorrectly configured packages in our
case so to prevent future incompatibility with layers adjusting their
PACKAGECONFIG values with this logic we should explicitly remove x11
again.

This decision will likely flip again if oe-core introduces a standard
"opengles" feature instead of just the blanket "opengl" one they
currently use.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This has a dependency on the following patch in meta-ti since vulkan is
currently enabled:
https://lists.yoctoproject.org/g/meta-ti/message/17432

 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ecbcbf1a..2a2b827f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -47,6 +47,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
+DISTRO_FEATURES:remove = "x11"
 #DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
 DISTRO_FEATURES:append = " opencv"
-- 
2.43.0


