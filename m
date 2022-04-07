Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A46C47088
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6505.1649337072354760927
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 06:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EvT/9tXY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 237DBAQW115097;
	Thu, 7 Apr 2022 08:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649337070;
	bh=sHh5Lz1WkXRwcmK5Y2vuRaIBtN0l0p5WCaP8GN3cq9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EvT/9tXYClT0FeTnu6TWFI8j5CHwroKGQGiC9s0ae8Y/rQCFqfxBAN5PygmEI2RA0
	 BnP0CWL7uZiVghe5eTfDBH/c4kt1EwxOBvX3MEiYVZmURn6Tv2480bSy7zi4AAH4pL
	 XgGbjA68CzmRVQYRXndon3RVMWxboFLMgwqrNNAU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 237DBAXx023199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Apr 2022 08:11:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Apr 2022 08:11:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Apr 2022 08:11:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 237DB94a095703;
	Thu, 7 Apr 2022 08:11:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ncRun-0001xe-M8; Thu, 07 Apr 2022 08:11:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v4 2/2] packagegroup-*-graphics: add
 virtual provider for AM62x GPU driver v2
Date: Thu, 7 Apr 2022 08:11:09 -0500
Message-ID: <20220407131109.7488-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220407131109.7488-1-reatmon@ti.com>
References: <20220407131109.7488-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13776

From: Krunal Bhargav <k-bhargav@ti.com>

Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a356c76c..f9fab020 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,6 +21,13 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
 
+# am62xx has a Rogue GPU core
+PREFERRED_PROVIDER_virtual/egl_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver_am62xx = "ti-img-rogue-driver"
+
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
-- 
2.17.1


