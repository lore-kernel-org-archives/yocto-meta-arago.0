Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9E27C529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:31:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EVAFP004810
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:31:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EVAFO003487
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:31:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:31:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 03/11] ti-tisdk-makefile: Update Qt
	Makefile	stubs to reflect Makefile name change
Thread-Index: AQHPe20xMGTSeQ/Wa0mMCF1wBGyzepthDGKw
Date: Wed, 4 Jun 2014 14:31:09 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C177@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 03/11] ti-tisdk-makefile: Update Qt Makefile	stubs to reflect Makefile name change
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
X-List-Received-Date: Wed, 04 Jun 2014 14:31:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, May 29, 2014 1:38 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 03/11] ti-tisdk-makefile: Update Qt
>Makefile stubs to reflect Makefile name change
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_dual-camera-demo    |    8 ++++---
>-
> .../ti-tisdk-makefile/Makefile_matrix-gui-browser  |    8 ++++---
>-
> .../ti-tisdk-makefile/Makefile_qt-tstat            |    8 ++++---
>-
> .../ti-tisdk-makefile/Makefile_quick-playground    |    8 ++++---
>-
> .../ti-tisdk-makefile/Makefile_refresh-screen      |    8 ++++---
>-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> 6 files changed, 21 insertions(+), 21 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-
>distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_dual-camera-demo
>index 5a1475e..bd99075 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_dual-camera-demo
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_dual-camera-demo
>@@ -3,22 +3,22 @@ dual-camera-demo:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building Dual Camera Demo
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make
>+	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make -f Makefile.build
>
> dual-camera-demo_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building Dual Camera Demo
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make clean
>+	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make -f Makefile.build clean
>
> dual-camera-demo_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> 	@echo   Installing Dual Camera Demo - Release version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make install
>+	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make -f Makefile.build install
>
> dual-camera-demo_install_debug:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> 	@echo   Installing Dual Camera Demo - Debug version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>-	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make install_debug
>+	@cd example-applications; cd `find . -name "*dual-camera-
>demo*"`; make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_matrix-gui-browser b/meta-arago-
>distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_matrix-gui-browser
>index eb60e4f..2fc3b21 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_matrix-gui-browser
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_matrix-gui-browser
>@@ -3,22 +3,22 @@ matrix-gui-browser:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building Matrix GUI Browser
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make release
>+	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make -f Makefile.build release
>
> matrix-gui-browser_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Cleaning Matrix GUI Browser
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make clean
>+	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make -f Makefile.build clean
>
> matrix-gui-browser_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> 	@echo   Installing Matrix GUI Browser - Release version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make install
>+	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make -f Makefile.build install
>
> matrix-gui-browser_install_debug:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> 	@echo   Installing Matrix GUI Browser - Debug Version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>-	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make install_debug
>+	@cd example-applications; cd `find . -name "*matrix-gui-
>browser*"`; make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_qt-tstat b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
>index 36d7ef5..857e058 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_qt-tstat
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_qt-tstat
>@@ -3,22 +3,22 @@ qt-tstat:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building QT Thermostat App
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make release
>+	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make -f Makefile.build release
>
> qt-tstat_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Cleaning QT Thermostat App
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make clean
>+	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make -f Makefile.build clean
>
> qt-tstat_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> 	@echo   Installing QT Thermostat App - Release version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make install
>+	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make -f Makefile.build install
>
> qt-tstat_install_debug:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> 	@echo   Installing QT Thermostat App - Debug version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>-	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make install_debug
>+	@cd example-applications; cd `find . -name "*qt-tstat*"`;
>make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_quick-playground b/meta-arago-
>distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_quick-playground
>index a87471b..b8b7c51 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_quick-playground
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_quick-playground
>@@ -3,22 +3,22 @@ quick-playground:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building Quick Playground App
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make
>+	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make -f Makefile.build
>
> quick-playground_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Cleaning Quick Playground App
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make clean
>+	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make -f Makefile.build clean
>
> quick-playground_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> 	@echo   Installing Quick Playground App - Release version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make install
>+	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make -f Makefile.build install
>
> quick-playground_install_debug:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> 	@echo   Installing Quick Playground App - Debug version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make install_debug
>+	@cd example-applications; cd `find . -name "*quick-
>playground*"`; make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_refresh-screen b/meta-arago-
>distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_refresh-screen
>index 6d8f203..bcc17fa 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_refresh-screen
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_refresh-screen
>@@ -3,22 +3,22 @@ refresh-screen:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Building Refresh Screen
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make release
>+	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make -f Makefile.build release
>
> refresh-screen_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Cleaning Refresh Screen
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make clean
>+	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make -f Makefile.build clean
>
> refresh-screen_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> 	@echo   Installing Refresh Screen - Release version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>-	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make install
>+	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make -f Makefile.build install
>
> refresh-screen_install_debug:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo   Installing Refresh Screen - Debug Version
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make install_debug
>+	@cd example-applications; cd `find . -name "*refresh-
>screen*"`; make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 0817e4e..4d8c486 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -35,7 +35,7 @@ SRC_URI =3D "\
>     file://Makefile_cryptodev \
> "
>
>-PR =3D "r31"
>+PR =3D "r32"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

