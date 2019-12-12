Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4A39952A39
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 23:48:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCNkpBG018922
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 17:46:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576194411;
	bh=b6lBWw08TZZnFWIpcY+yiUq084Y6uzDvnSx9OkGiBUw=;
	h=From:To:CC:Subject:Date;
	b=g+P8148uz2DbTl7bmSBPBwcsINSNYZ6/l/JzifqmxToD4wVspEO/UJ2c4f2VYPNbO
	oUKvG/F4ci6el+mXIZcW30Iic5yWZtbyKANt4q91ld9CM1HsAS/92yiOtSbDnZ1+nG
	thQICwNif1Fed5ZjGpHiMEs4xkk73fEQiAKTvB3g=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCNkp44069090
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 17:46:51 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 17:46:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 17:46:50 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCNkokQ060399;
	Thu, 12 Dec 2019 17:46:50 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 17:46:20 -0600
Message-ID: <20191212234620.103575-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.05][PATCH v2] tidl-api: fix package-qa issues
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
X-List-Received-Date: Thu, 12 Dec 2019 23:48:26 -0000
Content-Type: text/plain

- by putting SONAME in built shared libraries.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../0001-Fix-versioning-for-shared-libary.patch    | 55 ++++++++++++++++++++++
 .../recipes-ti/tidl-api/tidl-api_git.bb            |  6 ++-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch
new file mode 100644
index 00000000..d15389b8
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-shared-libary.patch
@@ -0,0 +1,55 @@
+tidl-api: Fix versioning for shared libary
+
+    SONAME needs to be properly set up in the generated shared library.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+---
+ tidl_api/Makefile | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/tidl_api/Makefile b/tidl_api/Makefile
+index a04e604..3a5ea69 100644
+--- a/tidl_api/Makefile
++++ b/tidl_api/Makefile
+@@ -37,6 +37,8 @@ all: $(LIB_NAME) $(LIB_IMGUTIL_NAME) $(PY_LIB_NAME) \
+ include make.inc
+ include make.buildid
+ 
++SO_VER=$(MAJOR_VER).$(MINOR_VER).$(PATCH_VER)
++
+ RM = rm
+ AR = ar
+ 
+@@ -95,7 +97,10 @@ $(LIB_NAME): $(HOST_OBJ_FILES)
+ 	$(AR) cr $@ $(HOST_OBJ_FILES)
+ 
+ $(SHARED_LIB_NAME): $(HOST_OBJ_FILES)
+-	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL $(HOST_OBJ_FILES) -o $@
++	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
++		-lOpenCL $(HOST_OBJ_FILES) -o $@.$(SO_VER)
++	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
++	ln -sf $@.$(MAJOR_VER) $@
+ 
+ $(PY_LIB_NAME): $(HOST_OBJ_PYBIND_FILES) $(LIB_NAME)
+ 	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL -locl_util $^ -o $@
+@@ -104,10 +109,14 @@ $(LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
+ 	$(AR) cr $@ $(HOST_OBJ_IMGUTIL_FILES)
+ 
+ $(SHARED_LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
+-	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared $(HOST_OBJ_IMGUTIL_FILES) -o $@
++	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
++		$(HOST_OBJ_IMGUTIL_FILES) -o $@.$(SO_VER)
++	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
++	ln -sf $@.$(MAJOR_VER) $@
+ 
+ clean::
+ 	$(RM) -f $(LIB_NAME) $(PY_LIB_NAME)
+ 	$(RM) -f $(LIB_IMGUTIL_NAME)
++	$(RM) -f $(SHARED_LIB_NAME)* $(SHARED_LIB_IMGUTIL_NAME)*
+ 	$(RM) -rf obj
+ 
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index a8829c1b..c96fa337 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -6,7 +6,8 @@ LICENSE = "BSD"
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+SRC_URI += "file://0001-Fix-versioning-for-shared-libary.patch"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -42,10 +43,11 @@ do_install() {
     install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
     install -d ${D}${TIDL_INSTALL_DIR}/viewer
     install -d ${D}${libdir}
+    cp ${CP_ARGS} ${S}/tidl_api/libtidl_*.so* ${D}${libdir}
+    rm -f ${S}/tidl_api/libtidl_*.so*
     cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
     cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
     install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
-    cp ${CP_ARGS} ${S}/tidl_api/libtidl_*.so ${D}${libdir}
 }
 
 FILES_${PN} += "\
-- 
2.14.1


