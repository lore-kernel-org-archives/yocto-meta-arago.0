Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B74D6529B5
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 19:22:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OJMr0f008004;
	Thu, 24 Apr 2014 14:22:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OJMqhs023143;
	Thu, 24 Apr 2014 14:22:52 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 14:22:52 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH 3/3]
	local-arago.conf.sample: enable single set of images by default
Thread-Index: AQHPX+Et6v/sQmFpDEGjX9e/DvGGlJshJOnQ
Date: Thu, 24 Apr 2014 19:22:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68EAB0@DFLE08.ent.ti.com>
References: <1398359871-24257-1-git-send-email-denis@denix.org>
	<1398359871-24257-3-git-send-email-denis@denix.org>
In-Reply-To: <1398359871-24257-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH 3/3] local-arago.conf.sample: enable single set of images by default
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
X-List-Received-Date: Thu, 24 Apr 2014 19:22:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, April 24, 2014 12:18 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [oe-layersetup][PATCH 3/3] local-arago.conf.sample:
> enable single set of images by default
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  sample-files/local-arago.conf.sample | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-
> arago.conf.sample
> index 06352e0..44fe8ce 100644
> --- a/sample-files/local-arago.conf.sample
> +++ b/sample-files/local-arago.conf.sample
> @@ -157,3 +157,6 @@ BB_GENERATE_MIRROR_TARBALLS =3D "0"
>=20
>  # Uncomment this to remove work directory after packaging to save disk
> space  #INHERIT +=3D "rm_work"
> +
> +# Keep one set of images by default
> +RM_OLD_IMAGE =3D "1"
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

