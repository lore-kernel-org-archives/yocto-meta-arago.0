Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F00BC36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 22:18:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.178.1742595498161184972
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 15:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RkqCbbEv;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52LMIFiF1059562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 17:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742595495;
	bh=lpIeTVSauBDjdzrckEjmQQLbRp7o4Rv7agbRAUgrXxE=;
	h=From:To:CC:Subject:Date;
	b=RkqCbbEvigDtQjIR4AjKat98ukNLmLJ/ezWTq6Ydyevd/n87MRW0EL8VPWDJqMAaX
	 KD2tRoDfJw0i9L5mo/nxizNthf6FgxBianDf+mbZcYvni5qHIyn1diX9ZH2vtOC1DA
	 3ykCbk4ZE/82P6nIZ6rRKDbfxauHW0Fxf7FALJPw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52LMIFGw008410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Mar 2025 17:18:15 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Mar 2025 17:18:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Mar 2025 17:18:14 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52LMIEAM107104;
	Fri, 21 Mar 2025 17:18:14 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH] git_retry.sh: remove let, use arithmetic evaluation
Date: Fri, 21 Mar 2025 17:17:55 -0500
Message-ID: <20250321221755.57811-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Mar 2025 22:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16143

From: Randolph Sapp <rs@ti.com>

Since none of this script is checking the exit code of let, we can
replace it with a standard arithmetic evaluation and switch the shebang
to a POSIX shell.

According to bash(1) let simply performs an arithmetic evaluation with
an additional check that returns 1 if the last arg evaluates to 0.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 git_retry.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/git_retry.sh b/git_retry.sh
index 1ffee7a..5683eef 100755
--- a/git_retry.sh
+++ b/git_retry.sh
@@ -1,9 +1,9 @@
-#!/bin/bash
+#!/bin/sh
 
-let glMaxRetries=5
-let glCurrRetry=1
-let glDelay=15
-let glExitCode=0
+glMaxRetries=5
+glCurrRetry=1
+glDelay=15
+glExitCode=0
 
 while [ $glMaxRetries -ge $glCurrRetry ]; do
 
@@ -15,16 +15,16 @@ while [ $glMaxRetries -ge $glCurrRetry ]; do
         exit
     fi
 
-    let glSleep=$glDelay*$glCurrRetry
+    glSleep=$((glDelay*glCurrRetry))
 
-    let glRemainingRetries=$glMaxRetries-$glCurrRetry
+    glRemainingRetries=$((glMaxRetries-glCurrRetry))
 
     if [ $glRemainingRetries -gt 0 ]; then
         echo "git failed... remaining attempts: $glRemainingRetries    sleeping $glSleep seconds"
         sleep $glSleep
     fi
 
-    let glCurrRetry=$glCurrRetry+1
+    glCurrRetry=$((glCurrRetry+1))
 
 done
 
-- 
2.49.0


