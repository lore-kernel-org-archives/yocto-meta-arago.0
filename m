Return-Path: <yan-liu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1577452980
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2019 02:34:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x772XxSE002063
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 21:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565145239;
	bh=+IqLDVrsA11XHCoQN64E2X0o5RcSGNryKRYAXwhC1l4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ZOq0jymJ744A2p+ggY3zFp1BTt4oRHVLn10yNGZJZu1TrrNN0wANdkGtJBw4kWgY9
	T/ERKpD9rQA/IGeTmJrkFXg+oH78o3HU9ywfhO2S4kC0u/FsEUsn3pGErDsI7uxgBf
	1vWzEc7ljinxYxU0q54AMP9rmikqSptFq0ibz32A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x772XxdA058886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 21:33:59 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 21:33:59 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
	DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
	15.01.1713.004; Tue, 6 Aug 2019 21:33:59 -0500
From: "Liu, Yan" <yan-liu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][PATCH v1] ltp-ddt: Update to latest
Thread-Index: AQHVTJLmt1sCKcRDO0u6prvvqpIEgKbvNUAA///CjmA=
Date: Wed, 7 Aug 2019 02:33:59 +0000
Message-ID: <a8bcc5b4c0f344ea887d634ac32e8bdf@ti.com>
References: <1565122120-19222-1-git-send-email-yan-liu@ti.com>
	<20190807011316.GW19505@beryl>
In-Reply-To: <20190807011316.GW19505@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.146]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 07 Aug 2019 02:35:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oops, I did not rebase.

I just sent v2 patch.

Thanks,
Yan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, August 06, 2019 9:13 PM
To: Liu, Yan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago][PATCH v1] ltp-ddt: Update to latest

This did not apply - did you forget to rebase?

On Tue, Aug 06, 2019 at 04:08:40PM -0400, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
>=20
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> index 02b41d6..2d39e30 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> @@ -4,7 +4,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -PR =3D "r8"
> +PR =3D "r9"
>  PV_append =3D "+git${SRCPV}"
> =20
>  PROVIDES +=3D "ltp"
> @@ -39,7 +39,7 @@ RDEPENDS_${PN} =3D "\
> =20
>  inherit autotools-brokensep
> =20
> -SRCREV =3D "1053c84e8b0485019ab085b5fb4e3c0e72e701ec"
> +SRCREV =3D "95004a59952a9f94dfb3f98f94b58b0bb5db89b4"
>  BRANCH ?=3D "master"
> =20
>  SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-dd=
t.git;branch=3D${BRANCH} \
> --=20
> 1.7.9.5
>=20

