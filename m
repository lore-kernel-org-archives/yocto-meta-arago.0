Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5D91E52A15
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 18:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5963740A6E;
	Wed,  6 May 2020 18:14:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SuwoHLzdFoCc; Wed,  6 May 2020 18:14:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7C2D740C2D;
	Wed,  6 May 2020 18:14:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 39E98172D0C;
	Wed,  6 May 2020 14:14:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  6 May 2020 14:14:46 -0400
Message-Id: <1588788886-53641-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588788886-53641-1-git-send-email-denis@denix.org>
References: <1588788886-53641-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/2] external-arm-toolchain-cross: drop hack for re-staging unwind.h
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
X-List-Received-Date: Wed, 06 May 2020 18:17:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

This has been reworked, submitted and accepted upstream, drop locally.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc_%.bbappend             |  5 -----
 .../meta/external-arm-toolchain-cross.bb            | 21 ---------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
deleted file mode 100644
index 22a739e..0000000
--- a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-DEPENDS =+ "flex-native"
-
-EXTRA_DEPS = "${@['','external-linaro-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
-EXTRA_DEPS = "${@['','external-arm-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
-DEPENDS += "${EXTRA_DEPS}"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
deleted file mode 100644
index d398ada..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-PR = "r1"
-
-inherit cross
-
-PN = "external-arm-toolchain-cross-${TARGET_ARCH}"
-BPN = "external-arm-toolchain"
-
-INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_AUTOTOOLS_DEPS = "1"
-
-TGT_VER_GCC = "${EAT_VER_GCC}"
-
-do_install() {
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
-}
-- 
2.7.4


