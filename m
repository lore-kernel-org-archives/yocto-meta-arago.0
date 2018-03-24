Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4BB8E52094
	for <meta-arago@arago-project.org>;
	Sun, 25 Mar 2018 02:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10E7820BAB;
	Sat, 24 Mar 2018 23:16:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qMduU3Dc-1t0; Sat, 24 Mar 2018 23:16:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9EE720AF8;
	Sat, 24 Mar 2018 23:16:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1182E16337F;
	Sat, 24 Mar 2018 19:16:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat, 24 Mar 2018 19:16:49 -0400
Message-Id: <1521933412-44751-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/4] img-pvr-sdk: fix RDEPENDS on libgles error and other warnings
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
X-List-Received-Date: Sun, 25 Mar 2018 02:52:42 -0000

1. Binaries are linked against libgles libraries, but no RDEPENDS set
2. Host contamination warnings due to cp
3. One binary is shipped already stripped, supress warning
4. Binaries don't have GNU_HASH, suppress warning

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb            | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 326a5e6..131239c 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -16,9 +16,10 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
 S = "${WORKDIR}/git"
 
 do_install () {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}/opt/img-powervr-sdk
-    cp -ar ${S}/targetfs/PVRHub ${D}/opt/img-powervr-sdk
-    cp -ar ${S}/targetfs/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
+    cp ${CP_ARGS} ${S}/targetfs/PVRHub ${D}/opt/img-powervr-sdk
+    cp ${CP_ARGS} ${S}/targetfs/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
 
     install -d ${D}${bindir}/SGX/demos/Raw/
     install -d ${D}${bindir}/SGX/demos/Wayland/
@@ -38,9 +39,11 @@ do_install () {
     install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
 }
 
+RDEPENDS_${PN} = "ti-sgx-ddk-um"
+
 INHIBIT_PACKAGE_STRIP = "1"
 
-INSANE_SKIP_${PN} += "dev-so staticdev"
+INSANE_SKIP_${PN} += "dev-so staticdev already-stripped ldflags"
 
 FILES_${PN} += " \
     /opt/img-powervr-sdk/PVRHub/* \
-- 
2.7.4


