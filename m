Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6E22552A9A
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 16:36:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HGaK8L017190
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 10:36:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516206980;
	bh=HxRQqvJfKF3yj7x/cxVTaDNbo09blug3pv/dahvctcw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Emv2RdUUHZ5EK3unTE45CDSTXYAfk5vXcJo9wJqVrWiswoO8d9j+inQiO4doXqHga
	1yfvJ3asdT9HsCafpe5R/3LeKtsl1eMDAyxrj/HnFcY1kXKMny1aAJYXW11KsLcytK
	SvvAqZbW6udWWo51sdw+gd14fK8qJcWAtig6yI88=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HGaKMF026088
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 10:36:20 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 10:36:20 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Wed, 17 Jan 2018 10:36:20 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	i2c-lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and
	am57xx
Thread-Index: AQHTju2xrB0NOuD6y0SNW7iPe5a9I6N4RLlg
Date: Wed, 17 Jan 2018 16:36:20 +0000
Message-ID: <a92b03a97b2240c4a74a0fc4c6e1104c@ti.com>
References: <1516122957-17975-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1516122957-17975-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and am57xx
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
X-List-Received-Date: Wed, 17 Jan 2018 16:36:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thanks!

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Tuesday, January 16, 2018 12:16 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] i2c-
> lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and
> am57xx
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
>=20
> diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/=
i2c-
> lld/i2c-lld-rtos_git.bbappend
> new file mode 100644
> index 0000000..f46d2b6
> --- /dev/null
> +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> @@ -0,0 +1,7 @@
> +DEPENDS_append_ti33x =3D " pruss-lld-rtos \ "
> +DEPENDS_append_ti43x =3D " pruss-lld-rtos \ "
> +DEPENDS_append_am57xx-evm =3D " pruss-lld-rtos \ "
> +INSANE_SKIP_${PN} =3D "arch"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

