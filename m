Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E350552A6F
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 03:58:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE3whSi026355
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 21:58:43 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE3whNE015807
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 21:58:43 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 13 Nov 2012 21:58:43 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [arago-commits] Denys Dmytriyenko :
	external-arago-sdk-toolchain:	package up gdb from the toolchain as well
Thread-Index: AQHNwg+pqjLR6MRmHEmDhuwdZot+c5fpBFSA//+wOhU=
Date: Wed, 14 Nov 2012 03:58:42 +0000
Message-ID: <DA9820EE-0593-4552-A1FC-6167B44C2CB9@ti.com>
References: <20121113044034.9EA3D529AE@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C31F344@DFLE09.ent.ti.com>,
	<20121114022719.GC13096@edge>,
	<580F15A3-540F-480F-BEFC-9B7989D20BDF@ti.com>
In-Reply-To: <580F15A3-540F-480F-BEFC-9B7989D20BDF@ti.com>
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
X-List-Received-Date: Wed, 14 Nov 2012 03:58:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DA9820EE05934552A1FC6167B44C2CB9ticom_"

--_000_DA9820EE05934552A1FC6167B44C2CB9ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What were we doing in the past?  Qtcreator used to work correct?

Sent from my cell phone

----- Reply message -----
From: "Cooper Jr., Franklin" <fcooper@ti.com>
Date: Tue, Nov 13, 2012 8:44 pm
Subject: [meta-arago] [arago-commits] Denys Dmytriyenko : external-arago-sd=
k-toolchain: package up gdb from the toolchain as well
To: "Dmytriyenko, Denys" <denys@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>

Not being able to debug via Qt Creator is not an option.

If we need to pull recipes in so we can build against 7.2 then let's do tha=
t.

If we need to recompile the toolchain and package up this toolchain and dis=
tribute it as a prebuilt toolchain we can do that also.

Any other options I missed?


On Nov 13, 2012, at 8:27 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> Well, gdb from the Arago toolchain does not provide python support, as th=
at's
> how it was built back then...
>
> The only way to get Python support built into gdb is to rebuild it from
> sources, which we discussed and agreed not to do. Moreover, if you want g=
db
> built from sources, it will be of a different version - OE-Core provides
> version 7.4, while we got clearance for 7.2 and also we have target gdbse=
rver
> of version 7.2 as well...
>
> Denys
>
>
> On Tue, Nov 13, 2012 at 01:31:37PM +0000, Cooper Jr., Franklin wrote:
>>
>> We need gdb with python support is required for Qt debugging via Qt Crea=
tor http://arago-project.org/pipermail/arago-commits/2012-January/001611.ht=
ml.
>> Gdb-cross-canadian recipe seems to include this needed support.
>>
>> A simple test to determine if python support has been added to gdb.
>> Run gdb
>> Enter python print 23.
>> 23 should be echoed back to the console.
>>
>> My build that picked up your gdb changes did not include python support =
for gdb.
>>
>> -----Original Message-----
>> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-boun=
ces@arago-project.org] On Behalf Of Arago Project git
>> Sent: Monday, November 12, 2012 10:41 PM
>> To: arago-commits@arago-project.org
>> Subject: [arago-commits] Denys Dmytriyenko : external-arago-sdk-toolchai=
n: package up gdb from the toolchain as well
>>
>> Module: meta-arago
>> Branch: master
>> Commit: 78bec05ff04e6e98def765e61a7a00c35c635938
>> URL:    http://arago-project.org/git/meta-arago.git?a=3Dcommit;h=3D78bec=
05ff04e6e98def765e61a7a00c35c635938
>>
>> Author: Denys Dmytriyenko <denys@ti.com>
>> Date:   Mon Nov 12 23:35:52 2012 -0500
>>
>> external-arago-sdk-toolchain: package up gdb from the toolchain as well
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>
>> ---
>>
>> .../meta/external-arago-sdk-toolchain.bb           |   25 ++++++++++++++=
+++++-
>> 1 files changed, 24 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-core/meta/external-arago-sdk-tool=
chain.bb b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain=
.bb
>> index 4b16bc1..abd1caf 100644
>> --- a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.b=
b
>> +++ b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.b
>> +++ b
>> @@ -2,7 +2,7 @@ inherit cross-canadian
>>
>> require external-arago-toolchain.inc
>>
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> INHIBIT_PACKAGE_STRIP =3D "1"
>> INHIBIT_DEFAULT_DEPS =3D "1"
>> @@ -16,15 +16,18 @@ LIC_FILES_CHKSUM =3D "\  "
>>
>> INSANE_SKIP_gcc-cross-canadian-arm =3D "dev-so"
>> +INSANE_SKIP_gdb-cross-canadian-arm =3D "dev-so"
>> INSANE_SKIP_binutils-cross-canadian-arm =3D "dev-so"
>>
>> PROVIDES =3D "\
>>    gcc-cross-canadian-arm \
>> +    gdb-cross-canadian-arm \
>>    binutils-cross-canadian-arm \
>> "
>>
>> PACKAGES =3D "\
>>    gcc-cross-canadian-arm \
>> +    gdb-cross-canadian-arm \
>>    binutils-cross-canadian-arm \
>> "
>>
>> @@ -32,6 +35,7 @@ PACKAGES =3D "\
>> bindir =3D "${exec_prefix}/bin/"
>> libdir =3D "${exec_prefix}/lib/"
>> libexecdir =3D "${exec_prefix}/libexec/"
>> +datadir =3D "${exec_prefix}/share/"
>>
>> gcclibdir =3D "${libdir}/gcc"
>>
>> @@ -55,6 +59,14 @@ FILES_gcc-cross-canadian-arm =3D "\
>>    ${libexecdir}/* \
>> "
>>
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
>>
>> DESCRIPTION_gcc-cross-canadian-arm =3D "The GNU cc and gcc C compilers"
>> +DESCRIPTION_gdb-cross-canadian-arm =3D "gdb - GNU debugger"
>> DESCRIPTION_binutils-cross-canadian-arm =3D "A GNU collection of binary =
utilities"
>>
>> LICENSE =3D "${ARG_LIC_LIBC}"
>> LICENSE_gcc-cross-canadian-arm =3D "${ARG_LIC_GCC}"
>> +LICENSE_gdb-cross-canadian-arm =3D "${ARG_LIC_GDB}"
>> LICENSE_binutils-cross-canadian-arm =3D "${ARG_LIC_BFD}"
>>
>> PKGV =3D "${ARG_VER_MAIN}"
>> PKGV_gcc-cross-canadian-arm =3D "${ARG_VER_GCC}"
>> +PKGV_gdb-cross-canadian-arm =3D "${ARG_VER_GDB}"
>> PKGV_binutils-cross-canadian-arm =3D "${ARG_VER_BFD}"
>>
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
>>
>> @@ -118,6 +136,11 @@ do_install() {
>>    cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gccbug,gcc,g++,cpp}=
 ${D}${bindir}
