Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EEF125298F
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2019 23:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 195C240BF3;
	Thu, 27 Jun 2019 23:46:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GMz5kwkN6cw8; Thu, 27 Jun 2019 23:46:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 036F240BF2;
	Thu, 27 Jun 2019 23:46:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B0F7B170A22;
	Thu, 27 Jun 2019 19:46:24 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Jun 2019 19:46:23 -0400
Message-Id: <1561679183-39805-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] external-arm-toolchain: add extra symlink for ${libdir}/gcc/${TARGET_SYS}
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
X-List-Received-Date: Thu, 27 Jun 2019 23:47:11 -0000

Allows native gcc to find omp.h from Arm/Linaro libgomp install.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 34daa03..af9d6cd 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -8,6 +8,7 @@ do_install_append() {
 
 	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
 		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
+		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
 		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
 	fi
 
@@ -20,3 +21,7 @@ do_install_append() {
 	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
 	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
 }
+
+FILES_libgomp-dev += "\
+    ${libdir}/gcc/${ORIG_TARGET_SYS} \
+"
-- 
2.7.4


