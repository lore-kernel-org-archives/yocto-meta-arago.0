Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8BDE9529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:20:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCKt3q007995
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:20:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCKtG8032606
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:20:55 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 21 Mar 2013 07:20:55 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Mar 2013 07:20:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 16/17] wpa-supplicant_r5.00.18: Create
	bbappend
Thread-Index: AQHOJRclaO7pTjQ+EU+2gKBSFfg1xpiwEt2A
Date: Thu, 21 Mar 2013 12:20:54 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948ED71@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-16-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-16-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 16/17] wpa-supplicant_r5.00.18: Create bbappend
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
X-List-Received-Date: Thu, 21 Mar 2013 12:20:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 16/17] wpa-supplicant_r5.00.18:
> Create bbappend
>=20
> * Create a bbappend to insure that any version changes to the
> wpa-supplicant
>   recipe will result in a new TSU exemption will be filed.
> ---
>  .../wpa-supplicant_r5.00.18.bbappend               |   11
> +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100755 meta-arago-distro/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_r5.00.18.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_r5.00.18.bbappend b/meta-arago-
> distro/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_r5.00.18.bbappend
> new file mode 100755
> index 0000000..6fe2023
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_r5.00.18.bbappend
> @@ -0,0 +1,11 @@
> +################################################################
> ################
> +######################### TSU EXEMPTION REQUIRED
> ###############################
> +################################################################
> ################
> +# Versions of wpa_supplicant that are TSU Exempted:
> +# wpa_supplicant-0.7.3
> +
> +# This package requires TSU exemption. Any update to the version
> of
> +# wpa_supplicant must be double checked to see if a new TSU
> exemption must be made.
> +################################################################
> ################
> +
> +PR_append =3D "-arago0"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

