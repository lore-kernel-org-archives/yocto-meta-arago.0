Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 43319529E3
	for <meta-arago@arago-project.org>;
	Fri,  3 Aug 2018 17:06:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w73H6huv115806
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 12:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533316003;
	bh=x8YgE7LS4BtnwhczkTN7LzfHW8mWNkp9/iIyhEjwV7M=;
	h=From:To:CC:Subject:Date;
	b=ksAikbvwvyN4F4L1xBnXrOucoRgaxGS7dUZyH9E7V4+9GdNKqXgFA6m/iEQklfLUw
	jZC+ag4BeU/XKUMv0xBPYkL2/BqHxE/HKTpSD7kW4c/aE/nRBqj/z3n/PFnBBVcb2J
	se9zkhnRpzxQoBo3ZPnMTZpIgSUo7RJ6BJNhf2qk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w73H6hJZ011239
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 12:06:43 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 3 Aug 2018 12:06:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 3 Aug 2018 12:06:42 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w73H6gr8006200;
	Fri, 3 Aug 2018 12:06:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Aug 2018 17:04:33 +0000
Message-ID: <20180803170433.8617-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] optee-os: replace make clean with removing of out/
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
X-List-Received-Date: Fri, 03 Aug 2018 17:06:50 -0000
Content-Type: text/plain

As make clean is currently broken:
|   CLEAN   out/arm-plat-ti
| rmdir: failed to remove 'out/arm-plat-ti/ta/avb': No such file or
| directory
| Makefile:98: recipe for target 'clean' failed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 40f251f2..8fc9cf32 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -19,7 +19,7 @@ ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX} \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX} \
                 CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
-                NOWERROR=1 \
+                NOWERROR=1 V=1 \
                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                 CFG_TEE_TA_LOG_LEVEL=0 \
                 CFG_TEE_CORE_LOG_LEVEL=2 \
@@ -44,7 +44,8 @@ do_compile() {
     )
 
     if [ "${OPTEEPAGER}" = "y" ]; then
-        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+#        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+        rm -rf out/
         oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR} CFG_WITH_PAGER=y
         ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
-- 
2.17.1


