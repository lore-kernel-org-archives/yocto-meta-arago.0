Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FB4C02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 19:49:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2298.1737229743411913856
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 18 Jan 2025 11:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZbCIrBYJ;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50IJn1mB381474
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Jan 2025 13:49:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737229742;
	bh=Eh0+/G+i0Lb9wpXdDHBOzoxNIjzY8y48gbatgjK9fRg=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=ZbCIrBYJY1yl9YM40zSRzqjP2bQ+nhkZ70zJpnSZkaKeSGutYjr8aLLbJENjBWMJ+
	 oQQdr+OJo+2fs44RY6UodLUGiPsw6wfif6fAdIU33RsnieGrePcumRVJs5fINzayMU
	 f8OizpZyOOzS6sKe4STuX9GfuJv+79gkkXByt7g8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50IJn13F104869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 18 Jan 2025 13:49:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 18
 Jan 2025 13:49:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 18 Jan 2025 13:49:01 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50IJmxMD112515;
	Sat, 18 Jan 2025 13:49:00 -0600
Message-ID: <1fd5c056-6311-4c74-bd75-706f82b7d189@ti.com>
Date: Sun, 19 Jan 2025 01:18:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/6] meta-arago-extras: Add
 recipe for ONNX
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-6-afd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250117002520.627504-6-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 18 Jan 2025 19:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15712

Hi Andrew,

On 17/01/25 05:55, Andrew Davis wrote:
> ONNX provides an open source format for AI models, both deep learning
> and traditional ML. It defines an extensible computation graph model,
> as well as definitions of built-in operators and standard data types.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   ...age-Protobuf-before-checking-if-it-w.patch |  25 ++++
>   .../recipes-framework/onnx/onnx_1.16.1.bb     | 107 ++++++++++++++++++
>   2 files changed, 132 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
>   create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
>
> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
> new file mode 100644
> index 00000000..dceac1f4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
> @@ -0,0 +1,25 @@
> +From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 2001
> +From: Andrew Davis <afd@ti.com>
> +Date: Thu, 16 Jan 2025 11:44:56 -0600
> +Subject: [PATCH] Try to find package Protobuf before checking if it was found
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andrew Davis <afd@ti.com>
> +---
> + CMakeLists.txt | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b666eec4..f6fbf159 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
> +   set(googletest_STATIC_LIBRARIES GTest::gtest)
> + endif()
> +
> ++find_package(Protobuf)
> ++
> + if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((NOT ONNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
> +   # Sometimes we need to use protoc compiled for host architecture while linking
> +   # libprotobuf against target architecture. See https://github.com/caffe2/caffe
> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
> new file mode 100644
> index 00000000..9624d061
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
> @@ -0,0 +1,107 @@
> +DESCRIPTION = "Open standard for machine learning interoperability"
> +SUMMARY = "ONNX Python package & C++ library"
> +HOMEPAGE = "https://www.onnx.ai/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI = "git://github.com/onnx/onnx.git;protocol=https;branch=rel-1.16.1"
> +SRC_URI += "file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch"
> +SRCREV = "595228d99e3977ac27cb79d5963adda262af99ad"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "\
> +	abseil-cpp \
> +	protobuf \
> +	protobuf-native \
> +	python3-protobuf \
> +	python3-protobuf-native \
> +"
> +
> +PYTHON_DEPENDS = "\
> +	python3 \



Nitpick,

To have a consistency across the entire recipe,
I think it would be better to use PYTHON_PN (as done at PACKAGE_BEFORE_PN)
OR keep it static as python3 for all references


--
Chirag



> +	python3-numpy \
> +	python3-numpy-native \
> +	python3-pybind11 \
> +	python3-pybind11-native \
> +"
> +
> +PYTHON_RDEPENDS = "\
> +	python3 \
> +	python3-numpy \
> +	python3-protobuf \
> +	python3-coloredlogs \
> +	python3-flatbuffers \
> +	python3-sympy \
> +"
> +
> +PACKAGECONFIG ??= "python sharedlib unittests"
> +
> +PACKAGECONFIG[python] = "\
> +	-DBUILD_ONNX_PYTHON=ON \
> +	-DPYTHON_LIBRARY=${PYTHON_LIBRARY} \
> +	-DPYTHON_INCLUDE_DIRS=${PYTHON_INCLUDE_DIR}, \
> +	-DBUILD_ONNX_PYTHON=OFF, \
> +	${PYTHON_DEPENDS} \
> +"
> +
> +PACKAGECONFIG[sharedlib] = "-DBUILD_SHARED_LIBS=ON, -D-DBUILD_SHARED_LIBS=OFF"
> +PACKAGECONFIG[unittests] = "-DONNX_BUILD_TESTS=ON, -DONNX_BUILD_TESTS=OFF, googletest"
> +
> +EXTRA_OECMAKE:append = " \
> +	-DONNX_CUSTOM_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
> +	-DONNX_USE_PROTOBUF_SHARED_LIBS=ON \
> +	-DONNX_DISABLE_STATIC_REGISTRATION=ON \
> +	-DONNX_ML=1 \
> +	-DCMAKE_VERBOSE_MAKEFILE=ON \
> +	--log-level=VERBOSE \
> +"
> +
> +inherit python3native cmake
> +
> +python do_build_version_file() {
> +    import os
> +    import textwrap
> +
> +    version_file_path = os.path.join(d.getVar('B'), "onnx", "version.py")
> +    os.makedirs(os.path.dirname(version_file_path), exist_ok=True)
> +    with open(version_file_path, "w", encoding="utf-8") as f:
> +        f.write(
> +            textwrap.dedent(
> +                f"""\
> +                # This file is generated. DO NOT EDIT!
> +
> +
> +                version = "{d.getVar('PV')}"
> +                git_version = "{d.getVar('SRCREV')}"
> +                """
> +            )
> +        )
> +}
> +addtask build_version_file before do_install after do_compile
> +
> +do_install:append() {
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +	# Install the Python package.
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> +		install -d ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
> +		(cd ${S}/onnx; cp --parents $(find . -name "*.py*") ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
> +		cp $CP_ARGS ${B}/onnx ${D}${PYTHON_SITEPACKAGES_DIR}
> +		cp $CP_ARGS ${B}/onnx_cpp2py_export.so ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
> +	fi
> +}
> +
> +# Add Python package
> +PACKAGE_BEFORE_PN += "${PYTHON_PN}-${PN}"
> +FILES:${PYTHON_PN}-${PN} += "${PYTHON_SITEPACKAGES_DIR}"
> +RDEPENDS:${PYTHON_PN}-${PN} += "${PYTHON_RDEPENDS} onnx"
> +
> +# Output library is unversioned
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""
> +
> +# TODO: ONNXConfig.cmake in package onnx-dev contains reference to TMPDIR
> +INSANE_SKIP:${PN}-dev = "buildpaths"

