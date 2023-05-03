Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C400CC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 16:00:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.23736.1683129592026324573
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 May 2023 08:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TECSZuan;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 343FxkO7087108;
	Wed, 3 May 2023 10:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683129586;
	bh=tCoq0cIhDxDAiL3yblRg3FFhfZvWmVU6VBZw3NNeT/Q=;
	h=From:To:CC:Subject:Date;
	b=TECSZuanl8dH1Ul6PZDi800xxz1CLlkDD31wmvr6KOO7c3Zrxh1y5foiXBz0n9n6b
	 VqznNEmnzG0xrNiUJAROZEtQg+KfwO23vQCakjxsU0eLJ3VhFu9R47/y6ls90YWWOP
	 7ZsSSmg8nopDEbY8kShExHOd5cEFuwoIae9hixGw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 343Fxkg1015756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 May 2023 10:59:46 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 May 2023 10:59:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 May 2023 10:59:46 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 343Fxkce058350;
	Wed, 3 May 2023 10:59:46 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] arago.conf: drop the cairo gles override
Date: Wed, 3 May 2023 10:59:35 -0500
Message-ID: <20230503155935.2151933-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 May 2023 16:00:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14396

From: Randolph Sapp <rs@ti.com>

Cairo OpenGLES selector logic has been moved into the bsp layer so that
other distros can get this optimization on our platforms as well.

Also it's necessary to drop this as not setting a gpudriver provider in
the meta-ti layer will create the exact clashing configs that extra
logic was created to resolve. Gotta love layer priority!

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This is dependent on the following patch:
https://lists.yoctoproject.org/g/meta-ti/message/16449

 meta-arago-distro/conf/distro/arago.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index bf54eb2a..89772b2e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -113,9 +113,6 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
 # Enable GST_TRACER logging in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
 
-# Enable EGL/GLESv2 support
-PACKAGECONFIG:append:pn-cairo = " egl glesv2"
-
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
-- 
2.40.0


