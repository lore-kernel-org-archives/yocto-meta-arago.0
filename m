Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2193.1643826395250139927
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NEWLMNMz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQXvj089099;
	Wed, 2 Feb 2022 12:26:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826393;
	bh=OB2wg7o7k9dEiLzTfwZudmhk6HmuxgmaeBLapPSIjmE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NEWLMNMzbuHJcAiqYi512Knc+5VG6cfH52fs4ah9/PclHR9O2eEnlmGVtNzrqm79G
	 dOEafgbWsHE31ZatV+1W2APbAf8O3QYAsNE7P0lQBOinGXX65HglPxlhPRL+TUSMW/
	 /tTQ2+Lw4IoW93iCemPDLKgUY0TaIyB6Shonaz9Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQWhn018436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:32 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQW2b078993;
	Wed, 2 Feb 2022 12:26:32 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007Ys-Vf; Wed, 02 Feb 2022 12:26:32 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 12/12] Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot images"
Date: Wed, 2 Feb 2022 12:26:30 -0600
Message-ID: <20220202182630.28943-13-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit d29025f7e868bea6299b55caf78e684fc647be33.

* associated fix in k3-image-gen is picked up now.
  commit 892c86501ff7 ("Makefile: Skip signing of binaries for HS combined boot")

hence its no longer needed to carry the same fix from meta-ti here.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  2 +-
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 --
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index fea0c783..014e89c8 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -24,7 +24,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
+K3_IMAGE_GEN_SRCREV ?= "892c86501ff745dfde4d535923ce686f45700da3"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
deleted file mode 100644
index 196f3d3f..00000000
--- a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
-From: Yogesh Siraswar <yogeshs@ti.com>
-Date: Wed, 8 Dec 2021 17:50:19 -0600
-Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
- images
-
-Combined sysfw binaries used in tiboot.bin do not require signed images.
-This fixes issues with AM64x HS and J7200 HS boot images
-
-Upstream-Status: Submitted
-Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
----
- Makefile           | 8 +++++++-
- soc/am64x/Makefile | 1 +
- soc/j7200/Makefile | 1 +
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 47b3b20..ab465df 100644
---- a/Makefile
-+++ b/Makefile
-@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
- 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
- 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -o $@ -s $(SOC) -l $@.log
- 
--# On HS board configuration binaries must be signed
-+# On HS board configuration binaries must be signed unless it is combined boot image
- ifdef HS
-+ifndef COMBINED_BOOT_IMAGE
-+SIGN_BINARY=1
-+endif
-+endif
-+
-+ifdef SIGN_BINARY
- %.bin.unsigned: %.o
- 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
- %.bin: %.bin.unsigned
-diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
-index bfbe3e5..33ebbd0 100644
---- a/soc/am64x/Makefile
-+++ b/soc/am64x/Makefile
-@@ -31,6 +31,7 @@
- #
- 
- SBL_LOADADDDR ?= 0x70000000
-+COMBINED_BOOT_IMAGE = 1
- COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x7b000
- LOADADDR  ?= 0x44000
- SCIFS = sci
-diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
-index 3b754f7..0baef51 100644
---- a/soc/j7200/Makefile
-+++ b/soc/j7200/Makefile
-@@ -31,6 +31,7 @@
- #
- 
- SBL_LOADADDDR ?= 0x41c00000
-+COMBINED_BOOT_IMAGE = 1
- COMBINED_TIFS_BRDCFG_LOADADDR ?= 0x7f000
- COMBINED_DM_BRDCFG_LOADADDR ?= 0x41c80000
- LOADADDR ?= 0x40000
--- 
-2.17.1
-
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index d70d664c..646833a7 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -49,11 +49,6 @@ LD[unexport] = "1"
 
 do_configure[noexec] = "1"
 
-SRC_URI_append_j7200-hs-evm-k3r5 = "\ 
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
-SRC_URI_append_am64xx-hs-evm-k3r5 = "\
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
-
 EXTRA_OEMAKE = "\
     CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-- 
2.17.1

