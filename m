Return-Path: <denys@ti.com>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 181CD5208C
	for <meta-arago@arago-project.org>;
	Wed, 15 Jun 2016 03:47:04 +0000 (UTC)
Received: from vz-proxy-m004.mx.aol.com ([64.236.83.8])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8S00FUNNTXLZ00@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Jun 2016 22:46:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=Bcm0RCOkHTZ4We9DUxtllQ==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=4js3eXZhmk1l6PzosWoA:9
Received: by 100.15.86.14 with SMTP id 545fa06d; Wed, 15 Jun 2016 03:46:45 GMT
Received: from aragorn.denix.denix (aragorn [192.168.0.3])
	by gandalf.denix.org (Postfix) with ESMTP id 51D22162046;	Tue,
	14 Jun 2016 23:46:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 15 Jun 2016 03:50:58 -0400
Message-id: <1465977060-3376-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.8.0
In-reply-to: <1465977060-3376-1-git-send-email-denys@ti.com>
References: <1465977060-3376-1-git-send-email-denys@ti.com>
Subject: [PATCH 2/4] Revert "FIXME: external-linaro-toolchain-cross: target Linaro gcc version doesn't match cross version"
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
X-List-Received-Date: Wed, 15 Jun 2016 03:47:04 -0000

This reverts commit 85e80f706e5d00d1cd5efb237b8409c4ab90da71.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain-cross.bb        |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
index 92fbfca..d448f47 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
@@ -13,10 +13,7 @@ BPN = "external-linaro-toolchain"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-#TGT_VER_GCC = "${ELT_VER_GCC}"
-TGT_VER_GCC = "5.2.1"
-
 do_install() {
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
 }
-- 
1.7.9.5


