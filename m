Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3945252975
	for <meta-arago@arago-project.org>;
	Thu,  8 Mar 2018 17:31:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w28HUIuT021204
	for <meta-arago@arago-project.org>; Thu, 8 Mar 2018 11:30:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520530218;
	bh=Jdo9W4OGbHZNsAYNT8nBFecjKrtYxw742iEgowLquJE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=XNyVpp6m3frZO4in84zyBQlIxcbcor+OMBnpFRam1orhRyjwEuZ7FplH6jvRhQvLi
	W+MLzodDxFj3r4Y23alBcGkjLwP1L5MRuQk2Idc/OjLq7xD2Gzj5TrecJiPXJpGS1k
	N7bXOFdDbSZr4n48m12l+CBeHkz8vwfM/UkRyluo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w28HUIM5022650
	for <meta-arago@arago-project.org>; Thu, 8 Mar 2018 11:30:18 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 8 Mar 2018 11:30:17 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 8 Mar 2018 11:30:17 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	starterware-rtos: Adding dependency to ti-pdk-build & env variables
Thread-Index: AQHTtmH4IyER16hWgkixJnyeihdXmKPGmVog
Date: Thu, 8 Mar 2018 17:30:17 +0000
Message-ID: <727fd5df71bb43b39b9cf080f83f9579@ti.com>
References: <1520460993-28842-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1520460993-28842-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] starterware-rtos: Adding dependency to ti-pdk-build & env variables
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
X-List-Received-Date: Thu, 08 Mar 2018 17:31:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you please submit this directly to meta-ti?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, March 07, 2018 5:17 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
> starterware-rtos: Adding dependency to ti-pdk-build & env variables
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/starterware/starterware-rtos_git.bbappend | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 recipes-bsp/starterware/starterware-
> rtos_git.bbappend
>=20
> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend
> b/recipes-bsp/starterware/starterware-rtos_git.bbappend
> new file mode 100644
> index 0000000..07fd9b4
> --- /dev/null
> +++ b/recipes-bsp/starterware/starterware-rtos_git.bbappend
> @@ -0,0 +1,5 @@
> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"
> +
> +DEPENDS_append=3D" ti-pdk-build-rtos"
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

