Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7ED2B52004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 19:46:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QJkrfS016447
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:46:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QJkreD025861
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:46:53 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 26 Feb 2016 13:46:53 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] Re-enable dual camera demo on AM4
Thread-Index: AQHRcMq56vvtCs+efEG2z1ci0XkjhZ8+uwAg
Date: Fri, 26 Feb 2016 19:46:53 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A14235CEA@DFLE09.ent.ti.com>
References: <1456505620-48160-1-git-send-email-e-ruei1@ti.com>
	<20160226192001.GX29852@edge>
In-Reply-To: <20160226192001.GX29852@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Re-enable dual camera demo on AM4
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
X-List-Received-Date: Fri, 26 Feb 2016 19:46:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Thank you so much! I just resubmitted this one with the subject fix.

Best regards,

Eric

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, February 26, 2016 2:20 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] Re-enable dual camera demo on AM4

Eric,

The patch looks good and the description is informative, but the commit log=
 is not following the guidelines I linked yesterday. Instead of this:

Subject: [PATCH] Re-enable dual camera demo on AM4

It should be:

Subject: [PATCH] dual-camera-demo: re-enable on AM4 to run outside of Westo=
n

--
Denys


On Fri, Feb 26, 2016 at 11:53:40AM -0500, Eric Ruei wrote:
> The dual camera demo stopped working when Wayland/DRM-based graphics supp=
ort
> was introduced on AM4 and therefore this demo was disabled. This demo doe=
s not
> work with Wayland/DRM-based graphics system because it invokes DRM APIs t=
o
> demonstrate DRM mode setings and overlay operations and those operations
> are denied because there should be only one DRM master.
>=20
> The simple solution is to update the demo script to run this QT5-based de=
mo
> program over linuxfb platform and therefore there is not another DRM mast=
er
> running.
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
> V2 Changes: Remove DOS <CR> from dual_camera_qt5.sh
>=20
>  .../dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh         | 9 +++=
++----
>  .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb  | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-c=
amera-demo/dual-camera-demo/dual_camera_qt5.sh
> index 9bf560b..4802337 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo/dual_camera_qt5.sh
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo/dual_camera_qt5.sh
> @@ -1,12 +1,13 @@
>  #!/bin/bash
> =20
> -/etc/init.d/matrix-gui-2.0 stop
> +/etc/init.d/weston stop
> +sleep 1
> =20
>  echo 0 > /sys/class/graphics/fbcon/cursor_blink
> =20
> -dual_camera
> +dual_camera -platform linuxfb
> =20
>  echo 1 > /sys/class/graphics/fbcon/cursor_blink
> =20
> -/etc/init.d/matrix-gui-2.0 start
> -
> +/etc/init.d/weston start
> +sleep 1
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/d=
ual-camera-demo_1.0.bb
> index 43bf00d..1b1a146 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d335=
4a64feeb4f19f52eb5"
>  DEPENDS +=3D "libdrm"
>  require recipes-core/matrix/matrix-gui-paths.inc
> =20
> -PR =3D "r12"
> +PR =3D "r13"
> =20
>  BRANCH =3D "drm"
>  SRCREV =3D "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

