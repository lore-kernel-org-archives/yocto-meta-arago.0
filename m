Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A02F352AA8
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2017 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DD1D20B64;
	Wed,  1 Feb 2017 20:55:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YPa-_XRUHdr2; Wed,  1 Feb 2017 20:55:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D690208D1;
	Wed,  1 Feb 2017 20:55:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id C25E51621BE;
	Wed,  1 Feb 2017 15:55:40 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  1 Feb 2017 15:55:40 -0500
Message-Id: <1485982540-24076-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] external-linaro-toolchain: normalize licenses to use SPDX names
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
X-List-Received-Date: Wed, 01 Feb 2017 20:55:43 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index c79767f..13b7640 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -116,13 +116,13 @@ FILES_libgomp-dev += "\
 #    to the release schedule - http://www.gnu.org/software/gdb/schedule/
 # binutils version 2.17 was the last one under GPL version 2 (or later), according
 #    to the published releases - http://ftp.gnu.org/gnu/binutils/
-ELT_LIC_LIBC := "LGPLv2.1+"
-ELT_LIC_GCC := "${@["GPLv3+", "GPLv2+"][elt_get_gcc_version(d) <= "4.2.1"]}"
-ELT_LIC_RLE := "${@["GPLv3+ with GCC RLE", "GPLv2+ with GCC RLE"][elt_get_gcc_version(d) <= "4.3.3"]}"
-ELT_LIC_GDB := "${@["GPLv3+", "GPLv2+"][elt_get_gdb_version(d) <= "6.6"]}"
-#ELT_LIC_BFD := "${@["GPLv3+", "GPLv2+"][elt_get_bfd_version(d) <= "2.17"]}"
+ELT_LIC_LIBC := "LGPL-2.1"
+ELT_LIC_GCC := "${@["GPL-3", "GPL-2"][elt_get_gcc_version(d) <= "4.2.1"]}"
+ELT_LIC_RLE := "${@["GPL-3-with-GCC-exception", "GPL-2-with-GCC-exception"][elt_get_gcc_version(d) <= "4.3.3"]}"
+ELT_LIC_GDB := "${@["GPL-3", "GPL-2"][elt_get_gdb_version(d) <= "6.6"]}"
+#ELT_LIC_BFD := "${@["GPL-3", "GPL-2"][elt_get_bfd_version(d) <= "2.17"]}"
 
-LICENSE = "${ELT_LIC_LIBC}"
+LICENSE = "${ELT_LIC_LIBC}&${ELT_LIC_GCC}&${ELT_LIC_RLE}&${ELT_LIC_GDB}"
 LICENSE_ldd = "${ELT_LIC_LIBC}"
 LICENSE_glibc = "${ELT_LIC_LIBC}"
 LICENSE_glibc-thread-db = "${ELT_LIC_LIBC}"
-- 
2.7.4


