Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1F1D9520DF
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 17:44:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MHhpJk006464
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 12:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566495831;
	bh=b3nyyIFA8u9+Uc5Qyix4P4lD+4Mco+94kaqSaGmMC/k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=m6r7ocn6u9QaSTKOIVZYCnfUyFXdU49D7VlEoLUxF5hGlVPBNSE1RNc1nEDfa1JeC
	jDuqp8P/Vn4hi2fIVwyxWauL+45xTybzWGw9I6l4UFw2nhWCYmZLEJqsarQedvgFYw
	yOgC/Nue0X/hCWrOWJ9GiXXeAwd71Sa3Tn/hRvbw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MHhpnv089413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 12:43:51 -0500
Received: from [158.218.116.215] (158.218.116.215) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 12:43:50 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190809140758.15280-1-xuj@ti.com> <20190813231318.GH7130@beryl>
	<5b8b049068d94a05b2b08b978daea598@ti.com>
	<20190819190222.GM2365@beryl>
From: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <a6011481-e170-7b72-9ec6-c2c63672544d@ti.com>
Date: Thu, 22 Aug 2019 13:43:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819190222.GM2365@beryl>
X-Originating-IP: [158.218.116.215]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DFLE112.ent.ti.com
	(10.64.6.33)
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
X-List-Received-Date: Thu, 22 Aug 2019 17:44:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/19/2019 3:02 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 19, 2019 at 10:34:34AM -0400, Xu, Jianzhong wrote:
>>> -----Original Message-----
>>> From: Dmytriyenko, Denys
>>> Sent: Tuesday, August 13, 2019 7:13 PM
>>> To: Xu, Jianzhong
>>> Cc: meta-arago@arago-project.org
>>> Subject: Re: [meta-arago] [thud/master] [PATCH] armnn: add installation of header files
>>>
>>> On Fri, Aug 09, 2019 at 10:07:58AM -0400, Jianzhong Xu wrote:
>>>> * Install header files that are needed to build tidl-api examples
>>>> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
>>>>
>>>> Signed-off-by: Jianzhong Xu <xuj@ti.com>
>>>> ---
>>>>   .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
>>>>   1 file changed, 17 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>> index 076ea3aa..7ad41d2d 100644
>>>> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
>>>>       -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
>>>>   "
>>>>   
>>>> -TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
>>>> +ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
>>>>   
>>>>   do_install_append() {
>>>>       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>>>>       install -d ${D}${bindir}
>>>>       find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>>>>       cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
>>>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/models
>>>> -    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
>>>> -    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
>>>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>> -    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>> -    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/models
>>>> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${ARMNN_INSTALL_DIR}/models
>>>> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${ARMNN_INSTALL_DIR}/models
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>> +    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
>>>> +    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armnn
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>>>> +    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>>>> +    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
>>>> +    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests
>>> CP_ARGS is not being used for any of the cp commands.
>> CP_ARGS is used in following commands:
>>        find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>>        cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
> What about others?
Other cp commands do not need CP_ARGS.
>
>>>>       chrpath -d ${D}${bindir}/*
>>>>   }
>>>>   
>>>>   CXXFLAGS += "-fopenmp"
>>>>   LIBS += "-larmpl_lp64_mp"
>>>>   
>>>> -FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
>>>> +FILES_${PN} += "${ARMNN_INSTALL_DIR}"
>>>>   FILES_${PN}-dev += "{libdir}/cmake/*"
>>>>   INSANE_SKIP_${PN}-dev = "dev-elf"
>>>> -- 
>>>> 2.17.1
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

