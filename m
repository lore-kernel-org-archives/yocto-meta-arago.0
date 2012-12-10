Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 75073529BC
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 21:03:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qBAL3vUV031805
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2012 15:03:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qBAL3vOP030861
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2012 15:03:57 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 10 Dec 2012 15:03:57 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Hernandez, Carlos" <ceh@ti.com>
Thread-Topic: [meta-arago] meta-arago master 469a8425 seems broken
Thread-Index: AQHN1xaPM/TJq2Tj1Ue6XjHQPv57FZgS5QOA//+gIUA=
Date: Mon, 10 Dec 2012 21:03:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3463AF@DFLE09.ent.ti.com>
References: <50C648A7.4050601@ti.com> <20121210204535.GB4591@denix.org>
In-Reply-To: <20121210204535.GB4591@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-arago master 469a8425 seems broken
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
X-List-Received-Date: Mon, 10 Dec 2012 21:03:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had to lock down oe-core and meta-oe  because of this same issue.

Here are the commits I am using for the Sitara SDK which was before all the=
 recent changes.
Meta-openembedded : e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f
Oe-core: c15fae372cf75403facc28cf76f973b1279425dd

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, December 10, 2012 2:46 PM
> To: Hernandez, Carlos
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] meta-arago master 469a8425 seems broken
>=20
> On Mon, Dec 10, 2012 at 03:40:07PM -0500, Carlos Hernandez wrote:
> > jenkins@jenkins1:/home/a0850405/oe/build$ MACHINE=3Dam335x-evm
> bitbake
> > virtual/bootloader -c clean Parsing recipes: 100%
> >
> |################################################################
> #####
> > |###############|
> > Time: 00:00:15
> > Parsing of 1353 .bb files complete (0 cached, 1353 parsed). 1719
> > targets, 131 skipped, 8 masked, 0 errors.
> > ERROR: No recipes available for:
> >
> > /home/a0850405/oe/sources/meta-arago/meta-arago-distro/recipes-connect
> > ivity/openssl/openssl_1.0.0i.bbappend
>=20
> Carlos,
>=20
> meta-arago master currently still only works with denzil. So, openssl-1.0=
.0i is
> present in denzil of oe-core, while master of oe-core has newer openssl-1=
.0.0j.
>=20
> --
> Denys
>=20
>=20
> > ERROR: Command execution failed: Exited with 1
> >
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> >
> >
> > jenkins@jenkins1:/home/a0850405/oe/sources/meta-arago$ git log
> > commit 469a8425e702969a5be18dae0184980bd4d031b4
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Thu Dec 6 10:44:26 2012 -0500
> >
> >     arago.conf: bump the version
> >
> >     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

