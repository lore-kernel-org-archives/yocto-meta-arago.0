Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 94D7E52A1D
	for <meta-arago@arago-project.org>;
	Mon, 18 Feb 2013 18:34:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1IIYiJY028365;
	Mon, 18 Feb 2013 12:34:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1IIYipE029271;
	Mon, 18 Feb 2013 12:34:44 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 12:34:44 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
Thread-Index: AQHOCLpsMGflxzqAp0WHcPg8Stwd3Jh8C5cAgAOyCHCAAJRMgP//qEHw
Date: Mon, 18 Feb 2013 18:34:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C394B7B@DFLE09.ent.ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
	<CA+edY+TJcTewZLGNf5WTjsZE3a+3cg0UCRBjaHPhtFQ344iM8Q@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C3946F1@DFLE09.ent.ti.com>
	<20130218174301.GA6546@denix.org>
In-Reply-To: <20130218174301.GA6546@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Mon, 18 Feb 2013 18:34:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, February 18, 2013 11:43 AM
> To: Cooper Jr., Franklin
> Cc: Paul Kovitz; fcooperjr27@gmail.com; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX
> variable
>=20
> On Mon, Feb 18, 2013 at 03:14:17PM +0000, Cooper Jr., Franklin wrote:
> > Hi Paul,
> >
> > In this case ?=3D and =3D would be equivalent. If your setting
> > SUPPORTS_SGX in your local.conf then it will override the value in the
> arago.conf file.
>=20
> Not really - distro conf always overrides local.conf. You'd need to use
> _forcevariable override in local.conf to make it work:
>=20
> SUPPORT_SGX_forcevariable =3D "blah"
>=20
> But, anyway, I'd rather work on extending MACHINE_FEATURES with "sgx"
> instead.
>=20
I guess I was wrong. I thought it was the other way around.

Adding sgx to MACHINE_FEATURES won't solve his problem since he isn't creat=
ing a new machine he is just tweaking the current am335x-evm machine.
So he can either use forcevariable or use something like oe_filter_out to r=
emove sgx from the am335x-evm MACHINE_FEATURES.

> --
> Denys
>=20
>=20
> > I do see your point for the other two recipes. Currently it isn't frien=
dly
> > for people wanting to support am3352.  I'll send updated patches. Thank=
s!
> >
> > From: Paul Kovitz [mailto:paul.kovitz@welchallyn.com]
> > Sent: Friday, February 15, 2013 6:26 PM
> > To: fcooperjr27@gmail.com
> > Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> > Subject: Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX
> variable
> >
> > Please comment on coding SUPPORTS_SGX ?=3D "YES" instead of
> SUPPORTS_SGX =3D "YES" For example, if you want to simulate an AM3352 dev=
ice
> on an AM335x eval board, you could write SUPPORTS_SGX =3D "NO" in local.c=
onf.
> This change requires a base_conditional checks for SUPPORTS_SGX in task-
> arago-tisdk-matrix.bb<http://task-arago-tisdk-matrix.bb> and task-arago-t=
isdk-
> graphics-sdk-target.bb<http://task-arago-tisdk-graphics-sdk-target.bb> to=
 avoid
> other dependencies on OpenGL for the AM3352. I have a similar patch in th=
e
> code I am currently using for my own development.
> >
> > Thanks for your help.
> >
> >
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


