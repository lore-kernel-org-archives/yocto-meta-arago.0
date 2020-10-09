Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D549952982
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2020 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 372F740C06;
	Fri,  9 Oct 2020 20:12:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DhG_yXX0zPQP; Fri,  9 Oct 2020 20:12:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 02FB040951;
	Fri,  9 Oct 2020 20:12:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C0D3417427C;
	Fri,  9 Oct 2020 16:12:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  9 Oct 2020 16:12:39 -0400
Message-Id: <1602274359-28526-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] optee-os: drop code that was moved to meta-ti
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
X-List-Received-Date: Fri, 09 Oct 2020 20:15:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend   | 76 ----------------------
 1 file changed, 76 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 8694554..677c6dd 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -5,79 +5,3 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
 "
 BRANCH = "ti-optee-os"
 SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
-
-do_compile() {
-    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
-        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
-        mv tee.bin.signed ${B}/$normfl.optee; \
-    )
-
-    if [ "${OPTEEPAGER}" = "y" ]; then
-#        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-        rm -rf out/
-        oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR} CFG_WITH_PAGER=y
-        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
-            normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
-            mv tee.bin.signed ${B}/$normfl-pager.optee; \
-        )
-    fi
-}
-
-do_compile_aarch64() {
-    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        cp tee-pager_v2.bin ${B}/bl32.bin; \
-        cp tee.elf ${B}/bl32.elf; \
-    )
-}
-
-do_compile_am65xx-hs-evm() {
-    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
-        mv tee-pager.bin.signed ${B}/bl32.bin; \
-        cp tee.elf ${B}/bl32.elf; \
-    )
-}
-
-do_compile_j7-hs-evm() {
-    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
-        mv tee-pager.bin.signed ${B}/bl32.bin; \
-        cp tee.elf ${B}/bl32.elf; \
-    )
-}
-
-do_install() {
-    #install core on boot directory
-    install -d ${D}/boot
-    install -m 644 ${B}/*.optee ${D}/boot || true
-    install -m 644 ${B}/bl32.bin ${D}/boot || true
-    install -m 644 ${B}/bl32.elf ${D}/boot || true
-
-    #install TA devkit
-    install -d ${D}/usr/include/optee/export-user_ta/
-    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}/usr/include/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-    install -d ${DEPLOYDIR}
-    install -m 644 ${B}/*.optee ${DEPLOYDIR} || true
-    install -m 644 ${B}/bl32.bin ${DEPLOYDIR} || true
-    install -m 644 ${B}/bl32.elf ${DEPLOYDIR} || true
-}
-
-FILES_${PN} = "/boot"
-SYSROOT_DIRS += "/boot"
-
-# This is needed for bl32.elf
-INSANE_SKIP_${PN} += "textrel"
-- 
2.7.4


