Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9E51952A3C
	for <meta-arago@arago-project.org>;
	Tue,  4 Sep 2018 12:29:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84CTc5B026019
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 07:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536064178;
	bh=YwH1ymNz109auS0PUpiat5PzNQu1GfoVm2AdwwSy7UU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qTXIUpa6L6BNWiPZmV1WQeCLjXl6jksh5+wq/TDT4JEgXmKXjPoc0kMJjbJjKq7Oy
	aEB2kBFO4UWiBZB5hKY+UtjEi0boU7I9UFlGfJTNDRXg0PnA58alW0ke+szNl7xkL8
	eUUuvHtdFurXUwzOEm9o9BsJ9qCSnyb1QjPpJtvw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84CTcqw004392
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 07:29:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 07:29:38 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 4 Sep 2018 07:29:38 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Reddy, M V Pratap" <x0257344@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
	icss-emac-lld: Checksum update
Thread-Index: AQHUQu6KBSHbQBc4BUG0C2a+N2WXg6TdqteAgAJk9NA=
Date: Tue, 4 Sep 2018 12:29:38 +0000
Message-ID: <2cf39966034a4d95ad44ebf7c14703d9@ti.com>
References: <1535914497-12916-1-git-send-email-x0257344@ti.com>
	<1535914497-12916-2-git-send-email-x0257344@ti.com>
In-Reply-To: <1535914497-12916-2-git-send-email-x0257344@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH] icss-emac-lld: Checksum update
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
X-List-Received-Date: Tue, 04 Sep 2018 12:29:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK.

Without a SRCREV update, not sure how the license checksum could change.

- Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Reddy, M V Pratap
> Sent: Sunday, September 02, 2018 2:55 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
> icss-emac-lld: Checksum update
>=20
> From: M V Pratap Reddy <x0257344@ti.com>
>=20
> Signed-off-by: M V Pratap Reddy <x0257344@ti.com>
> ---
>  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
>=20
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend b/recip=
es-
> bsp/icss-emac-lld/icss-emac-lld_git.bbappend
> new file mode 100644
> index 0000000..e2ef25c
> --- /dev/null
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
> @@ -0,0 +1 @@
> +LIC_FILES_CHKSUM =3D
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D590829f0298e5fc11=
6589
> 4e26d5380fc"
> --
> 1.9.5.msysgit.1
>=20
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

