Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C403152A29
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 00:44:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C0itAM007925
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:44:55 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0is81027669
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:44:54 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 11 Mar 2015 19:44:54 -0500
From: "Hernandez, Carlos" <ceh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
Thread-Index: AQHQWzQJw1KtHUmZFEGVBdbKcQoYxp0YSo6A//+6jCU=
Date: Thu, 12 Mar 2015 00:44:53 +0000
Message-ID: <32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>,
	<20150311235329.GD23587@edge>
In-Reply-To: <20150311235329.GD23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
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
X-List-Received-Date: Thu, 12 Mar 2015 00:44:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_32B5D12402BE454796026F6AC58AA86E33115ACCDLEE08entticom_"

--_000_32B5D12402BE454796026F6AC58AA86E33115ACCDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Did you do a clean ltp-ddt build? The v2 patch ran successfully for me.
Carlos

Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Dmytriyenko, Denys [denys@ti.com]
Received: Wednesday, 11 Mar 2015, 7:53PM
To: Hernandez, Carlos [ceh@ti.com]
CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recip=
e

Carlos,

ltp-ddt 1.0 fails to build now:

| arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mfloat=
-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8  -L/opt/linaro-2013.03/arm-linu=
x-gnueabihf/lib -Wl,-rpath-li
nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu --sysroot=3D/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-=
linaro-toolchain/sysroots
/am335x-evm -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstac=
k-protector -O2 -pipe -g -feliminate-unused-debug-types -g -O2 -fno-strict-=
aliasing -pipe -Wall
-W  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protec=
tor -O2 -pipe -g -feliminate-unused-debug-types -Wold-style-definition -isy=
stem/opt/linaro-2013.
03/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=3D2 -I/=
home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain=
/work/am335x_evm-oe-lin
ux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/include -D_GNU_SOURCE -I/h=
ome/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
work/am335x_evm-oe-li
nux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/timers/timer_create/../in=
clude -I../../../../include -I../../../../include -L/opt/linaro-2013.03/arm=
-linux-gnueabihf/lib
-Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--h=
ash-style=3Dgnu  -L../../../../lib  timer_create02.c   -lltp -lpthread -lrt=
 -o timer_create02
