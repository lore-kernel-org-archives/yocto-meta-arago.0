Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 34E8652985
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 01:29:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5P1T6YY061406
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 20:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561426146;
	bh=JkFAx9j+JGU/GIgOERFz78Y+xhXLz6vhhIYDWrMfqz8=;
	h=From:To:CC:Subject:Date;
	b=n8b4MI/nH+kZcUqvAQOCWmqxmwxlq1VV/2oZm0fyMwY+iBuxTTpR+eHrRCm/IJRDk
	NZQ8WUDbep3QWClIYRNhjRMzRAQ7LX5CNGOqRNspD5DjgX9VaDtQtcWBB1wzElMPxo
	xPofnc8Yywel/gH7bmBnbxS5cvzKSMd2V3ZsVRcQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5P1T6eQ024490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 20:29:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 20:29:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 20:29:06 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5P1T5ts091431;
	Mon, 24 Jun 2019 20:29:05 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 20:29:00 -0500
Message-ID: <20190625012900.73691-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.01][PATCH v2] ocl: fix g++8.3 opencl-examples undefined behavior
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
X-List-Received-Date: Tue, 25 Jun 2019 01:29:49 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...g-8.3.0-OpenCL-example-undefined-behavior.patch | 68 ++++++++++++++++++++++
 .../recipes-ti/ocl/opencl-examples_git.bb          | 12 ++--
 2 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch b/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
new file mode 100644
index 00000000..b2c40c84
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
@@ -0,0 +1,68 @@
+From 7cf77b704544b6012105f7ed19807b798b6cb242 Mon Sep 17 00:00:00 2001
+From: Yuan Zhao <yuanzhao@ti.com>
+Date: Mon, 24 Jun 2019 13:24:11 -0500
+Subject: [PATCH] Fix g++ 8.3.0 OpenCL example undefined behavior
+
+- Fix undefined behavior of non-void functions with no return statements,
+  when using g++ 8.3.0.  Change them to void functions.
+
+Upstream-Status: Submitted [Remove this patch when next release is out]
+
+Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+---
+ examples/persistent_common/host_assist.cpp | 2 +-
+ examples/persistent_common/host_assist.h   | 2 +-
+ examples/sgemm/main.cpp                    | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/examples/persistent_common/host_assist.cpp b/examples/persistent_common/host_assist.cpp
+index f1640bc..fd8bb18 100644
+--- a/examples/persistent_common/host_assist.cpp
++++ b/examples/persistent_common/host_assist.cpp
+@@ -34,7 +34,7 @@ void print_completion_code(uint32_t completion_code)
+ /******************************************************************************
+ * Given an OpenCL Device, Abort if the device is not part of the AM57x platform
+ ******************************************************************************/
+-int assert_am57x(cl::Device &device)
++void assert_am57x(cl::Device &device)
+ {
+     cl::Platform platform;
+     std::string  platform_name;
+diff --git a/examples/persistent_common/host_assist.h b/examples/persistent_common/host_assist.h
+index dec381e..4abf837 100644
+--- a/examples/persistent_common/host_assist.h
++++ b/examples/persistent_common/host_assist.h
+@@ -7,7 +7,7 @@
+ /*-----------------------------------------------------------------------------
+ * Prototypes
+ *----------------------------------------------------------------------------*/
+-int  assert_am57x         (cl::Device &device);
++void assert_am57x         (cl::Device &device);
+ void print_completion_code(uint32_t completion_code);
+ 
+ #endif // _HOST_ASSIST_H_
+diff --git a/examples/sgemm/main.cpp b/examples/sgemm/main.cpp
+index 85f19ac..dfac651 100644
+--- a/examples/sgemm/main.cpp
++++ b/examples/sgemm/main.cpp
+@@ -96,7 +96,7 @@ int NUMCOMPUNITS                    = 0;
+ /* ======================================================================== */
+ void PrintUsageAndExit();
+ void HandleOptions(int argc, char* argv[]);
+-bool SetSgemmParams(Device& device);
++void SetSgemmParams(Device& device);
+ 
+ /* ======================================================================== */
+ /*  MAIN                                                                    */
+@@ -428,7 +428,7 @@ static cl_ulong roundDownPower2(cl_ulong value)
+ /*-----------------------------------------------------------------------------
+ * Check platform name, set sgemm blocking/tiling parameters accordingly
+ *----------------------------------------------------------------------------*/
+-bool SetSgemmParams(Device& device)
++void SetSgemmParams(Device& device)
+ {
+    int APanelSz        = 8  << 10;
+    int BPanelSz        = 16 << 10;
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index cbc35ce5..c562bbf7 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+SRC_URI += "file://0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch;patchdir=.."
+
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -65,12 +67,14 @@ OCL_MPAX_EXAMPLE_LIST = " vecadd_mpax \
 OCL_EXAMPLE_LIST_append_k2hk = " ${OCL_MPAX_EXAMPLE_LIST}"
 
 python do_unpack_append() {
-    import shutil
+    s = d.getVar("S")
+    os.makedirs(s)
+}
 
+python do_patch_append() {
+    import shutil
     git_dir = d.expand("${WORKDIR}/git/examples")
     s = d.getVar("S")
-
-    os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
     for example in d.getVar("OCL_EXAMPLE_LIST").split():
-- 
2.14.1


