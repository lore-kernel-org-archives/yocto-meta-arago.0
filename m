Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4AA5E52A44
	for <meta-arago@arago-project.org>;
	Tue,  7 Aug 2018 20:51:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77Kpgr3096888
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 15:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533675102;
	bh=+iLNKAVwbbu9lCkSsGa0Th4M0mB9+kZJcKUC0araulc=;
	h=From:To:CC:Subject:Date;
	b=cOraxvnH/ndBBPPUcwWWB1x0l8yrNk6x1mBE+Sy3AXUxX4Z7ED3CUY51YqHQ1azjb
	//HowW3jycQzZkl3FjCz+rEPkQz86ipRDoZ5HoNXqdzlHzKPloCtR1gehMb1VE4ngN
	pxgxXnCe9xu4hjY9w8JUFdvhATBJueMCdFO56K2E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77KpgEn007975
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 15:51:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 15:51:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 15:51:41 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77KpfKm006623;
	Tue, 7 Aug 2018 15:51:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Aug 2018 20:49:23 +0000
Message-ID: <20180807204923.16120-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] optee-os: move resulting bins from out/ directory, as it's removed between builds
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
X-List-Received-Date: Tue, 07 Aug 2018 20:51:49 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../optee/optee-os_git.bbappend               | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 8fc9cf32..2204a50c 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -40,7 +40,7 @@ do_compile() {
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
         normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
-        mv tee.bin.signed $normfl.optee; \
+        mv tee.bin.signed ${B}/$normfl.optee; \
     )
 
     if [ "${OPTEEPAGER}" = "y" ]; then
@@ -50,7 +50,7 @@ do_compile() {
         ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
             normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
-            mv tee.bin.signed $normfl-pager.optee; \
+            mv tee.bin.signed ${B}/$normfl-pager.optee; \
         )
     fi
 }
@@ -58,17 +58,17 @@ do_compile() {
 do_compile_aarch64() {
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        cp tee-pager.bin bl32.bin; \
-        cp tee.elf bl32.elf; \
+        cp tee-pager.bin ${B}/bl32.bin; \
+        cp tee.elf ${B}/bl32.elf; \
     )
 }
 
 do_install() {
     #install core on boot directory
     install -d ${D}/boot
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${D}/boot || true
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${D}/boot || true
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.elf ${D}/boot || true
+    install -m 644 ${B}/*.optee ${D}/boot || true
+    install -m 644 ${B}/bl32.bin ${D}/boot || true
+    install -m 644 ${B}/bl32.elf ${D}/boot || true
 
     #install TA devkit
     install -d ${D}/usr/include/optee/export-user_ta/
@@ -79,9 +79,9 @@ do_install() {
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${DEPLOYDIR} || true
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${DEPLOYDIR} || true
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.elf ${DEPLOYDIR} || true
+    install -m 644 ${B}/*.optee ${DEPLOYDIR} || true
+    install -m 644 ${B}/bl32.bin ${DEPLOYDIR} || true
+    install -m 644 ${B}/bl32.elf ${DEPLOYDIR} || true
 }
 
 FILES_${PN} = "/boot"
-- 
2.17.1


