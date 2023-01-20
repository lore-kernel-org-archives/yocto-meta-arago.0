Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6769C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:23:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.75216.1674224609397769658
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 06:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DFilI48d;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-adivi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KENSRB100483;
	Fri, 20 Jan 2023 08:23:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674224608;
	bh=+yl+LW6yBXXzbo+euQLZ5mFsaRcQZ3XD+XqJOEMFsEA=;
	h=From:To:CC:Subject:Date;
	b=DFilI48dYES9v+7qvICUVOywb50dcSA7bobQe4tA0uIQ5Wf2ZAGAG8U3blSQJ1eBB
	 JMIf2087+nZgNdzFMtPwk6lOWre4knx6jeJkYZXqoQS7I5THCAZyE/PPIWyEGCqOAI
	 pBrglOyGt/JczovPxeVa1t+QGwo1ufH85Y7gEx2A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KENSXu010773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jan 2023 08:23:28 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 08:23:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 08:23:28 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KENRlj061384;
	Fri, 20 Jan 2023 08:23:27 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <khasim@ti.com>, <g-gupta@ti.com>
Subject: [meta-arago][dunfell][PATCH] arago-prefs: Use mesa for am62axx
Date: Fri, 20 Jan 2023 19:53:10 +0530
Message-ID: <20230120142310.22034-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 14:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14177

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

- Use mesa for am62axx device
- This is important when building images like tisdk-default-image
  which includes packages like Qt5 which pull through these
  dependencies.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index f9fab020..ecbb1d8a 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -28,6 +28,13 @@ PREFERRED_PROVIDER_virtual/libgles2_am62xx = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm_am62xx = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_am62xx = "ti-img-rogue-driver"
 
+# This is required to use am62axx with graphical support such as QT5
+PREFERRED_PROVIDER_virtual/egl_am62axx = "mesa"
+PREFERRED_PROVIDER_virtual/libgles1_am62axx = "mesa"
+PREFERRED_PROVIDER_virtual/libgles2_am62axx = "mesa"
+PREFERRED_PROVIDER_virtual/libgbm_am62axx = "mesa"
+PREFERRED_PROVIDER_virtual/gpudriver_am62axx = "mesa"
+
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
-- 
2.17.1