>>    cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
>>
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
>>
>> _______________________________________________
>> arago-commits mailing list
>> arago-commits@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_DA9820EE05934552A1FC6167B44C2CB9ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<style>
<!--
.x_EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>What were we doing in the past? &nbsp;Qtcreator used to work correct?<=
br>
<br>
Sent from my cell phone<br>
<br>
<div id=3D"x_htc_header" style=3D"">----- Reply message -----<br>
From: &quot;Cooper Jr., Franklin&quot; &lt;fcooper@ti.com&gt;<br>
Date: Tue, Nov 13, 2012 8:44 pm<br>
Subject: [meta-arago] [arago-commits] Denys Dmytriyenko : external-arago-sd=
k-toolchain: package up gdb from the toolchain as well<br>
To: &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.com&gt;<br>
Cc: &quot;meta-arago@arago-project.org&quot; &lt;meta-arago@arago-project.o=
rg&gt;<br>
<br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Not being able to debug via Qt Creator is not an o=
ption.<br>
<br>
If we need to pull recipes in so we can build against 7.2 then let's do tha=
t.<br>
<br>
If we need to recompile the toolchain and package up this toolchain and dis=
tribute it as a prebuilt toolchain we can do that also.<br>
<br>
Any other options I missed?<br>
<br>
<br>
On Nov 13, 2012, at 8:27 PM, &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.co=
m&gt; wrote:<br>
<br>
&gt; Well, gdb from the Arago toolchain does not provide python support, as=
 that's <br>
