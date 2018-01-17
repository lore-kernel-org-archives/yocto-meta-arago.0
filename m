Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BC2C452A94
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 15:39:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HFdQJY025064
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 09:39:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516203566;
	bh=8FGnz5keOaGbyM09OhxFMIBbUIqJlxZWWXM5Ee0AG3U=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=mZZiRS5FxhBqo/8Ns+lYoIrghg1L1MGCrf0pFLJhauYN3XZafmEj76UnkLY5JJ6Us
	6DAXD+juAhabenD7eLOjhhoiqiLvvEGC7ng/LPp4jTtgnbUH8WwUd3TKpEi4moml/6
	j86jhT89UQHyNTikHC1bk/oPuel2lkhnoCudbiik=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HFdQW6030126
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 09:39:26 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 09:39:25 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Wed, 17 Jan 2018 09:39:25 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v2]
	branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
Thread-Index: AQHTj53qMXb0aPf/SUqG0n/blH89G6N4Mq0A
Date: Wed, 17 Jan 2018 15:39:25 +0000
Message-ID: <56577d8bd31845e38ab6bd69b90b45c9@ti.com>
References: <1516198638-17156-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1516198638-17156-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
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
X-List-Received-Date: Wed, 17 Jan 2018 15:39:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for providing the v2 patch. Please update the patch using the origin=
al file as the baseline, rather than the v1 patch.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, January 17, 2018 9:17 AM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v2]
> branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>=20
>  v2 - Fixed TI_LIMIT_SOCS change to apply only for dra7xx-evm
>=20
>  conf/distro/include/branding-processor-sdk.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/distro/include/branding-processor-sdk.inc
> b/conf/distro/include/branding-processor-sdk.inc
> index ff127d4..0803ba1 100644
> --- a/conf/distro/include/branding-processor-sdk.inc
> +++ b/conf/distro/include/branding-processor-sdk.inc
> @@ -106,5 +106,5 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-
> staging =3D "${SRCIPK_GIT_COMMIT_MESSAGE}"
>  TI_PDK_LIMIT_SOCS_append_am57xx-evm =3D " am574x"
>  TI_PDK_LIMIT_BOARDS_append_am57xx-evm =3D " idkAM574x"
>=20
> -TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
> +TI_PDK_LIMIT_SOCS_dra7xx-evm =3D "dra72x dra75x dra78x"
>=20
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

