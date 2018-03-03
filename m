Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id ECEBE52A1D
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 03:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5EF220B67;
	Sat,  3 Mar 2018 03:20:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IWsl-3UgYvE2; Sat,  3 Mar 2018 03:20:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B09E2098D;
	Sat,  3 Mar 2018 03:20:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4EE761632F8;
	Fri,  2 Mar 2018 22:20:26 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  2 Mar 2018 22:20:26 -0500
Message-Id: <1520047226-52420-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH v2] toolchain-gcc: update glibc preference to 2.27
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
X-List-Received-Date: Sat, 03 Mar 2018 03:21:05 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 11c6b11..3d983c0 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -15,7 +15,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "7.3%"
 SDKBINUVERSION ?= "2.30%"
-SDKGLIBCVERSION ?= "2.26%"
+SDKGLIBCVERSION ?= "2.27%"
 SDKLINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -33,8 +33,8 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Can be overwritten globally, if needed
 GCCVERSION ?= "7.3%"
 BINUVERSION ?= "2.30%"
-GLIBCVERSION ?= "2.26%"
-GLIBCINITVERSION ?= "2.26%"
+GLIBCVERSION ?= "2.27%"
+GLIBCINITVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


