Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DE8E7529CE
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:52:35 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDqZLN028830;
	Fri, 12 Oct 2012 08:52:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDqZGs021321;
	Fri, 12 Oct 2012 08:52:35 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:52:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago.conf: Set PREFERRED_VERSION of the
	Graphics SDK
Thread-Index: AQHNqDqprhFmWb4H1U6Z9hn9PTJxzpe1sQqA
Date: Fri, 12 Oct 2012 13:52:33 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C3FA@DLEE12.ent.ti.com>
References: <1350021633-12803-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350021633-12803-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] arago.conf: Set PREFERRED_VERSION of the	Graphics SDK
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
X-List-Received-Date: Fri, 12 Oct 2012 13:52:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Denys, with all the PREFERRED_VERSIONS being set should we start thinking a=
bout a preferred_versions config file?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 1:01 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] arago.conf: Set PREFERRED_VERSION
> of the Graphics SDK
>=20
> * Set the PREVERRED_VERSION of the Graphics SDK to the version
> used in the
>   Arago SDK. This needed since meta-ti has an older version of
> the Graphics
>   SDK set as the default.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 2188fde..9872b0d 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -30,6 +30,10 @@ PREFERRED_VERSION_qt4-tools-nativesdk =3D
> "4.8.0"
>  PREFERRED_VERSION_wpa-supplicant =3D "0.7.3+0.8.0-rc-ti"
>  PREFERRED_VERSION_hostap-daemon =3D "0.7.3+0.8.0-rc-ti"
>=20
> +# Use v4.08.00.01 of the Graphics SDK
> +PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.01"
> +PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.01"
> +
>  ARAGO_QT_PROVIDER =3D "qt4-embedded"
>  # Enable Qt+GLES for ARM v7a devices
>  ARAGO_QT_PROVIDER_armv7a =3D "qt4-embedded-gles"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

