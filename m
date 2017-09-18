Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E1B08529D1
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 20:34:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKY2kX032199
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505766842;
	bh=5Jijf4XxC+5OD7hXR97SHKDwSPHKBCRayGsEWme/7AU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=fGgCPIfr1/dUFckcdWtzWdOTidQz+V3hKVPzjxUQyW61v7K8R9rotJNOrC1dmp9H7
	hYnYeMJZx20gi/ul7xvjsCkzeWkbCZJDF1m+y0+T1Erjcr2shsvGOyWFNBXTPzyy+e
	WzNlp1JfiV11fZgzQ8VtTO/j7x1/CGJ5p7SA5EYc=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKY2we023731
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:34:02 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:34:02 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processsor-sdk PATCH]
	uio-module-drv: Update to new version 02.02.01.00
Thread-Index: AQHTMLGhJ4qN4z2ebkyH7/esGfq/FqK7GX5w
Date: Mon, 18 Sep 2017 20:34:01 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958254540BA@DFLE09.ent.ti.com>
References: <1505761745-61153-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1505761745-61153-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processsor-sdk PATCH] uio-module-drv: Update to new version 02.02.01.00
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
X-List-Received-Date: Mon, 18 Sep 2017 20:34:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Monday, September 18, 2017 3:09 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processsor-sdk PATCH] uio-
> module-drv: Update to new version 02.02.01.00
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Same update sent to meta-ti as well.
> This is needed for the upcoming processor sdk release
> ---
> ---
>  recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend | 6 ++++++
>  recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend      | 6 ++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv-
> test_git.bbappend
>  create mode 100644 recipes-bsp/uio-module-drv/uio-module-
> drv_git.bbappend
>=20
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> new file mode 100644
> index 0000000..15fbc54
> --- /dev/null
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# This corresponds to version 02.02.01.00 UIO_MODULE_DRV_SRCREV =3D
> +"bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
> +
> +PV =3D "2.2.1.0+git${SRCPV}"
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend
> b/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend
> new file mode 100644
> index 0000000..15fbc54
> --- /dev/null
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# This corresponds to version 02.02.01.00 UIO_MODULE_DRV_SRCREV =3D
> +"bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
> +
> +PV =3D "2.2.1.0+git${SRCPV}"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

