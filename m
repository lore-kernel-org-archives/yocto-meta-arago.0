Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C7BB2520E2
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2020 00:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8379240B89;
	Fri, 29 May 2020 00:39:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UJfyplYjRAAU; Fri, 29 May 2020 00:39:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 39FE940AB5;
	Fri, 29 May 2020 00:39:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6041B16FA39;
	Thu, 28 May 2020 20:39:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 28 May 2020 20:39:35 -0400
Message-Id: <1590712775-35974-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] external-arm-toolchain: un-break target compilation broken by 9.x update
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
X-List-Received-Date: Fri, 29 May 2020 00:42:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 795e39c..5a51aaa 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -21,6 +21,8 @@ do_install_append() {
 	ln -sf libubsan.so.1 ${D}${libdir}/libubsan.so
 	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
 	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
+
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 }
 
 # Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
@@ -67,3 +69,5 @@ FILES_libgomp-dev = "\
     ${libdir}/libgomp.spec \
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
 "
+
+INSANE_SKIP_libgcc-dev += "staticdev"
-- 
2.7.4


