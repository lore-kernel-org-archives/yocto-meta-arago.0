Return-Path: <sam.nelson@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E03FC529E6;
	Tue, 18 Sep 2018 12:52:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8ICqoEv081482;
	Tue, 18 Sep 2018 07:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537275170;
	bh=Lhrzt19xhhGqzZK8drxLQay56t6S3asl8NTXnf6dXzs=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=oSpQJeldbdA2jABBuV4Dyiq/42gEE9Kns2nHvydwBUJv6jf5BI9DTY2CP4OY7kq/T
	BIXo3akAYUgS4j82Z9EMAe4u+ZDnPFc3syD/0azfg/DLwjqiehdXYtIEUl7eVxuT0/
	bYA8CnoyR0K4EhmCJuHcFYIvXpyITdz/sSyrqUhI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ICqoMN018936;
	Tue, 18 Sep 2018 07:52:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 07:52:50 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Tue, 18 Sep 2018 07:52:50 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"arago-commits@arago-project.org" <arago-commits@arago-project.org>
Thread-Topic: [EXTERNAL] [arago-commits] Sam Nelson : ti-ipc: Update to new
	version 3.50.02.02
Thread-Index: AQHUTuiak3q+1+o/wkaSDHMC0RLKQaT1/w6g
Date: Tue, 18 Sep 2018 12:52:50 +0000
Message-ID: <cf6abb6401f94af4975dab1e0bf113b6@ti.com>
References: <20180918004325.EB4B6529E6@arago-project.org>
In-Reply-To: <20180918004325.EB4B6529E6@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.139.144]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [arago-commits] Sam Nelson : ti-ipc: Update to new version 3.50.02.02
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
X-List-Received-Date: Tue, 18 Sep 2018 12:53:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can this be backported this to 2018.03 as well?
Thanks,
Sam

> -----Original Message-----
> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-
> bounces@arago-project.org] On Behalf Of Arago Project git
> Sent: Monday, September 17, 2018 8:43 PM
> To: arago-commits@arago-project.org
> Subject: [EXTERNAL] [arago-commits] Sam Nelson : ti-ipc: Update to new
> version 3.50.02.02
>=20
> Module: meta-ti
> Branch: rocko-next
> Commit: 29b4c0210b20ab60cd21ad60a8bd75b1edfe8404
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3D29b4c0210b20ab60cd21ad60a8bd75b1edfe8404
>=20
> Author: Sam Nelson <sam.nelson@ti.com>
> Date:   Sat Sep 15 08:24:28 2018 +0000
>=20
> ti-ipc: Update to new version 3.50.02.02
>=20
> Fixes backward compatibility issues for K2 and omapl138
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-ti/ipc/ti-ipc-common.inc |    2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc   |    4 ++--
>  recipes-ti/ipc/ti-ipc.inc        |    4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-
> common.inc
> index 543990a..dddb734 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV =3D "3.50.01.01"
> +PV =3D "3.50.02.02"
>  INC_PR =3D "r0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.=
inc
> index 4b2d7d7..7378d42 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -24,8 +24,8 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
>  name=3D${TI_IPC_METADATA_NAME}"
>=20
> -# Corresponds to tag: 3.50.01.01
> -TI_IPC_METADATA_SRCREV =3D
> "c749d4dd70cc259679dc862a164ad147d51381f6"
> +# Corresponds to tag: 3.50.02.02
> +TI_IPC_METADATA_SRCREV =3D
> "171ed5b4cfc73fd2ebfeefe42249bec18f475613"
>  # Corresponds to tag: 3.50.01.01
>  TI_IPC_EXAMPLES_SRCREV =3D
> "71f6e59a6b2c7e20c2656e5000f318339ded2f3c"
>=20
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index ca39292..230c7ef 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,8 +8,8 @@ TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL =3D "git"
>  TI_IPC_GIT_BRANCH =3D "3.50"
>=20
> -#Corresponds to 3.50.01.01
> -TI_IPC_SRCREV =3D "771859b9687476c3ba1b5bf0d4afb3c97876137e"
> +#Corresponds to 3.50.02.02
> +TI_IPC_SRCREV =3D "c2bb741e4a2723155d38ede6a5a5dea8d6592089"
>=20
>  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
>  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};
> name=3Dipcdev"
>=20
> _______________________________________________
> arago-commits mailing list
> arago-commits@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits

