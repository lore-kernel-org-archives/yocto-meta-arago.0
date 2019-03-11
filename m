Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8EA4252A62
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 18:00:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BI068h056996
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 13:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552327206;
	bh=/EtggQFDiMxwPgb7y7JKC//mQF1DX9I5gGjb+qKeF9k=;
	h=From:To:CC:Subject:Date;
	b=TWNem01zvMYV1Y5SRrRTpdGOacak5dHgM03FpJhLZvMIAhfogIVKkDvPuV3KtjBXo
	HU0JqX6CWHD8CPoY22Jyx9pehbQRTq19HVVfSdZF6X/x6S6JwCEWI9yljEUdLwrwQZ
	vccbtIK8KeFxbFz5znxPIbfigcHSz54/PvPiVkso=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BI06Ku098334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 13:00:06 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 13:00:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 13:00:05 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BI059k012316;
	Mon, 11 Mar 2019 13:00:05 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 14:00:03 -0400
Message-ID: <1552327203-21779-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4] tidl-utils: add new features; change license checksum
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
X-List-Received-Date: Mon, 11 Mar 2019 18:00:15 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
Change from previous version of patch: commit message modification
---
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb | 8 ++++----
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb      | 2 +-
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

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


