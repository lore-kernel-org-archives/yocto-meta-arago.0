Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 71FB552A7B
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2020 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B07CD40B3E;
	Mon,  4 May 2020 20:54:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SA-pcwEIZhHH; Mon,  4 May 2020 20:54:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9951840C26;
	Mon,  4 May 2020 20:54:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 56463172D0C;
	Mon,  4 May 2020 16:54:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  4 May 2020 16:54:40 -0400
Message-Id: <1588625682-33592-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588625682-33592-1-git-send-email-denis@denix.org>
References: <1588625682-33592-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/4] toolchain: remove secondary toolchain hack
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
X-List-Received-Date: Mon, 04 May 2020 20:57:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

With K3 R5F support in meta-ti now, this hack is no longer needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ------
 .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ----
 .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ----------
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index d2c2b2f..fd63256 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -9,9 +9,6 @@ EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
 EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
 EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"
 
-SECONDARY_TARGET_ARCH = ""
-SECONDARY_TARGET_ARCH_k3 = "armv7a"
-
 TARGET_VENDOR = ""
 
 TOOLCHAIN_BASE ?= "/opt"
@@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"
 
-PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain"
-PREFERRED_PROVIDER_binutils-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain"
-
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
 bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
deleted file mode 100644
index 22a8aa0..0000000
--- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
-MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
-
-require recipes-core/meta/external-arm-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
deleted file mode 100644
index fb728e0..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PR_append = ".arago0"
-
-SECONDARY_TARGET_ARCH ?= ""
-
-SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
-                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
-
-RDEPENDS_${PN}_append = " \
-    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
-"
-- 
2.7.4


