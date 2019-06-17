Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EABE452092
	for <meta-arago@arago-project.org>;
	Mon, 17 Jun 2019 12:53:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HCrENt042695
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560775994;
	bh=wn5eNjNbT2/7Zk+jAnjaQS3fbpV0PfmTWVIFW8umqyI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MxxCm5M9dVXvpUlZ+ZST7nXLM6sbYfO7PlR7Ys/aUBiYuiZPzZtfyTRNYxzNQ45yt
	h14lmks0uqeJOuQV9IueQ1WM+Pb0pflw6pWgMJxom4GeVQLfV5ghgGjBLiltzlUb5c
	9mTvDG9Q4u/G2dxuwHCtPmleNcy54f3JXAGnnjMY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HCrExI044388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 07:53:14 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 07:53:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 07:53:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HCrDI0123306;
	Mon, 17 Jun 2019 07:53:13 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190614131008.9336-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <947beeca-0e7d-bdc9-67af-596199381f93@ti.com>
Date: Mon, 17 Jun 2019 08:53:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614131008.9336-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] armnn: Fix issue with new version of protobuf 3.6.1, and new toolchain warning settings
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
X-List-Received-Date: Mon, 17 Jun 2019 12:53:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2019.01?


Thank you,

Jake

On 6/14/2019 9:10 AM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../recipes-support/armnn/armnn-caffe_git.bb  | 10 +++----
>   .../recipes-support/armnn/armnn-onnx_git.bb   | 10 +++----
>   ...verflow-warning-resulting-in-compila.patch | 27 +++++++++++++++++++
>   .../recipes-support/armnn/armnn_git.bb        |  1 +
>   4 files changed, 38 insertions(+), 10 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
>
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
> index 509324bc..a435ed75 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
> @@ -2,20 +2,20 @@ SUMMARY = "Caffe protobuf files - used in ARMNN for Caffe network models"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://caffeImport/LICENSE;md5=91d560803ea3d191c457b12834553991"
>   
> -SRC_URI = " \
> -    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
> -"
> +SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
> +           "
> +
> +SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
>   
>   PV = "1.0"
>   
>   BRANCH = "master"
> -SRCREV = "16030b2e43de6143f371072d54760737ddda0645"
>   
>   S = "${WORKDIR}/git"
>   
>   do_install() {
>           install -d ${D}${datadir}/${BPN}/caffe/proto/
> -        for file in ${S}/caffeImport/*
> +        for file in ${S}/caffeImport/ver361/*
>           do
>               install -m 0644 $file ${D}${datadir}/${BPN}/caffe/proto/
>           done
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
> index 80a957b3..d0f0c70d 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
> @@ -2,20 +2,20 @@ SUMMARY = "Onnx protobuf files - used in ARMNN for Onnx network models"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://onnxImport/LICENSE;md5=077ce3eaeaea91462d41c566300d2a02"
>   
> -SRC_URI = " \
> -    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
> -"
> +SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
> +           "
> +
> +SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
>   
>   PV = "1.0"
>   
>   BRANCH = "master"
> -SRCREV = "af39cf346f602bd2aa75db1e9b31636b78d4e31b"
>   
>   S = "${WORKDIR}/git"
>   
>   do_install() {
>           install -d ${D}${datadir}/${BPN}/onnx/
> -        for file in ${S}/onnxImport/*
> +        for file in ${S}/onnxImport/ver361/*
>           do
>               install -m 0644 $file ${D}${datadir}/${BPN}/onnx/
>           done
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
> new file mode 100644
> index 00000000..b6f11024
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
> @@ -0,0 +1,27 @@
> +From 4f5d63b026f225f6499e0a401d9b2769e8ef0a80 Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Wed, 12 Jun 2019 13:12:09 -0400
> +Subject: [PATCH] Avoid stringop-overflow warning resulting in compilation
> + error
> +
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
> +---
> + src/armnn/LayerSupport.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/armnn/LayerSupport.cpp b/src/armnn/LayerSupport.cpp
> +index 12b3c403..09c973e5 100644
> +--- a/src/armnn/LayerSupport.cpp
> ++++ b/src/armnn/LayerSupport.cpp
> +@@ -25,6 +25,8 @@ void CopyErrorMessage(char* truncatedString, const char* fullString, size_t maxL
> +     if(truncatedString != nullptr)
> +     {
> +         size_t copyLength = std::min(maxLength, strlen(fullString));
> ++        if(copyLength > 255) copyLength = 255; //Put source length independent upper bound
> ++
> +         std::strncpy(truncatedString, fullString, copyLength);
> +         // Ensure null-terminated string.
> +         truncatedString[copyLength] = '\0';
> +--
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> index ff1bfbdd..b5ebd129 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -28,6 +28,7 @@ SRC_URI = " \
>       file://0005-add-armnn-mobilenet-test-example.patch \
>       file://0006-armnn-mobilenet-test-example.patch \
>       file://0007-enable-use-of-arm-compute-shared-library.patch \
> +    file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
>       http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
>       git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
>   "

