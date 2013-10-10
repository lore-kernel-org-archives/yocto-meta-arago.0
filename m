Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D08F35296F
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 00:13:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9A0DNIW013119
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 19:13:23 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9A0DMuS002232
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 19:13:22 -0500
Received: from DNCE05.ent.ti.com ([fe80::5dc0:6ff5:718e:785a]) by
	DNCE71.ent.ti.com ([fe80::7d60:3983:a688:ea7d%20]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 02:13:22 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2]
	ti-connectivity/compat_wl18xx_r8.a6.01:	Update SRC_URI
Thread-Index: AQHOxUtUHQ2Gx9eiXkW9CFLXVcIMJZns7OOAgAAiXMA=
Date: Thu, 10 Oct 2013 00:13:21 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240BFF85F9@DNCE05.ent.ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>,
	<1381366559-13586-3-git-send-email-r-monk@ti.com>
	<6B10753E-A555-4D14-B1B4-055F564D1D26@ti.com>
In-Reply-To: <6B10753E-A555-4D14-B1B4-055F564D1D26@ti.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] ti-connectivity/compat_wl18xx_r8.a6.01:	Update SRC_URI
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
X-List-Received-Date: Thu, 10 Oct 2013 00:13:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2013 at 01:06:01, Cooper Jr., Franklin wrote:
> Subject: Re: [meta-arago] [PATCH 2/2] ti-
> connectivity/compat_wl18xx_r8.a6.01: Update SRC_URI
>=20
> The Wilink 8 recipes were initially created for AM335x on a 3.2 kernel.
>=20
> Based on your other patch set is this updated tag supported on=20
> omap-a15 only or 3.8+ kernels only?
>=20

The original commit hash for this version is no longer present (presumably =
due to a rebase), so this patch simply updates the commit to match the new =
commit id for the same tag (r8.a6.01) to make this recipe buildable again.

This recipe will likely need to be replaced shortly with newer r8.a6.xx rel=
ease anyway for AM335x, but I wanted to get the WILINK8 recipes buildable f=
irst.

>=20
>=20
> > On Oct 9, 2013, at 6:57 PM, "Monk, Roger" <r-monk@ti.com> wrote:
> >
> >   * SRC_URI tag has changed (rebased?)
> >   * Update SRC_URI to match r8.a6.01 tag
> >
> > Signed-off-by: Roger Monk <r-monk@ti.com>
> > ---
> > .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git=20
> > a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
> > index 273c721..a69b7d6 100644
> > ---=20
> > a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireles
> > s-
> wl18xx_r8.a6.01.bb
> > +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wir
> > +++ eless-
> wl18xx_r8.a6.01.bb
> > @@ -21,7 +21,7 @@ PR =3D "${MACHINE_KERNEL_PR}"
> > PR_append =3D "c"
> >
> > # Tags: ol_r8.a6.01
> > -SRCREV_wl18xx =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
> > +SRCREV_wl18xx =3D "f076cdad1988daf207ad560db2fe96caaa7c596e"
> > SRCREV_compat =3D "c37c46c4ab5085ba50f650d15854404983b8d09b"
> > SRCREV_compat-wireless =3D "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
> >
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



