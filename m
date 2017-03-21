Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 33FBF52A73
	for <meta-arago@arago-project.org>;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5145C20B96;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 21IfGT18plQT; Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D48920BBC;
	Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 57AEE16241B;
	Mon, 20 Mar 2017 21:43:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 21:43:05 -0400
Message-Id: <1490060589-72852-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490060589-72852-1-git-send-email-denis@denix.org>
References: <1490060589-72852-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 08/12] toolchain-gcc: update preferences to current versions
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
X-List-Received-Date: Tue, 21 Mar 2017 01:43:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 762a6a5..50fb5e1 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -17,9 +17,9 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "6.2%"
+SDKGCCVERSION ?= "6.3%"
 SDKBINUVERSION ?= "2.27%"
-SDKGLIBCVERSION ?= "2.24%"
+SDKGLIBCVERSION ?= "2.25%"
 SDKLINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
@@ -34,10 +34,10 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "6.2%"
+GCCVERSION ?= "6.3%"
 BINUVERSION ?= "2.27%"
-GLIBCVERSION ?= "2.24%"
-GLIBCINITVERSION ?= "2.24%"
+GLIBCVERSION ?= "2.25%"
+GLIBCINITVERSION ?= "2.25%"
 LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


