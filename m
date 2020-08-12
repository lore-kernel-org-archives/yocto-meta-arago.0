Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 72521520E0
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C49240C29;
	Wed, 12 Aug 2020 22:39:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qhuhGGCE0VnV; Wed, 12 Aug 2020 22:39:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D326540BBC;
	Wed, 12 Aug 2020 22:39:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8DC0C174460;
	Wed, 12 Aug 2020 18:39:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 12 Aug 2020 18:39:11 -0400
Message-Id: <1597271951-32491-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597271951-32491-1-git-send-email-denys@ti.com>
References: <1597271951-32491-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/3] toolchain: update toolchain component versions to the latest available
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
X-List-Received-Date: Wed, 12 Aug 2020 22:42:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc | 12 ++++++------
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 58efc00..66edede 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -47,9 +47,9 @@ PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "arm-9.2%"
-SDKGDBVERSION ?= "9.1%"
-SDKBINUVERSION ?= "2.34%"
-SDKGLIBCVERSION ?= "2.31%"
+SDKGDBVERSION ?= "9.2%"
+SDKBINUVERSION ?= "2.35%"
+SDKGLIBCVERSION ?= "2.32%"
 SDKLINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -69,9 +69,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?= "arm-9.2%"
-GDBVERSION ?= "9.1%"
-BINUVERSION ?= "2.34%"
-GLIBCVERSION ?= "2.31%"
+GDBVERSION ?= "9.2%"
+BINUVERSION ?= "2.35%"
+GLIBCVERSION ?= "2.32%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 587ba94..faf4e71 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -13,9 +13,9 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "9%"
-SDKBINUVERSION ?= "2.34%"
-SDKGLIBCVERSION ?= "2.31%"
+SDKGCCVERSION ?= "10%"
+SDKBINUVERSION ?= "2.35%"
+SDKGLIBCVERSION ?= "2.32%"
 SDKLINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -32,9 +32,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "9%"
-BINUVERSION ?= "2.34%"
-GLIBCVERSION ?= "2.31%"
+GCCVERSION ?= "10%"
+BINUVERSION ?= "2.35%"
+GLIBCVERSION ?= "2.32%"
 LINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


