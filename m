Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9568D52A39
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 22:46:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCMj0wL033133
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:45:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576190700;
	bh=SYCxGfasm3R6/Ni0egiHYYQFDMPHqbnmwJxFc6UBfvM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tpnru1IUg5pzh4x1OXloNx1oOlrqZyHX16fLZtoxNKr7HTvFt6OcOnmXZPyFwXs7S
	qrC6wrvqiJXXNHacsOZTQyBWt3cAB1lCYZp8g79CSFX3GTLHz3VPndL3sZ8yCMLhsW
	gQ9VTKjtfsgydT8eSzkSHKWz0u+UUYRsyp8YOmKk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCMj0aG031013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:45:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 16:45:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 16:45:00 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCMitXD082626;
	Thu, 12 Dec 2019 16:44:59 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 17:40:14 -0500
Message-ID: <20191212224014.23027-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212224014.23027-1-a0271529@ti.com>
References: <20191212224014.23027-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [master/thud/ti2019.05] [PATCH 2/2] tidl-import: add support for tensorflow-lite floating point models
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
X-List-Received-Date: Thu, 12 Dec 2019 22:46:35 -0000
Content-Type: text/plain

* The newer version also has the following changes:
  1. Bug fixes for ResNet-18 model
  2. Conv2d kernel types are automatically set when models are imported,
     and do not need to be explicitly configured.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-ti/tidl-utils/tidl-import_git.bb         | 12 +++++++++---
 .../recipes-ti/tidl-utils/tidl-utils.inc             |  6 +++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index ad1dad13..72ef8773 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;m
 
 S = "${WORKDIR}/git/src/importTool/"
 
-DEPENDS = "protobuf zlib protobuf-native"
+DEPENDS = "protobuf zlib protobuf-native flatbuffers tensorflow-lite flatbuffers-native tensorflow-lite-native"
 
 EXTRA_OEMAKE += "TIARM_TOOLS=${GCC_ARM_NONE_TOOLCHAIN}"
 EXTRA_OEMAKE += "XDAIS_PATH=${XDAIS_INSTALL_DIR}"
@@ -18,8 +18,14 @@ EXTRA_OEMAKE += "CORE=eve"
 EXTRA_OEMAKE += "TARGET_BUILD=release"
 EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
 
-EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUXENV=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
-EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} LINUXENV=oearm"
+EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUXENV=x86 LINUX_IMPORT_TOOL=64BIT \
+                   PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include \
+                   FLATBUFFERS_INC_DIR=${STAGING_DIR_NATIVE}$/usr/include/flatbuffers \
+                   TF_LITE_GENERATED_PATH=${STAGING_DIR_NATIVE}/usr/include/tensorflow/lite/schema"
+EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} \
+                                PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} \
+                                FLATBUFFERS_INC_DIR=${STAGING_INCDIR}/flatbuffers \
+                                TF_LITE_GENERATED_PATH=${STAGING_INCDIR}/tensorflow/lite/schema LINUXENV=oearm"
 
 EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
 
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 1fd3063f..61bb50e6 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "c88b229e70db220ddbf394f3e77c3d5930a0e35a"
-PV = "01.01.02.00"
-PR = "r2"
+SRCREV = "99ff282fbc440a68170736e7b5de2ff5a2984386"
+PV = "01.01.03.00"
+PR = "r0"
-- 
2.17.1


