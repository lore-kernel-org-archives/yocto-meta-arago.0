Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8F62252AB5
	for <meta-arago@arago-project.org>;
	Fri, 19 Oct 2012 17:37:51 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JHbodc032682;
	Fri, 19 Oct 2012 12:37:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JHbocV000658;
	Fri, 19 Oct 2012 12:37:50 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 19 Oct 2012 12:37:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] task-arago-qte: Port task-arago-qte
	task	from Arago
Thread-Index: AQHNrYCDSP4+wX8geEi3gNDtdXK78JfA5deg
Date: Fri, 19 Oct 2012 17:37:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015927178A@DLEE12.ent.ti.com>
References: <1350599563-18636-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350599563-18636-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v2] task-arago-qte: Port task-arago-qte task	from Arago
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
X-List-Received-Date: Fri, 19 Oct 2012 17:37:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Thursday, October 18, 2012 5:33 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH v2] task-arago-qte: Port task-arago-
> qte task from Arago
>=20
> * Port task-arago-qte task from Arago to meta-arago.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Replace qt4-embedded-qmlimports-* with qt4-embedded-qml-plugins.
>=20
>  .../tasks/task-arago-qte-sdk-target.bb             |   28
> ++++++++++++++++++++
>  .../recipes-core/tasks/task-arago-qte.bb           |   17
> ++++++++++++
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-qte-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-qte.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte-
> sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-
> qte-sdk-target.bb
> new file mode 100644
> index 0000000..c89ab6b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-
> target.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Task to add gstreamer and gstreamer plugins"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    qt4-embedded-dev \
> +    qt4-embedded-mkspecs \
> +    libqt-embeddedphonon4-dev \
> +    libqt-embedded3support4-dev \
> +    libqt-embeddedclucene4-dev \
> +    libqt-embeddedcore4-dev \
> +    libqt-embeddeddbus4-dev \
> +    libqt-embeddeddesignercomponents4-dev \
> +    libqt-embeddeddesigner4-dev \
> +    libqt-embeddeduitools4-dev \
> +    libqt-embeddedgui4-dev \
> +    libqt-embeddedhelp4-dev \
> +    libqt-embeddednetwork4-dev \
> +    libqt-embeddedscript4-dev \
> +    libqt-embeddedscripttools4-dev \
> +    libqt-embeddedsvg4-dev \
> +    libqt-embeddedtest4-dev \
> +    libqt-embeddedwebkit4-dev \
> +    libqt-embeddedxml4-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
> new file mode 100644
> index 0000000..c89e3f0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Task to add gstreamer and gstreamer plugins"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    qt4-embedded \
> +    qt4-embedded-plugin-mousedriver-tslib \
> +    qt4-embedded-plugin-gfxdriver-gfxtransformed \
> +    qt4-embedded-plugin-phonon-backend-gstreamer \
> +    qt4-embedded-plugin-imageformat-gif \
> +    qt4-embedded-plugin-imageformat-jpeg \
> +    qt4-embedded-qml-plugins \
> +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-
> gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
> +"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

