Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5CB0952092
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 21:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AC0E220B2F;
	Tue,  6 Nov 2018 21:39:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id X3kF_gVIVB86; Tue,  6 Nov 2018 21:39:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8BFD6206F3;
	Tue,  6 Nov 2018 21:39:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 49A43164D0C;
	Tue,  6 Nov 2018 16:39:46 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2018 16:39:45 -0500
Message-Id: <1541540385-34445-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko-next][PATCH] ti-sci-fw: update SYSFW to 2018.10
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
X-List-Received-Date: Tue, 06 Nov 2018 21:39:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2018.09.bb => ti-sci-fw_2018.10.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2018.09.bb => ti-sci-fw_2018.10.bb} (94%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
similarity index 94%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
index f436de4..4cae1c6 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
@@ -11,9 +11,9 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "1e03f08e89bee6d29ffd25782f5ce45b1b4bf1e6"
+SRCREV = "cbb37f282017cb5b6bf42c26c0b5a5a8b818ec9e"
 
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-firmware-next"
 
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-- 
2.7.4


