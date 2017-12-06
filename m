Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 80360529BD
	for <meta-arago@arago-project.org>;
	Wed,  6 Dec 2017 16:09:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB6G9Rja027296
	for <meta-arago@arago-project.org>; Wed, 6 Dec 2017 10:09:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512576567;
	bh=6CFw/2rYkAPkUZjhus/G/aUkO6Z954+u3fncuyITuV8=;
	h=From:To:Subject:Date;
	b=gkZhlH3jbL4cRhSfwZZ3g6d0oJVIQzb7+4VtrwDMq1/S7Y7XYSgcTAJotIM9bc4Nv
	+a3kjEtepoopBsJysOoGbMD09A54syqPk4VoEoPyFNLkIVZQM9Kd7LxUESRbB1KkLb
	Z3Lsoz+qBR1ECPIdU47A7/guAQR2bClcM45hhu+E=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB6G9Lnk022266
	for <meta-arago@arago-project.org>; Wed, 6 Dec 2017 10:09:21 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Dec 2017 10:09:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Dec 2017 10:09:21 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB6G9LlV018980
	for <meta-arago@arago-project.org>; Wed, 6 Dec 2017 10:09:21 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Dec 2017 11:09:18 -0500
Message-ID: <1512576558-12272-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] ti-sgx-ddk-um: update srcrev to pick up the latest fixes
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
X-List-Received-Date: Wed, 06 Dec 2017 16:09:38 -0000
Content-Type: text/plain

- gbm: Fix compilation error with BUILD=debug
- change GLES filenames to mesa style
- gbm: dont increment surface refcount inside internal function
- gbm: decrement gbm bo recount on DeleteDrawable
- add symbolic link libGLESv2.so.1 for backward compatibility of SGX binary demos

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
index bd19733..a48f670 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
@@ -1,8 +1,8 @@
-PR_append = ".tisdk5"
+PR_append = ".tisdk6"
 
 BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
-SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','cf8cd620e96c9741bfcbe7f07c95328fe2d6ece9','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
 
 do_install_append () {
-    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.2
+    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
 }
-- 
1.9.1


