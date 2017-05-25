Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 579C052A88
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B30620BFB;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CsAhUR2hyNxL; Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E8141207BD;
	Thu, 25 May 2017 19:01:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 659031624C8;
	Thu, 25 May 2017 15:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 May 2017 15:01:31 -0400
Message-Id: <1495738892-4367-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495738892-4367-1-git-send-email-denis@denix.org>
References: <1495738892-4367-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 2/3] packagegroup-arago-cross-canadian: sync up with upstream
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
X-List-Received-Date: Thu, 25 May 2017 19:01:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

TODO: potentially replace with upstream packagegroup-cross-canadian.bb, once
environment-setup script from meta-environment is synced and updated.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-cross-canadian.bb  | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
index e68e2a8..b89c5d0 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
@@ -1,19 +1,20 @@
 SUMMARY = "Host Arago SDK package for cross canadian toolchain"
 PN = "packagegroup-arago-cross-canadian-${MACHINE}"
-PR = "r6"
-LICENSE = "MIT"
-
-# Save TRANSLATED_TARGET_ARCH before allarch tramples it
-TRANSLATED_TARGET_ARCH = "${@d.getVar('TUNE_ARCH', True).replace('_', '-')}"
+PR = "r7"
 
 inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# Use indirection to stop these being expanded prematurely
+BINUTILS = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+GCC = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
 RDEPENDS_${PN} = "\
-    binutils-cross-canadian-${@' binutils-cross-canadian-'.join(all_multilib_tune_values(d,'TRANSLATED_TARGET_ARCH').split())} \
-    gdb-cross-canadian-${@' gdb-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
-    gcc-cross-canadian-${@' gcc-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
     "
 
 #    meta-environment-${MACHINE}
-- 
2.7.4


