Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 45CB852980
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2019 05:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AB8F40BCC;
	Wed,  7 Aug 2019 05:04:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NJjEK0_ESjul; Wed,  7 Aug 2019 05:04:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81AA740B86;
	Wed,  7 Aug 2019 05:04:23 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BC2FE17232F;
	Wed,  7 Aug 2019 01:04:22 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Aug 2019 01:04:22 -0400
Message-Id: <1565154262-1290-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ti-sci-fw: upgrade to 2019.07
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
X-List-Received-Date: Wed, 07 Aug 2019 05:05:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ti-sci-fw_2019.06a.bb => ti-sci-fw_2019.07.bb}          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.06a.bb => ti-sci-fw_2019.07.bb} (86%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
similarity index 86%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
index e7aa15f..df911a0 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
@@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "ca194f3c597b3ebba9ceb032f13f1a4e7ffa5653"
+SRCREV = "3f7c97c9f923f6fbf1b96dcae1da8620a3bab0b3"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "ef6f0b61dbd32ddbef62fbe7a7e70241221a0461"
+SRCREV_imggen = "1ee2d5d8476bcab79edf04778d5ae5db4ef291e3"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
@@ -30,10 +30,10 @@ SRC_URI_append_am65xx-hs-evm = " \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
 "
 
-SRC_URI[hs-cert.md5sum] = "29eeb2ef5088626c2add8a25f8b9a420"
-SRC_URI[hs-cert.sha256sum] = "c7185e4d95f8bd57e985d1c53c814e65bed078669e2270152e406e8d2a04a186"
-SRC_URI[hs-enc.md5sum] = "e465a2328e042dd932b98d78d8f531de"
-SRC_URI[hs-enc.sha256sum] = "6ecc456f2800a8937c6109c91bc4c62432c2aabad73ad6f3486a6457e22b087a"
+SRC_URI[hs-cert.md5sum] = "e36d9d945b4aa20347470c7c53dbc54a"
+SRC_URI[hs-cert.sha256sum] = "e32182a3b36e5fc9543ca920dafcc2163384e116c88e3c2625399bc1c2ad2f45"
+SRC_URI[hs-enc.md5sum] = "735128f2ac0dafdd44529f243b60a0c6"
+SRC_URI[hs-enc.sha256sum] = "46c2870e133058f68d6b25fd4979a0726b7c6e2a100d48431d47e47db4165c75"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


