Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BB75D52988
	for <meta-arago@arago-project.org>;
	Thu, 25 Jan 2018 14:17:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0PEGfDI011124
	for <meta-arago@arago-project.org>; Thu, 25 Jan 2018 08:16:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516889801;
	bh=EYV6aE9AeaSVe3s9uTPmp/ekf+oF4kjohhjSgbN3qR8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=He2rz67iqvYRfOmZb4Ro/JU8qEgpM7KyKdXo12BgGCVLqOb6MBatz1VS9bxpQGYkg
	H24PwyUBoThKwt7qJkHs+VVUrzqfktBa2NGgXFbj7sWom8PFGlohZOUeG4Bvpsc2pE
	tx8dL2Up0AORExwJt9aUzUoKT5q0i0mXtNUYwESY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0PEGfe4031510
	for <meta-arago@arago-project.org>; Thu, 25 Jan 2018 08:16:41 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 25 Jan 2018 08:16:41 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 25 Jan 2018 08:16:41 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][morty/master][PATCH
	] ti-ipc: Update to new version 3.47.01.00
Thread-Index: AQHTlUuMc+xxe/I44Ey61zDg314yT6OEo5YQ
Date: Thu, 25 Jan 2018 14:16:41 +0000
Message-ID: <73c3fc31604a432a972b5f642f2fb242@ti.com>
References: <1516822973-8380-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1516822973-8380-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][morty/master][PATCH ] ti-ipc: Update to new version 3.47.01.00
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
X-List-Received-Date: Thu, 25 Jan 2018 14:17:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This has been pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Wednesday, January 24, 2018 2:43 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-
> sdk][morty/master][PATCH ] ti-ipc: Update to new version 3.47.01.00
>=20
> This update is specifically for morty.
> Upstream meta-ti/rocko will have patches for 3.47.01.00
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-3.47.01.00.inc              | 4 ++++
>  recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend | 5 +++++
>  recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 5 +++++
>  recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         | 2 ++
>  recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 5 +++++
>  recipes-ti/ipc/ti-ipc_git.bbappend                | 3 +++
>  6 files changed, 24 insertions(+)
>  create mode 100644 recipes-ti/ipc/ti-ipc-3.47.01.00.inc
>  create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
>  create mode 100644 recipes-ti/ipc/ti-ipc-examples_git.bbappend
>  create mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
>  create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bbappend
>  create mode 100644 recipes-ti/ipc/ti-ipc_git.bbappend
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc=
-
> 3.47.01.00.inc
> new file mode 100644
> index 0000000..66bcda4
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
> @@ -0,0 +1,4 @@
> +PV =3D "3.47.01.00"
> +
> +#Corresponds to 3.47.01.00
> +TI_IPC_SRCREV =3D "6a2595a4148fb12f259efc19164a9d33ad2ed294"
> diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-
> ti/ipc/ti-ipc-examples-linux_git.bbappend
> new file mode 100644
> index 0000000..4adc0e6
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
> @@ -0,0 +1,5 @@
> +PR_append =3D ".tisdk0"
> +
> +require ti-ipc-3.47.01.00.inc
> +
> +require ti-ipc-rtos-3.47.01.00.inc
> diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc=
/ti-
> ipc-examples_git.bbappend
> new file mode 100644
> index 0000000..4adc0e6
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
> @@ -0,0 +1,5 @@
> +PR_append =3D ".tisdk0"
> +
> +require ti-ipc-3.47.01.00.inc
> +
> +require ti-ipc-rtos-3.47.01.00.inc
> diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/t=
i-ipc-rtos-
> 3.47.01.00.inc
> new file mode 100644
> index 0000000..ffe6ef9
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
> @@ -0,0 +1,2 @@
> +# Corresponds to tag: 3.47.01.00
> +SRCREV_ipc-metadata =3D "f78329ff0b2c65469271dab59e232e6e0dc82dc7"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-=
ipc-
> rtos_git.bbappend
> new file mode 100644
> index 0000000..4adc0e6
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
> @@ -0,0 +1,5 @@
> +PR_append =3D ".tisdk0"
> +
> +require ti-ipc-3.47.01.00.inc
> +
> +require ti-ipc-rtos-3.47.01.00.inc
> diff --git a/recipes-ti/ipc/ti-ipc_git.bbappend b/recipes-ti/ipc/ti-
> ipc_git.bbappend
> new file mode 100644
> index 0000000..96b3c2d
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc_git.bbappend
> @@ -0,0 +1,3 @@
> +PR_append =3D ".tisdk0"
> +
> +require ti-ipc-3.47.01.00.inc
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

