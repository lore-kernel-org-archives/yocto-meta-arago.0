Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id A36BD52A6A
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00JY8B7CY640@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C91B0259B1; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:46 -0400
Message-id: <1403287009-11256-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 16/19] arago-prefs, toolchain-linaro: update system versions
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc      | 12 +++++-------
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc |  8 ++++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 63e9e22..437bb61 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,9 +1,9 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "4.7%"
-BINUVERSION ?= "2.23%"
-EGLIBCVERSION ?= "2.17%"
-LINUXLIBCVERSION ?= "3.10"
+GCCVERSION ?= "4.8%"
+BINUVERSION ?= "2.24%"
+EGLIBCVERSION ?= "2.19%"
+LINUXLIBCVERSION ?= "3.14"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
@@ -21,7 +21,7 @@ include conf/distro/include/qt5-versions.inc
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 # Use the latest version of libdrm
-PREFERRED_VERSION_libdrm = "2.4.46"
+PREFERRED_VERSION_libdrm = "2.4.52"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
@@ -68,10 +68,8 @@ PREFERRED_VERSION_u-boot = "2014.04+2014.07-rc3"
 PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
 
-PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 
-PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
 
 PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 26e69ae..a4160d4 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -23,10 +23,10 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "externa
 bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-SDKGCCVERSION ?= "4.7%"
-SDKBINUVERSION ?= "2.23%"
-SDKEGLIBCVERSION ?= "2.17%"
-SDKLINUXLIBCVERSION ?= "3.10%"
+SDKGCCVERSION ?= "4.8%"
+SDKBINUVERSION ?= "2.24%"
+SDKEGLIBCVERSION ?= "2.19%"
+SDKLINUXLIBCVERSION ?= "3.14%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
-- 
2.0.0


