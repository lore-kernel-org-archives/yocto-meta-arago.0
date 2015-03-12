Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5909F52A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 10:59:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CAxt1U015115
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 05:59:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CAxsAl021259
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 05:59:54 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 05:59:53 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Hernandez, Carlos" <ceh@ti.com>
Thread-Topic: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
Thread-Index: AQHQWzQO+VOPk3+2OEmUSaboahin5p0YSo6AgAAOXYCAAACxAIAAN0iAgAAeoGA=
Date: Thu, 12 Mar 2015 10:59:53 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107CAC@DFLE09.ent.ti.com>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
	<20150311235329.GD23587@edge>
	<32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
	<20150312004722.GE23587@edge> <20150312040513.GI23587@edge>
In-Reply-To: <20150312040513.GI23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Thu, 12 Mar 2015 10:59:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I get an error on am335x-evm, am437x-evm, and am57xx-evm. I only see the 'y=
ylex' error.

- Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, March 12, 2015 12:05 AM
To: Hernandez, Carlos
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recip=
e

Doesn't help. It still fails for am57xx-evm. It seems to build fine for am3=
35x-evm...

Besides the undefined yylex error (which might be non-fatal), I also see=20
these:

| clock_gettime03.c:141:4: error: '__NR_clock_gettime' undeclared (first us=
e in this function)

| clock_gettime03.c:168:31: error: 'cleanup' undeclared (first use in this =
function)

| faccessat01.c:70:21: error: '__NR_faccessat' undeclared (first use in thi=
s function)

--=20
Denys


