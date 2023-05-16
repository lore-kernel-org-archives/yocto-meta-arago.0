Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC0AC7EE2D
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:41:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26950.1684255256889224729
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f7cXvaqu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGetKr075607;
	Tue, 16 May 2023 11:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255255;
	bh=G3ZCDy1LyPUuyzu8PJVefFab8tlJHbAkDEv4lhYzgjc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f7cXvaquUH0aqOYAM+vSSOGcaGSZ1tREHt2SSVGlG+RxW58Lfelt2cawW8aGyeawL
	 ylYVRgu0dD2gqTmiQYS84E6hnn1ITG5bBBVbESyvnJNzhh/mRNtJwW54jDCszGpkpJ
	 5etzcYCv4fvZ1Ktcz059vCycRUEfaFASrh0FSRcQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGetQ5019554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:40:55 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:40:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:40:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGesj9044974;
	Tue, 16 May 2023 11:40:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxjK-00038K-N2; Tue, 16 May 2023 11:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 4/6] ltp-ddt: Intial LTS migration version
Date: Tue, 16 May 2023 11:40:52 -0500
Message-ID: <20230516164054.11978-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164054.11978-1-reatmon@ti.com>
References: <20230516164054.11978-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14411

From: LCPD Automation Script <lcpdbld@list.ti.com>

As part of the initial LTS migration, move to the latest commits for the
various repos.
 - ltp-ddt_20230127

Going forward all updates will come from the CICD flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index d56c5b7b..c14ddba7 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
+SRCREV = "41e97da730b9064d9fc5337afb515a8b6f752099"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.17.1


