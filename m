Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C72BE52A47
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF3E520B95;
	Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LHLMs641Uhut; Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBE3C20B87;
	Tue, 16 May 2017 02:38:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F31E2162439;
	Mon, 15 May 2017 22:38:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 22:38:05 -0400
Message-Id: <1494902286-53913-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] toolchain-gcc: update preferences for internal gcc toolchain
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
X-List-Received-Date: Tue, 16 May 2017 02:38:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 762a6a5..f225b60 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -22,12 +22,13 @@ SDKBINUVERSION ?= "2.27%"
 SDKGLIBCVERSION ?= "2.24%"
 SDKLINUXLIBCVERSION ?= "4.9%"
 
-PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
+
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
+PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
@@ -46,4 +47,3 @@ PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
-
-- 
2.7.4


