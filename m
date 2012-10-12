Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 50CC3529CE
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:51:44 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDphhZ015526;
	Fri, 12 Oct 2012 08:51:43 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDphup020407;
	Fri, 12 Oct 2012 08:51:43 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:51:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
	graphics task
Thread-Index: AQHNqDpKvdiozlJi6UKAxp3tY2sDzJe1sAbQ
Date: Fri, 12 Oct 2012 13:51:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C3D5@DLEE12.ent.ti.com>
References: <1350021454-12557-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350021454-12557-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] task-arago-tisdk-graphics: Create graphics task
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
X-List-Received-Date: Fri, 12 Oct 2012 13:51:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:58 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
> graphics task
>=20
> * Create graphics task that groups the various packages from the
> Graphics SDK
>   recipe.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   11
> +++++++++++
>  .../tasks/task-arago-tisdk-graphics.bb             |   17
> +++++++++++++++++
>  2 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-graphics-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-graphics.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-graphics-sdk-target.bb
> new file mode 100644
> index 0000000..3de0809
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> graphics-sdk-target.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Task to install graphics binaries on sdk target"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "ti33x|omap3"

Same issue with COMPATIBLE_MACHINE as your other recipe.  This will break d=
evices like am180x-evm

> +PR =3D "r0"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    libgles-omap3-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-graphics.bb
> new file mode 100644
> index 0000000..2c0b3a6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> graphics.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Task to install graphics binaries"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "ti33x|omap3"

COMPATIBLE_MACHINE issue

> +PR =3D "r0"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    libgles-omap3 \
> +    libgles-omap3-blitwsegl \
> +    libgles-omap3-flipwsegl \
> +    libgles-omap3-frontwsegl \
> +    libgles-omap3-linuxfbwsegl \
> +    libgles-omap3-rawdemos \
> +    omap3-sgx-modules \
> +"

Where are the Qt example applications like qt-tstat, qml-playground, etc?  =
Are you putting those into a different task?

Where is the sdk-host task to install the example application sources in th=
e case of qt-tstat, etc being installed by this task?

> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

