Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2007C52A1F
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 18:05:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LI5Adw001957
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506017110;
	bh=VSTV2cfNNx0Z8PKnzmwPR/6e0USR9wSKr9bwHORMOcI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=CVJgUivW8CIstcembGIolj8YbXm+AMADtPyyrmmgaF00wMKFWvzY6pbeUr8Rjk+IF
	lpIN+qml9uOJ1uq9FQ1okCBxC3rqUr9ZPZFjCTPPmq2dTerhxQ0rQ2UPD//V8SA13U
	mHstCqvEd0cr2Paz0TN/uTY9d20PB1uv8QjUyXWg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LI59Wd021515
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:05:10 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Thu, 21 Sep 2017 13:05:08 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH]
	starterware:   Updating to version 2.1.1.4
Thread-Index: AQHTMmIgpGBqxPewVE+bG7rN15LP/6K/o4mg
Date: Thu, 21 Sep 2017 18:05:08 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825455E1D@DFLE09.ent.ti.com>
References: <1505947493-21847-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1505947493-21847-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] starterware: Updating to version 2.1.1.4
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
X-List-Received-Date: Thu, 21 Sep 2017 18:05:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, September 20, 2017 6:45 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] starterware:
> Updating to version 2.1.1.4
>=20
> ---
>  recipes-bsp/starterware/starterware-2.1.1.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/starterware/starterware-2.1.1.inc b/recipes-
> bsp/starterware/starterware-2.1.1.inc
> index c5d7655..8e0b647 100644
> --- a/recipes-bsp/starterware/starterware-2.1.1.inc
> +++ b/recipes-bsp/starterware/starterware-2.1.1.inc
> @@ -8,14 +8,14 @@ STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-
> rtos/starterware.git"
>  STARTERWARE_GIT_PROTOCOL =3D "git"
>  STARTERWARE_GIT_BRANCH =3D "master"
>=20
> -# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
> -STARTERWARE_SRCREV =3D "08f65ae3d5ccd19fbaf36040a99de971b685d144"
> +# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.04"
> +STARTERWARE_SRCREV =3D "03c5e4e2db71f7fac0206e17e8d00d903f15561c"
>=20
>  BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
>  SRC_URI =3D
> "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOCOL};bra
> nch=3D${BRANCH}"
>=20
>  SRCREV =3D "${STARTERWARE_SRCREV}"
> -PV =3D "02.01.01.03A"
> +PV =3D "02.01.01.04"
>  INC_PR =3D "r0"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

