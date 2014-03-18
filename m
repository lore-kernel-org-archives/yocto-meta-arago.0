Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 39B3E52A78
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 13:25:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IDPlCr004784;
	Tue, 18 Mar 2014 08:25:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IDPlqK018454;
	Tue, 18 Mar 2014 08:25:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 18 Mar 2014 08:25:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 0/5] updates for
	several recent OpenTest framework changes
Thread-Index: AQHPNzl0PKl5E87Pd06mFY4uguD7gprmCJ+AgADjvXA=
Date: Tue, 18 Mar 2014 13:25:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C668352@DFLE08.ent.ti.com>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<20140317184929.GR12929@edge>
In-Reply-To: <20140317184929.GR12929@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 0/5] updates for several recent OpenTest framework changes
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
X-List-Received-Date: Tue, 18 Mar 2014 13:25:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not seeing the other patches. Did you just send PATCH 0/5?



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, March 17, 2014 1:49 PM
> To: Denys Dmytriyenko
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 0/5] updates for se=
veral
> recent OpenTest framework changes
>=20
> Ping. Any objectsion to me pushing these patches in?
>=20
>=20
> On Mon, Mar 03, 2014 at 06:36:14PM -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > There were several changes made in the OpenTest framework
> > configuration and setup in the past few months, breaking compatibility
> > with the old CLI client as well as several other assumptions made in
> > the build scripts. This patchset updates the scripts with the new CLI
> > and other config options to work with the new OpenTest framework setup
> again.
> >
> > Denys Dmytriyenko (5):
> >   run-opentest: make assigning tests to a specific TEE optional
> >   run-opentest: pass test_scripts_root to always get latest vatf from
> >     git
> >   run-opentest: add support for new version of opentest CLI
> >   linux-devtest.tgz: add new version of OpenTest CLI 13.11
> >   arago-core-tisdk-dylan-puget: update to use new CLI
> >
> >  configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
> >  lib/run-opentest                         |   25 ++++++++++++++++++++++=
---
> >  linux-devtest.tgz                        |  Bin 0 -> 505553 bytes
> >  3 files changed, 24 insertions(+), 5 deletions(-)  create mode 100644
> > linux-devtest.tgz
> >
> > --
> > 1.7.9.5
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

