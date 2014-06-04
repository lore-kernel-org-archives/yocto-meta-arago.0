Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 69B98529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:38:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EcO6S005579
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EcOjT013412
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:38:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/11] image-gallery: Add image gallery
	application
Thread-Index: AQHPe201/XcUR2UOgUC0vzcrnaNkkZthDfkw
Date: Wed, 4 Jun 2014 14:38:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C25A@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-6-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 06/11] image-gallery: Add image gallery	application
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
X-List-Received-Date: Wed, 04 Jun 2014 14:38:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, May 29, 2014 1:38 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 06/11] image-gallery: Add image
>gallery application
>
>* Add new Qt application to the SDK which displays pictures taken
>by the camera
>  demo.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-qt/qt-apps/image-gallery_git.bb        |   33
>++++++++++++++++++++
> 1 files changed, 33 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-extras/recipes-qt/qt-apps/image-
>gallery_git.bb
>
>diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-
>gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-
>gallery_git.bb
>new file mode 100644
>index 0000000..3040415
>--- /dev/null
>+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
>@@ -0,0 +1,33 @@
>+DESCRIPTION =3D "Image Gallery"
>+HOMEPAGE =3D "https://gitorious.org/image-gallery"
>+SECTION =3D "multimedia"
>+LICENSE =3D "BSD"
>+LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D9c57cc1cdee589f97cbba69e95a89a15"
>+
>+require recipes-core/matrix/matrix-gui-paths.inc
>+
>+PR =3D "r0"

Not needed

>+
>+BRANCH =3D "master"
>+SRCREV =3D "8901d7c598b277e4e26a5abbcb859e7ceebd340a"
>+
>+SRC_URI =3D "git://gitorious.org/image-gallery/image-
>gallery.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+S =3D "${WORKDIR}/git/"
>+
>+BUILDDIR ?=3D "."

I'm not entirely sure what this is for.  When should this be set differentl=
y?  And would it be better to use a variable like ${S} rather than "."

>+
>+inherit qt-provider
>+
>+do_install() {
>+	install -d ${D}/usr/bin

Use ${bindir}

>+	install -m 0755 ${BUILDDIR}/image-gallery
>${D}/usr/bin/image-gallery

Use ${bindir}

>+	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
>+	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-
>gallery
>+}
>+
>+PACKAGES +=3D "matrix-gui-apps-image-gallery"
>+
>+RDEPENDS_matrix-gui-apps-image-gallery  =3D "matrix-gui-apps-images
>matrix-gui-submenus-camera ${PN}"
>+
>+FILES_matrix-gui-apps-image-gallery +=3D "${MATRIX_APP_DIR}/*"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

