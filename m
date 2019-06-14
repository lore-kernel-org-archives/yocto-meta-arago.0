Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 84A6B520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 15:12:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EFBWeq039295
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 10:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560525092;
	bh=dKIu45qk/5ndzJbguROOF/csW9pzlwYZXQw3bBWHAI4=;
	h=From:To:CC:Subject:Date;
	b=phWeSghS+VSskFyU3496IH3/fgw1LxJnkhNL+D1aFXHcnkTyEu4BZqLyjApqsI7qw
	rLYzHw+nLk/XAvlsm84sumgilGYk8qlOI8lvxaiobnx96Fx5va6XKa4PamnPA22Rrm
	6iq5UzAuX6d8QEyKfjWamyHM0aS9aadWnvM+hVL0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EFBWGN044293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 10:11:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 10:11:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 10:11:31 -0500
Received: from udb0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EFBVLr097711;
	Fri, 14 Jun 2019 10:11:31 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Jun 2019 11:11:28 -0400
Message-ID: <20190614151128.6908-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] tidl-utils: bump SRCREV and remove patch
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
X-List-Received-Date: Fri, 14 Jun 2019 15:12:12 -0000
Content-Type: text/plain

* Pick up tidl related developments for 6.0
* Remove tidl-import patch with source fix to disable static linking
* Consolidate "PV" and "PR" to tidl-utils.inc

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../tidl-utils/tidl-import/disable_static.patch  | 16 ----------------
 .../recipes-ti/tidl-utils/tidl-import_git.bb     |  5 -----
 .../recipes-ti/tidl-utils/tidl-utils.bb          |  5 -----
 .../recipes-ti/tidl-utils/tidl-utils.inc         |  6 +++++-
 4 files changed, 5 insertions(+), 27 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
deleted file mode 100644
index 23377af5..00000000
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff --git a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
-index 374f862..521f0dc 100644
---- a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
-+++ b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
-@@ -103,9 +103,9 @@ ifeq ($(PLATFORM_BUILD), x86)
- ifeq ($(LINUX_IMPORT_TOOL), 64BIT)
- CFLAGS+= -DPLATFORM_64BIT 
- endif
--LDFLAGS+= -lstdc++ -static
-+LDFLAGS+= -lstdc++
- else
--LDFLAGS+= -lstdc++ -lz -static
-+LDFLAGS+= -lstdc++ -lz
- endif
- endif
- 
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index 9f1c5bba..b7c9d7af 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -7,11 +7,6 @@ require ./tidl-utils.inc
 LICENSE = "BSD-3"
 LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
 
-PV = "01.01.00.00"
-PR = "r1"
-
-SRC_URI_append = " file://disable_static.patch;pnum=3"
-
 S = "${WORKDIR}/git/src/importTool/"
 
 DEPENDS = "protobuf zlib protobuf-native"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 69b6e297..554cf09a 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -5,15 +5,10 @@ LICENSE = "TI-TFL"
 
 require ./tidl-utils.inc
 
-PV = "1.0.1.0"
-INC_PR = "r0"
-
 LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
 
 RDEPENDS_${PN}_class-target += "tidl-api tidl-examples"
 
-PR = "${INC_PR}.0"
-
 S = "${WORKDIR}/git"
 
 TARGET_class-target = "arm"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 9ccabdd6..2c29fc27 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,2 +1,6 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "057984b05e143a4740ecec3dd28cfa082927b897"
+SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
+
+PV = "01.01.01.00"
+PR = "r0"
+
-- 
2.17.1


