Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B490A520DF
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 17:52:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MHpDDu058014
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 12:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566496273;
	bh=gxBFacnPcgi4JX+rT3+pz9JHMslP5OPLJB+oXmwJ1qo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZbUMvJ3BI/qeZhI5AF+69Vp9TMoBnTrL855HZQU49xV0vzf9qC1k8jUcsM2jp7imA
	9kDkYIJd7IbLAnAPp5B8jJ5mMhEWXtks1dqPkqb0dgv24lhw2/L9v6zAoAlKq0hfeC
	jjDOXqTC81BRIyZR65mrmEWqpEZXNu8Lg97KKumU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MHpDiI033750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 12:51:13 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 12:51:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 12:51:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MHpCH1091819;
	Thu, 22 Aug 2019 12:51:13 -0500
To: "Xu, Jianzhong" <xuj@ti.com>, Denys Dmytriyenko <denys@ti.com>
References: <20190809140758.15280-1-xuj@ti.com> <20190813231318.GH7130@beryl>
	<5b8b049068d94a05b2b08b978daea598@ti.com>
	<20190819190222.GM2365@beryl>
	<a6011481-e170-7b72-9ec6-c2c63672544d@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4cd53098-647f-530d-530b-eb4cbb19c26d@ti.com>
Date: Thu, 22 Aug 2019 13:51:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a6011481-e170-7b72-9ec6-c2c63672544d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [thud/master] [PATCH] armnn: add installation of header files
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
X-List-Received-Date: Thu, 22 Aug 2019 17:52:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 8/22/2019 1:43 PM, Xu, Jianzhong wrote:
>
> On 8/19/2019 3:02 PM, Denys Dmytriyenko wrote:
>> On Mon, Aug 19, 2019 at 10:34:34AM -0400, Xu, Jianzhong wrote:
>>>> -----Original Message-----
>>>> From: Dmytriyenko, Denys
>>>> Sent: Tuesday, August 13, 2019 7:13 PM
>>>> To: Xu, Jianzhong
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: Re: [meta-arago] [thud/master] [PATCH] armnn: add 
>>>> installation of header files
>>>>
>>>> On Fri, Aug 09, 2019 at 10:07:58AM -0400, Jianzhong Xu wrote:
>>>>> * Install header files that are needed to build tidl-api examples
>>>>> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
>>>>>
>>>>> Signed-off-by: Jianzhong Xu <xuj@ti.com>
>>>>> ---
>>>>>   .../recipes-support/armnn/armnn_git.bb        | 25 
>>>>> +++++++++++++------
>>>>>   1 file changed, 17 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb 
>>>>> b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>>> index 076ea3aa..7ad41d2d 100644
>>>>> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>>> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>>>>> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
>>>>>       -DGENERIC_LIB_VERSION=${PV} 
>>>>> -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
>>>>>   "
>>>>>   -TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
>>>>> +ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
>>>>>     do_install_append() {
>>>>>       CP_ARGS="-Prf --preserve=mode,timestamps 
>>>>> --no-preserve=ownership"
>>>>>       install -d ${D}${bindir}
>>>>>       find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable 
>>>>> -exec cp $CP_ARGS {} ${D}${bindir} \;
>>>>>       cp $CP_ARGS ${WORKDIR}/build/UnitTests ${D}${bindir}
>>>>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/models
>>>>> -    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb 
>>>>> ${D}${TESTVECS_INSTALL_DIR}/models
>>>>> -    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt 
>>>>> ${D}${TESTVECS_INSTALL_DIR}/models
>>>>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>>> -    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4 
>>>>> ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>>> -    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg 
>>>>> ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/models
>>>>> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb 
>>>>> ${D}${ARMNN_INSTALL_DIR}/models
>>>>> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt 
>>>>> ${D}${ARMNN_INSTALL_DIR}/models
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>>> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4 
>>>>> ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>>> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg 
>>>>> ${D}${ARMNN_INSTALL_DIR}/testvecs
>>>>> +    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
>>>>> +    cp ${WORKDIR}/git/src/armnn/*.hpp 
>>>>> ${D}${ARMNN_INSTALL_DIR}/src/armnn
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>>>>> +    cp 
>>>>> ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} 
>>>>> ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>>>>> +    cp 
>>>>> ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp 
>>>>> ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>>>>> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
>>>>> +    cp 
>>>>> ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} 
>>>>> ${D}${ARMNN_INSTALL_DIR}/tests
>>>> CP_ARGS is not being used for any of the cp commands.
>>> CP_ARGS is used in following commands:
>>>        find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable 
>>> -exec cp $CP_ARGS {} ${D}${bindir} \;
>>>        cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
>> What about others?
> Other cp commands do not need CP_ARGS.


Everywhere "cp -r" is used needs to be replaced with "cp $CP_ARGS"


>>
>>>>>       chrpath -d ${D}${bindir}/*
>>>>>   }
>>>>>     CXXFLAGS += "-fopenmp"
>>>>>   LIBS += "-larmpl_lp64_mp"
>>>>>   -FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
>>>>> +FILES_${PN} += "${ARMNN_INSTALL_DIR}"
>>>>>   FILES_${PN}-dev += "{libdir}/cmake/*"
>>>>>   INSANE_SKIP_${PN}-dev = "dev-elf"
>>>>> -- 
>>>>> 2.17.1
>>>>>
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

