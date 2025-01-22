Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0656AC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 16:30:22 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.47841.1737563419920959992
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 08:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wX9TBf4b;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MGUIEi1044345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 10:30:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737563418;
	bh=9Wa/fKzhB5J6yEL+15/KGY7Evm3a2W6vonBJiFjCvx4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wX9TBf4bQYtxaz5FEvLTDP6eIySgDx/NOnzs56eTp3yqoI1OcFlRm/W6wlTZZHBHD
	 jdalMCrI0q2v0NHUydJKSNT7Vewd7OxdUvXXndXN02q8ztBkDKgZZVUqVtApggOY5n
	 PKcHnFfdGBvcadF3o7Z2Zn9oPaPTytdtT/7D3nco=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MGUIM5060535;
	Wed, 22 Jan 2025 10:30:18 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 10:30:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 10:30:17 -0600
Received: from [10.249.32.65] ([10.249.32.65])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MGUInd015397;
	Wed, 22 Jan 2025 10:30:18 -0600
Message-ID: <8cba017e-3af0-4901-a31e-caed274fb72e@ti.com>
Date: Wed, 22 Jan 2025 10:30:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/6] meta-arago-extras: Add
 recipe for ONNX
To: Andrew Davis <afd@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-6-afd@ti.com>
 <1fd5c056-6311-4c74-bd75-706f82b7d189@ti.com>
 <553b95fc-e905-485d-8a8d-cd25e9ca1e24@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <553b95fc-e905-485d-8a8d-cd25e9ca1e24@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 50MGUIEi1044345
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Jan 2025 16:30:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15735



