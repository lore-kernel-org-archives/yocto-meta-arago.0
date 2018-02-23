Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 561E852985
	for <meta-arago@arago-project.org>;
	Fri, 23 Feb 2018 19:17:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1NJGkZX003192
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 13:16:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519413407;
	bh=y58blRZHPq8DrsuFaGfAyoM440RvXbjY9pcTHvoplq8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=nnGcy0ZauWnxWx3Xs0Bc46wXyZtCLn379RCkFqAG4Sy4T5YYHGBPnsI/BDk64ZEUE
	v1xU37Rk7jVZIm0hu6cWD0Ya04DogCD+CVJJfFkIpHRuB89aGh0gULMIeFFzf+UBYm
	ooTkXv3IM/V9u8ryuPci7W5d5uE7690jBYiqE9DM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NJGk9I004921
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 13:16:46 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 13:16:46 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Fri, 23 Feb 2018 13:16:46 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH]
	ti-tisdk-makefile: add am571x-idk-pps.dtb am572x-idk-pps.dtb to
	KERNEL_DEVICETREE list
Thread-Index: AQHTq2lvZcn7ihvrLkGlQ5AIxf8fIqOyXpag
Date: Fri, 23 Feb 2018 19:16:46 +0000
Message-ID: <c898c0048d294f679620d4e0d8510a3a@ti.com>
References: <1519254721-4087-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1519254721-4087-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-tisdk-makefile: add am571x-idk-pps.dtb am572x-idk-pps.dtb to KERNEL_DEVICETREE list
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
X-List-Received-Date: Fri, 23 Feb 2018 19:17:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Eric,

These entries will also need to be added to the kernel recipes.

See recipes-kernel/linux/linux-ti-staging{,-rt}_4.9.bbappend

- Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Wednesday, February 21, 2018 6:12 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] ti-tisdk-
> makefile: add am571x-idk-pps.dtb am572x-idk-pps.dtb to
> KERNEL_DEVICETREE list
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappe=
nd
> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> index 51e5b6e..e609aae 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D ".tisdk50"
> +PR_append =3D ".tisdk51"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> @@ -62,6 +62,8 @@ KERNEL_DEVICETREE_append_am57xx-evm =3D " \
>      am572x-idk-lcd-osd101t2045-jh.dtb \
>      am572x-idk-lcd-osd101t2587-jh.dtb \
>      am574x-idk-jailhouse.dtb \
> +    am571x-idk-pps.dtb \
> +    am572x-idk-pps.dtb \
>  "
>=20
>=20
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

