Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 45D41529AD
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2020 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38A4C40BA3;
	Tue, 10 Mar 2020 15:21:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HpMuV7ZTHj9Y; Tue, 10 Mar 2020 15:21:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B204400E8;
	Tue, 10 Mar 2020 15:21:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6887E16C451;
	Tue, 10 Mar 2020 11:21:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 10 Mar 2020 11:21:34 -0400
Message-Id: <1583853694-19964-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] pcitest: update to 5.4
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
X-List-Received-Date: Tue, 10 Mar 2020 15:23:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/pcitest/{pcitest_4.19.bb => pcitest_5.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-kernel/pcitest/{pcitest_4.19.bb => pcitest_5.4.bb} (86%)

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
similarity index 86%
rename from meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
rename to meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
index 6c7aec3..8edbd93 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
@@ -2,8 +2,8 @@ SUMMARY = "Linux Kernel PCI test"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-BRANCH = "ti-linux-4.19.y"
-SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
+BRANCH = "ti-linux-5.4.y"
+SRCREV = "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


