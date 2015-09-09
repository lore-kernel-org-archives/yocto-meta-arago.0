Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 18FFA529D7
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 17:17:35 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF00DU16OPDG80@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 12:17:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=EQNQRXLnWweNmdQJ430A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DC300161BCB;	Wed,
	9 Sep 2015 13:17:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 13:17:12 -0400
Message-id: <1441819032-23875-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] external-linaro-toolchain: adjust -cross dependency to avoid possible race
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
X-List-Received-Date: Wed, 09 Sep 2015 17:17:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Many toolchain components like gcc share common work directory with sources
and rely on those sources being prepped by a corresponding -cross part.
Since we use a prebuilt cross toolchain, we have to fake some prep steps for
target toolchain components to build successfully (install unwind.h, etc.).
Need to make sure those prep steps get executed before target gcc requires
them.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index f382897..71ef91e 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -4,7 +4,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago21"
+PR_append = "-arago22"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -18,7 +18,7 @@ PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'exter
 
 DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
 
-do_build[depends] += "external-linaro-toolchain-cross:do_populate_sysroot"
+do_populate_sysroot[depends] += "external-linaro-toolchain-cross:do_populate_sysroot"
 
 RDEPENDS_${PN}-utils = ""
 
-- 
2.2.0


