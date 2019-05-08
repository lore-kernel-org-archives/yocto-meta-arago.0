Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 96A45529D8
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2019 18:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 465D440BA7;
	Wed,  8 May 2019 18:25:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L6c1a0L-wgUj; Wed,  8 May 2019 18:25:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2027640A55;
	Wed,  8 May 2019 18:25:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6BFB016EA65;
	Wed,  8 May 2019 14:25:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 May 2019 14:25:55 -0400
Message-Id: <1557339955-23928-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ti-sci-fw: update SYSFW to 2019.04a
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
X-List-Received-Date: Wed, 08 May 2019 18:26:30 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.02.bb => ti-sci-fw_2019.04a.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.02.bb => ti-sci-fw_2019.04a.bb} (92%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.02.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
similarity index 92%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.02.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
index c287a69..0519b56 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.02.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "77bd5534eb33c2f9654ab1b56fcdff4e8b7143e0"
+SRCREV = "b41c4f097ab6f341462645f76059f48f78bbd17e"
 
 BRANCH ?= "ti-linux-firmware"
 
@@ -20,7 +20,7 @@ SRC_URI = " \
 	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-SRCREV_imggen = "3cbf4003060ead508653e2ec8f25c59bbe813e74"
+SRCREV_imggen = "f68fe913c16f13a7e04f6f340de1c4f6cc561c10"
 SRCREV_FORMAT = "imggen"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


