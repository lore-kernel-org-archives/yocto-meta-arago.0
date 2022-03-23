Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86247C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 21:07:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2700.1648069672714516097
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dKN4QaXr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7pHj119922;
	Wed, 23 Mar 2022 16:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648069671;
	bh=sHh5Lz1WkXRwcmK5Y2vuRaIBtN0l0p5WCaP8GN3cq9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dKN4QaXrK4b0aiJ4jEJC8byZi993qtDS01u9+UffNDrnogVYvbB5biYP8hk/s1RYH
	 gXYW1aM5irbOJ6F5Tb5zQ63MFAw1qMONPYAMrPWSPThtjfSBkQamFwaClJDfpeUYv3
	 NG5wRofvv5sH7yKRvJl6GnIGCil5/c17oIfVNEcw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NL7pZ5095759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 16:07:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 16:07:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 16:07:50 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7oX7007708;
	Wed, 23 Mar 2022 16:07:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nX8Cs-00013j-Qf; Wed, 23 Mar 2022 16:07:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v2 2/2] packagegroup-*-graphics:
 add virtual provider for AM62x GPU driver v2
Date: Wed, 23 Mar 2022 16:07:50 -0500
Message-ID: <20220323210750.3959-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323210750.3959-1-reatmon@ti.com>
References: <20220323210750.3959-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 21:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13731

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


