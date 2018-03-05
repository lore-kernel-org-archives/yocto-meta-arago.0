Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 145B352976
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 22:41:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25MediR016846
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 16:40:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520289639;
	bh=2cA0sqGcH4zcadDYoUfBoUHp2Ch/N0Acet5XBPrCjMY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=KGv/63mILMxzoQBuZXoq3zVEsQf2s4rdAFDp0uX+lnjaXDn8iWh31UYUlXdOeSSJ6
	aUp3mn2/wqrshsUcIxZT0/2iG4m3eAc1lg0/7cGh0jNlC6S2ebz8p1CmN/b6JwzuMh
	En8EXqJhDpgNNqvaiupCDm2nSasBqjsVyl5VH/Q8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25MedTK021833
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 16:40:39 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 16:40:39 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Mon, 5 Mar 2018 16:40:39 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][master][PATCH v2]
	ti-ipc: Update corrected 3.47.01.00 GA version
Thread-Index: AQHTtJbsS7A5nmS5QkuFr6BSfI6hXKPCPMIg
Date: Mon, 5 Mar 2018 22:40:39 +0000
Message-ID: <1108fc41371e44758180080a34d6f425@ti.com>
References: <1520263832-41055-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1520263832-41055-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][master][PATCH v2] ti-ipc: Update corrected 3.47.01.00 GA version
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
X-List-Received-Date: Mon, 05 Mar 2018 22:41:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Monday, March 05, 2018 10:31 AM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][master][PATCH v2]
> ti-ipc: Update corrected 3.47.01.00 GA version
>=20
> Minor update for documentation and build optimization This is specificall=
y a
> patch for morty.
> Upstream meta-ti will have patches sent for rocko.
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Change from previous version of patch
> Update ipc-example to avoid parallel build issue
> ---
> ---
>  recipes-ti/ipc/ti-ipc-3.47.01.00.inc              | 2 +-
>  recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend | 2 +-
>  recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         | 9 +++++++--
>  recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 2 +-
>  5 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc=
-
> 3.47.01.00.inc
> index 66bcda4..02abfa6 100644
> --- a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
> +++ b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
> @@ -1,4 +1,4 @@
>  PV =3D "3.47.01.00"
>=20
> -#Corresponds to 3.47.01.00
> +#Corresponds to 3.47.01.00A
>  TI_IPC_SRCREV =3D "6a2595a4148fb12f259efc19164a9d33ad2ed294"
> diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-
> ti/ipc/ti-ipc-examples-linux_git.bbappend
> index 4adc0e6..c0eac74 100644
> --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D ".tisdk0"
> +PR_append =3D ".tisdk1"
>=20
>  require ti-ipc-3.47.01.00.inc
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc=
/ti-
> ipc-examples_git.bbappend
> index 4adc0e6..c0eac74 100644
> --- a/recipes-ti/ipc/ti-ipc-examples_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D ".tisdk0"
> +PR_append =3D ".tisdk1"
>=20
>  require ti-ipc-3.47.01.00.inc
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/t=
i-ipc-
> rtos-3.47.01.00.inc
> index ffe6ef9..8274dd5 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
> @@ -1,2 +1,7 @@
> -# Corresponds to tag: 3.47.01.00
> -SRCREV_ipc-metadata =3D "f78329ff0b2c65469271dab59e232e6e0dc82dc7"
> +# Corresponds to tag: 3.47.01.00A
> +SRCREV_ipc-examples =3D "7f23e9b0ae395461b0854881dcc174392355d854"
> +
> +# Corresponds to tag: 3.47.01.00A
> +SRCREV_ipc-metadata =3D "72578cce9c9f9a932eb22b3397b46131efb12d69"
> +
> +PR =3D "${INC_PR}.r4"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-=
ipc-
> rtos_git.bbappend
> index 4adc0e6..c0eac74 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D ".tisdk0"
> +PR_append =3D ".tisdk1"
>=20
>  require ti-ipc-3.47.01.00.inc
>=20
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

