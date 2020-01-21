Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B6A7E529C9
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2020 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDB1D4087B;
	Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gwByCotdgU9m; Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CAC7240B37;
	Tue, 21 Jan 2020 21:13:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 741311743A9;
	Tue, 21 Jan 2020 16:13:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 21 Jan 2020 16:13:28 -0500
Message-Id: <1579641208-15555-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579641208-15555-1-git-send-email-denis@denix.org>
References: <1579641208-15555-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 3/3] toolchain-arm: update for 9.2-2019.12 external Arm gcc9 toolchain
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
X-List-Received-Date: Tue, 21 Jan 2020 21:15:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-arm.inc          | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index fca44c5..b9cd55a 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -2,9 +2,9 @@
 TCMODE = "external-arm"
 TCLIBC = "external-arm-toolchain"
 
-EAT_TARGET_SYS_ARMV5 ?= "arm-linux-gnueabi"
-EAT_TARGET_SYS_ARMV7 ?= "arm-linux-gnueabihf"
-EAT_TARGET_SYS_ARMV8 ?= "aarch64-linux-gnu"
+EAT_TARGET_SYS_ARMV5 ?= "arm-none-linux-gnueabi"
+EAT_TARGET_SYS_ARMV7 ?= "arm-none-linux-gnueabihf"
+EAT_TARGET_SYS_ARMV8 ?= "aarch64-none-linux-gnu"
 
 EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
 EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
@@ -16,9 +16,9 @@ SECONDARY_TARGET_ARCH_k3 = "armv7a"
 TARGET_VENDOR = ""
 
 TOOLCHAIN_BASE ?= "/opt"
-TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-ti2019.01-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
-TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-2019.03-x86_64-${EAT_TARGET_SYS_ARMV7}"
-TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.3-2019.03-x86_64-${EAT_TARGET_SYS_ARMV8}"
+TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-ti2020.01-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
+TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-${EAT_TARGET_SYS_ARMV7}"
+TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-${EAT_TARGET_SYS_ARMV8}"
 
 DEF_TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
 DEF_TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
@@ -47,10 +47,10 @@ PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "arm-8.3%"
-SDKGDBVERSION ?= "8.2%"
-SDKBINUVERSION ?= "2.31%"
-SDKGLIBCVERSION ?= "2.28%"
+SDKGCCVERSION ?= "arm-9.2%"
+SDKGDBVERSION ?= "8.3%"
+SDKBINUVERSION ?= "2.32%"
+SDKGLIBCVERSION ?= "2.30%"
 SDKLINUXLIBCVERSION ?= "4.19%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -69,10 +69,10 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "arm-8.3%"
-GDBVERSION ?= "8.2%"
-BINUVERSION ?= "2.31%"
-GLIBCVERSION ?= "2.28%"
+GCCVERSION ?= "arm-9.2%"
+GDBVERSION ?= "8.3%"
+BINUVERSION ?= "2.32%"
+GLIBCVERSION ?= "2.30%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
-- 
2.7.4


