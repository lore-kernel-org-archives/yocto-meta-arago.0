Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E338F520E2
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17FB940C08;
	Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cYUBixrXozaP; Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED66D40BF6;
	Thu, 12 Sep 2019 15:38:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 70D7E173BFD;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:06 -0400
Message-Id: <1568302717-46518-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 01/32] toolchain-gcc: update to match current internal toolchain versions
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
X-List-Received-Date: Thu, 12 Sep 2019 15:39:52 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 8921a3b..cd11262 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -13,9 +13,9 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "8%"
-SDKBINUVERSION ?= "2.31%"
-SDKGLIBCVERSION ?= "2.28%"
+SDKGCCVERSION ?= "9%"
+SDKBINUVERSION ?= "2.32%"
+SDKGLIBCVERSION ?= "2.30%"
 SDKLINUXLIBCVERSION ?= "4.19%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -32,9 +32,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "8%"
-BINUVERSION ?= "2.31%"
-GLIBCVERSION ?= "2.28%"
+GCCVERSION ?= "9%"
+BINUVERSION ?= "2.32%"
+GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "4.19%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


