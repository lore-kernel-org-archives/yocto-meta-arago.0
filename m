Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 16373529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:44:12 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDiBTl027882;
	Fri, 12 Oct 2012 08:44:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDiBVM011650;
	Fri, 12 Oct 2012 08:44:11 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:44:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] arago.conf: Set preferred u-boot
	version	for am335x
Thread-Index: AQHNqDcmMGRFQBBVE0uv5RmbxQLmgJe1rjJQ
Date: Fri, 12 Oct 2012 13:44:10 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C33C@DLEE12.ent.ti.com>
References: <1350020118-11207-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350020118-11207-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v2] arago.conf: Set preferred u-boot version	for am335x
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
X-List-Received-Date: Fri, 12 Oct 2012 13:44:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:35 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH v2] arago.conf: Set preferred u-boot
> version for am335x
>=20
> * For now u-boot_am335x-evm version 2011.09-psp04.06.00.08 is not
> the default
>   version of u-boot for am335x. Therefore, a PREFERRED_VERSION
> needs to be set
>   to make sure the Arago SDK uses the correct u-boot version.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Update comments.
>=20
>  meta-arago-distro/conf/distro/arago.conf |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 9ae2339..48629f1 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -36,6 +36,9 @@ ARAGO_QT_PROVIDER_armv7a =3D "qt4-embedded-gles"
>=20
>  PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>=20
> +# Use the SDK supported u-boot version
> +PREFERRED_VERSION_u-boot_am335x-evm =3D "2011.09-psp04.06.00.08"
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

