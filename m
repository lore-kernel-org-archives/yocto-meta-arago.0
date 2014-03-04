Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2179D52A00
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 20:51:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24KpddR023223
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:51:39 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24Kpd9j018141
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:51:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 14:51:38 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24Kpccn011772;
	Tue, 4 Mar 2014 14:51:38 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 15:51:35 -0500
Message-ID: <1393966295-21617-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-sa: provides ti sa recipe for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 20:51:40 -0000
Content-Type: text/plain

- TI Security Accelerator Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-sa/ti-sa_2.00.03.00.bb          |   70 ++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-sa/ti-sa_2.00.03.00.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-sa/ti-sa_2.00.03.00.bb b/meta-arago-extras/recipes-bsp/ti-sa/ti-sa_2.00.03.00.bb
new file mode 100644
index 0000000..0fbb017
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-sa/ti-sa_2.00.03.00.bb
@@ -0,0 +1,70 @@
+DESCRIPTION = "TI Security Accelerator LLD (SA LLD)"
+HOMEPAGE = "http://downloads.ti.com/sdoemb/sdoemb_public_sw/salld/index.html"
+LICENSE = "TI BSD and SSLeay" 
+SECTION = "devel"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/salld_keystone2_${PV}/packages/ti/drv/sa/docs/SA_LLD_2_0_SoftwareManifest.pdf;md5=ef1f05d5dd5b6cf5abc7180eda81aec9"
+
+PR ="r0"
+PV = "02_00_03_00"
+SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/salld/${PV}/exports/setupLinux_salld_keystone2_${PV}.bin;name=sabin"
+SRC_URI[sabin.md5sum] = "33c97a5214e19fb00e587dda86fc7b91"
+SRC_URI[sabin.sha256sum] = "7e63703b867efd3800e9d14742b426e12ebeca50836b4c4021f4c671eab1920e"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "ti-csl ti-cppi-lib ti-pa-lib ti-qmss-lib"
+
+require  ../../../../../sources/meta-ti/recipes-ti/includes/ti-eula-unpack.inc
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/saBasicExample_*.out \
+                    ${bindir}/saMCExample_*.out \
+                    ${bindir}/ti/drv/sa/example/saBasicExample/vectors/*.bin"
+
+DEVICELIST = "k2h k2k"
+
+CHOICELIST = "yes no"
+
+BINFILE="setupLinux_salld_keystone2_${PV}.bin"
+TI_BIN_UNPK_CMDS="Y:workdir"
+TI_BIN_UNPK_WDEXT="/salld_keystone2_${PV}"
+
+S = "${WORKDIR}/salld_keystone2_${PV}/packages/ti/drv/sa"
+
+do_compile() {
+#   Now build the lld
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} ARMV7SALIBDIR=${S}/lib/armv7
+    for device in ${DEVICELIST}
+    do
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 examples PDK_INSTALL_PATH=${STAGING_INCDIR} ARMV7LIBDIR=${STAGING_LIBDIR} ARMV7SALIBDIR=${S}/lib/armv7 DEVICE="$device" USEDYNAMIC_LIB="$choice"
+      done
+    done
+}
+
+do_install() {
+   install -d ${D}${libdir}/
+   install -d ${D}${bindir}/ti/drv/sa/example/SaBasicExample/vectors
+   install -d ${D}${includedir}/ti/drv/sa/fw
+
+# copy interface header files and firmware c files
+   find *.h fw/*.h fw/*.c -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/drv/sa
+
+# copy all the test vectors  
+   find example/SaBasicExample/vectors -name *.bin -type f | xargs -I {} cp --parents {} ${D}${bindir}/ti/drv/sa
+
+# copy the library files   
+   cp -rp ${S}/lib/armv7/lib* ${D}${libdir}/ 
+
+# copy the example test binaries
+   for device in ${DEVICELIST}
+   do
+     cp ${S}/example/SaBasicExample/$device/armv7/linux/build/bin/sa/example/saBasicExample.out ${D}${bindir}/saBasicExample_$device.out
+     cp ${S}/example/SaBasicExample/$device/armv7/linux/build/bin/sa/example/saBasicExample_so.out ${D}${bindir}/saBasicExample_so_$device.out
+     cp ${S}/example/SaMultiCoreExample/$device/armv7/linux/build/bin/sa/example/saMCExample.out ${D}${bindir}/saMCExample_$device.out
+     cp ${S}/example/SaMultiCoreExample/$device/armv7/linux/build/bin/sa/example/saMCExample_so.out ${D}${bindir}/saMCExample_so_$device.out
+   done
+
+}
-- 
1.7.9.5


