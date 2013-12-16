Return-Path: <nageswari@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 045D1529C3
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2013 13:20:43 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBGDKfMf025380
	for <meta-arago@arago-project.org>; Mon, 16 Dec 2013 07:20:42 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBGDKdP2016935
	for <meta-arago@arago-project.org>; Mon, 16 Dec 2013 18:50:40 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Mon, 16 Dec 2013 21:20:39 +0800
From: "Srinivasan, Nageswari" <nageswari@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "VENKADASWAMY, RAJASEKAR"
	<x0211375@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/2] machine config for am438x EPOS and
	am437x HS evm
Thread-Index: AQHO8o5bex2ZTtXbQE6gdV5g9nbeappW3eJw
Date: Mon, 16 Dec 2013 13:20:39 +0000
Message-ID: <464859D4BE03A84686BA47749242C1D03EFC4BFC@DBDE04.ent.ti.com>
References: <1386323741-18669-1-git-send-email-x0211375@ti.com>
	<20131206142036.GA690@edge>
In-Reply-To: <20131206142036.GA690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 0/2] machine config for am438x EPOS and am437x HS evm
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
X-List-Received-Date: Mon, 16 Dec 2013 13:20:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Denys,

Rajasekar has to go on a personal emergency and so follow up on this is del=
ayed.
Sorry for the delay.

Regards,
Nageswari

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, December 06, 2013 7:51 PM
> To: VENKADASWAMY, RAJASEKAR
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 0/2] machine config for am438x EPOS and
> am437x HS evm
>=20
> On Fri, Dec 06, 2013 at 03:25:41PM +0530, Rajasekar wrote:
> > Deepak M (1):
> >   am43xx: Added machine config for am437x HS evm
> >
> > Rajasekar (1):
> >   am438x : Added machine config for am438x EPOS machine
> >
> >  conf/machine/am437x-hs-evm.conf   |   39
> +++++++++++++++++++++++++++++++++++++
> >  conf/machine/am438x-epos-evm.conf |   36
> ++++++++++++++++++++++++++++++++++
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 conf/machine/am437x-hs-evm.conf
> >  create mode 100644 conf/machine/am438x-epos-evm.conf
>=20
> It's a wrong list for these patches. Should be meta-ti@yoctoproject.org, =
but
> otherwise the patches are fine, as long as there's somthing else that use=
s
> those machines configurations...
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

