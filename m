Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 491EA52978
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 17:15:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DHFBmk009578
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 12:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528910111;
	bh=UDak5+hZhfReSY1XD3RiX38oXllzyfh9N7vK9QN/Hr8=;
	h=From:To:CC:Subject:Date;
	b=KIw3UIe1mpNt9TGAPfnW9Kg7ip/Di7M2ZFj7evNXs1JdVIFfEwyQrHxkLNorlcEJX
	1gv2kJq1TDgVgrpqxFFsP4jvTkZU0lbwWw9nf6bFadgWGCxU1ZC0Ov3uCMYKq+/g0h
	PJA2pODNli/b64xcE3RL7S8W49i5T6wBPtgEFK0k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DHFBMj014426
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 12:15:11 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 12:15:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 12:15:11 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DHFADH023306;
	Wed, 13 Jun 2018 12:15:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Jun 2018 17:14:43 +0000
Message-ID: <20180613171443.26506-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH][rocko/master] optee-os: use OPTEEMACHINE in place of OPTEEOUTPUTMACHINE
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
X-List-Received-Date: Wed, 13 Jun 2018 17:15:17 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 8b84ca33..7905f325 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago7"
 
-PV="2.6.0+git${SRCPV}"
+PV = "2.6.0+git${SRCPV}"
 
 is_armv7 = "1"
 
@@ -24,7 +24,7 @@ do_compile() {
     unset LDFLAGS
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+    ( cd out/arm-plat-${OPTEEMACHINE}/core/; \
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
         normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
         mv tee.bin.signed $normfl.optee; \
@@ -33,7 +33,7 @@ do_compile() {
     if [ "${OPTEEPAGER}" = "y" ]; then
         oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
         oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR} CFG_WITH_PAGER=y
-        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ( cd out/arm-plat-${OPTEEMACHINE}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
             normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
             mv tee.bin.signed $normfl-pager.optee; \
@@ -44,18 +44,18 @@ do_compile() {
 do_install() {
     #install core on boot directory
     install -d ${D}/boot
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${D}/boot
+    install -m 644 ${B}/out/arm-plat-${OPTEEMACHINE}/core/*.optee ${D}/boot
 
     #install TA devkit
     install -d ${D}/usr/include/optee/export-user_ta/
-    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
+    for f in  ${B}/out/arm-plat-${OPTEEMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
         cp -aR $f ${D}/usr/include/optee/export-user_ta/
     done
 }
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${DEPLOYDIR}
+    install -m 644 ${B}/out/arm-plat-${OPTEEMACHINE}/core/*.optee ${DEPLOYDIR}
 }
 
 FILES_${PN} = "/boot"
-- 
2.17.1


