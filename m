Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E3EC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 19:00:05 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.23970.1737486000930608442
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 11:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=t9Gawzxo;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LIxxjv055200
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 13:00:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737486000;
	bh=+NXyoUleX3AgmVGNMRVgdyQc9ViFd1WxmxK2aT3NcSk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=t9Gawzxouq5WDY9qHNqej0yrDSmYPgExpB28BJjn+RlaQtod0EOFhw9Zp4IJ0JoRD
	 q9Igbr5LLjD8Y9pVuA5Nt0str+CM0dIk6JHBlSQq2zfA0yqfPmQbFSJrN0J3/8rGto
	 Cjf+ECgw++G+UjhtO9i9maz9do6R26u+LUl2p+Dc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LIxxuA031849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 12:59:59 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 12:59:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 12:59:59 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LIxxFI026099;
	Tue, 21 Jan 2025 12:59:59 -0600
Message-ID: <553b95fc-e905-485d-8a8d-cd25e9ca1e24@ti.com>
Date: Tue, 21 Jan 2025 12:59:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/6] meta-arago-extras: Add
 recipe for ONNX
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-6-afd@ti.com>
 <1fd5c056-6311-4c74-bd75-706f82b7d189@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1fd5c056-6311-4c74-bd75-706f82b7d189@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50LIxxjv055200
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 19:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15728

