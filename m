Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D108D529E1
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 848B320B01;
	Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3Ck6U-_L_QHJ; Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 545C520B04;
	Wed,  7 Feb 2018 20:33:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E8B2C163287;
	Wed,  7 Feb 2018 15:33:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:04 -0500
Message-Id: <1518035594-38357-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 05/15] toolchain-linaro: set default TOOLCHAIN_PATH for supported archs
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-linaro.inc       | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index c9301b0..b888be2 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -2,17 +2,30 @@
 TCMODE = "external-linaro"
 TCLIBC = "external-linaro-toolchain"
 
-ELT_TARGET_SYS = "arm-linux-gnueabihf"
-ELT_TARGET_SYS_armv5 = "arm-linux-gnueabi"
-ELT_TARGET_SYS_aarch64 = "aarch64-linux-gnu"
+ELT_TARGET_SYS_ARMV5 ?= "arm-linux-gnueabi"
+ELT_TARGET_SYS_ARMV7 ?= "arm-linux-gnueabihf"
+ELT_TARGET_SYS_ARMV8 ?= "aarch64-linux-gnu"
+
+ELT_TARGET_SYS_arm = "${ELT_TARGET_SYS_ARMV5}"
+ELT_TARGET_SYS_armv7a = "${ELT_TARGET_SYS_ARMV7}"
+ELT_TARGET_SYS_aarch64 = "${ELT_TARGET_SYS_ARMV8}"
+
 TARGET_VENDOR = ""
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
+TOOLCHAIN_BASE ?= "/opt"
+TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-ti2018.00-armv5-x86_64_${ELT_TARGET_SYS_ARMV5}"
+TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV7}"
+TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV8}"
+
+TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
+TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
+TOOLCHAIN_PATH_aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
 
-# Set some vars to help locate the toolchain automatically from PATH
 TOOLCHAIN_SYS := "${ELT_TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
 
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
+
 # Use specific libc headers instead of ones provided by toolchain
 PREFERRED_PROVIDER_linux-libc-headers_forcevariable = "linux-libc-headers"
 PREFERRED_PROVIDER_linux-libc-headers-dev_forcevariable = "linux-libc-headers"
-- 
2.7.4


