Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0B6715297E
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 18:23:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KIMoXt102239
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 13:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561054970;
	bh=fZZWOqIUzpo4GWe8yuk40Y3azIS68xyNmzPzWJLIehE=;
	h=From:To:CC:Subject:Date;
	b=DImub0PG8v9NDh/cgythG6yTRITqlSYq2pxvsi2CFR0+vJsGlyNLRSoRKdSLdIIOa
	zUJNWVpHaytvs/zq1Lvh1xYShxghnAnDC5Z9lGB33TJjSuOi3ZNF9JDdcQ/fKQxZZV
	AgK3rAatJKwdJqz1xeZqmPR46t8WXdHDUzmBAJRo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KIMoYs090351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 13:22:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 13:22:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 13:22:49 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KIMnRb072373;
	Thu, 20 Jun 2019 13:22:49 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 13:22:30 -0500
Message-ID: <20190620182230.96572-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.01][PATCH] tidl-api: fix g++ 8.3.0 compilation error
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
X-List-Received-Date: Thu, 20 Jun 2019 18:23:38 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 52 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  3 +-
 .../recipes-ti/tidl-api/tidl-api_git.bb            |  2 +-
 3 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
new file mode 100644
index 00000000..6a48203e
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
@@ -0,0 +1,52 @@
+commit aa7101256aefcea11d326740c111bf37a48b191e (HEAD -> master_patch)
+Author: Yuan Zhao <yuanzhao@ti.com>
+Date:   Thu Jun 20 12:01:24 2019 -0500
+
+    Fix g++ 8.3.0 compilation error
+    
+    - Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
+    - Make should report error from loop
+    
+    Upstream-Status: Submitted [Remove this patch when next release is out]
+    
+    Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+
+diff --git a/examples/Makefile b/examples/Makefile
+index 52b3ff6..9217380 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -34,7 +34,7 @@ RUN_DIRS := $(filter-out classification, $(DIRS))
+ define make_in_dirs
+ 	@for dir in $(1); do \
+ 	  echo "=============== " $$dir " =================" ; \
+-	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
++	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
+ 	done
+ endef
+ 
+diff --git a/examples/classification/main.cpp b/examples/classification/main.cpp
+index 020004b..25361f8 100644
+--- a/examples/classification/main.cpp
++++ b/examples/classification/main.cpp
+@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx, int frame_idx, int f_id)
+   int rpt_id = -1;
+ 
+   typedef std::pair<uchar, int> val_index;
+-  auto constexpr cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
++  auto cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
+   std::priority_queue<val_index, std::vector<val_index>, decltype(cmp)> queue(cmp);
+   // initialize priority queue with smallest value on top
+   for (int i = 0; i < k; i++) {
+diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
+index 937f467..dc1035b 100644
+--- a/examples/imagenet/main.cpp
++++ b/examples/imagenet/main.cpp
+@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline &eop,
+ 
+     // sort and get k largest values and corresponding indices
+     typedef pair<unsigned char, int> val_index;
+-    auto constexpr cmp = [](val_index &left, val_index &right)
++    auto cmp = [](val_index &left, val_index &right)
+                          { return left.first > right.first; };
+     priority_queue<val_index, vector<val_index>, decltype(cmp)> queue(cmp);
+     // initialize priority queue with smallest value on top
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 04049e73..d93aec82 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,5 +1,5 @@
 PV = "1.3.0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
 
@@ -12,4 +12,5 @@ SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
 
 # default patchdir is ${S}
 SRC_URI += "file://0001-tidl-api_l2_cache_size.patch"
+SRC_URI += "file://0002-tidl-api_gcc_8.3.0_compilation.patch"
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 1deb59e3..48f4db1d 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "dra7xx-evm|m57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit python3native
-- 
2.14.1


