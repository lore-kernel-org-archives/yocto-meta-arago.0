Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CF5C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 21:23:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14985.1684877027132768667
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 14:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PzPu6RTZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34NLNfeD080890;
	Tue, 23 May 2023 16:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684877021;
	bh=Ct1gsTXUxNtf0o5+O9PVjXqS4bF5Rkx5IAogl0/SX2o=;
	h=From:To:CC:Subject:Date;
	b=PzPu6RTZwNtB6haZ/XUhP3fZZaNE0bIQef46TMLCunYqsZ3hc3v5g0NuWsAu54HL0
	 dNETQLV8bvhD4GfzzzDNlmkC54pKXIKrxYwi2TMEmo2GZdRer1FfCIYf2TUiAfNxV4
	 2NHFIi7kIsn0lj0nFl2Z04K4YvomqSkxsb/JcseI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34NLNfGM029285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 16:23:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 16:23:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 16:23:41 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34NLNeS9007468;
	Tue, 23 May 2023 16:23:41 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][kirkstone][PATCH] recipes-tisdk: ti-tisdk-setup: Update SRCREV and Fix build issue
Date: Wed, 24 May 2023 02:53:33 +0530
Message-ID: <20230523212333.28411-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 21:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14456

- Bump up SRCREV to 2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac.
- Scripts were installed in /bin but not shipped resulting in QA issues. Hence,
ship all scripts under /bin.
- Fix syntax issue and update recipe revision.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index e000e8c7..a89803c9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r47"
+PR = "r48"
 
 BRANCH ?= "master"
-SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
+SRCREV = "2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac"
 SRC_URI = "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
@@ -55,5 +55,5 @@ do_install () {
     fi
 }
 
-FILES:${PN} += "setup.sh"
-RDEPENDS:${PN} += "bash"
+FILES:${PN} = "setup.sh /bin/*"
+RDEPENDS:${PN} = "bash"
-- 
2.17.1


