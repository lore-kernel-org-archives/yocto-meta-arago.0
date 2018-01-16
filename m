Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 15D6652A7D
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 23:46:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0GNjkbs011758
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 17:45:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516146346;
	bh=axYPZuuhBwvn/n5v9PCCN9zuoYQzCWskOIPywSut6Yw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=uQgjLLxCFbcqG4rlT6H7MpGtW6OyHmvJneKmnUxQHK4L/pnjze25NClhPAUqTzbpK
	kqfY0UckWyEBOo7IaNlBEDaBh5hlKENRdvzK1sE1nGumN/MpMq6xWM4gMwqbVLzNYf
	n5WrVArhC06w02sPrcAoE6bV9d19fqtfQUdckmE4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0GNjjTg002265
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 17:45:46 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 16 Jan 2018 17:45:45 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Tue, 16 Jan 2018 17:45:45 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	branding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS
Thread-Index: AQHTjwlq/Pi7OXcDGUK3orXqFHZl2qN3KW7A
Date: Tue, 16 Jan 2018 23:45:45 +0000
Message-ID: <964ecb29064f47bbbfe13314f59092ec@ti.com>
References: <1516134861-19384-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1516134861-19384-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
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
X-List-Received-Date: Tue, 16 Jan 2018 23:46:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
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

