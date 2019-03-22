Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D924D5203A
	for <meta-arago@arago-project.org>;
	Fri, 22 Mar 2019 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F089440B5F;
	Fri, 22 Mar 2019 17:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oBpJgDm1901a; Fri, 22 Mar 2019 17:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D796140AFE;
	Fri, 22 Mar 2019 17:09:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 316FB16CF9C;
	Fri, 22 Mar 2019 13:09:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 22 Mar 2019 13:09:53 -0400
Message-Id: <1553274593-29685-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] pcitest: update to 4.19
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
X-List-Received-Date: Fri, 22 Mar 2019 17:10:09 -0000

License checksum changed due to SPDX header addition.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/pcitest/{pcitest_4.9.bb => pcitest_4.19.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-kernel/pcitest/{pcitest_4.9.bb => pcitest_4.19.bb} (72%)

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
similarity index 72%
rename from meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb
rename to meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
index 718dc45..12efeda 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.19.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Linux Kernel PCI test"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-BRANCH = "ti-lsk-linux-4.9.y"
-SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
+BRANCH = "ti-linux-4.19.y"
+SRCREV = "0584082b5f5c815faee33f5fc0a1c8bc3d77ebf7"
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


