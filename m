Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D134C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:54:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.15725.1714661644386570274
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NTdcRmg+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442Es3sh057030;
	Thu, 2 May 2024 09:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714661643;
	bh=fmQDCHTyDtTyUVjY2eXciJUV5hlYO1C2KMJJ3C0QjOc=;
	h=From:To:Subject:Date;
	b=NTdcRmg+Uo8CopHIEFGsIZNYvXSCEO5Tr3TjolIi4lfMf0b7eJX7H7gPPls/7swHd
	 mL12Jo4gnbxC1fHpLN7YItZh2bV3lCTFWxEeF4aHMYg4vrAJhiJuxRqbhUBwxWoElh
	 pTzMkfDCx7QNaauSE07ikgbogeJD17YSzSOsqHRg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442Es3bs060615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 09:54:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 09:54:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 09:54:02 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442Es2Pd066719;
	Thu, 2 May 2024 09:54:02 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s2Xow-00074n-LJ; Thu, 02 May 2024 09:54:02 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] README: update meta-arm with scarthgap specific info
Date: Thu, 2 May 2024 09:54:02 -0500
Message-ID: <20240502145402.27161-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 May 2024 14:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15321

meta-arm has created the scarthgap branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/README  | 2 +-
 meta-arago-distro/README | 2 +-
 meta-arago-extras/README | 2 +-
 meta-arago-test/README   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index fb213cca..0e8d5e55 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -14,7 +14,7 @@ revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index aab046c5..b4027f43 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -14,7 +14,7 @@ revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 6ea69514..ebf278b8 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -14,7 +14,7 @@ revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
diff --git a/meta-arago-test/README b/meta-arago-test/README
index 1baa235e..5aa96cd2 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -14,7 +14,7 @@ revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
-- 
2.17.1


