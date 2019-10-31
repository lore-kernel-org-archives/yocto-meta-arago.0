Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AB8C7520E2
	for <meta-arago@arago-project.org>;
	Thu, 31 Oct 2019 14:13:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VEBkRh003060
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 09:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572531106;
	bh=kEg3ppX33Wbgyzt6ew9xT/7Sc4HtO5eZ1vjc0uJOYk8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YcQzVOkToejIcz8flQXKMrp7sUotMYYjAJMQ4tTrLBWMSEztDzTaA2k6Epv58ycYu
	hU/kocIbs4pFMBiHoOH6AtzX5DDXZxTUtNP0MaoCyCpLrdKzZ314Gmu8Z3Q7NYFN9U
	867eBcRPjbo+8JaWzTLy9yTJrWj8uyQWNIaYDb14=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VEBkXh042319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 09:11:46 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 31 Oct 2019 09:11:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 31 Oct 2019 09:11:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VEBjAF093284;
	Thu, 31 Oct 2019 09:11:45 -0500
Date: Thu, 31 Oct 2019 10:11:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20191031141145.GE32214@beryl>
References: <20191030165239.17804-1-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191030165239.17804-1-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master] [PATCH 2/3 v2] tensorflow-lite: update to version 1.15
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
X-List-Received-Date: Thu, 31 Oct 2019 14:13:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 30, 2019 at 12:52:39PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v2 change: add back Upstream-Status for the Makefile patch

[...]

> -MD5SUM_EIGEN = "4c884968ede816a84c70e2cd2c81de8d"
> -SHA256SUM_EIGEN = "d956415d784fa4e42b6a2a45c32556d6aec9d0a3d8ef48baee2522ab762556a9"
> +MD5SUM_EIGEN = "a28a728acb3298471b11132ab5c0c3cb"
> +SHA256SUM_EIGEN = "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f807078522fda52114b5c"
>  MD5SUM_FARMHASH = "f039a65a7f62bdb6c4b4c8a732638d80"
>  SHA256SUM_FARMHASH = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
> -MD5SUM_GEMMLOWP = "a90a2161ad8ee4ccf724f56e07637601"
> -SHA256SUM_GEMMLOWP = "b87faa7294dfcc5d678f22a59d2c01ca94ea1e2a3b488c38a95a67889ed0a658"
> +MD5SUM_GEMMLOWP = "09cf63d1d388a2753de3323684da70ed"
> +SHA256SUM_GEMMLOWP = "6678b484d929f2d0d3229d8ac4e3b815a950c86bb9f17851471d143f6d4f7834"
>  MD5SUM_GTEST = "16877098823401d1bf2ed7891d7dce36"
>  SHA256SUM_GTEST = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
> -MD5SUM_ABSLCPP = "7c9945f256d3733a8eade255afcbd072"
> -SHA256SUM_ABSLCPP = "7dd09690ae7ca4551de3111d4a86b75b23ec17445f273d3c42bdcdc1c7b02e4e"
> +MD5SUM_ABSLCPP = "7abf3aae8d57874d2eb04c4b92736208"
> +SHA256SUM_ABSLCPP = "acd93f6baaedc4414ebd08b33bebca7c7a46888916101d8c0b8083573526d070"
>  MD5SUM_NEON2SSE = "276619db5393450c223b7c4e47e848ce"
>  SHA256SUM_NEON2SSE = "8cc98e95c86d362dd6f003b35a9517a9928e3fd387b33188b0442df13245a17b"
> -MD5SUM_FLATBUFFER = "3811552512049fac3af419130904bc55"
> -SHA256SUM_FLATBUFFER = "b2bb0311ca40b12ebe36671bdda350b10c7728caf0cfe2d432ea3b6e409016f3"
> +MD5SUM_FLATBUFFER = "02c64880acb89dbd57eebacfd67200d8"
> +SHA256SUM_FLATBUFFER = "3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b"
>  MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
>  SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
>  
> -SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=https \
> -    https://bitbucket.org/eigen/eigen/get/fd6845384b86.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
> -    https://mirror.bazel.build/github.com/google/gemmlowp/archive/38ebac7b059e84692f53e5938f97a9943c120d98.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
> +SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=https \
> +    https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
> +    https://mirror.bazel.build/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is 404 Not Found

$ wget https://mirror.bazel.build/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip
--2019-10-31 10:10:15--  https://mirror.bazel.build/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip
Resolving mirror.bazel.build (mirror.bazel.build)... 130.211.22.235
Connecting to mirror.bazel.build (mirror.bazel.build)|130.211.22.235|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-10-31 10:10:15 ERROR 404: Not Found.


>      https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
> -    https://github.com/abseil/abseil-cpp/archive/48cd2c3f351ff188bc85684b84a91b6e6d17d896.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
> +    https://github.com/abseil/abseil-cpp/archive/43ef2148c0936ebf7cb4be6b19927a9d9d145b8f.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
>      https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9c7fbdf8710c032d462ca10051.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
>      https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
> -    https://github.com/google/flatbuffers/archive/1f5eae5d6a135ff6811724f6c57f911d1f46bb15.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
> +    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/flatbuffers/archive/v1.11.0.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
>      https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
>      http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
> -    file://apply-modification-for-tflite-1.12-to-eigen.patch \
> -    file://0001-Makefile-add-label_image-example.patch \
> +    file://apply-modification-for-tflite-${PV}-to-eigen.patch \
> +    file://0001-Makefile-add-label_image-example-${PV}.patch \
>      file://tensorflow-lite.pc.in"
>  
>  SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
>  SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"

