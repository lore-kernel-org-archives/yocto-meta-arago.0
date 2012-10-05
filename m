Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 62299529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:32:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CW8f8011962;
	Fri, 5 Oct 2012 07:32:08 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95CW8uZ002395;
	Fri, 5 Oct 2012 07:32:08 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:32:08 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] task-arago-gst-sdk-target: Add task to
	install gstreamer related dev packages
Thread-Index: AQHNosDLU+COfE0N5UiD9i7npWuZI5eqpUmQ
Date: Fri, 5 Oct 2012 12:32:08 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247C77@DLEE12.ent.ti.com>
References: <1349419415-21517-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419415-21517-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] task-arago-gst-sdk-target: Add task to	install gstreamer related dev packages
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
X-List-Received-Date: Fri, 05 Oct 2012 12:32:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:44 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2] task-arago-gst-sdk-target: Add
> task to install gstreamer related dev packages
>=20
> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * This task is used to install gstreamer and gstreamer plugins
> dev packages
> * Remove COMPATIBLE_MACHINE restriction
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use new task naming convention
>=20
>  .../tasks/task-arago-gst-sdk-target.bb             |   14
> ++++++++++++++
>  .../recipes-core/tasks/task-arago-gst.bb           |    3 +--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-gst-sdk-target.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-
> sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-
> gst-sdk-target.bb
> new file mode 100644
> index 0000000..655cd20
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-
> target.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Task to build and install header and libs in sdk"
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
> +    gstreamer-dev \
> +    gst-plugins-base-dev \
> +    gst-plugins-good-dev \
> +    gst-plugins-bad-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index d34402a..da9e41c 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -1,8 +1,7 @@
>  DESCRIPTION =3D "Task to add gstreamer and gstreamer plugins"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> -COMPATIBLE_MACHINE =3D "(am335x-evm|am3517-evm|am37x-
> evm|omap3evm|beagleboard|beaglebone)"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

