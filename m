Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A775C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 12:45:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.7768.1652445906452198168
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 05:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T0hykdf+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24DCj51r053083
	for <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652445905;
	bh=HknLan/7PIBP8Wkd4tq/KN7DQ21yWNnD07qzP1qfiAU=;
	h=From:To:CC:Subject:Date;
	b=T0hykdf+lJKDy4QKuMyUAmLOHXCtxV41c8+0uVYjMXfwmQHL6vdkX86bpHowD4NrH
	 IcCqzd/nymTFF7ra5ZH35jZurEyI9dd9nowj/cg/d1uHb72icdU3jOjP16UW56ZOsW
	 p3kXI82NQ9cYBRRTe5NZgBERde/15DLc3+sZ+kFw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24DCj5wH010955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:45:05 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 07:45:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 07:45:04 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24DCj2Ph004985;
	Fri, 13 May 2022 07:45:03 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Copy
 wificfg file to boot partition for am62xx
Date: Fri, 13 May 2022 18:14:58 +0530
Message-ID: <20220513124458.23582-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 12:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13862

WiFi demo supported in am62xx SK requires a wificfg file to be copied to
the boot partition of the SD card. Add support in the script to copy the
same.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 create-sdcard.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index fa7dadb..4af6c94 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -1129,7 +1129,7 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 
-	if [ "$TARIMAGETYPE" == "default" ] && [ "$TARDEVICENAME" == "am64xx" ] ; then
+	if [ "$TARIMAGETYPE" == "default" ] && ( [ "$TARDEVICENAME" == "am64xx" ] || [ "$TARDEVICENAME" == "am62xx" ] ); then
 	       	if [ "$WIFICFG" != "" ] ; then
 			cp $BOOTFILEPATH/$WIFICFG $PATH_TO_SDBOOT/wificfg
 	                echo "wificfg copied"
-- 
2.17.1


