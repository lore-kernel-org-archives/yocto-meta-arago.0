Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BE4C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 19:33:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2503.1702323194983962934
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 11:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dcmmvtVW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBJXDvD068187;
	Mon, 11 Dec 2023 13:33:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702323193;
	bh=E1ktPuaIepVKmhQrdbwCxRWew2+rUV3DSIZm1blwwBk=;
	h=From:To:Subject:Date;
	b=dcmmvtVWygy+4lNXKUvn2YOruCAi0viNT/2z2yuzpfXeKnGHWNcLXCrrsod2veNd7
	 Yjx/mLaIgTqDmh6kCGBxAtKaHvoc6dtnLIpVWP5upN34T3YIG1P/WEB60p7rORWuSO
	 tn0hJHqhv2OVKjLGpVFkwZUfbfUea9vGLpjjgGYA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBJXDZj002313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 13:33:13 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 13:33:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 13:33:12 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBJXCeM034264;
	Mon, 11 Dec 2023 13:33:12 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rCm1g-0007Ba-L4; Mon, 11 Dec 2023 13:33:12 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] branding-ltsprep: Move to kernel 6.6
Date: Mon, 11 Dec 2023 13:33:12 -0600
Message-ID: <20231211193312.27583-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Dec 2023 19:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15054

Move the kernel version overrides to 6.6 for the next LTS prep.  uboot
is not currently ready so leave it at 2023.04 for the time being.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index fb831225..397ad7b5 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,7 +1,7 @@
 
-PREFERRED_VERSION_linux-ti-staging = "6.1%"
-PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
-PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
+PREFERRED_VERSION_linux-ti-staging = "6.6%"
+PREFERRED_VERSION_linux-ti-staging-rt = "6.6%"
+PREFERRED_VERSION_linux-ti-staging-systest = "6.6%"
 PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
 
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-- 
2.17.1


