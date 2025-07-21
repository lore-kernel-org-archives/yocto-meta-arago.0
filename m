Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBBCC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 19:47:45 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.50887.1753127261454203177
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 12:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WITVhBdB;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LJldG4874518;
	Mon, 21 Jul 2025 14:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753127259;
	bh=w0fJF5Q4BfuDXN7Uk2ohT9yAofl806KzkgHwdX+gk0c=;
	h=From:To:Subject:Date;
	b=WITVhBdB0jWSiWWEvd4kEp85aGVTvR8eC2II6uwwKg4oLib8fvDwHbhwpIZSu3A1c
	 V7whJTueUYFPFEEfXgpE1vEr39+tkFTfRp0XXdRFA5ysslTz/lS7wqefeag1Xf6Dft
	 Ig9q1VZvZnyFED4YG0Jb4rgjRm/27ajlaEEOxSqY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LJldfJ503412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 14:47:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 14:47:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 14:47:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LJldPj160800;
	Mon, 21 Jul 2025 14:47:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1udwU7-00066x-At; Mon, 21 Jul 2025 14:47:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] dma-heap-tests: Update SRCREV to fix CMake 4.0 issue
Date: Mon, 21 Jul 2025 14:47:39 -0500
Message-ID: <20250721194739.23450-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 19:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16319

License-Update: New central file was created to hold the license
information.  No change in actual license for the project.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Another SRCREV bump to pick up new LICENSE file and move the
LIC_FILES_CHKSUM to that new file.

 meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
index 69f95391..3c0eaa5a 100644
--- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Test cases for DMA-Heap framework"
 HOMEPAGE = "https://github.com/glneo/dma-heap-tests"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=d16465a9e7dc8f53bfdf997c4bf55540"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c3b4cb87cfc8ccba69d579fbd7b0fb3"
 
 PV = "1.0"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
-SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
+SRCREV = "230b406e97c12be5f930125a432d0dfa0316aa39"
 
 DEPENDS = "googletest"
 
-- 
2.17.1