&gt; how it was built back then...<br>
&gt; <br>
&gt; The only way to get Python support built into gdb is to rebuild it fro=
m <br>
&gt; sources, which we discussed and agreed not to do. Moreover, if you wan=
t gdb <br>
&gt; built from sources, it will be of a different version - OE-Core provid=
es <br>
&gt; version 7.4, while we got clearance for 7.2 and also we have target gd=
bserver <br>
&gt; of version 7.2 as well...<br>
&gt; <br>
&gt; Denys<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Nov 13, 2012 at 01:31:37PM &#43;0000, Cooper Jr., Franklin wro=
te:<br>
&gt;&gt; <br>
&gt;&gt; We need gdb with python support is required for Qt debugging via Q=
t Creator <a href=3D"http://arago-project.org/pipermail/arago-commits/2012-=
January/001611.html">
http://arago-project.org/pipermail/arago-commits/2012-January/001611.html</=
a>.<br>
&gt;&gt; Gdb-cross-canadian recipe seems to include this needed support.<br=
>
&gt;&gt; <br>
&gt;&gt; A simple test to determine if python support has been added to gdb=
.<br>
&gt;&gt; Run gdb<br>
&gt;&gt; Enter python print 23.<br>
&gt;&gt; 23 should be echoed back to the console.<br>
&gt;&gt; <br>
&gt;&gt; My build that picked up your gdb changes did not include python su=
pport for gdb.<br>
&gt;&gt; <br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: arago-commits-bounces@arago-project.org [<a href=3D"mailto:a=
rago-commits-bounces@arago-project.org">mailto:arago-commits-bounces@arago-=
project.org</a>] On Behalf Of Arago Project git<br>
&gt;&gt; Sent: Monday, November 12, 2012 10:41 PM<br>
&gt;&gt; To: arago-commits@arago-project.org<br>
&gt;&gt; Subject: [arago-commits] Denys Dmytriyenko : external-arago-sdk-to=
olchain: package up gdb from the toolchain as well<br>
&gt;&gt; <br>
&gt;&gt; Module: meta-arago<br>
&gt;&gt; Branch: master<br>
&gt;&gt; Commit: 78bec05ff04e6e98def765e61a7a00c35c635938<br>
&gt;&gt; URL:&nbsp;&nbsp;&nbsp; <a href=3D"http://arago-project.org/git/met=
a-arago.git?a=3Dcommit;h=3D78bec05ff04e6e98def765e61a7a00c35c635938">
http://arago-project.org/git/meta-arago.git?a=3Dcommit;h=3D78bec05ff04e6e98=
def765e61a7a00c35c635938</a><br>
&gt;&gt; <br>
&gt;&gt; Author: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
&gt;&gt; Date:&nbsp;&nbsp; Mon Nov 12 23:35:52 2012 -0500<br>
&gt;&gt; <br>
&gt;&gt; external-arago-sdk-toolchain: package up gdb from the toolchain as=
 well<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
