Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 14277529AE
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 19:16:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HJG5jq030088
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 14:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531854965;
	bh=F4hpi8+x/UEhFbACpm7KxOqCu0luiX6kv6as0kNewUc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=IkJNmtKwDfIloM9xSpSQ6kzCe3DTtf+QrX5NjyI+sZAoK2RWyR8QjOGe3mkRkMwFQ
	mjtdCRl34JKoR7gsWFm0CMuJAHWU2RgpGzmJRmKnVEI4fho8GBWYDU4McPH1lROqFB
	TKPlkZBJMwqhKwADl/wgMvxzrbs1lFQmp3VWkM9s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HJG5J4005146
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 14:16:05 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 14:16:03 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 17 Jul 2018 14:16:03 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [rocko/master][PATCH] ti-tisdk-setup: update to latest
Thread-Index: AQHUHf7sxwRlyanuSUWOKFObLgamz6STyRsA
Date: Tue, 17 Jul 2018 19:16:03 +0000
Message-ID: <cc09473b30444dccb0ac8667093c4670@ti.com>
References: <1531853380-29504-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1531853380-29504-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [rocko/master][PATCH] ti-tisdk-setup: update to latest
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
X-List-Received-Date: Tue, 17 Jul 2018 19:16:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can you please apply this to the ti2018.01 branch as well?

Thank you,
Jake

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, July 17, 2018 2:50 PM
> To: meta-arago@arago-project.org
> Cc: Stiffler, Jacob
> Subject: [rocko/master][PATCH] ti-tisdk-setup: update to latest
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++-=
-
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb
> b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 01bd6c9..d6921d0 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION =3D "Package containing scripts to setup th=
e
> development host and targ
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://setup.sh;beginline=3D3;endline=3D31;md5=3Dfc4b04a33df6d892c9f4d4a=
9d92
> b945e"
>=20
> -PR =3D "r34"
> +PR =3D "r35"
>=20
>  BRANCH ?=3D "master"
> -SRCREV =3D "55a17a0d1c5b385eec620c5f51e1d4e5ca6905cd"
> +SRCREV =3D "c6517247c9bc5564bbe63d7322314010ac28b1c3"
>  SRC_URI =3D "git://arago-project.org/git/projects/tisdk-setup-
> scripts.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  S =3D "${WORKDIR}/git/"
> --
> 1.9.1


