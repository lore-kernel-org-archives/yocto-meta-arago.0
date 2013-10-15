Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 782255299B
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 15:45:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FFjbww014944;
	Tue, 15 Oct 2013 10:45:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFjb8s005343;
	Tue, 15 Oct 2013 10:45:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 15 Oct 2013 10:45:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/5] qt-tstat: fix Makefile to support
	build outside of source, i.e. ${S} != ${B}
Thread-Index: AQHOyVXJ4xmVPwKrKEW9KgO9uXIqf5n16F0A
Date: Tue, 15 Oct 2013 15:45:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597B1DD9@DLEE11.ent.ti.com>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
In-Reply-To: <1381807317-3759-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] qt-tstat: fix Makefile to support build outside of source, i.e. ${S} != ${B}
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
X-List-Received-Date: Tue, 15 Oct 2013 15:45:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, October 14, 2013 10:22 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/5] qt-tstat: fix Makefile to
>support build outside of source, i.e. ${S} !=3D ${B}
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> ...file.build-for-when-build-dir-is-not-the-.patch | 35
>++++++++++++++++++++++
> .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |  9 ++++--
> 2 files changed, 41 insertions(+), 3 deletions(-)
> create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-
>tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-
>.patch
>
>diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-
>Update-Makefile.build-for-when-build-dir-is-not-the-.patch b/meta-
>arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-
>Makefile.build-for-when-build-dir-is-not-the-.patch
>new file mode 100644
>index 0000000..3ceb74a
>--- /dev/null
>+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-
>Makefile.build-for-when-build-dir-is-not-the-.patch

Can we push this patch to the upstream project?  I think we own this one ri=
ght?

>@@ -0,0 +1,35 @@
>+From 00666002c48ebbb21e73eb9fbe90615cef87cc11 Mon Sep 17 00:00:00
>2001
>+From: Denys Dmytriyenko <denys@ti.com>
>+Date: Mon, 14 Oct 2013 18:53:28 -0400
>+Subject: [PATCH] Update Makefile.build for when build dir is not
>the same as
>+ source dir
>+
>+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>+---
>+ Makefile.build | 3 ++-
>+ 1 file changed, 2 insertions(+), 1 deletion(-)
>+
>+diff --git a/Makefile.build b/Makefile.build
>+index 18892d4..72b8e34 100644
>+--- a/Makefile.build
>++++ b/Makefile.build
>+@@ -2,6 +2,7 @@
>+
>+ ENV_SETUP ?=3D ../../linux-devkit/environment-setup
>+ DESTDIR ?=3D
>++BUILDDIR ?=3D .
>+ PLATFORM ?=3D
>+ MATRIX_APP_DIR ?=3D /usr/share/matrix-gui-2.0/apps/
>+ PLATFORM_DEFINE ?=3D "Platform_${PLATFORM}"
>+@@ -28,7 +29,7 @@ clean : ${SOURCES} qmake
>+
>+ install_common:
>+ 	@install -d ${DESTDIR}/usr/bin
>+-	@install -m 0755 ThermostatDemo
>${DESTDIR}/usr/bin/ThermostatDemo
>++	@install -m 0755 ${BUILDDIR}/ThermostatDemo
>${DESTDIR}/usr/bin/ThermostatDemo
>+ 	@install -d ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
>+ 	@cp -rf matrix-files/*  ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
>+
>+--
>+1.8.3.2
>+
>diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
>b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
>index 19c29fb..198ef1f 100644
>--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
>+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
>@@ -10,12 +10,15 @@ LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D93a105adb99011afa5baee932b560714 \
>
> require recipes-core/matrix/matrix-gui-paths.inc
>
>-PR =3D "r3"
>+PR =3D "r4"
>
> BRANCH ?=3D "master"
> SRCREV =3D "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
>
>-SRC_URI =3D "git://gitorious.org/thermostat-demo/thermostat-
>demo.git;protocol=3Dgit"
>+SRC_URI =3D " \
>+	git://gitorious.org/thermostat-demo/thermostat-
>demo.git;protocol=3Dgit \
>+	file://0001-Update-Makefile.build-for-when-build-dir-is-not-
>the-.patch \
>+"
>
> S =3D "${WORKDIR}/git/"
>
>@@ -23,7 +26,7 @@ inherit qt4e
>
> # use the make targets already created in the Makefile.build
>files
> do_install() {
>-	make -f Makefile.build DESTDIR=3D${D} install_common
>+	cd ${S} && make -f Makefile.build DESTDIR=3D${D} BUILDDIR=3D${B}
>install_common
> }
>
> PACKAGES +=3D "matrix-gui-thermostat-demo"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

