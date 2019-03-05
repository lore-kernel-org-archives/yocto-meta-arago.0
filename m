Return-Path: <xuj@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 047FE529C0
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 22:43:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25MhbsU130302
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 16:43:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551825817;
	bh=HfoQoSXyRBs+9klri8bueYuH567vUHTSaUfpHT3c8HU=;
	h=From:To:CC:Subject:Date;
	b=k1AGOC66TfvCSgUxtN9JfHqZMJUhUDycIQrNzEibudoKC7+69N9Jn+dMiwV48qcEa
	+vLQXB9kHSiZ/WBzqPUSaaiWFjIBjCAoq5gsnNN6FXWOOPV9Dg/VMeXOh6na7ds2Gn
	IV1KzlgJUWQCs1o2it1qBRPZ/J2DhjTGcrYNfquM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25MhauS116092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 16:43:37 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 16:43:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 16:43:36 -0600
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25MhZig010959;
	Tue, 5 Mar 2019 16:43:36 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 17:43:33 -0500
Message-ID: <1551825813-41508-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
Signed-off-by: Jianzhong Xu <xuj@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] tidl-utils: add new features; change checksum
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
X-List-Received-Date: Tue, 05 Mar 2019 22:43:44 -0000
Content-Type: text/plain

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index 1291f9d..bef2d1a 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -5,10 +5,10 @@ DESCRIPTION = "TIDL import tool is using protobuf to read and parse information
 require ./tidl-utils.inc
 
 LICENSE = "BSD-3"
-LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=7baa68fec0aadbac92c3b41b283d26c4"
+LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
 
-PV = "01.00.00.00"
-PR = "r1"
+PV = "01.01.00.00"
+PR = "r0"
 
 S = "${WORKDIR}/git/src/importTool/"
 
@@ -21,7 +21,7 @@ EXTRA_OEMAKE += "CORE=eve"
 EXTRA_OEMAKE += "TARGET_BUILD=release"
 EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
 
-EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
+EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUXENV=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
 EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} LINUXENV=oearm"
 
 EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index e065e17..69b6e29 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -5,7 +5,7 @@ LICENSE = "TI-TFL"
 
 require ./tidl-utils.inc
 
-PV = "1.0.0.1"
+PV = "1.0.1.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 37ce84d..9ccabdd 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,2 +1,2 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
+SRCREV = "057984b05e143a4740ecec3dd28cfa082927b897"
-- 
1.9.1


