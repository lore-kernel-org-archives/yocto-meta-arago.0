Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 74CC9529B9
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2019 23:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7BEF40BE5;
	Wed,  9 Oct 2019 23:57:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id upJhWPhDwGpR; Wed,  9 Oct 2019 23:57:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A054A40A89;
	Wed,  9 Oct 2019 23:57:14 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 55802174282;
	Wed,  9 Oct 2019 19:57:14 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  9 Oct 2019 19:57:14 -0400
Message-Id: <1570665434-27743-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] toolchain-arm: replace tabs with spaces in python code
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
X-List-Received-Date: Wed, 09 Oct 2019 23:58:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-arm.inc          | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 0f2336b..fca44c5 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -96,24 +96,24 @@ PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
 #    to the published releases - http://ftp.gnu.org/gnu/binutils/
 
 python external_arm_toolchain_license_handler () {
-	if not isinstance(e, bb.event.ConfigParsed):
-		return
-	d = e.data
-	ld = d.createCopy()
-	ld.finalize()
-
-	lc_libc = "LGPL-2.1"
-	lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
-	lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
-	lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
-#	lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
-
-	d.setVar('EAT_LIC_LIBC', lc_libc)
-	d.setVar('EAT_LIC_GCC', lc_gcc)
-	d.setVar('EAT_LIC_RLE', lc_rle)
-	d.setVar('EAT_LIC_GDB', lc_gdb)
-#	d.setVar('EAT_LIC_BFD', lc_bfd)
-
-	d.setVar('EAT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+    d = e.data
+    ld = d.createCopy()
+    ld.finalize()
+
+    lc_libc = "LGPL-2.1"
+    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
+    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
+    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
+#    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
+
+    d.setVar('EAT_LIC_LIBC', lc_libc)
+    d.setVar('EAT_LIC_GCC', lc_gcc)
+    d.setVar('EAT_LIC_RLE', lc_rle)
+    d.setVar('EAT_LIC_GDB', lc_gdb)
+#    d.setVar('EAT_LIC_BFD', lc_bfd)
+
+    d.setVar('EAT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
 }
 addhandler external_arm_toolchain_license_handler
-- 
2.7.4


