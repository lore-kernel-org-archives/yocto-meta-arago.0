Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E1FA1529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:15:05 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DF5Ph032503;
	Fri, 5 Oct 2012 08:15:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DF58E010600;
	Fri, 5 Oct 2012 08:15:05 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:15:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago: Add wlan related preferred versions
Thread-Index: AQHNosI/dNqqM+U290uQnttho1UKopeqsUYA
Date: Fri, 5 Oct 2012 13:15:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015924803B@DLEE12.ent.ti.com>
References: <1349420039-21942-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420039-21942-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago: Add wlan related preferred versions
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
X-List-Received-Date: Fri, 05 Oct 2012 13:15:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:54 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago: Add wlan related preferred
> versions
>=20
> * Add preferred versions for wpa-supplicant and hostap-daemon.
> * This ensures the TI version of the above recipes are used.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index c5d826c..a99a8df 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -18,6 +18,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>  PREFERRED_VERSION_qt4-embedded =3D "4.8.0"
>  PREFERRED_VERSION_qt4-native =3D "4.8.0"
>  PREFERRED_VERSION_qt4-tools-nativesdk =3D "4.8.0"
> +PREFERRED_VERSION_wpa-supplicant =3D "0.7.3+0.8.0-rc-ti"
> +PREFERRED_VERSION_hostap-daemon =3D "0.7.3+0.8.0-rc-ti"
>=20
>  # Pin down udev version from oe-core, as meta-oe pulls in newer
> systemd-enhanced version
>  PREFERRED_VERSION_udev =3D "164"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

