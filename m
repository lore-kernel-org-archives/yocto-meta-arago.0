Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D255952094
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 00:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B51952091B;
	Thu, 22 Dec 2016 00:09:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uVaADH-QAslg; Thu, 22 Dec 2016 00:09:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9116B207BD;
	Thu, 22 Dec 2016 00:09:28 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 98A141621E2;
	Wed, 21 Dec 2016 19:09:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 19:09:27 -0500
Message-Id: <1482365367-24615-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master/morty][PATCH] conf/toolchain: update TC versions and match target TC versions to cross/sdk ones
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
X-List-Received-Date: Thu, 22 Dec 2016 00:09:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            | 15 ------------
 .../conf/distro/include/toolchain-gcc.inc          | 23 +++++++++++++++---
 .../conf/distro/include/toolchain-linaro.inc       | 28 +++++++++++++++++-----
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index be7aa61..5b9d56b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,18 +1,3 @@
-# Set *target* toolchain preferences at global distro level.
-# Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "linaro-5.3%"
-BINUVERSION ?= "linaro-2.25%"
-GLIBCVERSION ?= "2.23%"
-GLIBCINITVERSION ?= "2.23%"
-LINUXLIBCVERSION ?= "4.4"
-
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
-
 # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
 include conf/distro/include/qt5-versions.inc
 
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index cae46a4..09b11c3 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -16,9 +16,10 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-ca
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-SDKGCCVERSION ?= "5.3%"
-SDKBINUVERSION ?= "2.26%"
-SDKGLIBCVERSION ?= "2.23%"
+# Set Cross and SDK toolchain preferences
+SDKGCCVERSION ?= "6.2%"
+SDKBINUVERSION ?= "2.27%"
+SDKGLIBCVERSION ?= "2.24%"
 SDKLINUXLIBCVERSION ?= "4.4%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
@@ -30,3 +31,19 @@ PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
+
+# Set target toolchain preferences to match Cross/SDK by default
+# Can be overwritten globally, if needed
+GCCVERSION ?= "6.2%"
+BINUVERSION ?= "2.27%"
+GLIBCVERSION ?= "2.24%"
+GLIBCINITVERSION ?= "2.24%"
+LINUXLIBCVERSION ?= "4.4"
+
+PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
+PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
+
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index feda02c..bbe6fd1 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -28,14 +28,15 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 
-SDKGCCVERSION ?= "linaro-5.3%"
-SDKBINUVERSION ?= "linaro-2.25%"
-SDKGLIBCVERSION ?= "2.23%"
+# Set Cross and SDK toolchain preferences
+SDKGCCVERSION ?= "linaro-6.2%"
+SDKBINUVERSION ?= "linaro-2.27%"
+SDKGLIBCVERSION ?= "2.24%"
 SDKLINUXLIBCVERSION ?= "4.4%"
 
-PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${SDKBINUVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
 
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
@@ -43,3 +44,18 @@ PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
+
+# Set target toolchain preferences to match Cross/SDK by default
+# Can be overwritten globally, if needed
+GCCVERSION ?= "linaro-6.2%"
+BINUVERSION ?= "linaro-2.27%"
+GLIBCVERSION ?= "2.24%"
+GLIBCINITVERSION ?= "2.24%"
+LINUXLIBCVERSION ?= "4.4"
+
+PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
+PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
-- 
2.7.4


