Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7154852981
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 01:14:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r321EgZA032408;
	Mon, 1 Apr 2013 20:14:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r321Egom011036;
	Mon, 1 Apr 2013 20:14:42 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Apr 2013 20:14:41 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 1 Apr 2013 20:14:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/3] RFC: Add branding support for
	products to	tweak preferences
Thread-Index: AQHOLzxXtlPkOoAj+kCZp2u6KmH0jZjCH2mAgAAAsyA=
Date: Tue, 2 Apr 2013 01:14:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C41944F@DFLE08.ent.ti.com>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C419438@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C419438@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] RFC: Add branding support for products to	tweak preferences
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
X-List-Received-Date: Tue, 02 Apr 2013 01:14:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Lol so as soon as I sent this the patch suddenly popped up as a new email i=
n my inbox. Ignore my comment.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Monday, April 01, 2013 8:13 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 0/3] RFC: Add branding support for
> products to tweak preferences
>=20
> PATCH 2/3 missing?
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, April 01, 2013 7:51 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 0/3] RFC: Add branding support for
> > products to tweak preferences
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > * For cases when products based on Arago Core TI-SDK need to select
> > different
> >   providers or versions of packages. For example, AM-SDK needs to stay
> > on the
> >   stable kernel 3.2, while Core TI-SDK is moving to the new kernel 3.8.
> > * Adding new branding policies requires creating a new
> > branding-<name>.inc file
> >   and setting ARAGO_BRAND=3D<name> in the local.conf
> > * The default branding is "core" when ARAGO_BRAND is not set and is
> > mostly empty
> >   to fall back on the default Arago Core TI-SDK preferences.
> >
> > Denys Dmytriyenko (3):
> >   arago.conf: add branding support to allow products to tweak
> >     preferences
> >   branding-amsdk: add the initial AM-SDK branding policy
> >   arago-prefs: set default preferences to the latest TI staging kernel
> >     and u-boot
> >
> >  meta-arago-distro/conf/distro/arago.conf                 | 7 +++++++
> >  meta-arago-distro/conf/distro/include/arago-prefs.inc    | 9 +++------
> >  meta-arago-distro/conf/distro/include/branding-amsdk.inc | 8 ++++++++
> > meta-arago-distro/conf/distro/include/branding-core.inc  | 6 ++++++
> >  4 files changed, 24 insertions(+), 6 deletions(-)  create mode 100644
> > meta- arago-distro/conf/distro/include/branding-amsdk.inc
> >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> > core.inc
> >
> > --
> > 1.8.1.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

