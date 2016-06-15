Return-Path: <denys@ti.com>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 4D9465208C
	for <meta-arago@arago-project.org>;
	Wed, 15 Jun 2016 03:47:08 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8S00BB1NTX5C70@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Jun 2016 22:46:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=a9HiYNDdyJgytr8eIhsA:9
Received: by 100.15.86.14 with SMTP id 2658553d; Wed, 15 Jun 2016 03:46:50 GMT
Received: from aragorn.denix.denix (aragorn [192.168.0.3])
	by gandalf.denix.org (Postfix) with ESMTP id 62308162047;	Tue,
	14 Jun 2016 23:46:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 15 Jun 2016 03:50:59 -0400
Message-id: <1465977060-3376-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.8.0
In-reply-to: <1465977060-3376-1-git-send-email-denys@ti.com>
References: <1465977060-3376-1-git-send-email-denys@ti.com>
Subject: [PATCH 3/4] arago-prefs, toolchain-linaro: update linaro gcc version
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
X-List-Received-Date: Wed, 15 Jun 2016 03:47:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 +-
 .../conf/distro/include/toolchain-linaro.inc       |   11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 14a7c8a..cc481cb 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,6 +1,6 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "linaro-5.2%"
+GCCVERSION ?= "linaro-5.3%"
 BINUVERSION ?= "linaro-2.25%"
 GLIBCVERSION ?= "2.23%"
 GLIBCINITVERSION ?= "2.23%"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 25c2ddc..feda02c 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -28,17 +28,18 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 
-SDKGCCVERSION ?= "linaro-5.2%"
+SDKGCCVERSION ?= "linaro-5.3%"
 SDKBINUVERSION ?= "linaro-2.25%"
 SDKGLIBCVERSION ?= "2.23%"
 SDKLINUXLIBCVERSION ?= "4.4%"
 
-PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${SDKBINUVERSION}"
+
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
+PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
-- 
1.7.9.5


