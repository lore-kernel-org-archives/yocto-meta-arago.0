Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C7952529F4
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 02:44:16 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE2iG8F021159
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 20:44:16 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE2iGgU028122
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 20:44:16 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 13 Nov 2012 20:44:16 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [arago-commits] Denys Dmytriyenko :
	external-arago-sdk-toolchain:	package up gdb from the toolchain as well
Thread-Index: AQHNwVkL+tyJihMipEGhQNDIorIgGZfnwgdQgAABHQCAAT3igP//oCfs
Date: Wed, 14 Nov 2012 02:44:15 +0000
Message-ID: <580F15A3-540F-480F-BEFC-9B7989D20BDF@ti.com>
References: <20121113044034.9EA3D529AE@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C31F344@DFLE09.ent.ti.com>,
	<20121114022719.GC13096@edge>
In-Reply-To: <20121114022719.GC13096@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [arago-commits] Denys Dmytriyenko : external-arago-sdk-toolchain:	package up gdb from the toolchain as well
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
X-List-Received-Date: Wed, 14 Nov 2012 02:44:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not being able to debug via Qt Creator is not an option.

If we need to pull recipes in so we can build against 7.2 then let's do tha=
t.

If we need to recompile the toolchain and package up this toolchain and dis=
tribute it as a prebuilt toolchain we can do that also.

Any other options I missed?