&gt;&gt; <br>
&gt;&gt; ---<br>
&gt;&gt; <br>
&gt;&gt; .../meta/external-arago-sdk-toolchain.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 25 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<b=
r>
&gt;&gt; 1 files changed, 24 insertions(&#43;), 1 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/meta-arago-extras/recipes-core/meta/external-arago-sd=
k-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arago-sdk-too=
lchain.bb<br>
&gt;&gt; index 4b16bc1..abd1caf 100644<br>
&gt;&gt; --- a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolc=
hain.bb<br>
&gt;&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-core/meta/external-ara=
go-sdk-toolchain.b<br>
&gt;&gt; &#43;&#43;&#43; b<br>
&gt;&gt; @@ -2,7 &#43;2,7 @@ inherit cross-canadian<br>
&gt;&gt; <br>
&gt;&gt; require external-arago-toolchain.inc<br>
&gt;&gt; <br>
&gt;&gt; -PR =3D &quot;r2&quot;<br>
&gt;&gt; &#43;PR =3D &quot;r3&quot;<br>
&gt;&gt; <br>
&gt;&gt; INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt;&gt; INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;&gt; @@ -16,15 &#43;16,18 @@ LIC_FILES_CHKSUM =3D &quot;\&nbsp; &quot;<=
br>
&gt;&gt; <br>
&gt;&gt; INSANE_SKIP_gcc-cross-canadian-arm =3D &quot;dev-so&quot;<br>
&gt;&gt; &#43;INSANE_SKIP_gdb-cross-canadian-arm =3D &quot;dev-so&quot;<br>
&gt;&gt; INSANE_SKIP_binutils-cross-canadian-arm =3D &quot;dev-so&quot;<br>
&gt;&gt; <br>
&gt;&gt; PROVIDES =3D &quot;\<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; gcc-cross-canadian-arm \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; gdb-cross-canadian-arm \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; binutils-cross-canadian-arm \<br>
&gt;&gt; &quot;<br>
&gt;&gt; <br>
&gt;&gt; PACKAGES =3D &quot;\<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; gcc-cross-canadian-arm \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; gdb-cross-canadian-arm \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; binutils-cross-canadian-arm \<br>
&gt;&gt; &quot;<br>
&gt;&gt; <br>
&gt;&gt; @@ -32,6 &#43;35,7 @@ PACKAGES =3D &quot;\<br>
&gt;&gt; bindir =3D &quot;${exec_prefix}/bin/&quot;<br>
&gt;&gt; libdir =3D &quot;${exec_prefix}/lib/&quot;<br>
&gt;&gt; libexecdir =3D &quot;${exec_prefix}/libexec/&quot;<br>
&gt;&gt; &#43;datadir =3D &quot;${exec_prefix}/share/&quot;<br>
&gt;&gt; <br>
&gt;&gt; gcclibdir =3D &quot;${libdir}/gcc&quot;<br>
&gt;&gt; <br>
&gt;&gt; @@ -55,6 &#43;59,14 @@ FILES_gcc-cross-canadian-arm =3D &quot;\<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp; ${libexecdir}/* \<br>
&gt;&gt; &quot;<br>
&gt;&gt; <br>
&gt;&gt; &#43;FILES_gdb-cross-canadian-arm =3D &quot;\<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ${bindir}/${TARGET_PREFIX}gdb \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ${bindir}/${TARGET_PREFIX}gdbtui \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ${datadir}/gdb/* \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ${datadir}/info/* \<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ${datadir}/man/man1/${TARGET_PREFIX}* \ &q=
uot;<br>
&gt;&gt; &#43;<br>
&gt;&gt; FILES_binutils-cross-canadian-arm =3D &quot;\<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; ${prefix}/${ARAGO_TARGET_SYS}/bin/ld \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; ${prefix}/${ARAGO_TARGET_SYS}/bin/addr2line \ @@=
 -91,14 &#43;103,17 @@ FILES_binutils-cross-canadian-arm =3D &quot;\&nbsp; =
&quot;<br>
&gt;&gt; <br>
&gt;&gt; DESCRIPTION_gcc-cross-canadian-arm =3D &quot;The GNU cc and gcc C =
compilers&quot;<br>
&gt;&gt; &#43;DESCRIPTION_gdb-cross-canadian-arm =3D &quot;gdb - GNU debugg=
er&quot;<br>
&gt;&gt; DESCRIPTION_binutils-cross-canadian-arm =3D &quot;A GNU collection=
 of binary utilities&quot;<br>
&gt;&gt; <br>
&gt;&gt; LICENSE =3D &quot;${ARG_LIC_LIBC}&quot;<br>
&gt;&gt; LICENSE_gcc-cross-canadian-arm =3D &quot;${ARG_LIC_GCC}&quot;<br>
&gt;&gt; &#43;LICENSE_gdb-cross-canadian-arm =3D &quot;${ARG_LIC_GDB}&quot;=
<br>
&gt;&gt; LICENSE_binutils-cross-canadian-arm =3D &quot;${ARG_LIC_BFD}&quot;=
<br>
&gt;&gt; <br>
&gt;&gt; PKGV =3D &quot;${ARG_VER_MAIN}&quot;<br>
&gt;&gt; PKGV_gcc-cross-canadian-arm =3D &quot;${ARG_VER_GCC}&quot;<br>
&gt;&gt; &#43;PKGV_gdb-cross-canadian-arm =3D &quot;${ARG_VER_GDB}&quot;<br=
>
&gt;&gt; PKGV_binutils-cross-canadian-arm =3D &quot;${ARG_VER_BFD}&quot;<br=
>
&gt;&gt; <br>
&gt;&gt; do_install() {<br>
&gt;&gt; @@ -109,6 &#43;124,9 @@ do_install() {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; install -d ${D}${libdir}/ldscripts<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; install -d ${D}${libexecdir}<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/gdb<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/info<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/man/man1<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; install -d ${D}${gcclibdir}/${ARAGO_TARGET_SYS}/=
${ARG_VER_GCC}/include<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; install -d ${D}${prefix}/i686-linux<br>
&gt;&gt; <br>
&gt;&gt; @@ -118,6 &#43;136,11 @@ do_install() {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gco=
v,gccbug,gcc,g&#43;&#43;,cpp} ${D}${bindir}<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecd=
ir}<br>
&gt;&gt; <br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFI=
X}{gdb,gdbtui} ${D}${bindir}<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${=
datadir}/gdb/<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}$=
{datadir}/info/<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/share/man/man1/${T=
ARGET_PREFIX}*<br>
&gt;&gt; &#43;${D}${datadir}/man/man1/<br>
&gt;&gt; &#43;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/bin/=
{ld,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c&#43;&#43;filt,ar,s=
trings,objdump,size} ${D}${prefix}/${ARAGO_TARGET_SYS}/bin<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/include/*.h ${D}${includ=
edir}<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; cp -a ${TOOLCHAIN_PATH}/lib/ldscripts/* ${D}${li=
bdir}/ldscripts<br>
&gt;&gt; <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; arago-commits mailing list<br>
&gt;&gt; arago-commits@arago-project.org<br>
&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/arago=
-commits">http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits</=
a><br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-arago mailing list<br>
&gt;&gt; meta-arago@arago-project.org<br>
&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-=
arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_DA9820EE05934552A1FC6167B44C2CB9ticom_--
