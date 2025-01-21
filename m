Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AC9C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 19:25:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24635.1737487517536884777
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 11:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B975340C21;
	Tue, 21 Jan 2025 19:25:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBBI2xyGMhgB; Tue, 21 Jan 2025 19:25:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 760FC40B13;
	Tue, 21 Jan 2025 19:25:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3736116415B; Tue, 21 Jan 2025 14:25:12 -0500 (EST)
Date: Tue, 21 Jan 2025 14:25:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Chirag Shilwant <c-shilwant@ti.com>, meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/6] meta-arago-extras:
 Add recipe for ONNX
Message-ID: <20250121192512.GP21836@denix.org>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-6-afd@ti.com>
 <1fd5c056-6311-4c74-bd75-706f82b7d189@ti.com>
 <553b95fc-e905-485d-8a8d-cd25e9ca1e24@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <553b95fc-e905-485d-8a8d-cd25e9ca1e24@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 19:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15730

On Tue, Jan 21, 2025 at 12:59:59PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 1/18/25 1:48 PM, Chirag Shilwant wrote:
> >Hi Andrew,
> >
> >On 17/01/25 05:55, Andrew Davis wrote:
> >>ONNX provides an open source format for AI models, both deep learning
> >>and traditional ML. It defines an extensible computation graph model,
> >>as well as definitions of built-in operators and standard data types.
> >>
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>=A0 ...age-Protobuf-before-checking-if-it-w.patch |=A0 25 ++++
> >>=A0 .../recipes-framework/onnx/onnx_1.16.1.bb=A0=A0=A0=A0 | 107 +++++=
+++++++++++++
> >>=A0 2 files changed, 132 insertions(+)
> >>=A0 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/=
0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
> >>=A0 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx_=
1.16.1.bb
> >>
> >>diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-t=
o-find-package-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras=
/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-che=
cking-if-it-w.patch
> >>new file mode 100644
> >>index 00000000..dceac1f4
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-=
package-Protobuf-before-checking-if-it-w.patch
> >>@@ -0,0 +1,25 @@
> >>+From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 20=
01
> >>+From: Andrew Davis <afd@ti.com>
> >>+Date: Thu, 16 Jan 2025 11:44:56 -0600
> >>+Subject: [PATCH] Try to find package Protobuf before checking if it =
was found
> >>+
> >>+Upstream-Status: Pending
> >>+
> >>+Signed-off-by: Andrew Davis <afd@ti.com>
> >>+---
> >>+ CMakeLists.txt | 2 ++
> >>+ 1 file changed, 2 insertions(+)
> >>+
> >>+diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>+index b666eec4..f6fbf159 100644
> >>+--- a/CMakeLists.txt
> >>++++ b/CMakeLists.txt
> >>+@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
> >>+=A0=A0 set(googletest_STATIC_LIBRARIES GTest::gtest)
> >>+ endif()
> >>+
> >>++find_package(Protobuf)
> >>++
> >>+ if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR (=
(NOT ONNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
> >>+=A0=A0 # Sometimes we need to use protoc compiled for host architect=
ure while linking
> >>+=A0=A0 # libprotobuf against target architecture. See https://github=
.com/caffe2/caffe
> >>diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb =
b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
> >>new file mode 100644
> >>index 00000000..9624d061
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
> >>@@ -0,0 +1,107 @@
> >>+DESCRIPTION =3D "Open standard for machine learning interoperability=
"
> >>+SUMMARY =3D "ONNX Python package & C++ library"
> >>+HOMEPAGE =3D "https://www.onnx.ai/"
> >>+LICENSE =3D "Apache-2.0"
> >>+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> >>+
> >>+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> >>+
> >>+SRC_URI =3D "git://github.com/onnx/onnx.git;protocol=3Dhttps;branch=3D=
rel-1.16.1"
> >>+SRC_URI +=3D "file://0001-Try-to-find-package-Protobuf-before-checki=
ng-if-it-w.patch"
> >>+SRCREV =3D "595228d99e3977ac27cb79d5963adda262af99ad"
> >>+
> >>+S =3D "${WORKDIR}/git"
> >>+
> >>+DEPENDS +=3D "\
> >>+=A0=A0=A0 abseil-cpp \
> >>+=A0=A0=A0 protobuf \
> >>+=A0=A0=A0 protobuf-native \
> >>+=A0=A0=A0 python3-protobuf \
> >>+=A0=A0=A0 python3-protobuf-native \
> >>+"
> >>+
> >>+PYTHON_DEPENDS =3D "\
> >>+=A0=A0=A0 python3 \
> >
> >
> >
> >Nitpick,
> >
> >To have a consistency across the entire recipe,
> >I think it would be better to use PYTHON_PN (as done at PACKAGE_BEFORE=
_PN)
> >OR keep it static as python3 for all references
> >
>=20
> Good idea, seems most recipes just use "python3" and not PYTHON_PN, so =
I'll
> switch to that. Better to be explicit on which python we need. (I just =
hope
> we never have to deal with a python4 someday :D)

Heh, you never know. We've dealt with python2/python3 and needing to supp=
ort=20
both, as well as Qt3/Qt4/Qt5 (and Qt6 now), and gstreamer 0.10 vs. 1.0...


> >
> >>+=A0=A0=A0 python3-numpy \
> >>+=A0=A0=A0 python3-numpy-native \
> >>+=A0=A0=A0 python3-pybind11 \
> >>+=A0=A0=A0 python3-pybind11-native \
> >>+"
> >>+
> >>+PYTHON_RDEPENDS =3D "\
> >>+=A0=A0=A0 python3 \
> >>+=A0=A0=A0 python3-numpy \
> >>+=A0=A0=A0 python3-protobuf \
> >>+=A0=A0=A0 python3-coloredlogs \
> >>+=A0=A0=A0 python3-flatbuffers \
> >>+=A0=A0=A0 python3-sympy \
> >>+"
> >>+
> >>+PACKAGECONFIG ??=3D "python sharedlib unittests"
> >>+
> >>+PACKAGECONFIG[python] =3D "\
> >>+=A0=A0=A0 -DBUILD_ONNX_PYTHON=3DON \
> >>+=A0=A0=A0 -DPYTHON_LIBRARY=3D${PYTHON_LIBRARY} \
> >>+=A0=A0=A0 -DPYTHON_INCLUDE_DIRS=3D${PYTHON_INCLUDE_DIR}, \
> >>+=A0=A0=A0 -DBUILD_ONNX_PYTHON=3DOFF, \
> >>+=A0=A0=A0 ${PYTHON_DEPENDS} \
> >>+"
> >>+
> >>+PACKAGECONFIG[sharedlib] =3D "-DBUILD_SHARED_LIBS=3DON, -D-DBUILD_SH=
ARED_LIBS=3DOFF"
> >>+PACKAGECONFIG[unittests] =3D "-DONNX_BUILD_TESTS=3DON, -DONNX_BUILD_=
TESTS=3DOFF, googletest"
> >>+
> >>+EXTRA_OECMAKE:append =3D " \
> >>+=A0=A0=A0 -DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}=
/protoc \
> >>+=A0=A0=A0 -DONNX_USE_PROTOBUF_SHARED_LIBS=3DON \
> >>+=A0=A0=A0 -DONNX_DISABLE_STATIC_REGISTRATION=3DON \
> >>+=A0=A0=A0 -DONNX_ML=3D1 \
> >>+=A0=A0=A0 -DCMAKE_VERBOSE_MAKEFILE=3DON \
> >>+=A0=A0=A0 --log-level=3DVERBOSE \
> >>+"
> >>+
> >>+inherit python3native cmake
> >>+
> >>+python do_build_version_file() {
> >>+=A0=A0=A0 import os
> >>+=A0=A0=A0 import textwrap
> >>+
> >>+=A0=A0=A0 version_file_path =3D os.path.join(d.getVar('B'), "onnx", =
"version.py")
> >>+=A0=A0=A0 os.makedirs(os.path.dirname(version_file_path), exist_ok=3D=
True)
> >>+=A0=A0=A0 with open(version_file_path, "w", encoding=3D"utf-8") as f=
:
> >>+=A0=A0=A0=A0=A0=A0=A0 f.write(
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 textwrap.dedent(
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f"""\
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # This file is generat=
ed. DO NOT EDIT!
> >>+
> >>+
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 version =3D "{d.getVar=
('PV')}"
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 git_version =3D "{d.ge=
tVar('SRCREV')}"
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 """
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 )
> >>+=A0=A0=A0=A0=A0=A0=A0 )
> >>+}
> >>+addtask build_version_file before do_install after do_compile
> >>+
> >>+do_install:append() {
> >>+=A0=A0=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=
=3Downership"
> >>+
> >>+=A0=A0=A0 # Install the Python package.
> >>+=A0=A0=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true',=
 'false', d)}; then
> >>+=A0=A0=A0=A0=A0=A0=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
> >>+=A0=A0=A0=A0=A0=A0=A0 (cd ${S}/onnx; cp --parents $(find . -name "*.=
py*") ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
> >>+=A0=A0=A0=A0=A0=A0=A0 cp $CP_ARGS ${B}/onnx ${D}${PYTHON_SITEPACKAGE=
S_DIR}
> >>+=A0=A0=A0=A0=A0=A0=A0 cp $CP_ARGS ${B}/onnx_cpp2py_export.so ${D}${P=
YTHON_SITEPACKAGES_DIR}/onnx
> >>+=A0=A0=A0 fi
> >>+}
> >>+
> >>+# Add Python package
> >>+PACKAGE_BEFORE_PN +=3D "${PYTHON_PN}-${PN}"
> >>+FILES:${PYTHON_PN}-${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
> >>+RDEPENDS:${PYTHON_PN}-${PN} +=3D "${PYTHON_RDEPENDS} onnx"
> >>+
> >>+# Output library is unversioned
> >>+SOLIBS =3D ".so"
> >>+FILES_SOLIBSDEV =3D ""
> >>+
> >>+# TODO: ONNXConfig.cmake in package onnx-dev contains reference to T=
MPDIR
> >>+INSANE_SKIP:${PN}-dev =3D "buildpaths"

