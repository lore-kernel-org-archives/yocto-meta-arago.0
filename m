Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A2A8E529EC
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2020 15:18:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088FFNB2078620
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 10:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599578123;
	bh=yGz71kvcZHUczN4iQcIQFr2QVHfk+O5A4a+OKtQU7ec=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=VnM9NI37jl6GoEqDf5PMXk01S/iGP5dh9pw0/Dz8BxTVmZykwIvzkKEVfMeZzdTnX
	aO0ObHnPUq0Z7tf3yQygtZJYWi6i9c3X1f0qexLcLrbl//phSVa1NbQC6WC1CjrS2c
	yCG1M69kFCpO2gAUO+cSTT8X1zNf/ow3UXDSYsTg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088FFN2e088929
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 10:15:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 8 Sep 2020 10:15:23 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1979.003; Tue, 8 Sep 2020 10:15:23 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [dunfell/master] [PATCH] tensorflow-lite: fix QA
	warning of using unstable GitHub archives
Thread-Index: AQHWggeVcfzQS/96K06I/nbeBBOZVale4aLw
Date: Tue, 8 Sep 2020 15:15:23 +0000
Message-ID: <e2427f993bde464885af03076d0f4c43@ti.com>
References: <20200903153324.25468-1-h-gou@ti.com>
In-Reply-To: <20200903153324.25468-1-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.112.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [dunfell/master] [PATCH] tensorflow-lite: fix QA warning of using unstable GitHub archives
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
X-List-Received-Date: Tue, 08 Sep 2020 15:18:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping...

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Thursday, September 3, 2020 11:33 AM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [dunfell/master] [PATCH] tensorflow-lite: fix QA
> warning of using unstable GitHub archives
>=20
> * The archive links are replaced with git repos with the corresponding co=
mmit
> IDs
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../tensorflow-lite/tensorflow-lite_1.15.bb   | 46 +++++++------------
>  1 file changed, 16 insertions(+), 30 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-
> lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-
> lite/tensorflow-lite_1.15.bb
> index 5f65055f..e9739d83 100644
> --- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-
> lite_1.15.bb
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-
> lite_1.15.bb
> @@ -6,29 +6,17 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D64a34301f8e355f57ec992c2af3e5157"
>=20
>  MD5SUM_EIGEN =3D "a28a728acb3298471b11132ab5c0c3cb"
>  SHA256SUM_EIGEN =3D
> "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f807078522fda52114b5c"
> -MD5SUM_FARMHASH =3D "f039a65a7f62bdb6c4b4c8a732638d80"
> -SHA256SUM_FARMHASH =3D
> "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
> -MD5SUM_GEMMLOWP =3D "09cf63d1d388a2753de3323684da70ed"
> -SHA256SUM_GEMMLOWP =3D
> "6678b484d929f2d0d3229d8ac4e3b815a950c86bb9f17851471d143f6d4f7834"
> -MD5SUM_GTEST =3D "16877098823401d1bf2ed7891d7dce36"
> -SHA256SUM_GTEST =3D
> "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
> -MD5SUM_ABSLCPP =3D "7abf3aae8d57874d2eb04c4b92736208"
> -SHA256SUM_ABSLCPP =3D
> "acd93f6baaedc4414ebd08b33bebca7c7a46888916101d8c0b8083573526d070"
> -MD5SUM_NEON2SSE =3D "276619db5393450c223b7c4e47e848ce"
> -SHA256SUM_NEON2SSE =3D
> "8cc98e95c86d362dd6f003b35a9517a9928e3fd387b33188b0442df13245a17b"
> -MD5SUM_FLATBUFFER =3D "02c64880acb89dbd57eebacfd67200d8"
> -SHA256SUM_FLATBUFFER =3D
> "3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b"
>  MD5SUM_FFT =3D "4255dd8a74949d123216b1ab91520469"
>  SHA256SUM_FFT =3D
> "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
>=20
> -SRC_URI =3D
> "git://github.com/tensorflow/tensorflow.git;branch=3Dr${PV};protocol=3Dht=
tps \
> +SRC_URI =3D
> "git://github.com/tensorflow/tensorflow.git;branch=3Dr${PV};rev=3D590d6ee=
f7e
> 91a6a7392c8ffffb7b58f2e0c8bc6b;protocol=3Dhttps \
>=20
> https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=3D${MD
> 5SUM_EIGEN};sha256sum=3D${SHA256SUM_EIGEN} \
> -
> https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/g
> emmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip;md5sum
> =3D${MD5SUM_GEMMLOWP};sha256sum=3D${SHA256SUM_GEMMLOWP} \
> -    https://github.com/google/googletest/archive/release-
> 1.8.0.tar.gz;md5sum=3D${MD5SUM_GTEST};sha256sum=3D${SHA256SUM_GTEST
> } \
> -    https://github.com/abseil/abseil-
> cpp/archive/43ef2148c0936ebf7cb4be6b19927a9d9d145b8f.tar.gz;md5sum=3D$
> {MD5SUM_ABSLCPP};sha256sum=3D${SHA256SUM_ABSLCPP} \
> -
> https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9
> c7fbdf8710c032d462ca10051.zip;md5sum=3D${MD5SUM_NEON2SSE};sha256su
> m=3D${SHA256SUM_NEON2SSE} \
> -
> https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622
> e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=3D${MD5SUM_FARMHASH
> };sha256sum=3D${SHA256SUM_FARMHASH} \
> -
> https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/fl
> atbuffers/archive/v1.11.0.tar.gz;md5sum=3D${MD5SUM_FLATBUFFER};sha256
> sum=3D${SHA256SUM_FLATBUFFER} \
> +
> git://github.com/google/gemmlowp;destsuffix=3Dgemmlowp/;branch=3Dmaster
> ;rev=3D12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3;protocol=3Dhttps \
> +
> git://github.com/google/googletest;destsuffix=3Dgoogletest/;branch=3Dmast=
er;r
> ev=3Drelease-1.8.0;protocol=3Dhttps \
> +    git://github.com/abseil/abseil-cpp;destsuffix=3Dabseil-
> cpp/;branch=3Dmaster;rev=3D43ef2148c0936ebf7cb4be6b19927a9d9d145b8f;nob
> ranch=3D1;protocol=3Dhttps \
> +
> git://github.com/intel/ARM_NEON_2_x86_SSE;destsuffix=3Dneon_2_sse/;bra
> nch=3Dmaster;rev=3D3057bb91b99bae9c7fbdf8710c032d462ca10051;protocol=3Dht=
t
> ps \
> +
> git://github.com/google/farmhash;destsuffix=3Dfarmhash/;branch=3Dmaster;r=
ev
> =3D816a4ae622e964763ca0862d9dbd19324a1eaf45;protocol=3Dhttps \
> +
> git://github.com/google/flatbuffers;destsuffix=3Dflatbuffers/;branch=3Dma=
ster;r
> ev=3Dv1.11.0;protocol=3Dhttps \
>      https://mirror.bazel.build/www.kurims.kyoto-
> u.ac.jp/~ooura/fft.tgz;md5sum=3D${MD5SUM_FFT};sha256sum=3D${SHA256SU
> M_FFT} \
>=20
> http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobile
> net_v1_1.0_224_quant.tgz;name=3Dmobilenet_v1_quant;subdir=3D${WORKDIR}
> /model;destsuffix=3Dmodel \
>      file://apply-modification-for-tflite-${PV}-to-eigen.patch \
> @@ -39,9 +27,7 @@ SRC_URI =3D
> "git://github.com/tensorflow/tensorflow.git;branch=3Dr${PV};protocol=3Dht=
t
>  SRC_URI[mobilenet_v1_quant.md5sum] =3D
> "36af340c00e60291931cb30ce32d4e86"
>  SRC_URI[mobilenet_v1_quant.sha256sum] =3D
> "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
>=20
> -SRCREV =3D "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
> -
> -PR =3D "r4"
> +PR =3D "r5"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -69,14 +55,14 @@ do_cp_downloaded_build_deps() {
>      mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
>      mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
>=20
> -    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
> -    cp -rf ${WORKDIR}/gemmlowp-
> 12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
> -    cp -rf ${WORKDIR}/googletest-release-1.8.0/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
> -    cp -rf ${WORKDIR}/abseil-cpp-
> 43ef2148c0936ebf7cb4be6b19927a9d9d145b8f/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
> -    cp -rf ${WORKDIR}/farmhash-
> 816a4ae622e964763ca0862d9dbd19324a1eaf45/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
> -    cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-
> 3057bb91b99bae9c7fbdf8710c032d462ca10051/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
> -    cp -rf ${WORKDIR}/flatbuffers-1.11.0/*
> ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
> -    cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
> +    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen"
> +    cp -rf ${WORKDIR}/gemmlowp/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp/"
> +    cp -rf ${WORKDIR}/googletest/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest/"
> +    cp -rf ${WORKDIR}/abseil-cpp/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl/"
> +    cp -rf ${WORKDIR}/farmhash/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash/"
> +    cp -rf ${WORKDIR}/neon_2_sse/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse/"
> +    cp -rf ${WORKDIR}/flatbuffers/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers/"
> +    cp -rf ${WORKDIR}/fft/*
> "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d"
>  }
>  addtask do_cp_downloaded_build_deps after do_unpack before do_patch
>=20
> --
> 2.17.1


