Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A34CB52981
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2018 23:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE4BB208AE;
	Wed,  7 Nov 2018 23:51:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xRWFdslxyCdf; Wed,  7 Nov 2018 23:51:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C51EC2014F;
	Wed,  7 Nov 2018 23:51:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6575A164CD7;
	Wed,  7 Nov 2018 18:51:44 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Nov 2018 18:51:43 -0500
Message-Id: <1541634703-47103-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ti-sci-fw: use SYSFW 2018.10 from release branch
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
X-List-Received-Date: Wed, 07 Nov 2018 23:51:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
index 4cae1c6..c05582a 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
@@ -11,9 +11,9 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "cbb37f282017cb5b6bf42c26c0b5a5a8b818ec9e"
+SRCREV = "7a6ce28348a99d2ad08a6cb2b36450d73bfccc80"
 
-BRANCH ?= "ti-firmware-next"
+BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-- 
2.7.4


