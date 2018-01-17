Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id AB25352A90
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 14:18:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HEIecm016453
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 08:18:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516198720;
	bh=55ujmmFQCqu1+wnmaBwkwnt6BtLmWKHrQQIj6Tar1Q0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=XKCw/xjz8hKpXtC/uhZXIAbq5oXTStXqyzAKjRvSBW4kJMiRC6LvIyVGsuxfeWGor
	AC4NoAqKaBTDlGwvjE2hGVALOvsFKaPGT3H2OjLQ5NrrIBVKdmJQSp9BYOy3dsYRIz
	Lj92Bnujkl1yi8SppCcBGZ6hMcSZ5L2kUup+orCw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HEIeRk009554
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 08:18:40 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 08:18:39 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Wed, 17 Jan 2018 08:18:39 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	branding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS
Thread-Index: AQHTjwlquM9rHmwmHkyuFvA/hZCtLqN3jsOAgACPDKA=
Date: Wed, 17 Jan 2018 14:18:39 +0000
Message-ID: <feb8544b98c5440a8e771fc86bde38f0@ti.com>
References: <1516134861-19384-1-git-send-email-m-radhakrishnan2@ti.com>
	<964ecb29064f47bbbfe13314f59092ec@ti.com>
In-Reply-To: <964ecb29064f47bbbfe13314f59092ec@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] branding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS
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
X-List-Received-Date: Wed, 17 Jan 2018 14:18:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. Sorry for the mistake. Thanks for catching it. I have just sent the v2=
 patch with the fix.


-----Original Message-----
From: Gou, Hongmei=20
Sent: Tuesday, January 16, 2018 6:46 PM
To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
Subject: RE: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] bra=
nding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Tuesday, January 16, 2018 3:34 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
> branding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  conf/distro/include/branding-processor-sdk.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/conf/distro/include/branding-processor-sdk.inc
> b/conf/distro/include/branding-processor-sdk.inc
> index 2fbcb04..ff127d4 100644
> --- a/conf/distro/include/branding-processor-sdk.inc
> +++ b/conf/distro/include/branding-processor-sdk.inc
> @@ -105,3 +105,6 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging
> =3D "${SRCIPK_GIT_COMMIT_MESSAGE}"
>=20
>  TI_PDK_LIMIT_SOCS_append_am57xx-evm =3D " am574x"
>  TI_PDK_LIMIT_BOARDS_append_am57xx-evm =3D " idkAM574x"
> +
> +TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
> +

Will this change affect all the platforms? Should it be limited to dra7xx-e=
vm only?=20

> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

