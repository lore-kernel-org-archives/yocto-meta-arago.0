Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB903CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 05:11:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.20600.1697692271856172727
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 22:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y/WA834S;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-adivi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39J5B6Rl044136;
	Thu, 19 Oct 2023 00:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697692266;
	bh=hqD0eRMMOvxP0vkJw6cHA69w+do4HZXTHOQrV11dT9I=;
	h=From:To:CC:Subject:Date;
	b=y/WA834SI8XQBKewzFCBA64YhOiivXIHl90ZHypoBpe0w8fYd7AGgAYN83wiRVR4g
	 18meisXWmiIc+CNEt3stYvfxEvIBlxpucKgLyebYNb0VvZON0FEW/gzp3waohUFx5E
	 u5NysIhfPXCxXbhbojRLl8bXkCwZD5b72YfSn6/Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39J5B6xV087556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 00:11:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 00:11:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 00:11:06 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39J5B334012822;
	Thu, 19 Oct 2023 00:11:03 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <c-shilwant@ti.com>, <a-limaye@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [meta-arago][kirkstone][PATCH] tisdk-default-image: Add Matrix GUI only for legacy platforms
Date: Thu, 19 Oct 2023 10:40:56 +0530
Message-ID: <20231019051056.2055622-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 05:11:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14952

Today, only ti33x and ti43x family platforms ship matrix-gui in the SDK.
It is removed for all other platforms in SDK layers. So add it only for
required platforms.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 787fac95..2c7b2f0c 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -24,8 +24,6 @@ IMAGE_INSTALL += "\
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
@@ -36,6 +34,16 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-sysrepo \
 "
 
+IMAGE_INSTALL:append:ti33x = " \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
+"
+
+IMAGE_INSTALL:append:ti43x = " \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
+"
+
 export IMAGE_BASENAME = "tisdk-default-image"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
-- 
2.34.1


