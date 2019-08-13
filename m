Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 16E0252980
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2019 23:14:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DNDJXV007440
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 18:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565737999;
	bh=J5fTQn5+ei/EvIGo3rb23/JtDlD4hptbVlfaum74XjE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OogQm/TkT2sRIsDLOHlI6fr7TGt7CwXsFeerP9soizWDA/Mw3FaKKXImvAdMRnFbG
	0H9Eccoaq+s+1E4GQXAr52N7p0fbfEwcdJgV/gCosd3vq5lleLS0bwRZFJBbYycePr
	YPbWcJvWbotLUabMAMAOY95wvBklETck9+yv/ZPI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DNDJAN100273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 18:13:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 18:13:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 18:13:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DNDIoM033960;
	Tue, 13 Aug 2019 18:13:19 -0500
Date: Tue, 13 Aug 2019 19:13:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20190813231318.GH7130@beryl>
References: <20190809140758.15280-1-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190809140758.15280-1-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master] [PATCH] armnn: add installation of header files
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
X-List-Received-Date: Tue, 13 Aug 2019 23:14:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 09, 2019 at 10:07:58AM -0400, Jianzhong Xu wrote:
> * Install header files that are needed to build tidl-api examples
> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> index 076ea3aa..7ad41d2d 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
>      -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
>  "
>  
> -TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
> +ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
>  
>  do_install_append() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>      install -d ${D}${bindir}
>      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
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
> +    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
> +    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armnn
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> +    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> +    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
> +    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests

CP_ARGS is not being used for any of the cp commands.


>      chrpath -d ${D}${bindir}/*
>  }
>  
>  CXXFLAGS += "-fopenmp"
>  LIBS += "-larmpl_lp64_mp"
>  
> -FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
> +FILES_${PN} += "${ARMNN_INSTALL_DIR}"
>  FILES_${PN}-dev += "{libdir}/cmake/*"
>  INSANE_SKIP_${PN}-dev = "dev-elf"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

