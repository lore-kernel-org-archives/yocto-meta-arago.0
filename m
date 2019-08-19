Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C0320529B7
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2019 14:35:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JEYYPi123497
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 09:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566225274;
	bh=djO1jK2GG6y9JvjdQAOPIi3XO7z6hiNOHFryus5fhms=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=oZCNFbPNoRXnviW9nDKxMptS30/0vSq7iqV8BXpo4lodBanWqI9uAZRfp6OnbStpW
	MRMf1HOFJSykaaGSPRpehAev4Lre6eJcLgMfyqQzy9LeRLsozuGGRNxMHAAY8FGPdv
	4ztsQ0Zfh+xFVi8JibDtH+9J5tyUELNqxkwAu594=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JEYYCS053107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 09:34:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 09:34:34 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1713.004; Mon, 19 Aug 2019 09:34:34 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/master] [PATCH] armnn: add installation of
	header files
Thread-Index: AQHVTrvp7eq0wxRxtUuyyG3WYveGEab6D7sAgAiIysA=
Date: Mon, 19 Aug 2019 14:34:34 +0000
Message-ID: <5b8b049068d94a05b2b08b978daea598@ti.com>
References: <20190809140758.15280-1-xuj@ti.com> <20190813231318.GH7130@beryl>
In-Reply-To: <20190813231318.GH7130@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 19 Aug 2019 14:35:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys=20
>Sent: Tuesday, August 13, 2019 7:13 PM
>To: Xu, Jianzhong
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [thud/master] [PATCH] armnn: add installation of=
 header files
>
>On Fri, Aug 09, 2019 at 10:07:58AM -0400, Jianzhong Xu wrote:
>> * Install header files that are needed to build tidl-api examples
>> * Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR
>>=20
>> Signed-off-by: Jianzhong Xu <xuj@ti.com>
>> ---
>>  .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
>>  1 file changed, 17 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta=
-arago-extras/recipes-support/armnn/armnn_git.bb
>> index 076ea3aa..7ad41d2d 100644
>> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> @@ -65,25 +65,34 @@ EXTRA_OECMAKE=3D" \
>>      -DGENERIC_LIB_VERSION=3D${PV} -DGENERIC_LIB_SOVERSION=3D${PV_MAJOR}=
 \
>>  "
>> =20
>> -TESTVECS_INSTALL_DIR =3D "${datadir}/arm/armnn"
>> +ARMNN_INSTALL_DIR =3D "${datadir}/arm/armnn"
>> =20
>>  do_install_append() {
>>      CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downers=
hip"
>>      install -d ${D}${bindir}
>>      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec c=
p $CP_ARGS {} ${D}${bindir} \;
>>      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/models
>> -    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVEC=
S_INSTALL_DIR}/models
>> -    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVEC=
S_INSTALL_DIR}/models
>> -    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
>> -    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${T=
ESTVECS_INSTALL_DIR}/testvecs
>> -    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${=
TESTVECS_INSTALL_DIR}/testvecs
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/models
>> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${ARMNN_I=
NSTALL_DIR}/models
>> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${ARMNN_I=
NSTALL_DIR}/models
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
>> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${A=
RMNN_INSTALL_DIR}/testvecs
>> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${=
ARMNN_INSTALL_DIR}/testvecs
>> +    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
>> +    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armn=
n
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>> +    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,L=
ogging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>> +    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp $=
{D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
>> +    install -d ${D}${ARMNN_INSTALL_DIR}/tests
>> +    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,Infer=
enceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests
>
>CP_ARGS is not being used for any of the cp commands.

CP_ARGS is used in following commands:
      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp =
$CP_ARGS {} ${D}${bindir} \;
      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}

>
>>      chrpath -d ${D}${bindir}/*
>>  }
>> =20
>>  CXXFLAGS +=3D "-fopenmp"
>>  LIBS +=3D "-larmpl_lp64_mp"
>> =20
>> -FILES_${PN} +=3D "${TESTVECS_INSTALL_DIR}"
>> +FILES_${PN} +=3D "${ARMNN_INSTALL_DIR}"
>>  FILES_${PN}-dev +=3D "{libdir}/cmake/*"
>>  INSANE_SKIP_${PN}-dev =3D "dev-elf"
>> --=20
>> 2.17.1
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