| /home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/sysroots/am335x-evm/usr/lib/libfl.so: undefined reference to `yylex'
| collect2: error: ld returned 1 exit status
| make[1]: *** [ltp-bump] Error 1


Looks like flex doesn't have the right symbol - is it wrong version?

--
Denys


On Tue, Mar 10, 2015 at 09:13:33AM -0400, Carlos Hernandez wrote:
> Latest ltp release was recently merge to ltp-ddt and there is a new
> way to configure and compile ltp-ddt.
>
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  ...ite-Make-sure-to-include-generated-header.patch | 33 ++++++++
>  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 87 ++++++++++++++++=
++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/00=
01-wdt_test_suite-Make-sure-to-include-generated-header.patch
>  create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.=
0.0.bb
>
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_=
test_suite-Make-sure-to-include-generated-header.patch b/meta-arago-distro/=
recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-g=
enerated-header.patch
> new file mode 100644
> index 0000000..31df16d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_su=
ite-Make-sure-to-include-generated-header.patch
> @@ -0,0 +1,33 @@
> +From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 19 Feb 2014 19:41:33 -0800
> +Subject: [PATCH] wdt_test_suite: Make sure to include generated headers
> +
> +This makes sure that its using the generated headers
> +and not the raw headers from kernel, generated headers
> +are built for the given machine already when kernel is
> +built and are available in configured/compiled kernel tree
> +already
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + testcases/ddt/wdt_test_suite/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/ddt/wdt_t=
est_suite/Makefile
> +index 90a6a90..22a1cfd 100644
> +--- a/testcases/ddt/wdt_test_suite/Makefile
> ++++ b/testcases/ddt/wdt_test_suite/Makefile
> +@@ -20,8 +20,8 @@ INCLUDES        =3D -I $(KERNEL_INC) -I src/interface/=
common -I ../utils/user
> + INCLUDES        =3D -I src/parser \
> +                   -I src/interface/common \
> +                   -I ../utils/user \
> +-                  -I $(KERNEL_INC)/include \
> +-                  -I $(KERNEL_INC)/arch/arm/include
> ++                  -I $(KERNEL_INC)/include/generated \
> ++                  -I $(KERNEL_INC)/arch/arm/include/generated \
> +
> +#List of source files- Update this on adding a new C file
> + SOURCES :=3D \
> +--
> +1.9.0
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb =
b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> new file mode 100644
> index 0000000..c321242
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> @@ -0,0 +1,87 @@
> +SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Test Proj=
ect"
> +HOMEPAGE =3D "http://arago-project.org/git/projects/test-automation/ltp-=
ddt.git"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +PR =3D "r1"
> +
> +PROVIDES +=3D "ltp"
> +DEPENDS +=3D "zip-native virtual/kernel alsa-lib"
> +
> +inherit autotools module-base kernel-module-split
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +SRCREV =3D "ltp-ddt_1.0.0"
> +BRANCH ?=3D "master"
> +
> +SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-dd=
t.git;branch=3D${BRANCH} \
> +           file://0001-wdt_test_suite-Make-sure-to-include-generated-hea=
der.patch \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +LTPROOT =3D "/opt/ltp"
> +
> +EXTRA_OEMAKE_append =3D " \
> +    prefix=3D${LTPROOT} \
> +    CROSS_COMPILE=3D${HOST_PREFIX} \
> +    SKIP_IDCHECK=3D1 \
> +    KERNEL_INC=3D${STAGING_KERNEL_DIR} \
> +    KERNEL_USR_INC=3D${STAGING_INCDIR} \
> +    ALSA_INCPATH=3D${STAGING_INCDIR} \
> +    ALSA_LIBPATH=3D${STAGING_LIBDIR} \
> +    PLATFORM=3D${MACHINE} \
> +    RANLIB=3D${RANLIB} \
> +"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +FILES_${PN}-dbg +=3D " \
> +    ${LTPROOT}/.debug \
> +    ${LTPROOT}/bin/.debug \
> +    ${LTPROOT}/runtest/.debug \
> +    ${LTPROOT}/testcases/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/test/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
> +    ${LTPROOT}/testcases/realtime/*/*/.debug \
> +"
> +
> +FILES_${PN}-staticdev +=3D "${LTPROOT}/lib"
> +FILES_${PN} +=3D "${LTPROOT}/*"
> +
> +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure c=
all.
> +# we explicitly force regeneration of that directory and pass configure =
options.
> +do_configure_append() {
> +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS=
})
> +}
> +
> +kmoddir =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
> +
> +do_compile_append () {
> +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +    oe_runmake KERNEL_CC=3D"${KERNEL_CC}" DESTDIR=3D${D} modules
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +    install -d ${D}${datadir}
> +    install -d ${D}${kmoddir}
> +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> +}
> +
> +PR_append =3D "-arago10+gitr${SRCPV}"
> +
> +RDEPENDS_${PN} +=3D "linaro-pm-qa-utils serialcheck"
> +
> +EXTRA_OEMAKE +=3D "KERNEL_PATH=3D"${STAGING_KERNEL_DIR}""
> +
> +KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> +
> +# do_make_scripts should be a separate task for the lock to work
> +addtask make_scripts before do_compile
> +do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> +do_make_scripts[deptask] =3D "do_populate_sysroot"
> --
> 1.9.1
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_32B5D12402BE454796026F6AC58AA86E33115ACCDLEE08entticom_
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Did you do a clean ltp-ddt build? The v2 patch ran success=
fully for me.<br>
Carlos<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>Received:</b> Wednesday, 11 Mar 2015, 7:53PM<br>
<b>To:</b> Hernandez, Carlos [ceh@ti.com]<br>
<b>CC:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.=
0 recipe<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Carlos,<br>
<br>
ltp-ddt 1.0 fails to build now:<br>
<br>
| arm-linux-gnueabihf-gcc&nbsp; -march=3Darmv7-a -marm -mthumb-interwork -m=
float-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8&nbsp; -L/opt/linaro-2013.0=
3/arm-linux-gnueabihf/lib -Wl,-rpath-li<br>
nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu --sysroot=3D/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-=
linaro-toolchain/sysroots<br>
/am335x-evm -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp; -=
fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -g -O2 -fno-st=
rict-aliasing -pipe -Wall
<br>
-W&nbsp; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp; -fst=
ack-protector -O2 -pipe -g -feliminate-unused-debug-types -Wold-style-defin=
ition -isystem/opt/linaro-2013.<br>
03/arm-linux-gnueabihf/include&nbsp; -fstack-protector -D_FORTIFY_SOURCE=3D=
2 -I/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-tool=
chain/work/am335x_evm-oe-lin<br>
ux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/include -D_GNU_SOURCE -I/h=
ome/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
work/am335x_evm-oe-li<br>
nux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/timers/timer_create/../in=
clude -I../../../../include -I../../../../include -L/opt/linaro-2013.03/arm=
-linux-gnueabihf/lib
<br>
-Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--h=
ash-style=3Dgnu&nbsp; -L../../../../lib&nbsp; timer_create02.c&nbsp;&nbsp; =
-lltp -lpthread -lrt -o timer_create02<br>
| /home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/sysroots/am335x-evm/usr/lib/libfl.so: undefined reference to `yylex'<br=
>
| collect2: error: ld returned 1 exit status<br>
| make[1]: *** [ltp-bump] Error 1<br>
<br>
<br>
Looks like flex doesn't have the right symbol - is it wrong version?<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Tue, Mar 10, 2015 at 09:13:33AM -0400, Carlos Hernandez wrote:<br>
&gt; Latest ltp release was recently merge to ltp-ddt and there is a new<br=
>
&gt; way to configure and compile ltp-ddt.<br>
&gt; <br>
&gt; Signed-off-by: Carlos Hernandez &lt;ceh@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ite-Make-sure-to-include-generated-header.patch | 33 &#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 87 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 2 files changed, 120 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/lt=
p-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch<br>
&gt;&nbsp; create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/lt=
p-ddt_1.0.0.bb<br>
&gt; <br>
&gt; diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-w=
dt_test_suite-Make-sure-to-include-generated-header.patch b/meta-arago-dist=
ro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-includ=
e-generated-header.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..31df16d<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0=
001-wdt_test_suite-Make-sure-to-include-generated-header.patch<br>
&gt; @@ -0,0 &#43;1,33 @@<br>
&gt; &#43;From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; &#43;Date: Wed, 19 Feb 2014 19:41:33 -0800<br>
&gt; &#43;Subject: [PATCH] wdt_test_suite: Make sure to include generated h=
eaders<br>
&gt; &#43;<br>
&gt; &#43;This makes sure that its using the generated headers<br>
&gt; &#43;and not the raw headers from kernel, generated headers<br>
&gt; &#43;are built for the given machine already when kernel is<br>
&gt; &#43;built and are available in configured/compiled kernel tree<br>
&gt; &#43;already<br>
&gt; &#43;<br>
&gt; &#43;Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; &#43;---<br>
&gt; &#43; testcases/ddt/wdt_test_suite/Makefile | 4 &#43;&#43;--<br>
&gt; &#43; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/dd=
t/wdt_test_suite/Makefile<br>
&gt; &#43;index 90a6a90..22a1cfd 100644<br>
&gt; &#43;--- a/testcases/ddt/wdt_test_suite/Makefile<br>
&gt; &#43;&#43;&#43;&#43; b/testcases/ddt/wdt_test_suite/Makefile<br>
&gt; &#43;@@ -20,8 &#43;20,8 @@ INCLUDES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D -I $(KERNEL_INC) -I src/interface/common -I ../utils/user<br>
&gt; &#43; INCLUDES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D -I src/pa=
rser \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I src/interface/common \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I ../utils/user \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I $(KERNEL_INC)/include \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I $(KERNEL_INC)/arch/arm/include<br=
>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I $(KERNEL_INC)/include/generat=
ed \<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -I $(KERNEL_INC)/arch/arm/includ=
e/generated \<br>
&gt; &#43;<br>
&gt; &#43;#List of source files- Update this on adding a new C file<br>
&gt; &#43; SOURCES :=3D \<br>
&gt; &#43;--<br>
&gt; &#43;1.9.0<br>
&gt; diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.=
bb b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c321242<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1=
.0.0.bb<br>
&gt; @@ -0,0 &#43;1,87 @@<br>
&gt; &#43;SUMMARY =3D &quot;Embedded Linux Device Driver Tests based on Lin=
ux Test Project&quot;<br>
&gt; &#43;HOMEPAGE =3D &quot;<a href=3D"http://arago-project.org/git/projec=
ts/test-automation/ltp-ddt.git">http://arago-project.org/git/projects/test-=
automation/ltp-ddt.git</a>&quot;<br>
&gt; &#43;SECTION =3D &quot;console/utils&quot;<br>
&gt; &#43;LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D0636e7=
3ff0215e8d672dc4c32c317bb3">file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c=
317bb3</a>&quot;<br>
&gt; &#43;PR =3D &quot;r1&quot;<br>
&gt; &#43;<br>
&gt; &#43;PROVIDES &#43;=3D &quot;ltp&quot;<br>
&gt; &#43;DEPENDS &#43;=3D &quot;zip-native virtual/kernel alsa-lib&quot;<b=
r>
&gt; &#43;<br>
&gt; &#43;inherit autotools module-base kernel-module-split<br>
&gt; &#43;<br>
&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRCREV =3D &quot;ltp-ddt_1.0.0&quot;<br>
&gt; &#43;BRANCH ?=3D &quot;master&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRC_URI =3D &quot;git://arago-project.org/git/projects/test-autom=
ation/ltp-ddt.git;branch=3D${BRANCH} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://0001-wdt_test_suite-Make-sure-to-include-generated-header.pat=
ch">
file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch</a> =
\<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; &#43;<br>
&gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &#43;<br>
&gt; &#43;LTPROOT =3D &quot;/opt/ltp&quot;<br>
&gt; &#43;<br>
&gt; &#43;EXTRA_OEMAKE_append =3D &quot; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; prefix=3D${LTPROOT} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; CROSS_COMPILE=3D${HOST_PREFIX} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; SKIP_IDCHECK=3D1 \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; KERNEL_INC=3D${STAGING_KERNEL_DIR} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; KERNEL_USR_INC=3D${STAGING_INCDIR} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ALSA_INCPATH=3D${STAGING_INCDIR} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ALSA_LIBPATH=3D${STAGING_LIBDIR} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; PLATFORM=3D${MACHINE} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; RANLIB=3D${RANLIB} \<br>
&gt; &#43;&quot;<br>
&gt; &#43;<br>
&gt; &#43;TARGET_CC_ARCH &#43;=3D &quot;${LDFLAGS}&quot;<br>
&gt; &#43;<br>
&gt; &#43;FILES_${PN}-dbg &#43;=3D &quot; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/bin/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/runtest/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/*/bin/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/*/test/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/ddt/.debug \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/bin/ddt/*/test/.debug \<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp; ${LTPROOT}/testcases/realtime/*/*/.debug \<br>
&gt; &#43;&quot;<br>
&gt; &#43;<br>
&gt; &#43;FILES_${PN}-staticdev &#43;=3D &quot;${LTPROOT}/lib&quot;<br>
&gt; &#43;FILES_${PN} &#43;=3D &quot;${LTPROOT}/*&quot;<br>
&gt; &#43;<br>
&gt; &#43;# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode conf=
igure call.<br>
&gt; &#43;# we explicitly force regeneration of that directory and pass con=
figure options.<br>
&gt; &#43;do_configure_append() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./con=
figure ${CONFIGUREOPTS})<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;kmoddir =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/drivers/d=
dt&quot;<br>
&gt; &#43;<br>
&gt; &#43;do_compile_append () {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; oe_runmake KERNEL_CC=3D&quot;${KERNEL_CC}&quot=
; DESTDIR=3D${D} modules<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;do_install() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; oe_runmake DESTDIR=3D${D} install<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${kmoddir}<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}$=
{kmoddir}<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;PR_append =3D &quot;-arago10&#43;gitr${SRCPV}&quot;<br>
&gt; &#43;<br>
&gt; &#43;RDEPENDS_${PN} &#43;=3D &quot;linaro-pm-qa-utils serialcheck&quot=
;<br>
&gt; &#43;<br>
&gt; &#43;EXTRA_OEMAKE &#43;=3D &quot;KERNEL_PATH=3D&quot;${STAGING_KERNEL_=
DIR}&quot;&quot;<br>
&gt; &#43;<br>
&gt; &#43;KERNEL_MODULES_META_PACKAGE =3D &quot;${PN}&quot;<br>
&gt; &#43;<br>
&gt; &#43;# do_make_scripts should be a separate task for the lock to work<=
br>
&gt; &#43;addtask make_scripts before do_compile<br>
&gt; &#43;do_make_scripts[lockfiles] =3D &quot;${TMPDIR}/kernel-scripts.loc=
k&quot;<br>
&gt; &#43;do_make_scripts[deptask] =3D &quot;do_populate_sysroot&quot;<br>
&gt; -- <br>
&gt; 1.9.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_32B5D12402BE454796026F6AC58AA86E33115ACCDLEE08entticom_--