On Nov 13, 2012, at 8:27 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> Well, gdb from the Arago toolchain does not provide python support, as th=
at's=20
> how it was built back then...
>=20
> The only way to get Python support built into gdb is to rebuild it from=20
> sources, which we discussed and agreed not to do. Moreover, if you want g=
db=20
> built from sources, it will be of a different version - OE-Core provides=
=20
> version 7.4, while we got clearance for 7.2 and also we have target gdbse=
rver=20
> of version 7.2 as well...
>=20
> Denys
>=20
>=20
> On Tue, Nov 13, 2012 at 01:31:37PM +0000, Cooper Jr., Franklin wrote:
>>=20
>> We need gdb with python support is required for Qt debugging via Qt Crea=
tor http://arago-project.org/pipermail/arago-commits/2012-January/001611.ht=
ml.
>> Gdb-cross-canadian recipe seems to include this needed support.
>>=20
>> A simple test to determine if python support has been added to gdb.
>> Run gdb
>> Enter python print 23.
>> 23 should be echoed back to the console.
>>=20
>> My build that picked up your gdb changes did not include python support =
for gdb.
>>=20
>> -----Original Message-----
>> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-boun=
ces@arago-project.org] On Behalf Of Arago Project git
>> Sent: Monday, November 12, 2012 10:41 PM
>> To: arago-commits@arago-project.org
>> Subject: [arago-commits] Denys Dmytriyenko : external-arago-sdk-toolchai=
n: package up gdb from the toolchain as well
>>=20
>> Module: meta-arago
>> Branch: master
>> Commit: 78bec05ff04e6e98def765e61a7a00c35c635938
>> URL:    http://arago-project.org/git/meta-arago.git?a=3Dcommit;h=3D78bec=
05ff04e6e98def765e61a7a00c35c635938
>>=20
>> Author: Denys Dmytriyenko <denys@ti.com>
>> Date:   Mon Nov 12 23:35:52 2012 -0500
>>=20
>> external-arago-sdk-toolchain: package up gdb from the toolchain as well
>>=20
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>=20
>> ---
>>=20
>> .../meta/external-arago-sdk-toolchain.bb           |   25 ++++++++++++++=
+++++-
>> 1 files changed, 24 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta-arago-extras/recipes-core/meta/external-arago-sdk-tool=
chain.bb b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain=
.bb
>> index 4b16bc1..abd1caf 100644
>> --- a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.b=
b
>> +++ b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.b
>> +++ b
>> @@ -2,7 +2,7 @@ inherit cross-canadian
>>=20
>> require external-arago-toolchain.inc
>>=20
>> -PR =3D "r2"
>> +PR =3D "r3"
>>=20
>> INHIBIT_PACKAGE_STRIP =3D "1"
>> INHIBIT_DEFAULT_DEPS =3D "1"
>> @@ -16,15 +16,18 @@ LIC_FILES_CHKSUM =3D "\  "
>>=20
>> INSANE_SKIP_gcc-cross-canadian-arm =3D "dev-so"
>> +INSANE_SKIP_gdb-cross-canadian-arm =3D "dev-so"
>> INSANE_SKIP_binutils-cross-canadian-arm =3D "dev-so"
>>=20
>> PROVIDES =3D "\
>>    gcc-cross-canadian-arm \
>> +    gdb-cross-canadian-arm \
>>    binutils-cross-canadian-arm \
>> "
>>=20
>> PACKAGES =3D "\
>>    gcc-cross-canadian-arm \
>> +    gdb-cross-canadian-arm \
>>    binutils-cross-canadian-arm \
>> "
>>=20
>> @@ -32,6 +35,7 @@ PACKAGES =3D "\
>> bindir =3D "${exec_prefix}/bin/"
>> libdir =3D "${exec_prefix}/lib/"
>> libexecdir =3D "${exec_prefix}/libexec/"
>> +datadir =3D "${exec_prefix}/share/"
>>=20
>> gcclibdir =3D "${libdir}/gcc"
>>=20
>> @@ -55,6 +59,14 @@ FILES_gcc-cross-canadian-arm =3D "\
>>    ${libexecdir}/* \
>> "
>>=20
>> +FILES_gdb-cross-canadian-arm =3D "\
>> +    ${bindir}/${TARGET_PREFIX}gdb \
>> +    ${bindir}/${TARGET_PREFIX}gdbtui \
>> +    ${datadir}/gdb/* \
>> +    ${datadir}/info/* \
>> +    ${datadir}/man/man1/${TARGET_PREFIX}* \ "
>> +
>> FILES_binutils-cross-canadian-arm =3D "\
>>    ${prefix}/${ARAGO_TARGET_SYS}/bin/ld \
>>    ${prefix}/${ARAGO_TARGET_SYS}/bin/addr2line \ @@ -91,14 +103,17 @@ FI=
LES_binutils-cross-canadian-arm =3D "\  "
>>=20
>> DESCRIPTION_gcc-cross-canadian-arm =3D "The GNU cc and gcc C compilers"
>> +DESCRIPTION_gdb-cross-canadian-arm =3D "gdb - GNU debugger"
>> DESCRIPTION_binutils-cross-canadian-arm =3D "A GNU collection of binary =
utilities"
>>=20
>> LICENSE =3D "${ARG_LIC_LIBC}"
>> LICENSE_gcc-cross-canadian-arm =3D "${ARG_LIC_GCC}"
>> +LICENSE_gdb-cross-canadian-arm =3D "${ARG_LIC_GDB}"
>> LICENSE_binutils-cross-canadian-arm =3D "${ARG_LIC_BFD}"
>>=20
>> PKGV =3D "${ARG_VER_MAIN}"
>> PKGV_gcc-cross-canadian-arm =3D "${ARG_VER_GCC}"
>> +PKGV_gdb-cross-canadian-arm =3D "${ARG_VER_GDB}"
>> PKGV_binutils-cross-canadian-arm =3D "${ARG_VER_BFD}"
>>=20
>> do_install() {
>> @@ -109,6 +124,9 @@ do_install() {
>>    install -d ${D}${libdir}/ldscripts
>>    install -d ${D}${includedir}
>>    install -d ${D}${libexecdir}
>> +    install -d ${D}${datadir}/gdb
>> +    install -d ${D}${datadir}/info
>> +    install -d ${D}${datadir}/man/man1
>>    install -d ${D}${gcclibdir}/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}/includ=
e
>>    install -d ${D}${prefix}/i686-linux
>>=20
>> @@ -118,6 +136,11 @@ do_install() {
>>    cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gccbug,gcc,g++,cpp}=
 ${D}${bindir}
>>    cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
>>=20
>> +    cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gdb,gdbtui} ${D}${bind=
ir}
>> +    cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/
>> +    cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/
>> +    cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}*
>> +${D}${datadir}/man/man1/
>> +
>>    cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/bin/{ld,addr2line,objcopy=
,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${pr=
efix}/${ARAGO_TARGET_SYS}/bin
>>    cp -a ${TOOLCHAIN_PATH}/include/*.h ${D}${includedir}
>>    cp -a ${TOOLCHAIN_PATH}/lib/ldscripts/* ${D}${libdir}/ldscripts
>>=20
>> _______________________________________________
>> arago-commits mailing list
>> arago-commits@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

