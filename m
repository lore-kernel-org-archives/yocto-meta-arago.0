Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F23EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 12:11:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6384.1665490265639893446
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 05:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VZ8EnDOg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BCB4og131058
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 07:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665490264;
	bh=dVoI6Ao7legehae6mI1zzmKY8RjSI4TzxwKG5lUg0UI=;
	h=From:To:CC:Subject:Date;
	b=VZ8EnDOgXHj9wdN/YTh7kS3VKMb+w2jbyXoCw05DvpUrNj+kwVs2u/fOorb9lvD3z
	 7KRFInyITPl9bDYq2I5Jq37HQRwf1XPKbrBTDzoY/rhgKm/lUkp6SKj3L+r2NNDgTW
	 0D77BVJ0H3QdgDyVAfU5BMVLtzdSJYZDOb/CAGdU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BCB4sJ105129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 07:11:04 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 07:11:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 07:11:04 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BCB3vs007199;
	Tue, 11 Oct 2022 07:11:03 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>
Subject: [tisdk-setup-scripts][master][PATCH v2] create-sdcard : Correct if
 condition which checks for boot images
Date: Tue, 11 Oct 2022 17:40:27 +0530
Message-ID: <20221011121027.6841-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 12:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14066

The if condition which checks for boot binaries for am65xx and j7 devices has no spaces which shows error while running create-sdcard.sh.Add the required spaces in if condition.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 create-sdcard.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 4af6c94..5c3490a 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -1057,7 +1057,7 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 	#copy boot files out of board support
-        if ["$TARDEVICENAME" == "am65xx"] || ["$TARDEVICENAME" == "j7"]; then
+        if [ "$TARDEVICENAME" == "am65xx" ] || [ "$TARDEVICENAME" == "j7" ]; then
 		if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
 			echo "Boot image not found"
 		fi
-- 
2.17.1