On 1/18/25 1:48 PM, Chirag Shilwant wrote:
> Hi Andrew,
>=20
> On 17/01/25 05:55, Andrew Davis wrote:
>> ONNX provides an open source format for AI models, both deep learning
>> and traditional ML. It defines an extensible computation graph model,
>> as well as definitions of built-in operators and standard data types.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 ...age-Protobuf-before-checking-if-it-w.patch |=C2=A0 25 ++++
>> =C2=A0 .../recipes-framework/onnx/onnx_1.16.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 | 107 ++++++++++++++++++
>> =C2=A0 2 files changed, 132 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-framework/onnx/onn=
x/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-framework/onnx/onn=
x_1.16.1.bb
>>
>> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to=
-find-package-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras/=
recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-chec=
king-if-it-w.patch
>> new file mode 100644
>> index 00000000..dceac1f4
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-p=
ackage-Protobuf-before-checking-if-it-w.patch
>> @@ -0,0 +1,25 @@
>> +From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 200=
1
>> +From: Andrew Davis <afd@ti.com>
>> +Date: Thu, 16 Jan 2025 11:44:56 -0600
>> +Subject: [PATCH] Try to find package Protobuf before checking if it w=
as found
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Andrew Davis <afd@ti.com>
>> +---
>> + CMakeLists.txt | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index b666eec4..f6fbf159 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
>> +=C2=A0=C2=A0 set(googletest_STATIC_LIBRARIES GTest::gtest)
>> + endif()
>> +
>> ++find_package(Protobuf)
>> ++
>> + if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((=
NOT ONNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
>> +=C2=A0=C2=A0 # Sometimes we need to use protoc compiled for host arch=
itecture while linking
>> +=C2=A0=C2=A0 # libprotobuf against target architecture. See https://g=
ithub.com/caffe2/caffe
>> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b=
/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>> new file mode 100644
>> index 00000000..9624d061
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>> @@ -0,0 +1,107 @@
>> +DESCRIPTION =3D "Open standard for machine learning interoperability"
>> +SUMMARY =3D "ONNX Python package & C++ library"
>> +HOMEPAGE =3D "https://www.onnx.ai/"
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> +
>> +SRC_URI =3D "git://github.com/onnx/onnx.git;protocol=3Dhttps;branch=3D=
rel-1.16.1"
>> +SRC_URI +=3D "file://0001-Try-to-find-package-Protobuf-before-checkin=
g-if-it-w.patch"
>> +SRCREV =3D "595228d99e3977ac27cb79d5963adda262af99ad"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +DEPENDS +=3D "\
>> +=C2=A0=C2=A0=C2=A0 abseil-cpp \
>> +=C2=A0=C2=A0=C2=A0 protobuf \
>> +=C2=A0=C2=A0=C2=A0 protobuf-native \
>> +=C2=A0=C2=A0=C2=A0 python3-protobuf \
>> +=C2=A0=C2=A0=C2=A0 python3-protobuf-native \
>> +"
>> +
>> +PYTHON_DEPENDS =3D "\
>> +=C2=A0=C2=A0=C2=A0 python3 \
>=20
>=20
>=20
> Nitpick,
>=20
> To have a consistency across the entire recipe,
> I think it would be better to use PYTHON_PN (as done at PACKAGE_BEFORE_=
PN)
> OR keep it static as python3 for all references
>=20

Good idea, seems most recipes just use "python3" and not PYTHON_PN, so I'=
ll
switch to that. Better to be explicit on which python we need. (I just ho=
pe
we never have to deal with a python4 someday :D)

Andrew

>=20
> --=20
> Chirag
>=20
>=20
>=20
>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy-native \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11-native \
>> +"
>> +
>> +PYTHON_RDEPENDS =3D "\
>> +=C2=A0=C2=A0=C2=A0 python3 \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>> +=C2=A0=C2=A0=C2=A0 python3-protobuf \
>> +=C2=A0=C2=A0=C2=A0 python3-coloredlogs \
>> +=C2=A0=C2=A0=C2=A0 python3-flatbuffers \
>> +=C2=A0=C2=A0=C2=A0 python3-sympy \
>> +"
>> +
>> +PACKAGECONFIG ??=3D "python sharedlib unittests"
>> +
>> +PACKAGECONFIG[python] =3D "\
>> +=C2=A0=C2=A0=C2=A0 -DBUILD_ONNX_PYTHON=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DPYTHON_LIBRARY=3D${PYTHON_LIBRARY} \
>> +=C2=A0=C2=A0=C2=A0 -DPYTHON_INCLUDE_DIRS=3D${PYTHON_INCLUDE_DIR}, \
>> +=C2=A0=C2=A0=C2=A0 -DBUILD_ONNX_PYTHON=3DOFF, \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_DEPENDS} \
>> +"
>> +
>> +PACKAGECONFIG[sharedlib] =3D "-DBUILD_SHARED_LIBS=3DON, -D-DBUILD_SHA=
RED_LIBS=3DOFF"
>> +PACKAGECONFIG[unittests] =3D "-DONNX_BUILD_TESTS=3DON, -DONNX_BUILD_T=
ESTS=3DOFF, googletest"
>> +
>> +EXTRA_OECMAKE:append =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR=
_NATIVE}/protoc \
>> +=C2=A0=C2=A0=C2=A0 -DONNX_USE_PROTOBUF_SHARED_LIBS=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DONNX_DISABLE_STATIC_REGISTRATION=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DONNX_ML=3D1 \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE=3DON \
>> +=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>> +"
>> +
>> +inherit python3native cmake
>> +
>> +python do_build_version_file() {
>> +=C2=A0=C2=A0=C2=A0 import os
>> +=C2=A0=C2=A0=C2=A0 import textwrap
>> +
>> +=C2=A0=C2=A0=C2=A0 version_file_path =3D os.path.join(d.getVar('B'), =
"onnx", "version.py")
>> +=C2=A0=C2=A0=C2=A0 os.makedirs(os.path.dirname(version_file_path), ex=
ist_ok=3DTrue)
>> +=C2=A0=C2=A0=C2=A0 with open(version_file_path, "w", encoding=3D"utf-=
8") as f:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.write(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
xtwrap.dedent(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 f"""\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # This file is generated. DO NOT EDIT!
>> +
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 version =3D "{d.getVar('PV')}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 git_version =3D "{d.getVar('SRCREV')}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> +}
>> +addtask build_version_file before do_install after do_compile
>> +
>> +do_install:append() {
>> +=C2=A0=C2=A0=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-=
preserve=3Downership"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install the Python package.
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'python',=
 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SI=
TEPACKAGES_DIR}/onnx
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cd ${S}/onnx; cp --parent=
s $(find . -name "*.py*") ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${B}/onnx ${D}=
${PYTHON_SITEPACKAGES_DIR}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${B}/onnx_cpp2=
py_export.so ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
>> +=C2=A0=C2=A0=C2=A0 fi
>> +}
>> +
>> +# Add Python package
>> +PACKAGE_BEFORE_PN +=3D "${PYTHON_PN}-${PN}"
>> +FILES:${PYTHON_PN}-${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
>> +RDEPENDS:${PYTHON_PN}-${PN} +=3D "${PYTHON_RDEPENDS} onnx"
>> +
>> +# Output library is unversioned
>> +SOLIBS =3D ".so"
>> +FILES_SOLIBSDEV =3D ""
>> +
>> +# TODO: ONNXConfig.cmake in package onnx-dev contains reference to TM=
PDIR
>> +INSANE_SKIP:${PN}-dev =3D "buildpaths"

