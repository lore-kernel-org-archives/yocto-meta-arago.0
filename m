Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9BC78529B2
	for <meta-arago@arago-project.org>;
	Thu, 12 Apr 2018 15:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FBDD20B70;
	Thu, 12 Apr 2018 15:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lG0TJKCWXUD4; Thu, 12 Apr 2018 15:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4CAAC2017D;
	Thu, 12 Apr 2018 15:09:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CF1B51633B1;
	Thu, 12 Apr 2018 11:09:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Apr 2018 11:09:52 -0400
Message-Id: <1523545792-5290-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] toolchain-*.inc: set correct preference for nativesdk-glibc-locale
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
X-List-Received-Date: Thu, 12 Apr 2018 15:09:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 4 ++--
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index c65996d..783a606 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -27,6 +27,7 @@ PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
@@ -34,7 +35,6 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 GCCVERSION ?= "7.3%"
 BINUVERSION ?= "2.29%"
 GLIBCVERSION ?= "2.26%"
-GLIBCINITVERSION ?= "2.26%"
 LINUXLIBCVERSION ?= "4.14%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -42,4 +42,4 @@ PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 218fd92..9836e5c 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -58,6 +58,7 @@ PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
@@ -66,14 +67,13 @@ GCCVERSION ?= "linaro-7.2%"
 GDBVERSION ?= "8.0"
 BINUVERSION ?= "linaro-2.27%"
 GLIBCVERSION ?= "2.26%"
-GLIBCINITVERSION ?= "2.26%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
 
 # Licenses set for main components of the toolchain:
 # (g)libc is always LGPL version 2 (or later)
-- 
2.7.4


