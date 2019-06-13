Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D4B8E52995
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2019 00:21:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5D0Kftr001187
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 19:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560385241;
	bh=LRI36quMydOVhZ8M7euV10N7Wc+LVpHfY+Po93T0DMk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TT0dcjI/he3s2c0JZDx56jPNAE3+86hza+QpAf+kO/E4HXSZbSGJohGar1rri57KV
	c/84lDM3nZXhg4IZV7u6Uu0MlGW8/Ii0/1BmrsE6kRLGK6/GUbq4wIVGz3clwK6ieU
	z/94eIr1xTbXwzAJh5vmTo9rThp87nPvteq+Cfj4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5D0Kf6s001037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 19:20:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 19:20:40 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1713.004; Wed, 12 Jun 2019 19:20:40 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/master][PATH] point-cloud-viewer: New binary
	compiled with gcc8 toolchain
Thread-Index: AQHVISh2w99VOoZgT0GQe/V3Dma6xqaYtvvQ
Date: Thu, 13 Jun 2019 00:20:40 +0000
Message-ID: <69eb4f12533e42ff818f4ff363c877e5@ti.com>
References: <20190611180913.10651-1-x0157990@ti.com>
	<20190612140934.GA17081@beryl>
In-Reply-To: <20190612140934.GA17081@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.96.62]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATH] point-cloud-viewer: New binary compiled with gcc8 toolchain
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
X-List-Received-Date: Thu, 13 Jun 2019 00:21:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just seen http://patchwork.dal.design.ti.com/patch/47749/, before sending a=
 patch.=20
"libstdc++" not needed any more in RDEPENDS?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, June 12, 2019 10:10 AM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/master][PATH] point-cloud-viewer: New binar=
y compiled with gcc8 toolchain

Now I'm seeing this:

ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cl=
oud_viewer contained in package point-cloud-viewer requires libxkbcommon.so=
.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]


On Tue, Jun 11, 2019 at 02:09:13PM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-clou=
d-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-c=
loud-viewer_git.bb
> index e477448b..9ee4ff0b 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
> @@ -11,9 +11,9 @@ BRANCH =3D "master"
> =20
>  SRC_URI =3D "git://git.ti.com/processor-sdk/point-cloud-viewer.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> =20
> -SRCREV =3D "ac8f7a8334b6458676810349ab84f718ecd16975"
> +SRCREV =3D "c4800b186744e9379c798299c5caa67f6a4468f0"
> =20
> -PV =3D "2.0"
> +PV =3D "2.1"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

