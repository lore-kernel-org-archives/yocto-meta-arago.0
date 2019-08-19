Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 05012529F3
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2019 19:03:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JJ2Ntf095591
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 14:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566241343;
	bh=rt8mT+/2jV+wjj8LsVACTFvlw/Kz72GCSsTAkMTkEdY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iPkdgxFtqAZeXfIjlJJwL6seJK9C2TM2mAZHHhwGWZh5QKjh61fUkL3sNf1prD+Gq
	NcxCOd6MES4JcWW+5zwmax5FjR5Kw+9YbQ5IBw3vXQJ6yUhvs1d1aLippFfarVqlHJ
	24Gsl0h+xvqAVtZzJAvoNfcrYKKVk+gpd9vL/iRM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JJ2N0w001524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 14:02:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 14:02:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 19 Aug 2019 14:02:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JJ2NZ4122284;
	Mon, 19 Aug 2019 14:02:23 -0500
Date: Mon, 19 Aug 2019 15:02:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <20190819190222.GM2365@beryl>
References: <20190809140758.15280-1-xuj@ti.com> <20190813231318.GH7130@beryl>
	<5b8b049068d94a05b2b08b978daea598@ti.com>
MIME-Version: 1.0
In-Reply-To: <5b8b049068d94a05b2b08b978daea598@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 19 Aug 2019 19:03:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 19, 2019 at 10:34:34AM -0400, Xu, Jianzhong wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys 
> >Sent: Tuesday, August 13, 2019 7:13 PM
> >To: Xu, Jianzhong
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [thud/master] [PATCH] armnn: add installation of header files
> >
> >On Fri, Aug 09, 2019 at 10:07:58AM -0400, Jianzhong Xu wrote:
> >> * Install header files that are needed to build tidl-api examples
> >> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
> >> 
> >> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> >> ---
> >>  .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
> >>  1 file changed, 17 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> >> index 076ea3aa..7ad41d2d 100644
> >> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> >> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> >> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
> >>      -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
> >>  "
> >>  
> >> -TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
> >> +ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
> >>  
> >>  do_install_append() {
> >>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >>      install -d ${D}${bindir}
> >>      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
> >>      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
> >> -    install -d ${D}${TESTVECS_INSTALL_DIR}/models
> >> -    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
> >> -    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
> >> -    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
> >> -    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
> >> -    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/models
> >> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${ARMNN_INSTALL_DIR}/models
> >> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${ARMNN_INSTALL_DIR}/models
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
> >> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${ARMNN_INSTALL_DIR}/testvecs
> >> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${ARMNN_INSTALL_DIR}/testvecs
> >> +    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
> >> +    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armnn
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> >> +    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> >> +    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
> >> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
> >> +    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests
> >
> >CP_ARGS is not being used for any of the cp commands.
> 
> CP_ARGS is used in following commands:
>       find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>       cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}

What about others?


> >>      chrpath -d ${D}${bindir}/*
> >>  }
> >>  
> >>  CXXFLAGS += "-fopenmp"
> >>  LIBS += "-larmpl_lp64_mp"
> >>  
> >> -FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
> >> +FILES_${PN} += "${ARMNN_INSTALL_DIR}"
> >>  FILES_${PN}-dev += "{libdir}/cmake/*"
> >>  INSANE_SKIP_${PN}-dev = "dev-elf"
> >> -- 
> >> 2.17.1
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

