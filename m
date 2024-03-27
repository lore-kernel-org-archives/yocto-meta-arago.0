Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1F0C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 09:41:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.33216.1711532464626648417
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 02:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BqJxLM+B;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42R9f4Fx006454
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 04:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711532464;
	bh=BDRmSB1K/lSCNDPxABGrHQarxOwo4OdGyuqjD2LwHyM=;
	h=From:To:CC:Subject:Date;
	b=BqJxLM+BcRu4z2U7eQfBGPGToSyVDA8mIm3U9ZkGotydZDOdJzyjmViuLAr39aywv
	 PCZLMRbKlWQB3TwG2hP8jZyw7A9X6G2KrPscddW7owVGbK7zRRaub7z27I06Nrl/Pm
	 pxLosdRdByYE7f9YkC2mM7oFO7xL87rcB3LDfEuE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42R9f4A3000964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 04:41:04 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Mar 2024 04:41:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Mar 2024 04:41:03 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42R9f1Bs044828;
	Wed, 27 Mar 2024 04:41:02 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-test: cpuloadgen: Update SRCREV to latest
Date: Wed, 27 Mar 2024 15:11:00 +0530
Message-ID: <20240327094100.2675069-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 09:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15249

Pulls in multi CPU support (no more limitation to dual-core max).

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 37842ea0..3c463d33 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/ptitiano/cpuloadgen"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6c2eb46c569d0cd7884089fea6b4f31"
 
-PV = "0.93"
+PV = "v0.94"
 PR = "r1"
 
 BRANCH ?= "master"
-SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
+SRCREV ?= "dd2052b581ae7c2e0e06344887885fd6cd66eebb"
 
 SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRANCH}"
 
-- 
2.34.1


