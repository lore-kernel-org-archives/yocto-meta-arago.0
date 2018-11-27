Return-Path: <qsu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9F7BC529D0
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 19:39:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARJdJ5n052462
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 13:39:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543347559;
	bh=egtMltgu25l8QNotFrcG6+i9i7LPRgzkX9KVX46D6co=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=RwqbvB+JWZh2fDS9jRFT9Uz4TUtXDAeHy09CAnsSla2OUGF7NAgDF0Eq3N1Pzlnei
	KJa8/Nf2Ci2XTukfhEW/4HcTJ7ao8XNH1oeMS9Y0WcccU5r0OGJuVLv/NKCKtVDJo+
	w5JCpeA3FLe7HmRCYewMPXTiEIzVdnHAB9XP/+5o=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARJdJkZ117207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 13:39:19 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 13:39:19 -0600
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
	DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
	15.01.1591.008; Tue, 27 Nov 2018 13:39:19 -0600
From: "Su, Qin" <qsu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] armnn: bump SRCREV and add a demo example
Thread-Index: AQHUhdR9Gy2hf/nPeUOnI+xD7ESbdaVkA+jQ
Date: Tue, 27 Nov 2018 19:39:19 +0000
Message-ID: <e18a7fb5025144ee8ccaa820484c7686@ti.com>
References: <1542837395-7368-1-git-send-email-qsu@ti.com>
	<20181126220758.GH21933@beryl>
In-Reply-To: <20181126220758.GH21933@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.194]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] armnn: bump SRCREV and add a demo example
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
X-List-Received-Date: Tue, 27 Nov 2018 19:39:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, November 26, 2018 5:08 PM
>To: Su, Qin
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH v2] armnn: bump SRCREV and add a demo
>example
>
>On Wed, Nov 21, 2018 at 04:56:35PM -0500, Qin Su wrote:
>> updated to the latest version of 18.08 updated to generate versioned
>> library created a demo example with mobileNet
>>
>> Signed-off-by: Qin Su <qsu@ti.com>
>> ---
>
>Would be nice to document here changes between patch revisions, i.e. v1 ->=
 v2

Will add a cover letter to explain the changes in patch v3

>
>
>>  ...0003-add-more-test-command-line-arguments.patch |  75 ++
>>  .../armnn/0004-generate-versioned-library.patch    |  63 ++
>>  .../0005-add-armnn-mobilenet-test-example.patch    |  69 ++
>>  .../armnn/0006-armnn-mobilenet-test-example.patch  | 886
>+++++++++++++++++++++
>>  .../recipes-support/armnn/armnn_git.bb             |  40 +-
>>  5 files changed, 1125 insertions(+), 8 deletions(-)  create mode
>> 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-
>comma
>> nd-line-arguments.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-
>> library.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet
>> -test-example.patch  create mode 100755
>> meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-tes
>> t-example.patch  mode change 100644 =3D> 100755
>> meta-arago-extras/recipes-support/armnn/armnn_git.bb
>
>^^^^^^^^^^^^^^^^^^^^^^
>Why are you making all patches and the recipe executable?
>
I will change them to 100644 in patch v3.

>[snip]
>
>
>> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> old mode 100644
>> new mode 100755
>> index 726a9da..2b25da8
>> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
>> @@ -1,23 +1,39 @@
>>  SUMMARY =3D "ARM Neural Network SDK"
>>  DESCRIPTION =3D "Linux software and tools to enable machine learning
>(Caffe/Tensorflow) workloads on power-efficient devices"
>> -LICENSE =3D "MIT"
>> +LICENSE =3D "MIT & Apache-2.0"
>>  LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D3e14a924c16f7d828b8335a59da64074"
>> +LIC_FILES_CHKSUM_tfmodel =3D
>"file://tfmodel/LICENSE;md5=3D7e2764bb89441ae65b52f305ffee5fa8"
>
>This is incorrect - why do you use _tfmodel override here? And it won't wo=
rk
>anyway. You simply need to add both entries to the variable.
>
Will fix this as the following in patch v3.
LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3e14a924c16f7d828b8335a59da64074=
 \
                    file://../tfmodel/LICENSE;md5=3D7e2764bb89441ae65b52f30=
