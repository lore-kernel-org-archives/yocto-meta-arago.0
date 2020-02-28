Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A11F152994
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 17:48:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SHkNin129296
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:46:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582911983;
	bh=UGrSuwNtlM8AMAefjVtv/mXi5aTN+LtFzrh4t4H37Q0=;
	h=From:To:CC:Subject:Date;
	b=vEdxoNFeNmUQKvSUeNblQtSmc9PxVDlkhEOrHAEZ8Aujl1MmNz5h33V13T+qPqFzV
	Ejt1a6Y/JBE6goBwb/aXReuLWpFgSxyAOks21ekKJDRpKzzZtd5+Wa8m656yDqJ21L
	gZ+JcDylZ/2PreV1IgfYFEPQrbLEovQF8Pcxyumc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SHkNJY072603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:46:23 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 11:46:22 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 28 Feb 2020 11:46:22 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01SHkMK1007375; 
	Fri, 28 Feb 2020 11:46:22 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Feb 2020 11:46:16 -0600
Message-ID: <20200228174616.97699-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.5.0
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
X-List-Received-Date: Fri, 28 Feb 2020 17:48:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Cleanup config file for subgraph runtime
- Remove previous patches (now merged)

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...001-Fix-versioning-for-shared-libary.patch | 55 -------------------
 ...p-2-group-layer-use-cases-with-1-dsp.patch | 34 ------------
 .../recipes-ti/tidl-api/tidl-api.inc          |  4 +-
 .../recipes-ti/tidl-api/tidl-api_git.bb       |  3 +-
 .../recipes-ti/tidl-api/tidl-examples_git.bb  |  4 +-
 5 files changed, 5 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch
deleted file mode 100644
index d15389b8..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-tidl-api: Fix versioning for shared libary
-
-    SONAME needs to be properly set up in the generated shared library.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- tidl_api/Makefile | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/tidl_api/Makefile b/tidl_api/Makefile
-index a04e604..3a5ea69 100644
---- a/tidl_api/Makefile
-+++ b/tidl_api/Makefile
-@@ -37,6 +37,8 @@ all: $(LIB_NAME) $(LIB_IMGUTIL_NAME) $(PY_LIB_NAME) \
- include make.inc
- include make.buildid
- 
-+SO_VER=$(MAJOR_VER).$(MINOR_VER).$(PATCH_VER)
-+
- RM = rm
- AR = ar
- 
-@@ -95,7 +97,10 @@ $(LIB_NAME): $(HOST_OBJ_FILES)
- 	$(AR) cr $@ $(HOST_OBJ_FILES)
- 
- $(SHARED_LIB_NAME): $(HOST_OBJ_FILES)
--	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL $(HOST_OBJ_FILES) -o $@
-+	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
-+		-lOpenCL $(HOST_OBJ_FILES) -o $@.$(SO_VER)
-+	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
-+	ln -sf $@.$(MAJOR_VER) $@
- 
- $(PY_LIB_NAME): $(HOST_OBJ_PYBIND_FILES) $(LIB_NAME)
- 	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL -locl_util $^ -o $@
-@@ -104,10 +109,14 @@ $(LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
- 	$(AR) cr $@ $(HOST_OBJ_IMGUTIL_FILES)
- 
- $(SHARED_LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
--	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared $(HOST_OBJ_IMGUTIL_FILES) -o $@
-+	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
-+		$(HOST_OBJ_IMGUTIL_FILES) -o $@.$(SO_VER)
-+	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
-+	ln -sf $@.$(MAJOR_VER) $@
- 
- clean::
- 	$(RM) -f $(LIB_NAME) $(PY_LIB_NAME)
- 	$(RM) -f $(LIB_IMGUTIL_NAME)
-+	$(RM) -f $(SHARED_LIB_NAME)* $(SHARED_LIB_IMGUTIL_NAME)*
- 	$(RM) -rf obj
- 
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
deleted file mode 100644
index 0c78ccf0..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-tidl-api: replace 2 dsp + 2 group layer use cases with 1 dsp
-
-    The BBAI only has enough CMEM for 4 EVEs, 1 DSP, and 2 group
-    layers. In the case of all of our networks, the difference between
-    1 and 2 dsps is essentially nonexistent. (PLSDK-3189)
-
-Upstream-Status: Accepted
-
-Signed-off-by: Caleb Robey <a0232989@ti.com>
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- examples/mcbench/scripts/all_5729.sh | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/examples/mcbench/scripts/all_5729.sh b/examples/mcbench/scripts/all_5729.sh
-index defec72..0fee8a1 100755
---- a/examples/mcbench/scripts/all_5729.sh
-+++ b/examples/mcbench/scripts/all_5729.sh
-@@ -7,8 +7,7 @@ export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
- export TIDL_NETWORK_HEAP_SIZE_EVE=67108864
- export TIDL_NETWORK_HEAP_SIZE_DSP=8388608
- ./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
--./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
--./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
--./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
--./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
--./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
-+./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
-+./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
-+./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
-+./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 116928ab..c45b33fb 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.4.0"
+PV = "1.5.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "21faf4b36a0ae9ee5b5c6aaf90d067728ff4f78b"
+SRCREV = "eeb4c457c8881a81fbf59a60b2ee070d2450a935"
 
 # default patchdir is ${S}
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index c96fa337..4dd8c685 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -6,8 +6,7 @@ LICENSE = "BSD"
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.1"
-SRC_URI += "file://0001-Fix-versioning-for-shared-libary.patch"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index e5afad1c..d59ee405 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -6,8 +6,7 @@ LICENSE = "BSD"
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.1"
-SRC_URI += "file://0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -23,6 +22,7 @@ RDEPENDS_${PN} += "tidl-api \
                    opencl-runtime \
                    opencv \
                    json-c \
+                   python3-core \
 "
 
 EXTRA_OEMAKE = " -C ${S}/examples \
-- 
2.24.1


