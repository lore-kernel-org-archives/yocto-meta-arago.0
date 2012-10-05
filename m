Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9928252A81
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:45:54 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CjsXH032118;
	Fri, 5 Oct 2012 07:45:54 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95Cjr6M014061;
	Fri, 5 Oct 2012 07:45:53 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:45:53 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] task-arago-gst: Add gst-plugins-ugly
Thread-Index: AQHNosIhnYZmHZ2dEk6FpHZH7t3nnZeqqRAg
Date: Fri, 5 Oct 2012 12:45:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247DAE@DLEE12.ent.ti.com>
References: <1349419959-21857-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419959-21857-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] task-arago-gst: Add gst-plugins-ugly
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
X-List-Received-Date: Fri, 05 Oct 2012 12:45:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:53 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] task-arago-gst: Add gst-plugins-
> ugly
>=20
> * Gst-plugins-ugly and several dependencies have a commercial
> license.
> * Add back gst-plugins-ugly and whitelist these needed recipes.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf           |    9
> +++++++++
>  .../tasks/task-arago-gst-sdk-target.bb             |    3 ++-
>  .../recipes-core/tasks/task-arago-gst.bb           |    2 ++
>  3 files changed, 13 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 381118d..002f000 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -27,3 +27,12 @@ POLKITAUTH =3D ""
>=20
>  # Enable generation of source packages for SDKs
>  require arago-source-ipk.conf
> +
> +# Whitelist several recipes that have commercial licenses
> +# Need to verify with legal that the following recipes are ok to
> distribute
> +# with the SDK
> +LICENSE_FLAGS_WHITELIST =3D "\
> +    commercial_gst-plugins-ugly \
> +    commercial_mpeg2dec \
> +    commercial_lame \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-
> sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-
> gst-sdk-target.bb
> index 655cd20..d2ccba3 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-
> target.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-
> target.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Task to build and install header and libs in sdk"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -11,4 +11,5 @@ RDEPENDS_${PN} =3D "\
>      gst-plugins-base-dev \
>      gst-plugins-good-dev \
>      gst-plugins-bad-dev \
> +    gst-plugins-ugly-dev \
>  "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index da9e41c..fc0962a 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -11,9 +11,11 @@ GSTREAMER =3D " \
>      gst-plugins-base \
>      gst-plugins-good \
>      gst-plugins-bad \
> +    gst-plugins-ugly \
>      gst-plugins-base-meta \
>      gst-plugins-good-meta \
>      gst-plugins-bad-meta \
> +    gst-plugins-ugly-meta \
>      "
>=20
>  RDEPENDS_${PN} =3D "\
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

