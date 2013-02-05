Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D023152A9C
	for <meta-arago@arago-project.org>;
	Tue,  5 Feb 2013 11:59:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r15BxvDK010997
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 05:59:57 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r15BxviI014693
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 05:59:57 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 5 Feb 2013 05:59:57 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] Danny migration
Thread-Index: AQHN/zcEHG7skvVMyEqR7GHmEsb5CJhmNwuAgAT7ATA=
Date: Tue, 5 Feb 2013 11:59:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C386449@DFLE09.ent.ti.com>
References: <20130130221217.GA1060@denix.org> <20130202015559.GA7440@denix.org>
In-Reply-To: <20130202015559.GA7440@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Danny migration
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
X-List-Received-Date: Tue, 05 Feb 2013 11:59:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What is the new recommend bitbake branch or commit to use?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, February 01, 2013 7:56 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Danny migration
>=20
> On Wed, Jan 30, 2013 at 05:12:17PM -0500, Denys Dmytriyenko wrote:
> > All,
> >
> > I've started migrating meta-arago from "denzil" stable branch (based
> > on the Yocto Project 1.2) to "danny" stable branch (Yocto Project 1.3).
> >
> > Please use arago-danny-config from oe-layersetup:
> > http://arago-project.org/git/projects/?p=3Doe-layersetup.git;a=3Dsummar=
y
> >
> > The first set of generic fixes is now in meta-arago master. There are
> > still plenty of issues. The biggest being the absence of gcc-4.5 base
> > recipes to support packaging of the Arago toolchain into the
> > filesystem images. I'm looking into a short-term fix of overlaying
> > those, until we move to a newer toolchain for our SDKs. But it's still
> > possible to use Arago gcc-4.5 based toolchain for now to build
> > packages, but not images, as TC is not packaged itself.
> >
> > There are other lingering issues and I'm going through them now. I may
> > not be able to accept your fixes/patches right now or for the next
> > couple of days, while I'm still working on the basic porting/migration =
issues...
>=20
> I've pushed additional patches today, including the ones needed for the
> toolchain. And it is now possible to build tisdk-rootfs-image. While I've=
 only
> done very minimal testing, it should be good enough to start using danny =
setup
> for SDK porting.
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

