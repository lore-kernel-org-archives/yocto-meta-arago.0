Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A58A852A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 15:29:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16FTSuV002692
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:29:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FTRgx018391
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:29:28 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 6 Feb 2014 09:29:27 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/5] Update recipes to pull in Makefile
	changes
Thread-Index: AQHPI0SPBwqvOEP/UUOtGIgOza2e4JqovAgA//+b0cA=
Date: Thu, 6 Feb 2014 15:29:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C61DB0A@DFLE08.ent.ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
	<1391700887-26166-3-git-send-email-fcooper@ti.com>
	<20140206152040.GG18784@edge>
In-Reply-To: <20140206152040.GG18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/5] Update recipes to pull in Makefile changes
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 15:29:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 06, 2014 9:21 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/5] Update recipes to pull in Makefile
> changes
>=20
> On Thu, Feb 06, 2014 at 09:34:45AM -0600, Franklin S. Cooper Jr wrote:
> > * Update SRCREV to pull in Makefile changes.
> > * Some makefile changes results in changes to do_install.
>=20
> Any details on what kind of Makefile changes happened across the board?
[Franklin] Most common change was handling nonexistent DESTDIR.
Other big change was moving some logic from the top level makefile (multipl=
e applications in a git repo) into the individual applications Makefile.
SDK qt makefiles were also changed from Makefile.build to makefile.=20
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../arm-benchmarks/arm-benchmarks_1.3.bb           |    4 +-
> >  .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    4 +-
> >  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 +-
> >  .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +-
> >  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 +-
> >  .../oprofile-example/oprofile-example_git.bb       |    4 +-
> >  .../ti-crypto-examples/ti-crypto-examples_git.bb   |    4 +-
> >  ...file.build-for-when-build-dir-is-not-the-.patch |   35 ------------=
--------
> >  .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |   13 ++++---
> >  .../recipes-qt/qt-apps/quick-playground_1.0.bb     |   11 ++++--
> >  10 files changed, 29 insertions(+), 58 deletions(-)  delete mode
> > 100644
> > meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.bui
> > ld-for-when-build-dir-is-not-the-.patch
> >
> > diff --git
> > a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.
> > 3.bb
> > b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.
> > 3.bb
> > index d46c0ab..952e50b 100644
> > ---
> > a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.
> > 3.bb
> > +++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmark
> > +++ s_1.3.bb
> > @@ -4,10 +4,10 @@ LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f957922"
> >  SECTION =3D "system"
> >
> > -PR =3D "r6"
> > +PR =3D "r7"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "eba9e69247c105f6d8dbcb56452ad4c4ea2df31e"
> > +SRCREV =3D "7f76ec24d3fedb9b2e3331f77c2f790c8b43f5f0"
> >
> >  SRC_URI =3D
> "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=3Dgit;bra=
nch
> =3D${BRANCH}"
> >
> > diff --git
> > a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> > b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> > index 5d13ad5..493a80a 100644
> > --- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> > +++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> > "file://mem_util/mem_util.c;beginline=3D1;endline=3D37;md5=3D8aa8e7
> >  SECTION =3D "system"
> >
> >  PACKAGE_STRIP =3D "no"
> > -PR =3D "r8"
> > +PR =3D "r9"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "7aa7e7a316d24c06c8e6a4931f7297f209dfd8e1"
> > +SRCREV =3D "5df7da69a50d27b7f594db0918c5e6793c3a6237"
> >
> >  SRC_URI =3D
> "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=3Dgit;branch=3D${=
BRANCH}
> "
> >
> > diff --git
> > a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > index 329b65a..4d41b73 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > @@ -11,9 +11,9 @@ RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
> >
> >  DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
> >
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> > -SRCREV =3D "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
> > +SRCREV =3D "d962b18b628f0006642491c2250ef01557591e66"
> >  BRANCH ?=3D "master"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-
> v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > index fa1f1e0..b96d67c 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> >
> >  SECTION =3D "multimedia"
> >
> > -PR =3D "r14"
> > +PR =3D "r15"
> >
> >  INITSCRIPT_NAME =3D "matrix-gui-2.0"
> >  INITSCRIPT_PARAMS =3D "defaults 97"
> > @@ -16,7 +16,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  inherit update-rc.d
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "25311718417147bd87aaa25d758cde9a5bffa0a8"
> > +SRCREV =3D "a67a9721134fcbf9017d2dd361079f67b10b0ace"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-
> v2.git;protocol=3Dgit;branch=3D${BRANCH} \
> >             file://init \
> > diff --git
> > a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > index 68381e7..f409c1e 100644
> > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > @@ -7,9 +7,9 @@ SECTION =3D "multimedia"
> >  # Make sure that QT font libraries have been installed
> > RDEPENDS_${PN} +=3D "qt4-embedded-fonts"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> > -SRCREV =3D "23acf023743e864bb30158636840a080e36d45b6"
> > +SRCREV =3D "e652edf9403fe9329e1bcd14b79503045a53705c"
> >  BRANCH ?=3D "master"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> > diff --git
> > a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git
> > .bb
> > b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git
> > .bb
> > index 5799f6c..fa203e0 100644
> > ---
> > a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git
> > .bb
> > +++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example
> > +++ _git.bb
> > @@ -7,10 +7,10 @@ SECTION =3D "system"
> >
> >  INHIBIT_PACKAGE_STRIP =3D "1"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "3aa2de4bb698c96f8a481c4048e3140503b26082"
> > +SRCREV =3D "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
> >
> >  SRC_URI =3D "git://gitorious.org/oprofile-example/oprofile-
> example.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > diff --git
> > a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples
> > _git.bb
> > b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples
> > _git.bb
> > index 995d60a..485faed 100644
> > ---
> > a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples
> > _git.bb
> > +++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-exam
> > +++ ples_git.bb
> > @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D
> > "file://AES/aes_256.c;beginline=3D9;endline=3D35;md5=3D8edbb4dee965
> >  SECTION =3D "console"
> >  DEPENDS +=3D "openssl"
> >
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "1c6a493600ce1a830611cc5671639c03cc3ebc01"
> > +SRCREV =3D "616ca5b6a0feefc1ba2e876c7ced4407f927ef1b"
> >
> >  SRC_URI =3D "git://arago-project.org/git/projects/crypto-example-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > diff --git
> > a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.b
> > uild-for-when-build-dir-is-not-the-.patch
> > b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.b
> > uild-for-when-build-dir-is-not-the-.patch
> > deleted file mode 100644
> > index 3ceb74a..0000000
> > ---
> > a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.b
> > uild-for-when-build-dir-is-not-the-.patch
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -From 00666002c48ebbb21e73eb9fbe90615cef87cc11 Mon Sep 17
> 00:00:00
> > 2001
> > -From: Denys Dmytriyenko <denys@ti.com>
> > -Date: Mon, 14 Oct 2013 18:53:28 -0400
> > -Subject: [PATCH] Update Makefile.build for when build dir is not the
> > same as
> > - source dir
> > -
> > -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ----
> > - Makefile.build | 3 ++-
> > - 1 file changed, 2 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/Makefile.build b/Makefile.build -index 18892d4..72b8e34
> > 100644
> > ---- a/Makefile.build
> > -+++ b/Makefile.build
> > -@@ -2,6 +2,7 @@
> > -
> > - ENV_SETUP ?=3D ../../linux-devkit/environment-setup
> > - DESTDIR ?=3D
> > -+BUILDDIR ?=3D .
> > - PLATFORM ?=3D
> > - MATRIX_APP_DIR ?=3D /usr/share/matrix-gui-2.0/apps/
> > - PLATFORM_DEFINE ?=3D "Platform_${PLATFORM}"
> > -@@ -28,7 +29,7 @@ clean : ${SOURCES} qmake
> > -
> > - install_common:
> > - 	@install -d ${DESTDIR}/usr/bin
> > --	@install -m 0755 ThermostatDemo
> ${DESTDIR}/usr/bin/ThermostatDemo
> > -+	@install -m 0755 ${BUILDDIR}/ThermostatDemo
> > -+${DESTDIR}/usr/bin/ThermostatDemo
> > - 	@install -d ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
> > - 	@cp -rf matrix-files/*  ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
> > -
> > ---
> > -1.8.3.2
> > -
> > diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > index 8035537..6704354 100644
> > --- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > +++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > @@ -12,16 +12,15 @@ require recipes-core/matrix/matrix-gui-paths.inc
> >
> >  inherit qt-provider
> >
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
> > +SRCREV =3D "e6225f9e485675e4390dcc7575810e9f63501692"
> >
> >  SRC_URI =3D " \
> >  	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=3Dgi=
t
> \
> > -	file://0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patc=
h
> \
> >  "
> >
> >  SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5',
> > 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patc
> > h \ @@ -29,9 +28,13 @@ SRC_URI +=3D
> "${@base_conditional('QT_PROVIDER',
> > 'qt5', 'file://0002-Replace-QtGui
> >
> >  S =3D "${WORKDIR}/git/"
> >
> > -# use the make targets already created in the Makefile.build files
> > +BUILDDIR ?=3D "."
> > +
> >  do_install() {
> > -	cd ${S} && make -f Makefile.build DESTDIR=3D${D} BUILDDIR=3D${B}
> install_common
> > +	install -d ${D}/usr/bin
> > +	install -m 0755 ${BUILDDIR}/ThermostatDemo
> ${D}/usr/bin/ThermostatDemo
> > +	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
> > +	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
> >  }
> >
> >  PACKAGES +=3D "matrix-gui-thermostat-demo"
> > diff --git
> > a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> > b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> > index a8e8869..5f493d3 100644
> > --- a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> > +++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> "file://Licence.txt;md5=3D7cc88160b55ec5db6c6c5bb8e3238c0b"
> >
> >  require recipes-core/matrix/matrix-gui-paths.inc
> >
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  BRANCH =3D "master"
> > -SRCREV =3D "49bb5b7e1df2f61fc361b7d83a6ec838ffc5381c"
> > +SRCREV =3D "0be45ce805147798c98b2dee65e41de67bfcea5d"
> >
> >  SRC_URI =3D "git://arago-project.org/git/projects/qt4-
> demos.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > @@ -17,9 +17,12 @@ S =3D "${WORKDIR}/git/qml_playground"
> >
> >  inherit qt4e
> >
> > -# use the make targets already created in the Makefile.build files
> >  do_install() {
> > -    make -f Makefile.build DESTDIR=3D${D} install_common
> > +    install -d ${D}/usr/bin
> > +    install -m 0755 runQMLplay.sh ${D}/usr/bin/
> > +    install -d ${D}${MATRIX_APP_DIR}/qml_playground
> > +    cp -r apps/qml_playground/*  ${D}${MATRIX_APP_DIR}/qml_playground
> > +    install -m 0755 qtquickplayground
> > + ${D}${MATRIX_APP_DIR}/qml_playground/
> >  }
> >
> >  PACKAGES +=3D "matrix-gui-apps-quick-playground"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

