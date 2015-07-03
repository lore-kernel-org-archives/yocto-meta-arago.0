Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id F222652AC7
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW006R55S6UQH0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KZwvylsD c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=kefA_0BhpZdatvnMMSQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5E4FC161AF1;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:08 -0400
Message-id: <1435892533-6046-50-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 49/54] arago-prefs, toolchain*: update toolchain component versions
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            | 22 +++++++++++-----------
 .../conf/distro/include/branding-mcsdk.inc         |  2 +-
 .../conf/distro/include/toolchain-gcc.inc          | 12 ++++++------
 .../conf/distro/include/toolchain-linaro.inc       | 10 +++++-----
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8947c7f..c9be400 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,17 +1,17 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "linaro-4.7%"
-BINUVERSION ?= "linaro-2.24%"
-EGLIBCVERSION ?= "2.19%"
-EGLIBCINITVERSION ?= "2.19%"
-LINUXLIBCVERSION ?= "3.14"
+GCCVERSION ?= "linaro-4.9%"
+BINUVERSION ?= "linaro-2.25%"
+GLIBCVERSION ?= "2.21%"
+GLIBCINITVERSION ?= "2.21%"
+LINUXLIBCVERSION ?= "3.19"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_eglibc ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-locale ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial ?= "${EGLIBCINITVERSION}"
+PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
 
 # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
 include conf/distro/include/qt5-versions.inc
@@ -20,7 +20,7 @@ include conf/distro/include/qt5-versions.inc
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 # Use the latest version of libdrm
-PREFERRED_VERSION_libdrm = "2.4.52"
+PREFERRED_VERSION_libdrm = "2.4.59"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
@@ -99,8 +99,8 @@ PREFERRED_VERSION_readline = "5.2"
 PREFERRED_VERSION_readline-native = "5.2"
 PREFERRED_VERSION_readline-nativesdk = "5.2"
 
-PREFERRED_VERSION_libnl = "3.2.24"
-PREFERRED_VERSION_crda = "1.1.3"
+PREFERRED_VERSION_libnl = "3.2.25"
+PREFERRED_VERSION_crda = "3.13"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
index 9fca5af..7dbffd3 100644
--- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
@@ -15,4 +15,4 @@ PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
 PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
-PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "eglibc-locale"
+PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "glibc-locale"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 1f40a0a..510915b 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -1,6 +1,6 @@
 # Select internal gcc toolchain to be built from sources
 TCMODE = "default"
-TCLIBC = "eglibc"
+TCLIBC = "glibc"
 
 # Match some of the external vars
 TOOLCHAIN_SYS := "${TARGET_SYS}"
@@ -14,10 +14,10 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-ca
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-SDKGCCVERSION ?= "4.7%"
+SDKGCCVERSION ?= "4.9%"
 SDKBINUVERSION ?= "2.24%"
-SDKEGLIBCVERSION ?= "2.19%"
-SDKLINUXLIBCVERSION ?= "3.14%"
+SDKGLIBCVERSION ?= "2.21%"
+SDKLINUXLIBCVERSION ?= "3.19%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
@@ -26,5 +26,5 @@ PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index cd2d3ce..3a5d207 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -28,10 +28,10 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 
-SDKGCCVERSION ?= "4.7%"
+SDKGCCVERSION ?= "4.9%"
 SDKBINUVERSION ?= "2.24%"
-SDKEGLIBCVERSION ?= "2.19%"
-SDKLINUXLIBCVERSION ?= "3.14%"
+SDKGLIBCVERSION ?= "2.21%"
+SDKLINUXLIBCVERSION ?= "3.19%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
@@ -40,5 +40,5 @@ PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
-- 
2.2.0


