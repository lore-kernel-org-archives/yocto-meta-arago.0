Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 623F9520DF
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2019 15:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C420740BE5;
	Thu,  5 Sep 2019 15:12:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5-8X16AXrXvQ; Thu,  5 Sep 2019 15:12:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC43F40BAC;
	Thu,  5 Sep 2019 15:12:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E5058173D77;
	Thu,  5 Sep 2019 11:12:51 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  5 Sep 2019 11:12:51 -0400
Message-Id: <1567696371-20131-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] pcitest: update to ti2019.03-rc4 tag
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2019 15:13:59 -0000

This adds enhancements and new command line options to the tool.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
index 12efeda..6c7aec3 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 BRANCH = "ti-linux-4.19.y"
-SRCREV = "0584082b5f5c815faee33f5fc0a1c8bc3d77ebf7"
+SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


