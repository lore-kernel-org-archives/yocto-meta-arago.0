Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2A41C52093
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 18:05:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09I4xPY007050
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 12:04:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515521099;
	bh=V4BHzdC1kJWgDE86weCiUwEnIX/pUszGkP3xDrCl1r4=;
	h=From:To:CC:Subject:Date;
	b=l5R3SEbtPKbeP/xcgH1/CzLj4dGp3rDD9TFjBeny7CPlAU4bEP+L8ORSNhUWUg1Cr
	UI3jNlGqqpyaDI2hw6nT8qNeLCymWQkxfRAjRXRz81GhFptwuiRl1trzlmtQtvHiyG
	rOJaoAP3XMxW+UMOt2LqHU4mcgPgpGDxts9tLCFE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09I4xAj012716
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 12:04:59 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 12:04:58 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 12:04:58 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09I4wW0032548;
	Tue, 9 Jan 2018 12:04:58 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 13:04:55 -0500
Message-ID: <1515521095-27254-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] linux-ti-staging: rebase patches against 2017.06 kernel
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
X-List-Received-Date: Tue, 09 Jan 2018 18:05:06 -0000
Content-Type: text/plain

* Removed the patch to add camera support in the default dtb for am57x-evm,
  due to the baseline difference between rt and non-rt in 2017.06 kernel.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-4.9-patches.inc          |  3 +--
 ...-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch |  4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend          | 10 +++++-----
 recipes-kernel/linux/linux-ti-staging_4.9.bbappend             | 10 +++++-----
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
index 9294303..a01deaa 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
@@ -1,4 +1,4 @@
-PR_append = ".p32"
+PR_append = ".p33"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"
 
@@ -56,7 +56,6 @@ TI_LINUX_KERNEL_PATCHES = " \
     file://0049-prueth-preparatory-patch-to-add-run-time-protocol-ch.patch \
     file://0050-prueth-support-run-time-change-of-protocol-at-pru-Et.patch \
     file://0051-prueth-parse-red-rx-red-tx-DT-property-only-if-eth-t.patch \
-    file://0052-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch \
     file://0053-arm-dts-rename-am572x-idk-jailhouse.dts-to-dtsi.patch \
     file://0054-arm-dtb-am572x-idk-add-dts-files-to-support-jailhous.patch \
     file://0055-net-prueth-Add-promiscuous-mode-support.patch \
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0037-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0037-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch
index d574098..5037f7f 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0037-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0037-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch
@@ -3268,9 +3268,9 @@ index a03e955..812793c 100644
  			(void __iomem *)gen_pool_alloc(prueth->sram_pool,
 -						       OCMC_RAM_SIZE);
 +						       prueth->ocmc_ram_size);
- 	if (IS_ERR(prueth->mem[PRUETH_MEM_OCMC].va)) {
- 		ret = PTR_ERR(prueth->mem[PRUETH_MEM_OCMC].va);
+ 	if (!prueth->mem[PRUETH_MEM_OCMC].va) {
  		dev_err(dev, "unable to allocate OCMC resource\n");
+ 		ret = -ENOMEM;
 @@ -1737,7 +3473,7 @@ static int prueth_probe(struct platform_device *pdev)
  	prueth->mem[PRUETH_MEM_OCMC].pa =
  			gen_pool_virt_to_phys(prueth->sram_pool,
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
index 3b0c152..7f0bf1f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
@@ -1,12 +1,12 @@
-PR_append = ".tisdk16"
+PR_append = ".tisdk17"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
-#require linux-ti-staging-4.9-patches.inc
+require linux-ti-staging-4.9-patches.inc
 
-KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BRANCH = "processor-sdk-linux-rt-04.02.00"
-SRCREV = "273202a0d36d6cc2c0ca8bd2a9fd6333a7b69407"
+#KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+#BRANCH = "processor-sdk-linux-rt-04.02.00"
+#SRCREV = "273202a0d36d6cc2c0ca8bd2a9fd6333a7b69407"
 
 SRC_URI_append = " file://jailhouse.cfg"
 
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
index c082c0e..ea2e12f 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
@@ -1,12 +1,12 @@
-PR_append = ".tisdk16"
+PR_append = ".tisdk17"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
-#require linux-ti-staging-4.9-patches.inc
+require linux-ti-staging-4.9-patches.inc
 
-KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BRANCH = "processor-sdk-linux-04.02.00"
-SRCREV = "a75d8e93056181d512f6c818e8627bd4554aaf92"
+#KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+#BRANCH = "processor-sdk-linux-04.02.00"
+#SRCREV = "a75d8e93056181d512f6c818e8627bd4554aaf92"
 
 SRC_URI_append = " file://jailhouse.cfg"
 
-- 
1.9.1


