Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2C35352A0F
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 05:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 415F440C27;
	Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yZZB6ATRlNjk; Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2C9A640A52;
	Thu, 30 Jan 2020 05:12:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E28B716E7F5;
	Thu, 30 Jan 2020 00:12:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2020 00:12:45 -0500
Message-Id: <1580361172-41124-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH 1/8] linux-libc-headers: update to 5.4
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
X-List-Received-Date: Thu, 30 Jan 2020 05:14:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc           | 4 ++--
 .../{linux-libc-headers_4.19.bb => linux-libc-headers_5.4.bb}     | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.19.bb => linux-libc-headers_5.4.bb} (67%)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index cd11262..51ccd9e 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "9%"
 SDKBINUVERSION ?= "2.32%"
 SDKGLIBCVERSION ?= "2.30%"
-SDKLINUXLIBCVERSION ?= "4.19%"
+SDKLINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -35,7 +35,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 GCCVERSION ?= "9%"
 BINUVERSION ?= "2.32%"
 GLIBCVERSION ?= "2.30%"
-LINUXLIBCVERSION ?= "4.19%"
+LINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
similarity index 67%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
index d62fc06..74b676a 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
@@ -1,9 +1,11 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
-PR_append = ".arago1"
+PR_append = ".arago0"
 
-BRANCH = "ti-linux-4.19.y"
-SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
+DEPENDS += "rsync-native"
+
+BRANCH = "ti-linux-5.4.y"
+SRCREV = "c65c87b98f8d1b647c13b5bb36e5ffbad5805ff1"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


