Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0DA125299A
	for <meta-arago@arago-project.org>;
	Fri,  1 Nov 2019 00:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78B1A40BFE;
	Fri,  1 Nov 2019 00:53:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uta1aROO4kv4; Fri,  1 Nov 2019 00:53:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6424840BCF;
	Fri,  1 Nov 2019 00:53:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2CB541742CE;
	Thu, 31 Oct 2019 20:53:26 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 31 Oct 2019 20:53:23 -0400
Message-Id: <1572569604-34682-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] ti-sci-fw: update to 2019.09
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
X-List-Received-Date: Fri, 01 Nov 2019 00:54:48 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ti-sci-fw_2019.08.bb => ti-sci-fw_2019.09.bb}    | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.08.bb => ti-sci-fw_2019.09.bb} (71%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb
similarity index 71%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb
index a8fa994..24081d6 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb
@@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "c75bca342d5a8579c3a459515adb6b77d640a245"
+SRCREV = "2b292f87e7257d4f9103d4e862a7b1769b13fed7"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "92623d82dc683e74225ceaac239b29deac437adf"
+SRCREV_imggen = "8e6b34ad71b244f055f3d9a0107f6e905dd53e22"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
@@ -24,17 +24,6 @@ SRC_URI = " \
 	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-# Please note, "install.source.dir.local" is not a real URL, below files need to be pre-downloaded
-SRC_URI_append_am65xx-hs-evm = " \
-	http://install.source.dir.local/ti-sci-firmware-am65x-hs-cert.bin;name=hs-cert \
-	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
-"
-
-SRC_URI[hs-cert.md5sum] = "b5ad8a9e8d7d0bc2c0d075ce06a15213"
-SRC_URI[hs-cert.sha256sum] = "f79cf2696f4dac4f682a79336e7be86df50bddf764234bd82ac67921565e6129"
-SRC_URI[hs-enc.md5sum] = "dfe6eac6a650b9b3ac2a9a679e5e5678"
-SRC_URI[hs-enc.sha256sum] = "6389d873889b63c32d9aa3aaae7f0ebd21d1e97e32c176a8daf514e99e412d17"
-
 S = "${WORKDIR}/git"
 
 SYSFW_SOC_am65xx = "am65x"
@@ -47,7 +36,7 @@ SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-gp"
 SYSFW_BASE_am65xx-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
-SYSFW_TISCI_am65xx-hs-evm = "${WORKDIR}/${SYSFW_BASE}-*.bin"
+SYSFW_TISCI_am65xx-hs-evm = "${S}/ti-sysfw/${SYSFW_BASE}-*.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${PV}.itb"
@@ -69,7 +58,7 @@ EXTRA_OEMAKE = "\
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
 "
 EXTRA_OEMAKE_append_am65xx-hs-evm = " \
-    HS=1 SYSFW_HS_PATH="${WORKDIR}/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${WORKDIR}/${SYSFW_BASE}-cert.bin" \
+    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
 "
 
 do_compile() {
-- 
2.7.4


