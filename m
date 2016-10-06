Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 444495299E
	for <meta-arago@arago-project.org>;
	Thu,  6 Oct 2016 18:18:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u96IIHsp029544;
	Thu, 6 Oct 2016 13:18:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u96IIHOX018665;
	Thu, 6 Oct 2016 13:18:17 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 6 Oct 2016 13:18:16 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] branding-processor-sdk: enable
	RESERVE_CMEM by	default
Thread-Index: AQHSH/eMnIXLUEPWjUqCApDNdn4VfqCbuHKQ
Date: Thu, 6 Oct 2016 18:18:15 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814304334@DFLE09.ent.ti.com>
References: <1475775104-6182-1-git-send-email-denis@denix.org>
In-Reply-To: <1475775104-6182-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-processor-sdk: enable RESERVE_CMEM by	default
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
X-List-Received-Date: Thu, 06 Oct 2016 18:18:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Seeing this reminds me how out of date this file has become. I'll try to se=
nd a patch by the end of next week.

But as opencl is the main consumer of CMEM, could we use that machine featu=
re to determine whether or not to reserve memory for CMEM?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, October 06, 2016 1:32 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] branding-processor-sdk: enable
> RESERVE_CMEM by default
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-
> sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.in=
c
> index bd51f76..d97518d 100644
> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -1,6 +1,7 @@
>  ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
>=20
>  # Set CMEM reserved memory region
> +RESERVE_CMEM_omap-a15 =3D "1"
>  CMEM_BASE_omap-a15 ?=3D "a0000000"
>  CMEM_SIZE_omap-a15 ?=3D "08000000"
>=20
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

