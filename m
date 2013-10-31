Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1CA7F5299D
	for <meta-arago@arago-project.org>;
	Thu, 31 Oct 2013 13:41:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9VDfjXU018060
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2013 08:41:45 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9VDfjFb025656
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2013 08:41:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 31 Oct 2013 08:41:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
Thread-Index: AQHO1aNfJaIv8hQeGkKbtq4NLjkLgpoOiScAgABIhyA=
Date: Thu, 31 Oct 2013 13:41:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597EF49C@DLEE11.ent.ti.com>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
	<5271DA2C.8070401@ti.com>
In-Reply-To: <5271DA2C.8070401@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ti-cmem: New recipes for ti-cmem
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
X-List-Received-Date: Thu, 31 Oct 2013 13:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, October 30, 2013 11:19 PM
>To: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-
>cmem
>
>On 10/31/2013 12:37 AM, Sam Nelson wrote:
>> - Recipes for ti-cmem which provides user space api for
>contigous memory allocaion
>> - ti-cmem_mod provides the kernel module
>> - ti-mem provides the user space library
>
>Why do we need to create a new recipe? The ti-linuxutils in meta-
>ti
>should be the provider for cmem. Shouldn't that be updated for
>newer
>versions?
>Also, I would suggest that we make it machine compatible with
>omap-a15.

I don't know that linuxutils is really the right solution.  I think it main=
ly comes down to where/how is cmem being released.  So really the question =
is whether the SRC_URI used below is the official cmem release point or is =
the SRC_URI from linuxutils right?  We do not need multiple versions of cme=
m where everyone has their own fork of the cmem code.

Another point is shouldn't this be in meta-ti for at least the cmem module?

>
>>
>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>> ---
>>   .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40
>++++++++++++++++++++
>>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20
>++++++++++
>>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10
>+++++
>>   3 files changed, 70 insertions(+)
>>   create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-
>cmem-mod.bb
>>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-
>cmem.bb
>>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-
>cmem.inc
>>
>> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-
>mod.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
>> new file mode 100755
>> index 0000000..0839c20
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
>> @@ -0,0 +1,40 @@
>> +DESCRIPTION=3D"The cmem component module for contiguous memory
>allocation from userspace "
>> +
>>
>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
>> +
>> +LICENSE =3D "GPLv2"
>> +
>> +include ti-cmem.inc
>> +
>> +RDEPENDS_${PN} +=3D "kernel (=3D${KERNEL_VERSION})"
>> +
>> +DEPENDS +=3D "virtual/kernel"
>> +
>> +NAME=3D"cmem"
>> +MODULE_BUILD_DIR =3D"src/cmem/module"
>> +
>> +# This package builds a kernel module, use kernel PR as base
>and append a local
>> +PR =3D "${MACHINE_KERNEL_PR}"
>> +PR_append =3D "a"
>> +
>> +PKG_${PN} =3D "kernel-module-${PN}"
>> +
>> +KERNEL_VERSION =3D
>"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit module
>> +
>> +do_compile () {
>> +    cd ${S}
>> +    make -f lu.mak module_clean
>> +    make -f lu.mak module
>KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
>TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
>> +}
>> +
>> +do_install () {
>> +    cd ${S}
>> +    make -f lu.mak module_install
>KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
>EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
>INSTALL_MOD_PATH=3D"${D}"
>> +}
>> +
>> +PACKAGE_STRIP =3D "no"
>> +
>> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
>b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
>> new file mode 100644
>> index 0000000..a106aa0
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
>> @@ -0,0 +1,20 @@
>> +DESCRIPTION=3D"The cmem component supports contiguous memory
>allocation from userspace "
>> +
>>
>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
>> +
>> +LICENSE =3D "GPLv2"
>> +
>> +include ti-cmem.inc
>> +
>> +DEPENDS =3D "ti-cmem-mod"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PR =3D "r1"
>> +
>> +PACKAGES =3D+ "${PN}-test"
>> +
>> +FILES_${PN}-test =3D "${bindir}/*"
>> +
>> +inherit autotools
>> +
>> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
>b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
>> new file mode 100644
>> index 0000000..9308b2d
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
>> @@ -0,0 +1,10 @@
>>
>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
>> +
>> +LIC_FILES_CHKSUM =3D
>"file://products.mak;beginline=3D2;endline=3D30;md5=3D195feadf798bb4165b
>cb1a23ffd50dbb"
>> +
>> +COMPATIBLE_MACHINE =3D "keystone-evm"
>> +
>> +BRANCH ?=3D "master"
>> +SRCREV =3D "4.00.00.06"
>> +
>> +SRC_URI =3D
>"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

