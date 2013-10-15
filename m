Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4776F5299B
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 15:48:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FFmNMY011479;
	Tue, 15 Oct 2013 10:48:23 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFmNSl009006;
	Tue, 15 Oct 2013 10:48:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 15 Oct 2013 10:48:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFmM04009570;
	Tue, 15 Oct 2013 10:48:22 -0500
Date: Tue, 15 Oct 2013 11:48:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131015154822.GD25798@edge>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597B1DD9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597B1DD9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Tue, 15 Oct 2013 15:48:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 15, 2013 at 03:45:36PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Monday, October 14, 2013 10:22 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 1/5] qt-tstat: fix Makefile to
> >support build outside of source, i.e. ${S} != ${B}
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > ...file.build-for-when-build-dir-is-not-the-.patch | 35
> >++++++++++++++++++++++
> > .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |  9 ++++--
> > 2 files changed, 41 insertions(+), 3 deletions(-)
> > create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-
> >tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-
> >.patch
> >
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-
> >Update-Makefile.build-for-when-build-dir-is-not-the-.patch b/meta-
> >arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-
> >Makefile.build-for-when-build-dir-is-not-the-.patch
> >new file mode 100644
> >index 0000000..3ceb74a
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-
> >Makefile.build-for-when-build-dir-is-not-the-.patch
> 
> Can we push this patch to the upstream project?  I think we own this one 
> right?

Right, I separated this out from other Qt5 changes on purpose. We should 
definitely push it to upstream qt-tstat project. Franklin, any objections?


> >@@ -0,0 +1,35 @@
> >+From 00666002c48ebbb21e73eb9fbe90615cef87cc11 Mon Sep 17 00:00:00
> >2001
> >+From: Denys Dmytriyenko <denys@ti.com>
> >+Date: Mon, 14 Oct 2013 18:53:28 -0400
> >+Subject: [PATCH] Update Makefile.build for when build dir is not
> >the same as
> >+ source dir
> >+
> >+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >+---
> >+ Makefile.build | 3 ++-
> >+ 1 file changed, 2 insertions(+), 1 deletion(-)
> >+
> >+diff --git a/Makefile.build b/Makefile.build
> >+index 18892d4..72b8e34 100644
> >+--- a/Makefile.build
> >++++ b/Makefile.build
> >+@@ -2,6 +2,7 @@
> >+
> >+ ENV_SETUP ?= ../../linux-devkit/environment-setup
> >+ DESTDIR ?=
> >++BUILDDIR ?= .
> >+ PLATFORM ?=
> >+ MATRIX_APP_DIR ?= /usr/share/matrix-gui-2.0/apps/
> >+ PLATFORM_DEFINE ?= "Platform_${PLATFORM}"
> >+@@ -28,7 +29,7 @@ clean : ${SOURCES} qmake
> >+
> >+ install_common:
> >+ 	@install -d ${DESTDIR}/usr/bin
> >+-	@install -m 0755 ThermostatDemo
> >${DESTDIR}/usr/bin/ThermostatDemo
> >++	@install -m 0755 ${BUILDDIR}/ThermostatDemo
> >${DESTDIR}/usr/bin/ThermostatDemo
> >+ 	@install -d ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
> >+ 	@cp -rf matrix-files/*  ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
> >+
> >+--
> >+1.8.3.2
> >+
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >index 19c29fb..198ef1f 100644
> >--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >@@ -10,12 +10,15 @@ LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
> >
> > require recipes-core/matrix/matrix-gui-paths.inc
> >
> >-PR = "r3"
> >+PR = "r4"
> >
> > BRANCH ?= "master"
> > SRCREV = "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
> >
> >-SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-
> >demo.git;protocol=git"
> >+SRC_URI = " \
> >+	git://gitorious.org/thermostat-demo/thermostat-
> >demo.git;protocol=git \
> >+	file://0001-Update-Makefile.build-for-when-build-dir-is-not-
> >the-.patch \
> >+"
> >
> > S = "${WORKDIR}/git/"
> >
> >@@ -23,7 +26,7 @@ inherit qt4e
> >
> > # use the make targets already created in the Makefile.build
> >files
> > do_install() {
> >-	make -f Makefile.build DESTDIR=${D} install_common
> >+	cd ${S} && make -f Makefile.build DESTDIR=${D} BUILDDIR=${B}
> >install_common
> > }
> >
> > PACKAGES += "matrix-gui-thermostat-demo"
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

