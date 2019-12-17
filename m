Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 91A40529B5
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 11:33:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHBVrKP072336
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576582313;
	bh=Ey8kzVMEOK8ak5PxmFvzgCimgVW7duhoFJy214P8pT8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=JBRhR6SSVfNLgkRvGwQ73hKC3MY7WG3ecB2I2cK5891c9jLGFL//E4h8l5XR7FbdR
	fPTsrwyeR+TRvjq8ikG350Uzv7hfcfEiYCI+Cez5WwS4m8MXQzkgsPuRd7FHmGSFQh
	dzJCWYip+ecrPqML9vzCLDcr9vBjrHrsC00g8BSw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHBVq1D124088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:52 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 05:31:52 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 05:31:52 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master/thud/ti2019.05][PATCH v2]
	tidl-api: fix package-qa issues
Thread-Index: AQHVsUZxFg36Szi3DkaEC1KrE/rHIqe+OJdg
Date: Tue, 17 Dec 2019 11:31:52 +0000
Message-ID: <6d6369ebfe284b729690a91f1f31c416@ti.com>
References: <20191212234620.103575-1-yuanzhao@ti.com>
In-Reply-To: <20191212234620.103575-1-yuanzhao@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master/thud/ti2019.05][PATCH v2] tidl-api: fix package-qa issues
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
X-List-Received-Date: Tue, 17 Dec 2019 11:33:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please backport to ti2019.05.

Thank you,
Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Zhao (Compiler), Yuan
Sent: Thursday, December 12, 2019 6:46 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [master/thud/ti2019.05][PATCH v2] tidl-api=
: fix package-qa issues

- by putting SONAME in built shared libraries.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../0001-Fix-versioning-for-shared-libary.patch    | 55 ++++++++++++++++++=
++++
 .../recipes-ti/tidl-api/tidl-api_git.bb            |  6 ++-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-ve=
rsioning-for-shared-libary.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versionin=
g-for-shared-libary.patch b/meta-arago-extras/recipes-ti/tidl-api/files/000=
1-Fix-versioning-for-shared-libary.patch
new file mode 100644
index 00000000..d15389b8
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/files/0001-Fix-versioning-for-s=
hared-libary.patch
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
+=20
++SO_VER=3D$(MAJOR_VER).$(MINOR_VER).$(PATCH_VER)
++
+ RM =3D rm
+ AR =3D ar
+=20
+@@ -95,7 +97,10 @@ $(LIB_NAME): $(HOST_OBJ_FILES)
+ 	$(AR) cr $@ $(HOST_OBJ_FILES)
+=20
+ $(SHARED_LIB_NAME): $(HOST_OBJ_FILES)
+-	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL $(HOST_OBJ_FILES) -o =
$@
++	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
++		-lOpenCL $(HOST_OBJ_FILES) -o $@.$(SO_VER)
++	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
++	ln -sf $@.$(MAJOR_VER) $@
+=20
+ $(PY_LIB_NAME): $(HOST_OBJ_PYBIND_FILES) $(LIB_NAME)
+ 	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -lOpenCL -locl_util $^ -o $@
+@@ -104,10 +109,14 @@ $(LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
+ 	$(AR) cr $@ $(HOST_OBJ_IMGUTIL_FILES)
+=20
+ $(SHARED_LIB_IMGUTIL_NAME): $(HOST_OBJ_IMGUTIL_FILES)
+-	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared $(HOST_OBJ_IMGUTIL_FILES) -o $=
@
++	$(CXX) $(CXXFLAGS) -Wl,-Bsymbolic -shared -Wl,-soname,$@.$(MAJOR_VER) \
++		$(HOST_OBJ_IMGUTIL_FILES) -o $@.$(SO_VER)
++	ln -sf $@.$(SO_VER) $@.$(MAJOR_VER)
++	ln -sf $@.$(MAJOR_VER) $@
+=20
+ clean::
+ 	$(RM) -f $(LIB_NAME) $(PY_LIB_NAME)
+ 	$(RM) -f $(LIB_IMGUTIL_NAME)
++	$(RM) -f $(SHARED_LIB_NAME)* $(SHARED_LIB_IMGUTIL_NAME)*
+ 	$(RM) -rf obj
+=20
+--=20
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-a=
rago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index a8829c1b..c96fa337 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -6,7 +6,8 @@ LICENSE =3D "BSD"
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
=20
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
+SRC_URI +=3D "file://0001-Fix-versioning-for-shared-libary.patch"
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
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
=20
 FILES_${PN} +=3D "\
--=20
2.14.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

