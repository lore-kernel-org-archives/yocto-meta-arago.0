Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id DA3515299E
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB007SOU6WMC70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=acg_Wbwi9hA6yHJazkAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 48DEA200F0;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:51:56 -0400
Message-id: <1426546322-25230-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/7] toolchain-gcc: update versions for internal toolchain build
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 530f3c3..0ed8bba 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -14,10 +14,10 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-ca
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-SDKGCCVERSION ?= "4.7%"
-SDKBINUVERSION ?= "2.23%"
-SDKEGLIBCVERSION ?= "2.17%"
-SDKLINUXLIBCVERSION ?= "3.10%"
+SDKGCCVERSION ?= "4.8%"
+SDKBINUVERSION ?= "2.24%"
+SDKEGLIBCVERSION ?= "2.19%"
+SDKLINUXLIBCVERSION ?= "3.14%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
-- 
2.2.0


