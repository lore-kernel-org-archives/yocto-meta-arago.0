Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D35BC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:26:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.53375.1681151154307665374
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 11:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R9ZxFAJS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AIPpnR035933;
	Mon, 10 Apr 2023 13:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681151152;
	bh=zl0U1xgAe9xOQIhJ+ypuslT/wmgAEDhKRIAxUhoh9es=;
	h=From:To:CC:Subject:Date;
	b=R9ZxFAJSLSkBFJTvHsZrPAPg9Mk8hBBhwNqMYvufhRyLgzQa63lly21/7cpx1a2AN
	 UpXZog759lheTc4wD1SejXorFTl1mfKFWCq795m0VTZFXklZxrpFT4FG4xM3CXlj0N
	 nT/nRBl+jegVQRBeN96/xHjW30PokQPib/C5Xlws=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AIPp7F007410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 13:25:51 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 13:25:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 13:25:51 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AIPpVJ018031;
	Mon, 10 Apr 2023 13:25:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] big-data-ipc-demo: Update to version without CMEM dependency
Date: Mon, 10 Apr 2023 13:25:51 -0500
Message-ID: <20230410182551.11926-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 18:26:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14301

Latest version does not use CMEM, update this recipe accordingly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../big-data-ipc-demo/big-data-ipc-demo_git.bb            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
index 439fac14..e7bf1a1d 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
@@ -3,8 +3,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
 
 SRC_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;protocol=git;branch=master"
-SRCREV = "984edb3c69c8a1f51da02e0abcd2201319650894"
-PV = "01.03.00.00"
+SRCREV = "3dedbde2a539834ee8f4d0419888116ea80789d0"
+PV = "01.03.00.01"
 
 S = "${WORKDIR}/git"
 
@@ -19,8 +19,8 @@ DEPENDS = "ti-ipc \
            ti-xdctools-native \
            ti-sysbios \
            ti-ipc-rtos \
-           cmem \
            ti-cgt6x-native \
+           virtual/kernel \
 "
 
 PLATFORM = "UNKNOWN"
@@ -33,7 +33,7 @@ EXTRA_OEMAKE = "\
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-    LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+    LINUX_SYSROOT_DIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include" \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
-- 
2.39.2


