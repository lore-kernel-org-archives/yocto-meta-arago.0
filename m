Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1DBBB52A00
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:35:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CZWvB026187;
	Fri, 5 Oct 2012 07:35:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95CZWEK005524;
	Fri, 5 Oct 2012 07:35:32 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:35:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] task-arago-tisdk-multimedia: Port
	multimedia task from arago to meta-arago
Thread-Index: AQHNosEFtDG3Bxv33UuSlDni4FLArpeqpjmw
Date: Fri, 5 Oct 2012 12:35:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247CAE@DLEE12.ent.ti.com>
References: <1349419480-21560-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419480-21560-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] task-arago-tisdk-multimedia: Port	multimedia task from arago to meta-arago
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
X-List-Received-Date: Fri, 05 Oct 2012 12:35:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:45 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2] task-arago-tisdk-multimedia:
> Port multimedia task from arago to meta-arago
>=20
> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Port task-arago-tisdk-multimedia from arago to meta-arago.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use new task naming convention
>=20
>  .../tasks/task-arago-tisdk-multimedia-sdk-host.bb  |   21
> ++++++++++++++
>  .../task-arago-tisdk-multimedia-sdk-target.bb      |   11
> +++++++
>  .../tasks/task-arago-tisdk-multimedia.bb           |   30
> ++++++++++++++++++++
>  3 files changed, 62 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-multimedia-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-multimedia-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-multimedia.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
> new file mode 100644
> index 0000000..17defc2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> multimedia-sdk-host.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Task to add multimedia related sources into the
> SDK"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +MULTIMEDIA =3D ""
> +
> +MULTIMEDIA_append_am37x-evm =3D " \
> +    av-examples-src \
> +"
> +
> +MULTIMEDIA_append_am3517-evm =3D " \
> +    av-examples-src \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    ${MULTIMEDIA} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
> new file mode 100644
> index 0000000..1f17f87
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> multimedia-sdk-target.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Task to build and install header and libs into
> sdk"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +RDEPENDS_${PN} =3D "\
> +    task-arago-gst-sdk-target \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-multimedia.bb b/meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-multimedia.bb
> new file mode 100644
> index 0000000..8cd0d2a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> multimedia.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Task to add multimedia related packages"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +MULTIMEDIA =3D ""
> +
> +MULTIMEDIA_append_omap3 =3D " \
> +    amsdk-av-files \
> +"
> +
> +MULTIMEDIA_append_ti33x =3D " \
> +    amsdk-av-files \
> +"
> +
> +MULTIMEDIA_append_am37x-evm =3D " \
> +    av-examples \
> +"
> +
> +MULTIMEDIA_append_am3517-evm =3D " \
> +    av-examples \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    task-arago-gst \
> +    ${MULTIMEDIA} \
> +"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

