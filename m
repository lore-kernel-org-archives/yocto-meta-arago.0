Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5F568529AB
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2019 02:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CCB9740BA8;
	Sat, 13 Apr 2019 02:01:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mdIi4HVVst03; Sat, 13 Apr 2019 02:01:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B60F640A89;
	Sat, 13 Apr 2019 02:01:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DC0A916DDFC;
	Fri, 12 Apr 2019 22:01:35 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Apr 2019 22:01:35 -0400
Message-Id: <1555120895-53406-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555120895-53406-1-git-send-email-denys@ti.com>
References: <1555120895-53406-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] toolchain-arm: switch to 2019.03 release version
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
X-List-Received-Date: Sat, 13 Apr 2019 02:01:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc        | 10 +++++-----
 .../recipes-core/meta/external-arm-toolchain-cross.bb          |  6 ++++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index e442811..9e064af 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -16,9 +16,9 @@ SECONDARY_TARGET_ARCH_k3 = "armv7a"
 TARGET_VENDOR = ""
 
 TOOLCHAIN_BASE ?= "/opt"
-TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-ti2019.00-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
-TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-2019.01-x86_64-${EAT_TARGET_SYS_ARMV7}"
-TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-2019.01-x86_64-${EAT_TARGET_SYS_ARMV8}"
+TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-ti2019.01-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
+TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-2019.03-x86_64-${EAT_TARGET_SYS_ARMV7}"
+TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-2019.03-x86_64-${EAT_TARGET_SYS_ARMV8}"
 
 DEF_TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
 DEF_TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
@@ -48,7 +48,7 @@ PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "arm-8.2%"
-SDKGDBVERSION ?= "8.2"
+SDKGDBVERSION ?= "8.2%"
 SDKBINUVERSION ?= "2.31%"
 SDKGLIBCVERSION ?= "2.28%"
 SDKLINUXLIBCVERSION ?= "4.14%"
@@ -70,7 +70,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?= "arm-8.2%"
-GDBVERSION ?= "8.2"
+GDBVERSION ?= "8.2%"
 BINUVERSION ?= "2.31%"
 GLIBCVERSION ?= "2.28%"
 
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
index 1ce9e06..1d71e03 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
@@ -13,7 +13,9 @@ BPN = "external-arm-toolchain"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
+TGT_VER_GCC = "8.2.1"
+
 do_install() {
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
 }
-- 
2.7.4


