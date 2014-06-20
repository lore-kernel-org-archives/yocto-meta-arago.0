Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8379952A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:13:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKDLsB022511
	for <meta-arago@arago-project.org>; Fri, 20 Jun 2014 15:13:21 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKDLTS002755
	for <meta-arago@arago-project.org>; Fri, 20 Jun 2014 15:13:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:13:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 02/19] linux-libc-headers: remove old
	2.6.37	version
Thread-Index: AQHPjLEYEUUJkghBL0OXAJ0UuNToc5t6r3OAgAABHoD//71OkA==
Date: Fri, 20 Jun 2014 20:13:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D653B@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-3-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9033@DLEE11.ent.ti.com>
	<20140620190849.GA1825@edge>
In-Reply-To: <20140620190849.GA1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 02/19] linux-libc-headers: remove old 2.6.37	version
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
X-List-Received-Date: Fri, 20 Jun 2014 20:13:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, June 20, 2014 2:09 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 02/19] linux-libc-headers: remove old 2.=
6.37
> version
>=20
> Yes, 2.6 is just completely and utterly broken with newer toolchains, new=
er
> udev and newer kmod. Nothing builds anymore... I'll update commit message=
.
>=20
>=20
> On Fri, Jun 20, 2014 at 07:04:49PM +0000, Maupin, Chase wrote:
> > I'm assuming this is because the legacy machines line am180x are moving=
 to
> > using the mainline kernel?  A more detailed commit message explaining t=
his
> > move would help.  Aside from that:
[Franklin] We talked about this sometime last year about removing old machi=
nes. I think we should go ahead with that plan.
> >
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> >
> >
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > >Sent: Friday, June 20, 2014 12:57 PM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 02/19] linux-libc-headers: remove old
> > >2.6.37 version
> > >
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > > .../linux-libc-headers/linux-libc-headers_2.6.37.2.bb          |
> > >10 ----------
> > > 1 file changed, 10 deletions(-)
> > > delete mode 100644 meta-arago-extras/recipes-kernel/linux-libc-
> > >headers/linux-libc-headers_2.6.37.2.bb
> > >
> > >diff --git a/meta-arago-extras/recipes-kernel/linux-libc-
> > >headers/linux-libc-headers_2.6.37.2.bb b/meta-arago-
> > >extras/recipes-kernel/linux-libc-headers/linux-libc-
> > >headers_2.6.37.2.bb
> > >deleted file mode 100644
> > >index 5c00af5..0000000
> > >--- a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-
> > >libc-headers_2.6.37.2.bb
> > >+++ /dev/null
> > >@@ -1,10 +0,0 @@
> > >-require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > >-
> > >-FILESEXTRAPATHS_append :=3D
> > >"${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-
> > >headers/${PN}"
> > >-
> > >-PR =3D "r1"
> > >-
> > >-SRC_URI +=3D " file://connector-msg-size-fix.patch"
> > >-SRC_URI[md5sum] =3D "89f681bc7c917a84aa7470da6eed5101"
> > >-SRC_URI[sha256sum] =3D
> >
> >"2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
> > >-
> > >--
> > >2.0.0
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

