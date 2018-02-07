Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 29D7852A5C
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E01F20B64;
	Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o5rdQCJDylcK; Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3A26C20B56;
	Wed,  7 Feb 2018 20:33:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0DC1016328A;
	Wed,  7 Feb 2018 15:33:18 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:07 -0500
Message-Id: <1518035594-38357-8-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 08/15] external-linaro-toolchain-cross: handle case when target and cross gcc versions differ
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain-cross.bb      | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
index 14e0826..8a0b333 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
@@ -13,7 +13,14 @@ BPN = "external-linaro-toolchain"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
+# When used external toolchain gcc version doesn't match
+# the one built for the target
+# OE-Core gcc version
+#TGT_VER_GCC = "7.3.0"
+# Linaro gcc source version
+TGT_VER_GCC = "7.1.1"
+
 do_install() {
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
 }
-- 
2.7.4


