Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E39C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:39:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1188.1675899574831686713
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rRUdi+Gp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NdWJ8053675;
	Wed, 8 Feb 2023 17:39:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899572;
	bh=nP+394Vbq2IUFtfZwZMPcrSya9k5ofxrquGmx/kuRmc=;
	h=From:To:CC:Subject:Date;
	b=rRUdi+GpUXW/e38Dk06z3dFzlE9jLfJrdqzHMkbzEAi5L0fJ1Ox/M0NV504yJlU26
	 jtAFXex8yT95g6nXT4qJnMSGaGYNLcPLVFllz63YhI6M9PtZEvCfgW87ATj3VUXCBN
	 53FRu6+njcxejil2TEXC79TnGQFYsbMcIArKoZJE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NdWji088892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:39:32 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:39:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:39:32 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NdVZr005760;
	Wed, 8 Feb 2023 17:39:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] meta-arago: Remove some leftover srcipk bits
Date: Wed, 8 Feb 2023 17:39:31 -0600
Message-ID: <20230208233931.20169-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14213

With srcipk class gone these are no longer functional. Remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_%.bbappend               | 3 ---
 .../ocl-rtos/opencl-examples-rtos_git.bbappend             | 7 -------
 .../big-data-ipc-demo/big-data-ipc-demo_git.bb             | 4 ----
 3 files changed, 14 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend
deleted file mode 100644
index a281f4dd..00000000
--- a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append = ".arago0"
-
-SRCIPK_SRC_DIR = "${S}/${PLATFORM_ARCH}"
diff --git a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
index a0e3d084..f7acb63b 100644
--- a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
+++ b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
@@ -4,10 +4,3 @@ CM_NAME = "OpenCL"
 CM_VERSION = "${PV}"
 CM_ROOT_DIR = "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '_')}"
 CM_DESCRIPTION = "OpenCL is a framework for writing programs that execute across heterogeneous systems"
-
-deltask do_create_srcipk
-addtask create_srcipk after do_install before do_package
-
-CREATE_SRCIPK = "1"
-SRCIPK_SRC_DIR = "${DESTDIR}"
-SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
index 779cef7f..439fac14 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
@@ -39,10 +39,6 @@ EXTRA_OEMAKE = "\
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
-do_create_srcipk:prepend() {
-    rm -rf host_bios
-}
-
 do_compile() {
     oe_runmake host_linux
 }
-- 
2.39.1


