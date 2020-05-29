Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 216FF529DC
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2020 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7141040C14;
	Fri, 29 May 2020 18:53:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XJUJy9Xe-Rfa; Fri, 29 May 2020 18:53:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31739409DE;
	Fri, 29 May 2020 18:53:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D38B9173170;
	Fri, 29 May 2020 14:53:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 May 2020 14:53:19 -0400
Message-Id: <1590778399-32896-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] HACK: toolchain: re-instate secondary toolchain for now
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
X-List-Received-Date: Fri, 29 May 2020 18:55:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

The proper implementation with multiconfig is taking longer, so re-instate
the older solution for now with minor fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ++++++
 .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ++++
 .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 0ee0a4c..58efc00 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -9,6 +9,9 @@ EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
 EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
 EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"
 
+SECONDARY_TARGET_ARCH = "invalid"
+SECONDARY_TARGET_ARCH_k3 = "armv7a"
+
 TARGET_VENDOR = ""
 
 TOOLCHAIN_BASE ?= "/opt"
@@ -31,6 +34,9 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 
+PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
+PREFERRED_PROVIDER_binutils-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
+
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
 bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
new file mode 100644
index 0000000..22a8aa0
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
@@ -0,0 +1,4 @@
+TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
+MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
+
+require recipes-core/meta/external-arm-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
new file mode 100644
index 0000000..9f59ac8
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".arago0"
+
+SECONDARY_TARGET_ARCH ?= "invalid"
+
+SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
+                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
+
+RDEPENDS_${PN}_append = " \
+    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', 'invalid', '', '${SECONDARY_TOOLCHAIN}', d)} \
+"
-- 
2.7.4


