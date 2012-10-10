Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3FCD452980
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:46:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AJk1PI016229;
	Wed, 10 Oct 2012 14:46:01 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AJk15g023670;
	Wed, 10 Oct 2012 14:46:01 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 14:46:00 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] arago.conf: Select PREFERRED_PROVIDER
	of	qt4-embedded
Thread-Index: AQHNpxzmv7hXYtbBAEK/3hPSvdAIBZey8Xdg
Date: Wed, 10 Oct 2012 19:46:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592573F6@DLEE12.ent.ti.com>
References: <1349898901-32630-1-git-send-email-fcooper@ti.com>
	<1349898901-32630-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1349898901-32630-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 2/2] arago.conf: Select PREFERRED_PROVIDER of	qt4-embedded
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
X-List-Received-Date: Wed, 10 Oct 2012 19:46:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, October 10, 2012 2:55 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 2/2] arago.conf: Select
> PREFERRED_PROVIDER of qt4-embedded
>=20
> * Set the PREFERRED_PROVIDER for qt4-embedded depending on
>   the ARM architecture. This is needed since the only non armv7
>   device we have (am1808) does not have a SGX core therefore can
>   not use qt4-embedded-gles
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 1bd272f..1ce64ce 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -23,6 +23,12 @@ PREFERRED_VERSION_qt4-tools-nativesdk =3D
> "4.8.0"
>  PREFERRED_VERSION_wpa-supplicant =3D "0.7.3+0.8.0-rc-ti"
>  PREFERRED_VERSION_hostap-daemon =3D "0.7.3+0.8.0-rc-ti"
>=20
> +ARAGO_QT_PROVIDER =3D "qt4-embedded"
> +# Enable Qt+GLES for ARM v7a devices
> +ARAGO_QT_PROVIDER_armv7a =3D "qt4-embedded-gles"
> +
> +PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
> +
>  # Pin down udev version from oe-core, as meta-oe pulls in newer
> systemd-enhanced version
>  PREFERRED_VERSION_udev =3D "164"
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

