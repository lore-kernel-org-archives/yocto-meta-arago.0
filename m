Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8CD8452977
	for <meta-arago@arago-project.org>;
	Wed, 21 Nov 2018 19:13:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wALJD9Zt008370
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 13:13:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542827589;
	bh=iSjk30iZkQj/KtLrDkNi8679uZmMjRhKYemOYVnP0FA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jNS1JX9nfX1azvqcpiv72Wjkq5VC3WlJJxXIKZGK8QzMM90VWtutJsi5Ba+eHylCu
	eh918Ta0N5mED9kG0rHc03+thyZHRJpbaqxiXj95jT2MLfaVV9I3O8ZUVIDr4TPvIt
	9lgi+EKtUcZGl9WcpjCtY3YIkaof27rWbnCr/GCk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wALJD9s8020065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 13:13:09 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 21 Nov 2018 13:13:08 -0600
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
	DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
	15.01.1591.008; Wed, 21 Nov 2018 13:13:08 -0600
From: "Su, Qin" <qsu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] armnn: bump SRCREV and add a demo example
Thread-Index: AQHUgEbpQDvbcSxiVESD8j9LJAUb0qVamxRA
Date: Wed, 21 Nov 2018 19:13:08 +0000
Message-ID: <d5861db4f137460885d26ef1d4547050@ti.com>
References: <1542400052-28613-1-git-send-email-qsu@ti.com>
	<20181119203151.GC2540@beryl>
In-Reply-To: <20181119203151.GC2540@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.194]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] armnn: bump SRCREV and add a demo example
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
X-List-Received-Date: Wed, 21 Nov 2018 19:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, November 19, 2018 3:32 PM
>To: Su, Qin
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] armnn: bump SRCREV and add a demo
>example
>
>On Fri, Nov 16, 2018 at 03:27:32PM -0500, Qin Su wrote:
>> updated to the latest version of 18.08 updated to generate versioned
>> library created a demo example with mobileNet
>
>Same comment about missing Upstream-Status for new patches.
>

Fixed in patch v2

>> Signed-off-by: Qin Su <qsu@ti.com>
>> ---
>>  .../0003-add-more-test-command-arguments.patch     |  74 ++
>>  .../armnn/0004-generate-versioned-library.patch    |  62 ++
>>  .../0005-add-armnn-mobilenet-test-example.patch    |  68 ++
>>  .../armnn/0006-armnn-mobilenet-test-example.patch  | 862
>+++++++++++++++++++++
>>  .../recipes-support/armnn/armnn_git.bb             |  31 +-
>>  5 files changed, 1092 insertions(+), 5 deletions(-)  create mode
>> 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-
>comma
>> nd-arguments.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0004-generate-
>versioned-
>> library.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-
>mobilenet
>> -test-example.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-
>tes
>> t-example.patch
>
>[snip]
>
>
>> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> index 726a9da..c31e4ae 100644
>> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> @@ -1,12 +1,13 @@
>>  SUMMARY =3D "ARM Neural Network SDK"
>>  DESCRIPTION =3D "Linux software and tools to enable machine learning
>(Caffe/Tensorflow) workloads on power-efficient devices"
>> -LICENSE =3D "MIT"
>> +LICENSE =3D "MIT & Apache-2.0"
>>  LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D3e14a924c16f7d828b8335a59da64074"
>
>Did the license change? Also, need a checksum for Apache-2.0 too.
>

No license change.
Added checksum for Apache-2.0 in patch v2

>> -PV =3D "20180502"
>> +PV =3D "18.08"
>> +PV_MAJOR =3D "${@d.getVar('PV',d,1).split('.')[0]}"
>>
>>  BRANCH =3D "master"
>> -SRCREV =3D "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
>> +SRCREV =3D "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> @@ -16,8 +17,20 @@ SRC_URI =3D " \
>>      git://github.com/ARM-software/armnn.git;branch=3D${BRANCH} \
>
>Might want to add "name=3Darmnn" above since used in SRCREV_FORMAT.
>

Added "name=3Darmnn" in patch v2

>>      file://0001-stdlib-issue-work-around.patch \
>>      file://0002-enable-use-of-boost-shared-library.patch \
>> +    file://0003-add-more-test-command-arguments.patch \
>> +    file://0004-generate-versioned-library.patch \
>> +    file://0005-add-armnn-mobilenet-test-example.patch \
>> +    file://0006-armnn-mobilenet-test-example.patch \
>> +
>> +
>http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobile
>> + net_v1_1.0_224.tgz; \
>
>Might want to add "name=3Dmobilenet" for use in
>SRC_URI[md5sum/sha256sum]
>

Added "name=3Dmobilenet" in patch v2

>> +
>> + git://git.ti.com/tidl/tidl-api.git;name=3Dtidl-api;branch=3D${BRANCH};=
su
>> + bdir=3D${WORKDIR}/tidl-api;destsuffix=3Dtidl-api \
>>  "
>>
>> +SRC_URI[md5sum] =3D "d5f69cef81ad8afb335d9727a17c462a"
>> +SRC_URI[sha256sum] =3D
>"1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
>> +
>> +SRCREV_tidl-api =3D "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
>> +SRCREV_FORMAT =3D "armnn"
>> +
>>  DEPENDS =3D " \
>>      boost \
>>      protobuf \
>> @@ -25,6 +38,7 @@ DEPENDS =3D " \
>>      arm-compute-library \
>>      armnn-caffe \
>>      armnn-tensorflow \
>> +    opencv \
>>  "
>>
>>  RDEPENDS_${PN} =3D " arm-compute-library protobuf boost "
>> @@ -39,21 +53,28 @@ EXTRA_OECMAKE=3D" \
>>      -DARMCOMPUTENEON=3D1 \
>>      -DBUILD_TESTS=3D1 -DPROFILING=3D1 \
>>      -DTHIRD_PARTY_INCLUDE_DIRS=3D${STAGING_DIR_HOST}${includedir} \
>> +    -DBUILD_ARMNN_EXAMPLES=3D1 \
>> +    -DGENERIC_LIB_VERSION=3D${PV} -
>DGENERIC_LIB_SOVERSION=3D${PV_MAJOR} \
>>  "
>>
>> +TESTVECS_INSTALL_DIR =3D "${datadir}/arm/armnn"
>> +
>>  do_install_append() {
>>      CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downers=
hip"
>>      install -d ${D}${bindir}
>>      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec c=
p
>$CP_ARGS {} ${D}${bindir} \;
>>      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
>> +    install -d ${D}${TESTVECS_INSTALL_DIR}/models
>> +    cp ${WORKDIR}/mobilenet_v1_1.0_224_frozen.pb
>${D}${TESTVECS_INSTALL_DIR}/models
>> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt
>${D}${TESTVECS_INSTALL_DIR}/models
>> +    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
>> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/test2.mp4
>> + ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>      chrpath -d ${D}${bindir}/*
>>  }
>>
>>  CXXFLAGS +=3D "-fopenmp"
>>  LIBS +=3D "-larmpl_lp64_mp"
>>
>> -SOLIBS =3D ".so"
>> -FILES_SOLIBSDEV =3D ""
>>  FILES_${PN} +=3D "{bindir}/*"
>>  FILES_${PN} +=3D "{libdir}/*"
>>  FILES_${PN}-dev +=3D "{libdir}/cmake/*"
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

