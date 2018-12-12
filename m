Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0376E52A5D
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 22:20:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCMKTiV040956
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 16:20:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544653229;
	bh=qYMu1Eng2OUsJICUJ2nUFS4PV45yh8EHysYajWo1l2k=;
	h=From:To:CC:Subject:Date;
	b=rCSGalNDdhmFO8N6wF7lun/9Dfrf5Uht3j5aEBMfdwTFhDrRZWrMALLq+xkNdsdpY
	s8SS7Pb0BnnpR/eKa/UhvhgOeyHfNG/0UtHAINKq5zqmuUApjm7dBu8yXnLtV2yBUq
	spZBW6xEyqFUEe66eXG0EiocZBiwqWqAxA7bENQY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCMKToi053219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 16:20:29 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 16:20:29 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 12 Dec 2018 16:20:29 -0600
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBCMKSKr026966;
	Wed, 12 Dec 2018 16:20:28 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Dec 2018 17:20:05 -0500
Message-ID: <1544653205-55520-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3] tidl-utils: add TIDL import tool source compilation.
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
X-List-Received-Date: Wed, 12 Dec 2018 22:20:42 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
Change from previous version of patch:
Added/removed spaces to comply with OpenEmbedded coding style. 
---
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       |  1 +
 .../recipes-ti/tidl-utils/tidl-import_git.bb       | 43 ++++++++++++++++++++++
 .../recipes-ti/tidl-utils/tidl-utils.bb            | 17 ++++-----
 .../recipes-ti/tidl-utils/tidl-utils.inc           |  2 +
 4 files changed, 54 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 54466b7..af83521 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -13,6 +13,7 @@ EXTRA_TI_TOOLS = " \
     nativesdk-clacc \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
+    nativesdk-tidl-import \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
new file mode 100644
index 0000000..1291f9d
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -0,0 +1,43 @@
+SUMMARY = "TIDL import tool for conversion of Caffe and TF models into TI custom network format"
+DESCRIPTION = "TIDL import tool is using protobuf to read and parse information from external network models \
+               This is ARM Linux implementation."
+
+require ./tidl-utils.inc
+
+LICENSE = "BSD-3"
+LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=7baa68fec0aadbac92c3b41b283d26c4"
+
+PV = "01.00.00.00"
+PR = "r1"
+
+S = "${WORKDIR}/git/src/importTool/"
+
+DEPENDS = "protobuf zlib protobuf-native"
+
+EXTRA_OEMAKE += "TIARM_TOOLS=${GCC_ARM_NONE_TOOLCHAIN}"
+EXTRA_OEMAKE += "XDAIS_PATH=${XDAIS_INSTALL_DIR}"
+EXTRA_OEMAKE += "SHOW_COMMANDS=1"
+EXTRA_OEMAKE += "CORE=eve"
+EXTRA_OEMAKE += "TARGET_BUILD=release"
+EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
+
+EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
+EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} LINUXENV=oearm"
+
+EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
+
+do_compile() {
+    cd ${S}/modules/ti_dl/utils
+    ./genProtoSrc.sh
+    cd ${S}
+    oe_runmake -C modules/ti_dl/utils/tidlModelImport
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_model_import.out ${D}${bindir}
+}
+
+INSANE_SKIP_${PN} = "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 569de5a..e065e17 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -3,15 +3,14 @@ DESCRIPTION = "TIDL Utilities for standalone simulation and importing / translat
 HOMEPAGE = "http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components.html#tidl"
 LICENSE = "TI-TFL"
 
-PV = "1.0.0.0"
+require ./tidl-utils.inc
+
+PV = "1.0.0.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
 
-RDEPENDS_${PN}_class-target += " tidl-api tidl-examples "
-
-SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "994d90ae583610673d9d39086ca5e84027a9c56e"
+RDEPENDS_${PN}_class-target += "tidl-api tidl-examples"
 
 PR = "${INC_PR}.0"
 
@@ -21,7 +20,7 @@ TARGET_class-target = "arm"
 TARGET_class-native = "x86"
 TARGET_class-nativesdk = "x86"
 
-CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+CP_ARGS = "-Prf --preserve=mode,timestamps --no-preserve=ownership"
 
 do_install() {
   install -d ${D}${bindir}
@@ -32,9 +31,9 @@ do_install() {
   cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
 }
 
-FILES_${PN} += " ${datadir}/ti/tidl/utils \
-                 ${bindir} "
+FILES_${PN} += "${datadir}/ti/tidl/utils \
+                ${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-INSANE_SKIP_${PN} += "build-deps ldflags already-stripped "
+INSANE_SKIP_${PN} += "build-deps ldflags already-stripped"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
new file mode 100644
index 0000000..37ce84d
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -0,0 +1,2 @@
+SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
+SRCREV = "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
-- 
1.9.1


