Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9563EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:35:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.14727.1647977756689854820
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fm6wNOQ4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZt8A014886;
	Tue, 22 Mar 2022 14:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647977755;
	bh=hlD8O6Im7sBx+KX18B1QoMYnuM0g7IysorBpJ3zDlDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Fm6wNOQ41sRt6uWjxf3r7/FVPaaPRCt3JHeRdPftqopL0lhW1CBHu6ko67bLmGBGB
	 Jx4GIIstyGMeggw4wGZlvqgR9FdFutVWo4QePtkKzay2OaTb4h2H3jQpjjp1DT2QED
	 kLnEyXADSyjlxL7h0YUi2Zy30cC0eT9rcqDAmrto=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MJZtD5076930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 14:35:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 14:35:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 14:35:55 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZt9r066397;
	Tue, 22 Mar 2022 14:35:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWkIN-0006MW-0R; Tue, 22 Mar 2022 14:35:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 2/3] packagegroup-*-graphics: add virtual
 provider for AM62x GPU driver v2
Date: Tue, 22 Mar 2022 14:35:53 -0500
Message-ID: <20220322193554.24404-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322193554.24404-1-reatmon@ti.com>
References: <20220322193554.24404-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13711

From: Krunal Bhargav <k-bhargav@ti.com>

Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a356c76c..7bc2ba52 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -14,12 +14,12 @@ PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
-# J7 has a Rogue GPU core
-PREFERRED_PROVIDER_virtual/egl_j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1_j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
+# K3 TI Platforms has a Rogue GPU core
+PREFERRED_PROVIDER_virtual/egl = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver = "ti-img-rogue-driver"
 
 # This is required when using keystone devices with graphical support
 # such as Qt5
-- 
2.17.1


