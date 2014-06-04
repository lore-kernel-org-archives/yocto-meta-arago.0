Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 00D9052A1E
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 15:30:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54FUwAk010411
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:30:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FUwrf025774
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:30:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 10:30:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 06/11] image-gallery: Add image gallery
	application
Thread-Index: AQHPgAmOhPy7XEyVx061L4/ris3fgJthEzzw
Date: Wed, 4 Jun 2014 15:30:57 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C336F@DFLE08.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-6-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D08C25A@DLEE11.ent.ti.com>
	<20140604152754.GK21819@edge>
In-Reply-To: <20140604152754.GK21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 06/11] image-gallery: Add image gallery application
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
X-List-Received-Date: Wed, 04 Jun 2014 15:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, June 04, 2014 10:28 AM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 06/11] image-gallery: Add image gallery
> application
>=20
> On Wed, Jun 04, 2014 at 02:38:23PM +0000, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >Sent: Thursday, May 29, 2014 1:38 PM
> > >To: meta-arago@arago-project.org
> > >Cc: Cooper Jr., Franklin
> > >Subject: [meta-arago] [PATCH 06/11] image-gallery: Add image gallery
> > >application
> > >
> > >* Add new Qt application to the SDK which displays pictures taken by
> > >the camera
> > >  demo.
> > >
> > >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >---
> > > .../recipes-qt/qt-apps/image-gallery_git.bb        |   33
> > >++++++++++++++++++++
> > > 1 files changed, 33 insertions(+), 0 deletions(-)  create mode
> > >100644 meta-arago-extras/recipes-qt/qt-apps/image-
> > >gallery_git.bb
> > >
> > >diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-
> > >gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-
> > >gallery_git.bb
> > >new file mode 100644
> > >index 0000000..3040415
> > >--- /dev/null
> > >+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> > >@@ -0,0 +1,33 @@
> > >+DESCRIPTION =3D "Image Gallery"
> > >+HOMEPAGE =3D "https://gitorious.org/image-gallery"
> > >+SECTION =3D "multimedia"
> > >+LICENSE =3D "BSD"
> > >+LIC_FILES_CHKSUM =3D
> > >"file://LICENSE;md5=3D9c57cc1cdee589f97cbba69e95a89a15"
> > >+
> > >+require recipes-core/matrix/matrix-gui-paths.inc
> > >+
> > >+PR =3D "r0"
> >
> > Not needed
>=20
> Why? Even though it's default, it helps remember to bump it next time :)
>=20
>=20
> > >+BRANCH =3D "master"
> > >+SRCREV =3D "8901d7c598b277e4e26a5abbcb859e7ceebd340a"
> > >+
> > >+SRC_URI =3D "git://gitorious.org/image-gallery/image-
> > >gallery.git;protocol=3Dgit;branch=3D${BRANCH}"
> > >+
> > >+S =3D "${WORKDIR}/git/"
> > >+
> > >+BUILDDIR ?=3D "."
> >
> > I'm not entirely sure what this is for.  When should this be set
> > differently?  And would it be better to use a variable like ${S}
> > rather than "."
>=20
> I have seen this variable in qt-tstat recipe and had to remove it. There =
is no
> need for it and moreover, there's already ${B} defined and used for build=
 dir.
> See my recent patch re-submission for qt-tstat.
[Franklin] I based this recipe from qt-tstat so that's probably the problem=
 :). I'll rework these.
>=20
>=20
> > >+inherit qt-provider
> > >+
> > >+do_install() {
> > >+	install -d ${D}/usr/bin
> >
> > Use ${bindir}
>=20
> +1
>=20
>=20
> > >+	install -m 0755 ${BUILDDIR}/image-gallery
> > >${D}/usr/bin/image-gallery
> >
> > Use ${bindir}
>=20
> +1
>=20
>=20
> > >+	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
> > >+	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-
> > >gallery
> > >+}
> > >+
> > >+PACKAGES +=3D "matrix-gui-apps-image-gallery"
> > >+
> > >+RDEPENDS_matrix-gui-apps-image-gallery  =3D "matrix-gui-apps-images
> > >matrix-gui-submenus-camera ${PN}"
> > >+
> > >+FILES_matrix-gui-apps-image-gallery +=3D "${MATRIX_APP_DIR}/*"
> > >--
> > >1.7.0.4
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

