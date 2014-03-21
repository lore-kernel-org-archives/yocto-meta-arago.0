Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9F70D52998
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 14:20:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LEKrNd027096
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 09:20:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LEKrrS030297
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 09:20:53 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 21 Mar 2014 09:20:53 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 4/5]
	linux-devtest.tgz: add new version of OpenTest CLI 13.11
Thread-Index: AQHPNznfQ87gtBVb00GIsht174AlUprm/GhggANlHgiAAFiqAIAA+Bjw
Date: Fri, 21 Mar 2014 14:20:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C66B25A@DFLE08.ent.ti.com>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-5-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C668606@DFLE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C66AAE0@DFLE08.ent.ti.com>
	<20140320183004.GA3370@denix.org>
In-Reply-To: <20140320183004.GA3370@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 4/5] linux-devtest.tgz: add new version of OpenTest CLI 13.11
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
X-List-Received-Date: Fri, 21 Mar 2014 14:20:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not sure what kind of changes to a TEE are required to use an updated O=
penTest CLI but I guess we just need to make sure that all the TEEs upgrade=
 together in the future before pushing updated tarballs if the naming isn't=
 going to change.

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Consider this an Ack to all the other patches as well.


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, March 20, 2014 1:30 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 4/5] linux-devtest.=
tgz:
> add new version of OpenTest CLI 13.11
>=20
> On Thu, Mar 20, 2014 at 06:13:12PM +0000, Cooper Jr., Franklin wrote:
> > Sorry sent this before but apparently I didn't use reply all.
> > ________________________________________
> > From: Cooper Jr., Franklin
> > Sent: Tuesday, March 18, 2014 9:27 AM
> > To: Denys Dmytriyenko
> > Subject: RE: [meta-arago] [tisdk-build-scripts][PATCH 4/5]
> > linux-devtest.tgz: add new version of OpenTest CLI 13.11
> >
> > Any reason why we need to name this linux-devtest.tgz instead of
> opentest_cli_xxx.tar.gz?
> >
> > It would just make it easier to recognize what this tarball contains.
>=20
> The main reason being this is AS IS tarball that comes directly from Open=
Test
> install. I didn't want to change it - either rename or change the new dir=
ectory
> structure. This way it should be very straightforward to update to new
> versions in the future.
>=20
> --
> Denys

