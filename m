Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E09DB529BC
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:52:14 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03KqDW7021695;
	Thu, 3 Jan 2013 14:52:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03KqDiX026586;
	Thu, 3 Jan 2013 14:52:13 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:52:12 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/4] quick-playground: Port quick-playground from Arago
Thread-Index: AQHNwSbKRqH2XivrnkGRbRsCSNRB8pg4Za6g
Date: Thu, 3 Jan 2013 20:52:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3599B5@DFLE09.ent.ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352760055-6119-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] quick-playground: Port quick-playground from Arago
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
X-List-Received-Date: Thu, 03 Jan 2013 20:52:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Monday, November 12, 2012 4:41 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 1/4] quick-playground: Port quick-playground from Arago
>=20
> * Port Qt application qml-playground from Arago.
> * Renaming the recipe from qml-playground to quick-playground.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-qt/qt-apps/quick-playground_1.0.bb     |   36
> ++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)  create mode 100644 me=
ta-
> arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
>=20
> diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> new file mode 100644
> index 0000000..ccbde4a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "Qt Quick Playground"
> +HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dqt4-
> demos.git;a=3Dsummary"
> +SECTION =3D "multimedia"
> +LICENSE =3D "Nokia"
> +LIC_FILES_CHKSUM =3D
> "file://Licence.txt;md5=3D7cc88160b55ec5db6c6c5bb8e3238c0b"
> +
> +require recipes-core/matrix/matrix-gui-paths.inc
> +
> +INC_PR =3D "r0"
> +
> +BRANCH =3D "master"
> +SRCREV =3D "49bb5b7e1df2f61fc361b7d83a6ec838ffc5381c"
> +
> +SRC_URI =3D "git://arago-project.org/git/projects/qt4-
> demos.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git/qml_playground"
> +
> +inherit qt4e
> +
> +# use the make targets already created in the Makefile.build files
> +do_install() {
> +    make -f Makefile.build DESTDIR=3D${D} install_common }
> +
> +RDEPENDS  +=3D "matrix-gui-apps-images matrix-gui-submenus-qt4"
> +
> +PACKAGES +=3D "matrix-gui-apps-quick-playground"
> +
> +# Add the matrix directory to the FILES FILES_${PN} =3D
> +"${MATRIX_APP_DIR}/qml_playground/qtquickplayground \
> +               /usr/bin/runQMLplay.sh"
> +
> +# Add the .debug directory to the dbg package FILES_${PN}-dbg +=3D
> +"${MATRIX_APP_DIR}/qml_playground/.debug"
> +
> +FILES_matrix-gui-apps-quick-playground =3D "${MATRIX_APP_DIR}/*"
> --
> 1.7.0.4


