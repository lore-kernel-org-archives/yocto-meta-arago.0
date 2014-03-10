Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id BC20A529B5
	for <meta-arago@arago-project.org>;
	Mon, 10 Mar 2014 14:22:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N2800CTJ58G9960@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Mar 2014 09:21:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 92B0120086; Mon,
	10 Mar 2014 10:21:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Mar 2014 10:21:52 -0400
Message-id: <1394461312-32573-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2] arago: set target toolchain preferences at distro level
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
X-List-Received-Date: Mon, 10 Mar 2014 14:22:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - don't use wildcard for LINUXLIBCHEADERS, as it's used in other places and
break things

 meta-arago-distro/conf/distro/include/arago-prefs.inc   | 17 ++++++++++++++++-
 .../conf/distro/include/toolchain-linaro.inc            |  2 --
 .../conf/distro/include/tcmode-external-arago.inc       |  5 ++---
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index d5176fd..4de0301 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,3 +1,19 @@
+# Set *target* toolchain preferences at global distro level.
+# Cross and SDK toolchain preferences are set in toolchain-*.inc files
+GCCVERSION ?= "4.7%"
+BINUVERSION ?= "2.23%"
+EGLIBCVERSION ?= "2.17%"
+LINUXLIBCVERSION ?= "3.8"
+
+PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
+PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
+PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_eglibc ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-locale ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-initial ?= "${EGLIBCVERSION}"
+
 # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
 include conf/distro/include/qt5-versions.inc
 
@@ -12,7 +28,6 @@ PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 PREFERRED_VERSION_qt4-embedded = "4.8.4"
 PREFERRED_VERSION_qt4-native = "4.8.4"
 PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.4"
-PREFERRED_VERSION_linux-libc-headers = "3.8"
 
 # Use v4.09.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules_omap3 = "4.09.00.01"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index cc12f08..08aa3f6 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -32,7 +32,6 @@ SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.23%"
 SDKEGLIBCVERSION ?= "2.17%"
 SDKLINUXLIBCVERSION ?= "3.8%"
-LINUXLIBCVERSION ?= "3.8%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
@@ -40,7 +39,6 @@ PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
index 3ff235f..676e08e 100644
--- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
+++ b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
@@ -38,7 +38,7 @@ GCCVERSION ?= "4.5%"
 SDKGCCVERSION ?= "4.5%"
 BINUVERSION ?= "2.20%"
 EGLIBCVERSION ?= "2.12%"
-LINUXLIBCVERSION ?= "3.8"
+SDKLINUXLIBCVERSION ?= "3.8"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
@@ -56,8 +56,7 @@ PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc ?= "${EGLIBCVERSION}"
-- 
1.8.3.2


