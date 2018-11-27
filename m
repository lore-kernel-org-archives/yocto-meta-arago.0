Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1B593529D0
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 20:00:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARK0NDC109400
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 14:00:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543348823;
	bh=PqmnI5NR/ffAJUqDe3IhQoBXQvMMFV2MU1EtsOhwDfQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bBz1QZNTIdsE+WWrlUA1bu5wpYIjdWTjuOpSF4oY8QPvio1hdBY/90DaJhxSzCPJS
	IVraBhuls3spkw/t7EqZnPN38wBQy1gs/12cskCDV9BYqjHDfUu79Y3qZ4X6DoHo5A
	8XywI07CMf8PKiS9ukZo+tDSHyZJ3ZxkZNeZrlgU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARK0N0K004046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 14:00:23 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 14:00:22 -0600
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
	DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
	15.01.1591.008; Tue, 27 Nov 2018 14:00:22 -0600
From: "Su, Qin" <qsu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] arm-compute-library: bump SRCREV and add
	TI benchmark test group.
Thread-Index: AQHUhdUEzfgNrGMtBU+d97DMTO/BtKVkBh5g
Date: Tue, 27 Nov 2018 20:00:22 +0000
Message-ID: <b8f61903377d478ebb3082a697acf773@ti.com>
References: <1542826913-4093-1-git-send-email-qsu@ti.com>
	<20181126221144.GI21933@beryl>
In-Reply-To: <20181126221144.GI21933@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.194]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] arm-compute-library: bump SRCREV and add TI benchmark test group.
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
X-List-Received-Date: Tue, 27 Nov 2018 20:00:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, November 26, 2018 5:12 PM
>To: Su, Qin
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH v2] arm-compute-library: bump SRCREV and
>add TI benchmark test group.
>
>On Wed, Nov 21, 2018 at 02:01:53PM -0500, Qin Su wrote:
>> updated to the latest version of 18.08 updated LIC_FILES_CHKSUM as
>> Copyright time changed in LICENSE from 2017 to 2017-2018 updated to
>> generate versioned library added benchmark preset group for squeezenet
>> and inceptionnet
>
>Mostly looks good. 2 comments re: permissions and *.so below.
>
>
>> Signed-off-by: Qin Su <qsu@ti.com>
>> ---
>>  .../0001-add-ti-benchmark-test-group.patch         | 64 +++++++++++++++=
++++
>>  .../0002-add-ti-benchmark-test-group.patch         | 74
>++++++++++++++++++++++
>>  .../0003-add-ti-benchmark-test-group.patch         | 42 ++++++++++++
>>  .../0004-add-ti-benchmark-test-group.patch         | 49 ++++++++++++++
>>  .../0005-add-ti-benchmark-test-group.patch         | 46 ++++++++++++++
>>  .../0006-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>>  .../0007-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>>  .../0008-add-ti-benchmark-test-group.patch         | 31 +++++++++
>>  .../0009-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>>  .../0010-add-ti-benchmark-test-group.patch         | 50 +++++++++++++++
>>  .../0011-add-ti-benchmark-test-group.patch         | 37 +++++++++++
>>  .../arm-compute-library/arm-compute-library_git.bb | 32 ++++++----
>>  12 files changed, 546 insertions(+), 11 deletions(-)  create mode
>> 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0001-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0002-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0003-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0004-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0005-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0006-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0007-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0008-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0009-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0010-add-ti-benchmark-test-group.patch
>>  create mode 100755
>> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
>> ary/0011-add-ti-benchmark-test-group.patch
>
>Please fix file permissions.
>
Sorry, will fix this in patch v3.

