Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4141AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 15:47:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3230.1689090455079855567
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Jul 2023 08:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N7t7pHvp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36BFlXYt048663;
	Tue, 11 Jul 2023 10:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689090453;
	bh=om/ylQDWk+cMCx4hkAL4LpqXmDyA+nTY5QB0EjEJlbQ=;
	h=From:To:CC:Subject:Date;
	b=N7t7pHvpQf4zjXjj/QP+evR7lkDBxgnfr3eVQFN5/epmB1cDS1tDijxWWi39CGUqx
	 l7Kl3pYIMIejZLbUou5dQaY69i2dFSnh84ciepZqqX0+mmF1nlmTOnFrIcUrxUFzyx
	 TF8QfZu8a/xKSoPWJZEaIGWv9k+dapkg0KAnoUSE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36BFlXb3005425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jul 2023 10:47:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Jul 2023 10:47:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Jul 2023 10:47:32 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36BFlWLO083307;
	Tue, 11 Jul 2023 10:47:32 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>, <devarsht@ti.com>, <a-limaye@ti.com>,
        <shyam.jagannathan@ti.com>, <g-gupta@ti.com>, <vijayp@ti.com>,
        <detheridge@ti.com>
Subject: [meta-arago] [kirkstone] [PATCH] arago.conf: Enable coretracers in gstreamer1.0
Date: Tue, 11 Jul 2023 21:17:31 +0530
Message-ID: <20230711154731.3270458-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Jul 2023 15:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14794

Enable coretracers packageconfig
for gstreamer1.0 package to include gstreamer
coretracers such as latency tracer, leak tracer
e.t.c in base gstreamer package

Without this change, the gstreamer tracers
were not getting included.

Fixes: 1fbb3fb3 ("conf: arago: Adding tracer-hooks build flag to gstreamer1.0")

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index bb074478..43553678 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -123,7 +123,7 @@ PACKAGECONFIG:append:pn-libsdl2 = " kmsdrm"
 PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
 
 # Enable GST_TRACER logging in gstreamer
-PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
+PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks coretracers"
 
 # Enable kmssink in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
-- 
2.34.1


