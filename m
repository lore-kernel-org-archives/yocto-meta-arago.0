Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B5766529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:39:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EdC1x027960
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:39:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EdC7v011890
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:39:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:39:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/11] ti-tisdk-makefile: Add image
	gallery to	SDK makefile for AM4x
Thread-Index: AQHPe207TA0bP+l99Eyqmi02KxQIHpthDqFA
Date: Wed, 4 Jun 2014 14:39:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C32B@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-10-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-10-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 10/11] ti-tisdk-makefile: Add image gallery to	SDK makefile for AM4x
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
X-List-Received-Date: Wed, 04 Jun 2014 14:39:13 -0000
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
>Subject: [meta-arago] [PATCH 10/11] ti-tisdk-makefile: Add image
>gallery to SDK makefile for AM4x
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_image-gallery       |   24
>++++++++++++++++++++
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
> 2 files changed, 27 insertions(+), 1 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile/Makefile_image-gallery
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_image-gallery b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
>new file mode 100644
>index 0000000..df843fb
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_image-gallery
>@@ -0,0 +1,24 @@
>+# QT Image Gallery build targets
>+image-gallery:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Building Image Gallery
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*image-
>gallery*"`; make -f Makefile.build
>+
>+image-gallery_clean:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Building Image Gallery
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*image-
>gallery*"`; make -f Makefile.build clean
>+
>+image-gallery_install:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+	@echo   Installing Image Gallery - Release version
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*image-
>gallery*"`; make -f Makefile.build install
>+
>+image-gallery_install_debug:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>+	@echo   Installing Dual Camera Demo - Debug version
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>+	@cd example-applications; cd `find . -name "*image-
>galleryo*"`; make -f Makefile.build install_debug
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 770c2ae..ab4244c 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -32,10 +32,11 @@ SRC_URI =3D "\
>     file://Makefile_omapconf \
>     file://Makefile_oprofile-example \
>     file://Makefile_dual-camera-demo \
>+    file://Makefile_image-gallery \
>     file://Makefile_cryptodev \
> "
>
>-PR =3D "r33"
>+PR =3D "r34"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>@@ -75,6 +76,7 @@ MAKEFILES_append_ti43x =3D " u-boot-spl \
>                            linux-dtbs \
>                            wireless \
>                            dual-camera-demo \
>+                           image-gallery \
>                            cryptodev \
> "
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

