Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0F6C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 10:18:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12388.1711621123640697948
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 03:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oolleM/B;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42SAIh5R112772
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Mar 2024 05:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711621123;
	bh=lxBrlsjCb1S2Ld3hQOmqgvSssloS8JhCQVo6s5BEpN8=;
	h=From:To:CC:Subject:Date;
	b=oolleM/BRdnT4+f0cCMhywL7KW3lSn6micuyEI+yLSNhp7b4R6L6T1sdi+jSUNaed
	 OBSgjp4RmtEZ2cPI1spZKRGv2312rl+ZvXVdnfsxF2P2/mJ9+2tJ6WeBN4o+bukkjH
	 cApaxXaFrzIuAXTP4NChnN5Xc0tjrlhNLVHwDOzY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42SAIgNl029728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Mar 2024 05:18:43 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Mar 2024 05:18:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Mar 2024 05:18:42 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42SAIeeK108210;
	Thu, 28 Mar 2024 05:18:41 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] meta-arago-test: cpuloadgen: Update SRCREV to latest
Date: Thu, 28 Mar 2024 15:48:38 +0530
Message-ID: <20240328101838.248742-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Mar 2024 10:18:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15252

Pulls in multi CPU support (no more limitation to dual-core max).

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changelog

v2: Corrected the PV to remove the extra 'v' character
---
 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 37842ea0..7f734558 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/ptitiano/cpuloadgen"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6c2eb46c569d0cd7884089fea6b4f31"
 
-PV = "0.93"
+PV = "0.94"
 PR = "r1"
 
 BRANCH ?= "master"
-SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
+SRCREV ?= "dd2052b581ae7c2e0e06344887885fd6cd66eebb"
 
 SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRANCH}"
 
-- 
2.34.1


