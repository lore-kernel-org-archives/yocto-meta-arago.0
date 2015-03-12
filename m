Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1A1D552A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 20:20:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CKK4m1002846
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 15:20:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CKK2n6025388
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 15:20:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 15:20:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH v2 0/4] Implment the wayland DISTRO_FEATURE.
Thread-Index: AQHQXP095y8eSDk8nUWEl6ExGuF+8p0ZlnsA//+y2LA=
Date: Thu, 12 Mar 2015 20:20:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C843A24@DFLE08.ent.ti.com>
References: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
	<20150312195415.GP24885@edge>
In-Reply-To: <20150312195415.GP24885@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2 0/4] Implment the wayland DISTRO_FEATURE.
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
X-List-Received-Date: Thu, 12 Mar 2015 20:20:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch set looks great.

The only issue I see is what happens when a user wants to use Qt 4. I don't=
 think Qt 4 and wayland works together so we should have a check to not inc=
lude Wayland if Qt 4 is being used. Thoughts?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, March 12, 2015 2:54 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2 0/4] Implment the wayland
> DISTRO_FEATURE.
>=20
> Looks good, thanks.
>=20
> On Thu, Mar 12, 2015 at 03:46:18PM -0400, Jacob Stiffler wrote:
> > * Only include wayland, weston, and example packages if 'wayland' is a
> >   DISTRO_FEATURE.
> > * By default, if 'screen' is a MACHINE_FEATURE, then add 'wayland' as a
> >   DISTRO_FEATURE.
> > * Configure qt5 to use wayland if it is a DISTRO_FEATURE, otherwise use
> eglfs.
> > * Add processor-sdk brand to remove wayland from DISTRO_EFATURES for
> the ti33x
> >   and ti43x soc families.
> >
> >
> > Jacob Stiffler (4):
> >   arago.conf: Include wayland in DISTRO_FEATURES by default.
> >   packagegroup-*: Include wayland/weston if specified in
> >     DISTRO_FEATURES.
> >   qtbase: Use DISTRO_FEATURES to set appropriate qpa.
> >   branding-processor-sdk: Add processor-sdk brand.
> >
> >  meta-arago-distro/conf/distro/arago.conf           |    2 +-
> >  .../conf/distro/include/branding-processor-sdk.inc |   35
> ++++++++++++++++++++
> >  .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
> >  .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
> >  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
> >  .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
> >  meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
> >  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    4 +--
> >  8 files changed, 47 insertions(+), 12 deletions(-)  create mode
> > 100644
> > meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> >
> > --
> > v2: Change order of patches.
> >
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