5ffee5fa8"

>BTW, tfmodel is a new entry in v2 - it wasn't there in v1...
>
Tfmodel (tensorflow model) was added to get the LICENSE file for Apache-2.0=
 for mobilenet (which is one of the tensorflow models).

>

>> -PV =3D "20180502"
>> +PV =3D "18.08"
>> +PV_MAJOR =3D "${@d.getVar('PV',d,1).split('.')[0]}"
>>
>>  BRANCH =3D "master"
>> -SRCREV =3D "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
>> +SRCREV =3D "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
>> +SRCREV_tfmodel =3D "d299118e54aade794d5d98d9122b392783faeb8a"
>> +SRCREV_tidl-api =3D "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
>> +
>> +SRCREV_FORMAT =3D "armnn"
>>
>>  S =3D "${WORKDIR}/git"
>>
>>  inherit cmake
>>
>>  SRC_URI =3D " \
>> -    git://github.com/ARM-software/armnn.git;branch=3D${BRANCH} \
>> +
>> + git://github.com/ARM-software/armnn.git;name=3Darmnn;branch=3D${BRANCH=
}
>> + \
>>      file://0001-stdlib-issue-work-around.patch \
>>      file://0002-enable-use-of-boost-shared-library.patch \
>> +    file://0003-add-more-test-command-line-arguments.patch \
>> +    file://0004-generate-versioned-library.patch \
>> +    file://0005-add-armnn-mobilenet-test-example.patch \
>> +    file://0006-armnn-mobilenet-test-example.patch \
>> +
>git://github.com/tensorflow/models;name=3Dtfmodel;branch=3D${BRANCH};subdi=
r=3D
>${WORKDIR}/tfmodel;destsuffix=3Dtfmodel \
>> +
>http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet
>_v1_1.0_224.tgz;name=3Dmobilenet;subdir=3D${WORKDIR}/tfmodel;destsuffix=3D=
tfmo
>del \
>> +
>> + git://git.ti.com/tidl/tidl-api.git;name=3Dtidl-api;branch=3D${BRANCH};=
su
>> + bdir=3D${WORKDIR}/tidl-api;destsuffix=3Dtidl-api \
>>  "
>>
>> +SRC_URI[mobilenet.md5sum] =3D "d5f69cef81ad8afb335d9727a17c462a"
>> +SRC_URI[mobilenet.sha256sum] =3D
>"1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
>> +
>>  DEPENDS =3D " \
>>      boost \
>>      protobuf \
>> @@ -25,6 +41,7 @@ DEPENDS =3D " \
>>      arm-compute-library \
>>      armnn-caffe \
>>      armnn-tensorflow \
>> +    opencv \
>>  "
>>
>>  RDEPENDS_${PN} =3D " arm-compute-library protobuf boost "
>> @@ -39,22 +56,29 @@ EXTRA_OECMAKE=3D" \
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
>> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb
>${D}${TESTVECS_INSTALL_DIR}/models
>> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt
>${D}${TESTVECS_INSTALL_DIR}/models
>> +    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
>> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4
>${D}${TESTVECS_INSTALL_DIR}/testvecs
>> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg
>> + ${D}${TESTVECS_INSTALL_DIR}/testvecs
>>      chrpath -d ${D}${bindir}/*
>>  }
>>
>>  CXXFLAGS +=3D "-fopenmp"
>>  LIBS +=3D "-larmpl_lp64_mp"
>>
>> -SOLIBS =3D ".so"
>> -FILES_SOLIBSDEV =3D ""
>> -FILES_${PN} +=3D "{bindir}/*"
>> -FILES_${PN} +=3D "{libdir}/*"
>> +FILES_${PN} +=3D "${TESTVECS_INSTALL_DIR}"
>>  FILES_${PN}-dev +=3D "{libdir}/cmake/*"
>>  INSANE_SKIP_${PN}-dev =3D "dev-elf"
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

