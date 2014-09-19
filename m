Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5812052981
	for <meta-arago@arago-project.org>;
	Fri, 19 Sep 2014 15:53:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8JFrYGj032708;
	Fri, 19 Sep 2014 10:53:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8JFrYsp008040;
	Fri, 19 Sep 2014 10:53:34 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 19 Sep 2014 10:53:34 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
Thread-Index: Ac/TnTy9Iq0xG1/kThm3DoLQ77ZYWAAg2gHA
Date: Fri, 19 Sep 2014 15:53:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73729D@DFLE08.ent.ti.com>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FE6@MSXBEBVT12.planar.net>
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FE6@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
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
X-List-Received-Date: Fri, 19 Sep 2014 15:53:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since meta-ti is only a bsp layer people can choose to use other layers whi=
ch may use that variable. Like you point out meta-oe would be an example. H=
onestly it may be a variable that isn't used often or deprecated but as is =
its not harming anything.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Matt Schuckmann
> Sent: Thursday, September 18, 2014 7:04 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
>=20
> In my quest to understand this stuff I was checking out what the settings=
 in
> meta-ti/conf/machine/include/ti33x.inc do.
>=20
> Many of the inc files in ./meta-ti/conf/machine/include set
> GUI_MACHINE_CLASS to either bigscreen or smallscreen, but I can find no
> layer that uses GUI_MACHINE_CLASS.
> However, meta-openembedded/meta-oe/recipes-kernel/linux/linux.inc does
> use MACHINE_GUI_CLASS to determine some sort of LOGO_SIZE variable, of
> course smallscreen isn't one of the options.
>=20
> So for at least my own edification what gives?
>=20
> Thanks,
> Matt S.
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

