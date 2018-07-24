Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1B2EA52993
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 22:47:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6OMl96q066836
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 17:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532472429;
	bh=hNRpSwv+WBU14iuspG8Eb2O//CGPIHnpd44jFSoIatg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=t1Xqb4GpW98wyc35Emu3LDK0p8g1nc+7K1txN5uJWuynw9nj0Q4LHQ5mzDWiv3GDu
	6kVr/DzgY4rLnzNB36gYy1irbq7SrSvopRNkcxO3LDdWmaJ+TzwG4q6ce+WnTKtMNa
	bNgMJz22oHntn8Gw82QL+MXJ/R4mL2eUEr2AiN0E=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OMl9Dh022075
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 17:47:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 17:47:08 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Tue, 24 Jul 2018 17:47:08 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master][PATCHv2] tidl-api: Update test video
	clip (subject line fixed)
Thread-Index: AQHUI5/vLuFcT8AzDEivDZ4WKkUPsKSe+NGA
Date: Tue, 24 Jul 2018 22:47:08 +0000
Message-ID: <dcd4002b5f8d4657afc3266067b53ee8@ti.com>
References: <1532465828-3221-1-git-send-email-x0157990@ti.com>
	<20180724224424.GN5506@beryl>
In-Reply-To: <20180724224424.GN5506@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.111.218]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCHv2] tidl-api: Update test video clip (subject line fixed)
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
X-List-Received-Date: Tue, 24 Jul 2018 22:47:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Previous (same) patch was accidently left w/o any subject (blank line).
Do I need to resubmit  PATCHv3?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, July 24, 2018 6:44 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org; Senicic, Djordje
Subject: Re: [meta-arago] [rocko/master][PATCHv2] tidl-api: Update test vid=
eo clip (subject line fixed)

On Tue, Jul 24, 2018 at 04:57:08PM -0400, Djordje Senicic wrote:
> * Use real-life video clip and list of classes
>=20
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---

Please make change notes like "subject line fixed" in here, after ---


>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
> index d2b570d..f1a34eb 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -8,4 +8,4 @@ GIT_PROTOCOL =3D "git"
>  BRANCH =3D "master"
> =20
>  SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANCH}"
> -SRCREV =3D "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
> +SRCREV =3D "06585057d0f47bb930647123557bc5a1506dabda"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