On 1/21/2025 12:59 PM, Andrew Davis wrote:
> On 1/18/25 1:48 PM, Chirag Shilwant wrote:
>> Hi Andrew,
>>
>> On 17/01/25 05:55, Andrew Davis wrote:
>>> ONNX provides an open source format for AI models, both deep learning
>>> and traditional ML. It defines an extensible computation graph model,
>>> as well as definitions of built-in operators and standard data types.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 ...age-Protobuf-before-checking-if-it-w.patch |=C2=A0 25 ++++
>>> =C2=A0 .../recipes-framework/onnx/onnx_1.16.1.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 107 ++++++++++++++++++
>>> =C2=A0 2 files changed, 132 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-packag=
e-Protobuf-before-checking-if-it-w.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-pack=
age-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras/recipes-fr=
amework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it=
-w.patch
>>> new file mode 100644
>>> index 00000000..dceac1f4
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-pack=
age-Protobuf-before-checking-if-it-w.patch
>>> @@ -0,0 +1,25 @@
>>> +From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 16 Jan 2025 11:44:56 -0600
>>> +Subject: [PATCH] Try to find package Protobuf before checking if it=20
>>> was found
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +---
>>> + CMakeLists.txt | 2 ++
>>> + 1 file changed, 2 insertions(+)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index b666eec4..f6fbf159 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
>>> +=C2=A0=C2=A0 set(googletest_STATIC_LIBRARIES GTest::gtest)
>>> + endif()
>>> +
>>> ++find_package(Protobuf)
>>> ++
>>> + if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR=20
>>> ((NOT ONNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
>>> +=C2=A0=C2=A0 # Sometimes we need to use protoc compiled for host arc=
hitecture=20
>>> while linking
>>> +=C2=A0=C2=A0 # libprotobuf against target architecture. See=20
>>> https://github.com/caffe2/caffe
>>> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb=20
>>> b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>>> new file mode 100644
>>> index 00000000..9624d061
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>>> @@ -0,0 +1,107 @@
>>> +DESCRIPTION =3D "Open standard for machine learning interoperability=
"
>>> +SUMMARY =3D "ONNX Python package & C++ library"
>>> +HOMEPAGE =3D "https://www.onnx.ai/"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>>> +
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>> +
>>> +SRC_URI =3D=20
>>> "git://github.com/onnx/onnx.git;protocol=3Dhttps;branch=3Drel-1.16.1"
>>> +SRC_URI +=3D=20
>>> "file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.pat=
ch"
>>> +SRCREV =3D "595228d99e3977ac27cb79d5963adda262af99ad"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +DEPENDS +=3D "\
>>> +=C2=A0=C2=A0=C2=A0 abseil-cpp \
>>> +=C2=A0=C2=A0=C2=A0 protobuf \
>>> +=C2=A0=C2=A0=C2=A0 protobuf-native \
>>> +=C2=A0=C2=A0=C2=A0 python3-protobuf \
>>> +=C2=A0=C2=A0=C2=A0 python3-protobuf-native \
>>> +"
>>> +
>>> +PYTHON_DEPENDS =3D "\
>>> +=C2=A0=C2=A0=C2=A0 python3 \
>>
>>
>>
>> Nitpick,
>>
>> To have a consistency across the entire recipe,
>> I think it would be better to use PYTHON_PN (as done at=20
>> PACKAGE_BEFORE_PN)
>> OR keep it static as python3 for all references
>>
>=20
> Good idea, seems most recipes just use "python3" and not PYTHON_PN, so =
I'll
> switch to that. Better to be explicit on which python we need. (I just =
hope
> we never have to deal with a python4 someday :D)
>=20
> Andrew

Does this mean a v2 is coming for this series?  I'm getting a little=20
lost since you keep sending some of the same patches under new series=20
names...  I'll wait to process all of these until we get the v2.



>>
>> --=20
>> Chirag
>>
>>
>>
>>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>>> +=C2=A0=C2=A0=C2=A0 python3-numpy-native \
>>> +=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>>> +=C2=A0=C2=A0=C2=A0 python3-pybind11-native \
>>> +"
>>> +
>>> +PYTHON_RDEPENDS =3D "\
>>> +=C2=A0=C2=A0=C2=A0 python3 \
>>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>>> +=C2=A0=C2=A0=C2=A0 python3-protobuf \
>>> +=C2=A0=C2=A0=C2=A0 python3-coloredlogs \
>>> +=C2=A0=C2=A0=C2=A0 python3-flatbuffers \
>>> +=C2=A0=C2=A0=C2=A0 python3-sympy \
>>> +"
>>> +
>>> +PACKAGECONFIG ??=3D "python sharedlib unittests"
>>> +
>>> +PACKAGECONFIG[python] =3D "\
>>> +=C2=A0=C2=A0=C2=A0 -DBUILD_ONNX_PYTHON=3DON \
>>> +=C2=A0=C2=A0=C2=A0 -DPYTHON_LIBRARY=3D${PYTHON_LIBRARY} \
>>> +=C2=A0=C2=A0=C2=A0 -DPYTHON_INCLUDE_DIRS=3D${PYTHON_INCLUDE_DIR}, \
>>> +=C2=A0=C2=A0=C2=A0 -DBUILD_ONNX_PYTHON=3DOFF, \
>>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_DEPENDS} \
>>> +"
>>> +
>>> +PACKAGECONFIG[sharedlib] =3D "-DBUILD_SHARED_LIBS=3DON,=20
>>> -D-DBUILD_SHARED_LIBS=3DOFF"
>>> +PACKAGECONFIG[unittests] =3D "-DONNX_BUILD_TESTS=3DON,=20
>>> -DONNX_BUILD_TESTS=3DOFF, googletest"
>>> +
>>> +EXTRA_OECMAKE:append =3D " \
>>> +=C2=A0=C2=A0=C2=A0 -DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDI=
R_NATIVE}/protoc \
>>> +=C2=A0=C2=A0=C2=A0 -DONNX_USE_PROTOBUF_SHARED_LIBS=3DON \
>>> +=C2=A0=C2=A0=C2=A0 -DONNX_DISABLE_STATIC_REGISTRATION=3DON \
>>> +=C2=A0=C2=A0=C2=A0 -DONNX_ML=3D1 \
>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE=3DON \
>>> +=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>>> +"
>>> +
>>> +inherit python3native cmake
>>> +
>>> +python do_build_version_file() {
>>> +=C2=A0=C2=A0=C2=A0 import os
>>> +=C2=A0=C2=A0=C2=A0 import textwrap
>>> +
>>> +=C2=A0=C2=A0=C2=A0 version_file_path =3D os.path.join(d.getVar('B'),=
 "onnx",=20
>>> "version.py")
>>> +=C2=A0=C2=A0=C2=A0 os.makedirs(os.path.dirname(version_file_path), e=
xist_ok=3DTrue)
>>> +=C2=A0=C2=A0=C2=A0 with open(version_file_path, "w", encoding=3D"utf=
-8") as f:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.write(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
extwrap.dedent(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 f"""\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # This file is generated. DO NOT EDIT!
>>> +
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 version =3D "{d.getVar('PV')}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 git_version =3D "{d.getVar('SRCREV')}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 """
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> +}
>>> +addtask build_version_file before do_install after do_compile
>>> +
>>> +do_install:append() {
>>> +=C2=A0=C2=A0=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no=
-preserve=3Downership"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Install the Python package.
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'python'=
, 'true',=20
>>> 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_S=
ITEPACKAGES_DIR}/onnx
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cd ${S}/onnx; cp --paren=
ts $(find . -name "*.py*")=20
>>> ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${B}/onnx ${D=
}${PYTHON_SITEPACKAGES_DIR}
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${B}/onnx_cpp=
2py_export.so=20
>>> ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +}
>>> +
>>> +# Add Python package
>>> +PACKAGE_BEFORE_PN +=3D "${PYTHON_PN}-${PN}"
>>> +FILES:${PYTHON_PN}-${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
>>> +RDEPENDS:${PYTHON_PN}-${PN} +=3D "${PYTHON_RDEPENDS} onnx"
>>> +
>>> +# Output library is unversioned
>>> +SOLIBS =3D ".so"
>>> +FILES_SOLIBSDEV =3D ""
>>> +
>>> +# TODO: ONNXConfig.cmake in package onnx-dev contains reference to=20
>>> TMPDIR
>>> +INSANE_SKIP:${PN}-dev =3D "buildpaths"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

