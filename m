Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 512D852A34
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 17:59:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SHxHiO015657
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493402357;
	bh=m6z/uhCSdIWNqKSDDOPUHRQDaj2y5i1hQupvJ9wQ68Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cDv50sIttw52UuiDn2EsVvlaalBz6PXDkQEllgCSl4jDv9ttMEIvi54g9uBmwifjQ
	1lrIQYfl/RCoadejXVruLhIx42YPipVSDTD6J6axwXjRCIZ8vNvPT+nodzN6aVTVll
	8FmkigBKgD4NV/MQXOSsda834DpaAR0zyKVM22Rk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SHxHKA024446
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:59:17 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 28 Apr 2017 12:59:16 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH] arago-tisdk-addons: Add ipc
	related packages
Thread-Index: AQHSwCxCG8TXpp41NESfhRXTs22UC6HbEdQw
Date: Fri, 28 Apr 2017 17:59:16 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490585CB34E@DLEE11.ent.ti.com>
References: <1493260049-39927-1-git-send-email-sam.nelson@ti.com>
	<20170428143225.GJ31608@edge>
In-Reply-To: <20170428143225.GJ31608@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH] arago-tisdk-addons: Add ipc related packages
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
X-List-Received-Date: Fri, 28 Apr 2017 17:59:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sent another follow up patch. Hope the new patch can work with the size lim=
itation.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, April 28, 2017 10:32 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH] arago-tisdk-addons: Add i=
pc
> related packages
>=20
> Sam,
>=20
> This addition pushes the size of k2hk rootfs over the limit - need to fin=
d
> something to move to the extras image...
>=20
>=20
> On Wed, Apr 26, 2017 at 10:27:29PM -0400, Sam Nelson wrote:
> > Add ipc packages for omapl138
> > Add ti-ipc-examples-linux to Keystone and omap-a15
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | =
6
> ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 5ad6655..c8b0f4a 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bb
> > @@ -55,6 +55,11 @@ UTILS_append_omap-a15 =3D " mmc-utils \
> >                            ti-ipc-rtos-fw \
> >                            uio-test-pruss \
> >                            uio-module-drv-test \
> > +                          ti-ipc-examples-linux \
> > +"
> > +
> > +UTILS_append_omapl138 =3D " ti-ipc-rtos-fw \
> > +                          ti-ipc-examples-linux \
> >  "
> >
> >  UTILS_append_dra7xx =3D " canutils \
> > @@ -66,6 +71,7 @@ UTILS_append_dra7xx =3D " canutils \
> >  UTILS_append_keystone =3D " \
> >      uio-module-drv-test \
> >      ti-ipc-rtos-fw \
> > +    ti-ipc-examples-linux \
> >  "
> >
> >  UTILS_append_k2hk =3D " \
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

