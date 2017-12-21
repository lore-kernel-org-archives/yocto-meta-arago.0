Return-Path: <gaurav@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3770E52985
	for <meta-arago@arago-project.org>;
	Thu, 21 Dec 2017 22:05:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLM5221025446
	for <meta-arago@arago-project.org>; Thu, 21 Dec 2017 16:05:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513893902;
	bh=Xibd7cMjWBCgyFslfWQrq/mSVLpfMmzXEwpc72wDwG8=;
	h=From:To:CC:Subject:Date;
	b=EsbqS2lLEXhK0VJZcoakGJaCcC4f4xaUH9GjxsrnNL2DyUdlpdTbzaV76eCZi/DbX
	lUayC2rS9GG2o2cXLFTR7iaT1aTn1IY5vjoYA9e64q+t0c2tziH6DLRt0w/bOYvWY7
	L4yViz4Wr/BYNH7I1FMgv1wshd21sYwN8HWi50gk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLM52VB021133
	for <meta-arago@arago-project.org>; Thu, 21 Dec 2017 16:05:02 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 16:05:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 21 Dec 2017 16:05:01 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLM51Bx004958;
	Thu, 21 Dec 2017 16:05:01 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Dec 2017 16:04:15 -0600
Message-ID: <20171221220415.101279-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl, ocl-rtos: OpenCL RTOS Eclipse plugin generation and signature moved to yocto build
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
X-List-Received-Date: Thu, 21 Dec 2017 22:05:03 -0000
Content-Type: text/plain

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb | 1 -
 meta-arago-extras/recipes-ti/ocl/ocl.inc                 | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index 41b66534..88b94215 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -73,7 +73,6 @@ do_compile() {
         -DARM_LLVM_DIR=${ARM_LLVM_DIR} \
         -DOCL_VERSION=${PV} ../git/host;
     make install
-    make -C eclipse install
     make -C packages install
     cd ..
 }
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index ffa3cbee..b2c90671 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.8"
+PV = "1.1.14.10"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "caf4a0e55831ea34e3659e81877aaffde29ccfd1"
+OCL_SRCREV = "4669e010c35591154872d2364be720dc12b6b112"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 0f769f4d..2a9fccc5 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.1"
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "opencl ti-cgt6x-native clocl-native"
+DEPENDS = "opencl opencl-monitor ti-cgt6x-native clocl-native"
 
 OCL_PERSISTENT_DEPENDS = "ti-xdctools ti-ipc-rtos ti-sysbios"
 
-- 
2.14.1


