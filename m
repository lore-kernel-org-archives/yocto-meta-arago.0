Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9F38C529BD
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 01:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A330B20B73;
	Wed, 21 Mar 2018 01:20:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9ln7iHUkId65; Wed, 21 Mar 2018 01:20:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 786D02099C;
	Wed, 21 Mar 2018 01:20:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CBC1E16337D;
	Tue, 20 Mar 2018 21:20:26 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Mar 2018 21:20:25 -0400
Message-Id: <1521595225-1093-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] linux-libc-headers, toolchain-gcc/linaro: update kernel-libc headers to 4.14
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
X-List-Received-Date: Wed, 21 Mar 2018 01:21:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc             | 4 ++--
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc          | 4 +---
 .../{linux-libc-headers_4.9.bb => linux-libc-headers_4.14.bb}       | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.9.bb => linux-libc-headers_4.14.bb} (71%)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 4357ea0..c65996d 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "7.3%"
 SDKBINUVERSION ?= "2.29%"
 SDKGLIBCVERSION ?= "2.26%"
-SDKLINUXLIBCVERSION ?= "4.9%"
+SDKLINUXLIBCVERSION ?= "4.14%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -35,7 +35,7 @@ GCCVERSION ?= "7.3%"
 BINUVERSION ?= "2.29%"
 GLIBCVERSION ?= "2.26%"
 GLIBCINITVERSION ?= "2.26%"
-LINUXLIBCVERSION ?= "4.9%"
+LINUXLIBCVERSION ?= "4.14%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index cba29bb..218fd92 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -45,7 +45,7 @@ SDKGCCVERSION ?= "linaro-7.2%"
 SDKGDBVERSION ?= "8.0"
 SDKBINUVERSION ?= "linaro-2.27%"
 SDKGLIBCVERSION ?= "2.26%"
-SDKLINUXLIBCVERSION ?= "4.9%"
+SDKLINUXLIBCVERSION ?= "4.14%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -67,12 +67,10 @@ GDBVERSION ?= "8.0"
 BINUVERSION ?= "linaro-2.27%"
 GLIBCVERSION ?= "2.26%"
 GLIBCINITVERSION ?= "2.26%"
-LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
similarity index 71%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
index 597d71f..c313ca2 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
@@ -1,9 +1,9 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
-PR_append = ".arago2"
+PR_append = ".arago0"
 
-BRANCH = "ti-lsk-linux-4.9.y"
-SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
+BRANCH = "ti-lsk-linux-4.14.y"
+SRCREV = "3bacc614e300e497679bdd7d2759f486e713f373"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


