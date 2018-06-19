Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 91050529BF
	for <meta-arago@arago-project.org>;
	Tue, 19 Jun 2018 19:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AFACD20C01;
	Tue, 19 Jun 2018 19:23:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bDi1xjWosMKJ; Tue, 19 Jun 2018 19:23:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 868C02017D;
	Tue, 19 Jun 2018 19:23:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E41AF1634AC;
	Tue, 19 Jun 2018 15:23:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 19 Jun 2018 15:23:50 -0400
Message-Id: <1529436231-29959-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] optee-os: unify and simplify ARM32/ARM64 build configuration
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
X-List-Received-Date: Tue, 19 Jun 2018 19:24:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend             | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 3c33645..c85f413 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -13,19 +13,17 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
 BRANCH = "master"
 SRCREV = "940a24375ba5357d34fea7196dba48eadaee9abd"
 
+ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
+ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
+
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX} \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX} \
+                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
                 NOWERROR=1 \
-                ta-targets=ta_arm32 \
                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                 CFG_TEE_TA_LOG_LEVEL=0 \
                 CFG_TEE_CORE_LOG_LEVEL=2 \
-"
-
-EXTRA_OEMAKE_append_aarch64 = " \
-                CFG_ARM64_core=y \
-                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
-                ta-targets=ta_arm64 \
+                ${ARMCORE} \
 "
 
 CFLAGS[unexport] = "1"
-- 
2.7.4


