Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AD0FC52A3C
	for <meta-arago@arago-project.org>;
	Tue,  4 Sep 2018 12:59:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84CxIS2051659
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 07:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536065958;
	bh=Oxx7mpG6KCoGPkDorvJJdu6VJP7biHCpeOQnITxt1UQ=;
	h=From:To:Subject:Date:References;
	b=zIQNZ1XHdJjqpqyo6NFXecJ6Jpbrcbpeqslt/2//Tjex+Eeez+XxbJMmLUud4Vcj+
	K0sMlgbCwmTz4vf9pXT49dfxl1Pg3ocZ0m3tvmjpQ/CD5LF+m2TWy1d1XbKi/JY3W2
	UTdK86b4MiSYHahdfItZhFydqDT1AQUPDM1oC69g=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84CxIkT024794
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 07:59:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 07:59:18 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 4 Sep 2018 07:59:18 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Reddy, M V Pratap" <x0257344@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
	icss-emac-lld: Checksum update
Thread-Index: AQHUQu6KBSHbQBc4BUG0C2a+N2WXg6TdqteAgAJk9NCAAAcagA==
Date: Tue, 4 Sep 2018 12:59:18 +0000
Message-ID: <eff367e1631c4e498c04fe291641e494@ti.com>
References: <1535914497-12916-1-git-send-email-x0257344@ti.com>
	<1535914497-12916-2-git-send-email-x0257344@ti.com> 
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
X-List-Received-Date: Tue, 04 Sep 2018 12:59:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Additionally, this only changes the checksum for "icss-emac-lld". The check=
sum for "icss-emac-lld-rtos" and "icss-emac-lld-test" will remain unchanged=
. All three of these recipes share the same source (including license) via =
"icss-lld.inc" in meta-ti. And can you directly submit to meta-ti?

And whenever the license checksum changes, you will need to explain what ha=
s changed.

- Jake

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, September 04, 2018 8:30 AM
> To: Reddy, M V Pratap; meta-arago@arago-project.org
> Subject: RE: [EXTERNAL] [meta-arago] [master][meta-processor-
> sdk][PATCH] icss-emac-lld: Checksum update
>=20
> NAK.
>=20
> Without a SRCREV update, not sure how the license checksum could change.
>=20
> - Jake
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Reddy, M V Pratap
> > Sent: Sunday, September 02, 2018 2:55 PM
> > To: meta-arago@arago-project.org
> > Subject: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
> > icss-emac-lld: Checksum update
> >
> > From: M V Pratap Reddy <x0257344@ti.com>
> >
> > Signed-off-by: M V Pratap Reddy <x0257344@ti.com>
> > ---
> >  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-
> lld_git.bbappend
> >
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
> b/recipes-
> > bsp/icss-emac-lld/icss-emac-lld_git.bbappend
> > new file mode 100644
> > index 0000000..e2ef25c
> > --- /dev/null
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
> > @@ -0,0 +1 @@
> > +LIC_FILES_CHKSUM =3D
> >
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D590829f0298e5fc11=
6589
> > 4e26d5380fc"
> > --
> > 1.9.5.msysgit.1
> >
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