On Wed, Mar 11, 2015 at 08:47:22PM -0400, Denys Dmytriyenko wrote:
> No, it wasn't a clean build. I'll try that next, but I think I need to dr=
op=20
> "share" part I've added first...
>=20
>=20
> On Wed, Mar 11, 2015 at 08:44:53PM -0400, Hernandez, Carlos wrote:
> >    Did you do a clean ltp-ddt build? The v2 patch ran successfully for =
me.
> >    Carlos
> >=20
> >    Sent from my Android phone using TouchDown (www.nitrodesk.com)
> >=20
> >    -----Original Message-----
> >    From: Dmytriyenko, Denys [denys@ti.com]
> >    Received: Wednesday, 11 Mar 2015, 7:53PM
> >    To: Hernandez, Carlos [ceh@ti.com]
> >    CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
> >    Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.=
0
> >    recipe
> >=20
> >    Carlos,
> >=20
> >    ltp-ddt 1.0 fails to build now:
> >=20
> >    | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork
> >    -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8=20
> >    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-li
> >    nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
> >    -Wl,--hash-style=3Dgnu
> >    --sysroot=3D/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-exter=
nal-linaro-toolchain/sysroots
> >    /am335x-evm -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include=
=20
> >    -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -g -O2
> >    -fno-strict-aliasing -pipe -Wall
> >    -W  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include=20
> >    -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
> >    -Wold-style-definition -isystem/opt/linaro-2013.
> >    03/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=
=3D2
> >    -I/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro=
-toolchain/work/am335x_evm-oe-lin
> >    ux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/include -D_GNU_SOUR=
CE
> >    -I/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro=
-toolchain/work/am335x_evm-oe-li
> >    nux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/timers/timer_creat=
e/../include
> >    -I../../../../include -I../../../../include
> >    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib
> >    -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
> >    -Wl,--hash-style=3Dgnu  -L../../../../lib  timer_create02.c   -lltp
> >    -lpthread -lrt -o timer_create02
> >    |
> >    /home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-t=
oolchain/sysroots/am335x-evm/usr/lib/libfl.so:
> >    undefined reference to `yylex'
> >    | collect2: error: ld returned 1 exit status
> >    | make[1]: *** [ltp-bump] Error 1
> >=20
> >    Looks like flex doesn't have the right symbol - is it wrong version?
> >=20
> >    --
> >    Denys
> >=20
> >    On Tue, Mar 10, 2015 at 09:13:33AM -0400, Carlos Hernandez wrote:
> >    > Latest ltp release was recently merge to ltp-ddt and there is a ne=
w
> >    > way to configure and compile ltp-ddt.
> >    >
> >    > Signed-off-by: Carlos Hernandez <ceh@ti.com>
> >    > ---
> >    >  ...ite-Make-sure-to-include-generated-header.patch | 33 ++++++++
> >    >  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 87
> >    ++++++++++++++++++++++
> >    >  2 files changed, 120 insertions(+)
> >    >  create mode 100644
> >    meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_sui=
te-Make-sure-to-include-generated-header.patch
> >    >  create mode 100644
> >    meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> >    >
> >    > diff --git
> >    a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_s=
uite-Make-sure-to-include-generated-header.patch
> >    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_s=
uite-Make-sure-to-include-generated-header.patch
> >    > new file mode 100644
> >    > index 0000000..31df16d
> >    > --- /dev/null
> >    > +++
> >    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_s=
uite-Make-sure-to-include-generated-header.patch
> >    > @@ -0,0 +1,33 @@
> >    > +From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00=
 2001
> >    > +From: Khem Raj <raj.khem@gmail.com>
> >    > +Date: Wed, 19 Feb 2014 19:41:33 -0800
> >    > +Subject: [PATCH] wdt_test_suite: Make sure to include generated h=
eaders
> >    > +
> >    > +This makes sure that its using the generated headers
> >    > +and not the raw headers from kernel, generated headers
> >    > +are built for the given machine already when kernel is
> >    > +built and are available in configured/compiled kernel tree
> >    > +already
> >    > +
> >    > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    > +---
> >    > + testcases/ddt/wdt_test_suite/Makefile | 4 ++--
> >    > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >    > +
> >    > +diff --git a/testcases/ddt/wdt_test_suite/Makefile
> >    b/testcases/ddt/wdt_test_suite/Makefile
> >    > +index 90a6a90..22a1cfd 100644
> >    > +--- a/testcases/ddt/wdt_test_suite/Makefile
> >    > ++++ b/testcases/ddt/wdt_test_suite/Makefile
> >    > +@@ -20,8 +20,8 @@ INCLUDES        =3D -I $(KERNEL_INC) -I
> >    src/interface/common -I ../utils/user
> >    > + INCLUDES        =3D -I src/parser \
> >    > +                   -I src/interface/common \
> >    > +                   -I ../utils/user \
> >    > +-                  -I $(KERNEL_INC)/include \
> >    > +-                  -I $(KERNEL_INC)/arch/arm/include
> >    > ++                  -I $(KERNEL_INC)/include/generated \
> >    > ++                  -I $(KERNEL_INC)/arch/arm/include/generated \
> >    > +
> >    > +#List of source files- Update this on adding a new C file
> >    > + SOURCES :=3D \
> >    > +--
> >    > +1.9.0
> >    > diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.=
0.0.bb
> >    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> >    > new file mode 100644
> >    > index 0000000..c321242
> >    > --- /dev/null
> >    > +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> >    > @@ -0,0 +1,87 @@
> >    > +SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Te=
st
> >    Project"
> >    > +HOMEPAGE =3D
> >    "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> >    > +SECTION =3D "console/utils"
> >    > +LICENSE =3D "GPLv2"
> >    > +LIC_FILES_CHKSUM =3D
> >    "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"
> >    > +PR =3D "r1"
> >    > +
> >    > +PROVIDES +=3D "ltp"
> >    > +DEPENDS +=3D "zip-native virtual/kernel alsa-lib"
> >    > +
> >    > +inherit autotools module-base kernel-module-split
> >    > +
> >    > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >    > +
> >    > +SRCREV =3D "ltp-ddt_1.0.0"
> >    > +BRANCH ?=3D "master"
> >    > +
> >    > +SRC_URI =3D
> >    "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;br=
anch=3D${BRANCH}
> >    \
> >    > +         =20
> >    file://0001-wdt_test_suite-Make-sure-to-include-generated-header.pat=
ch \
> >    > +          "
> >    > +
> >    > +S =3D "${WORKDIR}/git"
> >    > +
> >    > +LTPROOT =3D "/opt/ltp"
> >    > +
> >    > +EXTRA_OEMAKE_append =3D " \
> >    > +    prefix=3D${LTPROOT} \
> >    > +    CROSS_COMPILE=3D${HOST_PREFIX} \
> >    > +    SKIP_IDCHECK=3D1 \
> >    > +    KERNEL_INC=3D${STAGING_KERNEL_DIR} \
> >    > +    KERNEL_USR_INC=3D${STAGING_INCDIR} \
> >    > +    ALSA_INCPATH=3D${STAGING_INCDIR} \
> >    > +    ALSA_LIBPATH=3D${STAGING_LIBDIR} \
> >    > +    PLATFORM=3D${MACHINE} \
> >    > +    RANLIB=3D${RANLIB} \
> >    > +"
> >    > +
> >    > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >    > +
> >    > +FILES_${PN}-dbg +=3D " \
> >    > +    ${LTPROOT}/.debug \
> >    > +    ${LTPROOT}/bin/.debug \
> >    > +    ${LTPROOT}/runtest/.debug \
> >    > +    ${LTPROOT}/testcases/bin/.debug \
> >    > +    ${LTPROOT}/testcases/bin/*/bin/.debug \
> >    > +    ${LTPROOT}/testcases/bin/*/test/.debug \
> >    > +    ${LTPROOT}/testcases/bin/ddt/.debug \
> >    > +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
> >    > +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
> >    > +    ${LTPROOT}/testcases/realtime/*/*/.debug \
> >    > +"
> >    > +
> >    > +FILES_${PN}-staticdev +=3D "${LTPROOT}/lib"
> >    > +FILES_${PN} +=3D "${LTPROOT}/*"
> >    > +
> >    > +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode conf=
igure
> >    call.
> >    > +# we explicitly force regeneration of that directory and pass con=
figure
> >    options.
> >    > +do_configure_append() {
> >    > +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure
> >    ${CONFIGUREOPTS})
> >    > +}
> >    > +
> >    > +kmoddir =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
> >    > +
> >    > +do_compile_append () {
> >    > +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >    > +    oe_runmake KERNEL_CC=3D"${KERNEL_CC}" DESTDIR=3D${D} modules
> >    > +}
> >    > +
> >    > +do_install() {
> >    > +    oe_runmake DESTDIR=3D${D} install
> >    > +    install -d ${D}${datadir}
> >    > +    install -d ${D}${kmoddir}
> >    > +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> >    > +}
> >    > +
> >    > +PR_append =3D "-arago10+gitr${SRCPV}"
> >    > +
> >    > +RDEPENDS_${PN} +=3D "linaro-pm-qa-utils serialcheck"
> >    > +
> >    > +EXTRA_OEMAKE +=3D "KERNEL_PATH=3D"${STAGING_KERNEL_DIR}""
> >    > +
> >    > +KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> >    > +
> >    > +# do_make_scripts should be a separate task for the lock to work
> >    > +addtask make_scripts before do_compile
> >    > +do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> >    > +do_make_scripts[deptask] =3D "do_populate_sysroot"
> >    > --
> >    > 1.9.1
> >    >
> >    > _______________________________________________
> >    > meta-arago mailing list
> >    > meta-arago@arago-project.org
> >    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

