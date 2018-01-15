Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5697252A28
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 23:34:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FNYRLV006562
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:34:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516059267;
	bh=ZAz6OAJUVUgBLMHS1bsv14FbD4Rnl+WKD9aw3y+YDhw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YyJpdnv2V4F2rCELeYlDykeOOveqxSt6U1ljnquZdGtGC6v9VW3iHKADLPLUfGtsZ
	fWSGwhcD9ROzOUQP68B/PMy5tsZ62Pm7ViQW+jZH2YAFetpubm1iyRrXt4weji4LQq
	LsD9raJGz0s2C8pjW/NNmGOkIHHXnjQ3QWs4goGw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNYRnh021188
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:34:27 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 17:34:27 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Mon, 15 Jan 2018 17:34:27 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk] branding-processor-sdk: bump
	max_leb_cnt for k2hk
Thread-Index: AQHTjlgT9kozJelL6kSDllVVwlvxJqN1lMjg
Date: Mon, 15 Jan 2018 23:34:27 +0000
Message-ID: <f52ea77d0c044d5fb021a8686d221bd7@ti.com>
References: <1516058569-7239-1-git-send-email-a0271529@ti.com>
	<20180115232504.GB31682@edge>
In-Reply-To: <20180115232504.GB31682@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-processor-sdk] branding-processor-sdk: bump max_leb_cnt for k2hk
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
X-List-Received-Date: Mon, 15 Jan 2018 23:34:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, January 15, 2018 6:25 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-processor-sdk] branding-processor-sdk:
> bump max_leb_cnt for k2hk
>=20
> On Mon, Jan 15, 2018 at 06:22:49PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  conf/distro/include/branding-processor-sdk.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/distro/include/branding-processor-sdk.inc
> > b/conf/distro/include/branding-processor-sdk.inc
> > index 955606f..2fbcb04 100644
> > --- a/conf/distro/include/branding-processor-sdk.inc
> > +++ b/conf/distro/include/branding-processor-sdk.inc
> > @@ -43,7 +43,7 @@ MKUBIFS_ARGS_am57xx-evm     =3D "-F -m 2048 -e
> 126976 -c 15000"
> >  MKUBIFS_ARGS_am57xx-hs-evm  =3D "-F -m 2048 -e 126976 -c 15000"
> >  MKUBIFS_ARGS_dra7xx-evm     =3D "-F -m 2048 -e 126976 -c 15000"
> >  MKUBIFS_ARGS_dra7xx-hs-evm  =3D "-F -m 2048 -e 126976 -c 15000"
> > -MKUBIFS_ARGS_k2hk           =3D "-F -m 2048 -e 126976 -c 4100"
> > +MKUBIFS_ARGS_k2hk           =3D "-F -m 2048 -e 126976 -c 4200"
>=20
> Would it fit into flash?

Not sure what would be the maximal to use to fit into flash.=20
Below is reported from the nightly builds for K2HK in processor SDK:
Non-RT: max_leb_cnt too low (4120 needed)
RT: max_leb_cnt too low (4118 needed)
HS: max_leb_cnt too low (4130 needed)

>=20
>=20
> >  # By default, do not include OPTEE for any HS platform  # Comment the
> > OPTEEMACHINE and OPTEEFLAVOR line for a
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

