Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2A4E55299C
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 20:14:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7CKEU2i017461
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 15:14:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CKEUvX001414
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 15:14:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 12 Aug 2015 15:14:30 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CKETln006825;
	Wed, 12 Aug 2015 15:14:30 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPcPt-0006QA-Dc; Wed, 12 Aug 2015 16:14:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Aug 2015 16:14:27 -0400
Message-ID: <1439410467-24648-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master/fido][PATCH] ti-llvm3.3: Use pkg-config for libxml2
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
X-List-Received-Date: Wed, 12 Aug 2015 20:14:31 -0000
Content-Type: text/plain

* the libxml2 binconfig has been disabled.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
index a8eed48..35514c4 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "LLVM 3.3 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
+PR = "r1"
+
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
     sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-config/llvm-config.cpp
@@ -8,7 +10,9 @@ do_configure_prepend_class-native() {
 
 require recipes-core/llvm/llvm.inc
 
-DEPENDS_append_class-native = " llvm-common-native"
+DEPENDS += "zlib libxml2"
+EXTRA_OECONF += "--enable-zlib"
+
 
 LLVM_DIR = "ti-llvm${PV}"
 
@@ -24,6 +28,11 @@ SRCREV = "29629a3e70d445cfbfbb4046a56d3648ebae9544"
 
 S = "${WORKDIR}/git"
 
+LIBXML2_INC = "`pkg-config libxml-2.0 --cflags`"
+LIBXML2_LIBS = "`pkg-config libxml-2.0 --libs`"
+
+EXTRA_OEMAKE += "LIBXML2_INC="${LIBXML2_INC}" LIBXML2_LIBS="${LIBXML2_LIBS}""
+
 do_compile_class-native() {
   cd ${LLVM_BUILD_DIR}
   oe_runmake
-- 
1.9.1


