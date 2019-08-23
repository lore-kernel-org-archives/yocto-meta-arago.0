Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 94C7A52978
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 21:49:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NLmJ7D119737
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 16:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566596899;
	bh=UuQ3X5liOMzPuiVQ3y2oFembaNaCfX6SzHTOjeNhG9Q=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QclryW40kyXxlVs8C3kOdj6WiSkrMcpWCV+hSODfYzGqZ2X4PkWrJ8EJ4vCKLPYdZ
	gpWPP3EV/4gxIEb9R3s3zug5qKK0F+vsLh6jbNNNaSco+V4RMbyctHGYlq6z0affq6
	3W6zi7bTrGJYggFak4NWCrapM+JxUp+/llgAbpZM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NLmJlB079618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 16:48:19 -0500
Received: from [158.218.116.215] (158.218.116.215) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 16:48:18 -0500
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <20190822205929.13175-1-xuj@ti.com>
From: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <42b68b57-cab5-117c-776d-9af1d6b18835@ti.com>
Date: Fri, 23 Aug 2019 17:48:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822205929.13175-1-xuj@ti.com>
X-Originating-IP: [158.218.116.215]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DFLE112.ent.ti.com
	(10.64.6.33)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master] [PATCH v2] armnn: add installation of header files and .so links
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
X-List-Received-Date: Fri, 23 Aug 2019 21:49:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

NACK

Please discard this patch as development plan has changed.

On 8/22/2019 4:59 PM, Jianzhong Xu wrote:
> * Install header files that are needed to build tidl-api examples
> * Add armnn-dev to packagegroups to include armnn*.so links in file system for building armnn applications on the target
> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   .../packagegroup-arago-tisdk-addons.bb        |  5 +++-
>   .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
>   2 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index eb39cadf..ac3835bd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -147,7 +147,10 @@ EXTRA_PACKAGES_omapl138 = " \
>       protobuf \
>   "
>   
> -ARMNN_PACKAGES = "armnn"
> +ARMNN_PACKAGES = " \
> +    armnn \
> +    armnn-dev \
> +"
>   
>   EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                   arm-compute-library \
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> index 076ea3aa..76875ee3 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
>       -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
>   "
>   
> -TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
> +ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
>   
>   do_install_append() {
>       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>       install -d ${D}${bindir}
>       find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>       cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
> -    install -d ${D}${TESTVECS_INSTALL_DIR}/models
> -    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
> -    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
> -    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
> -    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
> -    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
> +    install -d ${D}${ARMNN_INSTALL_DIR}/models
> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${ARMNN_INSTALL_DIR}/models
> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${ARMNN_INSTALL_DIR}/models
> +    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${ARMNN_INSTALL_DIR}/testvecs
> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${ARMNN_INSTALL_DIR}/testvecs
> +    cp $CP_ARGS ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
> +    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armnn
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> +    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> +    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
> +    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests
>       chrpath -d ${D}${bindir}/*
>   }
>   
>   CXXFLAGS += "-fopenmp"
>   LIBS += "-larmpl_lp64_mp"
>   
> -FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
> +FILES_${PN} += "${ARMNN_INSTALL_DIR}"
>   FILES_${PN}-dev += "{libdir}/cmake/*"
>   INSANE_SKIP_${PN}-dev = "dev-elf"

