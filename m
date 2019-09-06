Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AD0CA520E5
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 22:18:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86MH43v010612
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 17:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567808224;
	bh=TE7exJ7QH2nHFlDJQUQKX3ms18YRaVuMPQfjbt+z88o=;
	h=From:To:CC:Subject:Date;
	b=mFmqM/Gd42Othwa+wJu5rjNNS0+OY5Vjq5wSJUKldTKAOyauqWRl9EaD1WfEb4GBV
	ONsxJ6m96b4+W+aG3MIRJh73nmdmCrr1hkRsM9gwIGDcyxV9G8SjYBvmcfd4i3aYBw
	ertrzVcOPbDmo86R2SrBy6NoerxJeq43C5UTCD/A=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86MH4Cw101963
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 17:17:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 17:17:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 17:17:04 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86MH4Z7032984;
	Fri, 6 Sep 2019 17:17:04 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Sep 2019 17:16:50 -0500
Message-ID: <20190906221650.132984-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.3.1
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
X-List-Received-Date: Fri, 06 Sep 2019 22:18:09 -0000
Content-Type: text/plain

- Bug fixes

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../files/0001-tidl-api_l2_cache_size.patch        | 41 ---------------
 .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 59 ----------------------
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  8 ++-
 3 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
deleted file mode 100644
index 84e12a18..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-diff --git a/tidl_api/dsp/ocl_wrapper.cl b/tidl_api/dsp/ocl_wrapper.cl
-index e75ed1d..cb56302 100644
---- a/tidl_api/dsp/ocl_wrapper.cl
-+++ b/tidl_api/dsp/ocl_wrapper.cl
-@@ -46,6 +46,7 @@ void ocl_tidl_initialize(global unsigned char*            createParams,
- {
-     // Set L1 cache to 16KB. TIDL requires 16KB of L1 scratch
-     __cache_l1d_16k();
-+    __cache_l2_64k();
- 
-     ocl_dsp_tidl_initialize(createParams, netParamsBuffer, 
-                             externalMemoryHeapBase, initializeParams, 
-@@ -66,5 +67,6 @@ void ocl_tidl_process(global OCL_TIDL_ProcessParams* processParams,
- kernel void ocl_tidl_cleanup()
- {
-     ocl_dsp_tidl_cleanup();
-+    __cache_l2_128k();
-     __cache_l1d_all();
- }
-diff --git a/tidl_api/src/ocl_device.cpp b/tidl_api/src/ocl_device.cpp
-index ab0bf26..d9351cd 100644
---- a/tidl_api/src/ocl_device.cpp
-+++ b/tidl_api/src/ocl_device.cpp
-@@ -511,7 +511,7 @@ static bool CheckOpenCLVersion(cl_platform_id id)
-     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, 0, nullptr, &length);
-     if (err != CL_SUCCESS) return false;
- 
--    std::unique_ptr<char> version(new char[length]);
-+    std::unique_ptr<char[]> version(new char[length]);
-     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, length, version.get(),
-                             nullptr);
-     if (err != CL_SUCCESS) return false;
-@@ -543,7 +543,7 @@ static bool PlatformIsAM57()
-     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, 0, nullptr, &length);
-     if (err != CL_SUCCESS) return false;
- 
--    std::unique_ptr<char> name(new char[length]);
-+    std::unique_ptr<char[]> name(new char[length]);
- 
-     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, length, name.get(), nullptr);
-     if (err != CL_SUCCESS) return false;
diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
deleted file mode 100644
index 36e8ab88..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From aa7101256aefcea11d326740c111bf37a48b191e Mon Sep 17 00:00:00 2001
-From: Yuan Zhao <yuanzhao@ti.com>
-Date: Thu, 20 Jun 2019 12:01:24 -0500
-Subject: [PATCH] Fix g++ 8.3.0 compilation error
-
-- Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
-- Make should report error from loop
-
-Upstream-Status: Submitted [Remove this patch when next release is out]
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- examples/Makefile                | 2 +-
- examples/classification/main.cpp | 2 +-
- examples/imagenet/main.cpp       | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/examples/Makefile b/examples/Makefile
-index 52b3ff6..9217380 100644
---- a/examples/Makefile
-+++ b/examples/Makefile
-@@ -34,7 +34,7 @@ RUN_DIRS := $(filter-out classification, $(DIRS))
- define make_in_dirs
- 	@for dir in $(1); do \
- 	  echo "=============== " $$dir " =================" ; \
--	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
-+	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
- 	done
- endef
- 
-diff --git a/examples/classification/main.cpp b/examples/classification/main.cpp
-index 020004b..25361f8 100644
---- a/examples/classification/main.cpp
-+++ b/examples/classification/main.cpp
-@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx, int frame_idx, int f_id)
-   int rpt_id = -1;
- 
-   typedef std::pair<uchar, int> val_index;
--  auto constexpr cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
-+  auto cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
-   std::priority_queue<val_index, std::vector<val_index>, decltype(cmp)> queue(cmp);
-   // initialize priority queue with smallest value on top
-   for (int i = 0; i < k; i++) {
-diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
-index 937f467..dc1035b 100644
---- a/examples/imagenet/main.cpp
-+++ b/examples/imagenet/main.cpp
-@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline &eop,
- 
-     // sort and get k largest values and corresponding indices
-     typedef pair<unsigned char, int> val_index;
--    auto constexpr cmp = [](val_index &left, val_index &right)
-+    auto cmp = [](val_index &left, val_index &right)
-                          { return left.first > right.first; };
-     priority_queue<val_index, vector<val_index>, decltype(cmp)> queue(cmp);
-     // initialize priority queue with smallest value on top
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index d93aec82..01725245 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,5 +1,5 @@
-PV = "1.3.0"
-INC_PR = "r2"
+PV = "1.3.1"
+INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
 
@@ -8,9 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
+SRCREV = "73efef4ab6b4c9c20f6ade372c396043e6d36b40"
 
 # default patchdir is ${S}
-SRC_URI += "file://0001-tidl-api_l2_cache_size.patch"
-SRC_URI += "file://0002-tidl-api_gcc_8.3.0_compilation.patch"
 S = "${WORKDIR}/git"
-- 
2.14.1


