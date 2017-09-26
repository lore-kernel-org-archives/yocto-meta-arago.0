Return-Path: <esc@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8C19D52A02
	for <meta-arago@arago-project.org>;
	Tue, 26 Sep 2017 18:08:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QI8fM8016015
	for <meta-arago@arago-project.org>; Tue, 26 Sep 2017 13:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506449321;
	bh=DmndEvZl5I6joTlX/gvrlRiXnma7rOrX63aro1NBc6o=;
	h=From:To:CC:Subject:Date;
	b=aWHPJTKAQR7WPXP7OiBD3gahycmxwLsgEzgbGfHgcGPI+Yo1WZk3rD5Yr/NadK2sr
	T+xlgff++3GqdVoAQEtchSvAvPZJv+ZXtScKYmXXMgG+jV1q2TMkffFUc7/QEb7CkD
	89cj986DNQJicxQqCqTRg3ESZv1zAraVl1y7rFzo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QI8aV9015568
	for <meta-arago@arago-project.org>; Tue, 26 Sep 2017 13:08:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 26 Sep 2017 13:08:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 26 Sep 2017 13:08:36 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QI8ZmJ016502;
	Tue, 26 Sep 2017 13:08:36 -0500
From: Emily Curry <esc@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Sep 2017 13:07:17 -0500
Message-ID: <20170926180717.72244-1-esc@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: Update to v01.01.14.04
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
X-List-Received-Date: Tue, 26 Sep 2017 18:08:51 -0000
Content-Type: text/plain

* Build system update including variables to avoid hardcoding compiler prefix

Signed-off-by: Emily Curry <esc@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc                | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb | 8 --------
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb  | 3 +--
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 7b196fff..e211478f 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.2"
+PV = "1.1.14.4"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "e1314591c668c32b8d360badfa4d6a3dc1d345f2"
+OCL_SRCREV = "733e105ab96d0395cd8ed2f405c5e038543d33ba"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index fbecbc1d..0f769f4d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -73,18 +73,10 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
                  TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
 "
 
-do_configure() {
-    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
-}
-
 export XDC_DIR = "${XDC_INSTALL_DIR}/packages"
 export IPC_DIR = "${IPC_INSTALL_DIR}/packages"
 export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}/packages"
 
-do_compile() {
-    oe_runmake CC="${CC}" CPP="${CPP}" CXX="${CXX}"
-}
-
 do_install() {
     install -d ${D}${datadir}/ti/examples/opencl
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index b69aa950..44050f11 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -61,8 +61,7 @@ EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
 "
 
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export AM57_PDK_DIR = "${PDK_INSTALL_DIR}"
-export C6636_PDK_DIR = "${PDK_INSTALL_DIR}"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
 export IPC_DIR = "${IPC_INSTALL_DIR}"
 export XDC_DIR = "${XDC_INSTALL_DIR}"
 export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
-- 
2.14.1


