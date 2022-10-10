Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD18C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 07:41:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.3668.1665387661885249588
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 00:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sYVS6Zuo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29A7f01s068353
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 02:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665387660;
	bh=2xEGLFPuom2OPSIcx9TgOP7vhhPRaPW7NePB7h++nk0=;
	h=From:To:CC:Subject:Date;
	b=sYVS6ZuolgztYXdUoC3quB+ml1+VNRCdeJ/hKuxIYeaEwHcGV6Zmh5R6bCkB+j3uQ
	 nDzyVfeZEtIHVyQlINKD0XKEI6vtLFPfMeeWjINyJHN8LSb8s5ChkqhLawkLRDmH/G
	 TGeX7mb/LfkYDeHN7UpOgKqpewbrkzWE8wa1TWXo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29A7f0Wu090779
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 02:41:00 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 02:40:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 02:40:59 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29A7ex8u025249;
	Mon, 10 Oct 2022 02:40:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>
Subject: [[meta-arago][tisdk-setup-scripts][master][PATCH]] create-sdcard :
 Correct if condition which checks for boot images
Date: Mon, 10 Oct 2022 13:10:49 +0530
Message-ID: <20221010074049.13114-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 07:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14061

Jira - https://jira.itg.ti.com/browse/SITSW-1649

The if condition which checks for boot binaries for am65xx and
j7 devices has no spaces which shows error while running create-sdcard.sh.
Add the required spaces in if condition.

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