>[snip]
>
>
>> diff --git
>> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
>> brary_git.bb
>> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
>> brary_git.bb
>> index 8a65ade..3c6fae5 100644
>> ---
>> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
>> brary_git.bb
>> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
>> +++ e-library_git.bb
>> @@ -1,18 +1,30 @@
>>  SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
>>  DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library i=
s a
>set of functions optimised for both ARM CPUs and GPUs."
>>  LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3De2c93841b20cd522af621cabaea3aef8"
>> +LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D762a7ba8d2ddc3b38d88742fbaf0b62d"
>>
>> -COMPATIBLE_MACHINE =3D "armv7a"
>> +COMPATIBLE_MACHINE =3D "armv7a|aarch64"
>>
>>  SRC_URI =3D " \
>>      git://github.com/ARM-software/ComputeLibrary.git;branch=3D${BRANCH}
>> \
>> +    file://0001-add-ti-benchmark-test-group.patch \
>> +    file://0002-add-ti-benchmark-test-group.patch \
>> +    file://0003-add-ti-benchmark-test-group.patch \
>> +    file://0004-add-ti-benchmark-test-group.patch \
>> +    file://0005-add-ti-benchmark-test-group.patch \
>> +    file://0006-add-ti-benchmark-test-group.patch \
>> +    file://0007-add-ti-benchmark-test-group.patch \
>> +    file://0008-add-ti-benchmark-test-group.patch \
>> +    file://0009-add-ti-benchmark-test-group.patch \
>> +    file://0010-add-ti-benchmark-test-group.patch \
>> +    file://0011-add-ti-benchmark-test-group.patch \
>>  "
>>
>> -PV  =3D "18.05"
>> +PV  =3D "18.08"
>> +PV_MAJOR =3D "${@d.getVar('PV',d,1).split('.')[0]}"
>>
>>  BRANCH =3D "master"
>> -SRCREV =3D "e2542c9f35ca427286822cd0c9296f49914f78b0"
>> +SRCREV =3D "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> @@ -22,7 +34,8 @@ do_compile_prepend() {
>>
>>  inherit scons
>>
>> -EXTRA_OESCONS =3D "arch=3Darmv7a extra_cxx_flags=3D"-fPIC" benchmark_te=
sts=3D1
>validation_tests=3D0 neon=3D1 openmp=3D1 opencl=3D0"
>> +EXTRA_OESCONS =3D "arch=3Darmv7a extra_cxx_flags=3D"-fPIC" benchmark_te=
sts=3D1
>validation_tests=3D0 neon=3D1 openmp=3D1 opencl=3D0 set_soname=3D1"
>> +EXTRA_OESCONS_aarch64 =3D "arch=3Darm64-v8a extra_cxx_flags=3D"-fPIC"
>benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1 opencl=3D0
>set_soname=3D1"
>>
>>  LIBS +=3D "-larmpl_lp64_mp"
>>
>> @@ -30,7 +43,7 @@ do_install() {
>>      CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downers=
hip"
>>
>>      install -m 0755 -d ${D}${libdir}
>> -    for lib in ${S}/build/*.so
>> +    for lib in ${S}/build/*.so*
>>      do
>>          install -m 0755 $lib ${D}${libdir}
>>      done
>> @@ -43,16 +56,13 @@ do_install() {
>>      # Install built source package as expected by ARMNN
>>      install -d ${D}${datadir}/${BPN}
>>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
>> +    # Remove unneeded symlink .so
>> +    rm -f ${D}${datadir}/${BPN}/build/*.so
>
>Why? They are useful for development and would automatically get packaged
>into ${PN}-dev package...
>
These are the source files used by armnn. I did a clean up here with the ch=
ange of=20
enabling the use of shared library in armnn patch v3
=20
Replaced:
    # Install built source package as expected by ARMNN
    install -d ${D}${datadir}/${BPN}
    cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
    # Remove unneeded symlink .so
    rm -f ${D}${datadir}/${BPN}/build/*.so

with:
    # Install built source package as expected by ARMNN
    install -d ${D}${datadir}/${BPN}
    cp $CP_ARGS ${S}/arm_compute ${D}${datadir}/${BPN}/.
    cp $CP_ARGS ${S}/include ${D}${datadir}/${BPN}/.
    cp $CP_ARGS ${S}/support ${D}${datadir}/${BPN}/.

>
>>  }
>>
>> -SOLIBS =3D ".so"
>> -FILES_SOLIBSDEV =3D ""
>>  INSANE_SKIP_${PN} =3D "ldflags"
>>  INSANE_SKIP_${PN}-dev =3D "dev-elf ldflags"
>>
>> -PACKAGES =3D+ "${PN}-source"
>> -FILES_${PN} +=3D "${bindir}/*"
>> -FILES_${PN} +=3D "${libdir}/*.so"
>>  FILES_${PN}-source =3D "${datadir}/${BPN}"
>>  INSANE_SKIP_${PN}-source =3D "ldflags libdir staticdev"
>>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

