Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id DB5FE52A20
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:16:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28NGopD034957
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:16:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552087010;
	bh=dy7tH8Nl0+LHuhtk2oqOnguBs1jLET101IlqA6R5i7s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=I/4glWdnNK/G2bEQYYA/Do4epPHud7LGkzETclhDkNfuHE+DqtZG7lVqWbVtHxLYW
	tqgPJZVXdsf2pAyFJLF0MJELqduH6zibYfDzheO9bpv4nmgNUoCMcsNntISMrCxmps
	g0Q2spRK0hBtTPd9CmErMiSqIYhiezGvj/1zQS74=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28NGoFP025055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:16:50 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:16:50 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1591.008; Fri, 8 Mar 2019 17:16:50 -0600
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master][PATCH] matrix-gui:bump up SRCREV to
	include additional TIDL demos
Thread-Index: AQHU1gSVHes4ZJpaW0CFzYK5BUSzsKYCXewQ
Date: Fri, 8 Mar 2019 23:16:50 +0000
Message-ID: <55da21bc14084e2ca81e4cd31c0ac859@ti.com>
References: <20190305191016.24497-1-x0157990@ti.com>
	<20190308231346.GE26510@beryl>
In-Reply-To: <20190308231346.GE26510@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.38.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH] matrix-gui:bump up SRCREV to include additional TIDL demos
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
X-List-Received-Date: Fri, 08 Mar 2019 23:16:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, please.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 8, 2019 6:14 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org; Senicic, Djordje
Subject: Re: [meta-arago] [rocko/master][PATCH] matrix-gui:bump up SRCREV t=
o include additional TIDL demos

Should this be merged first, before the other 2 related patches?


On Tue, Mar 05, 2019 at 02:10:16PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index e8fed13a..82882ea4 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb2=
5f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> =20
>  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "22d15489ed9e0fcd0b8734a87cf23db47d13aa46"
> +SRCREV =3D "f9fa5cb158902b6a3520fb7e853cc049ea920ae5"
>  BRANCH =3D "master"
> -INC_PR =3D "r66"
> +INC_PR =3D "r67"
> =20
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

