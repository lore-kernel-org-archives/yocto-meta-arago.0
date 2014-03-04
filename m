Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EEC7252AB3
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 19:59:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24JxQTU018731
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:59:26 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24JxQPY010684
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:59:26 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 4 Mar 2014 13:59:25 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [dylan|ti2013.12.x][PATCH] Revert "arago-prefs:
	set PREFERRED VERSION of libdrm to latest"
Thread-Index: AQHPN9yIJwWiT59pEkuxWUltCI3E2JrRsJqA//+nV6A=
Date: Tue, 4 Mar 2014 19:59:25 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C65D344@DFLE08.ent.ti.com>
References: <1393959849-32619-1-git-send-email-fcooper@ti.com>
	<20140304191348.GM22125@edge>
In-Reply-To: <20140304191348.GM22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dylan|ti2013.12.x][PATCH] Revert "arago-prefs: set PREFERRED VERSION of libdrm to latest"
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
X-List-Received-Date: Tue, 04 Mar 2014 19:59:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 04, 2014 1:14 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [dylan|ti2013.12.x][PATCH] Revert "arago-prefs:=
 set
> PREFERRED VERSION of libdrm to latest"
>=20
> Have you seen this:
> http://arago-project.org/pipermail/meta-arago/2014-February/003143.html
[Franklin] Yes. Chase responded that his original patch was meant for dora =
and up.=20

My patch is only for Dylan and ti2013.12.x.
>=20
>=20
> On Tue, Mar 04, 2014 at 01:04:09PM -0600, Franklin S. Cooper Jr wrote:
> > This reverts commit 8303758bc661f660a39b75e0ff7aa2a0ca6fea56.
> >
> > libdrm v2.4.46 doesn't exist for the dylan (ti2013.12.x) maintenance
> > branch
> > ---
> >  .../conf/distro/include/arago-prefs.inc            |    3 ---
> >  1 files changed, 0 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > index 5f7b023..d5176fd 100644
> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > @@ -4,9 +4,6 @@ include conf/distro/include/qt5-versions.inc
> >  # Use the latest version of ltp-ddt for kernel versions 3.8+
> > PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
> >
> > -# Use the latest version of libdrm
> > -PREFERRED_VERSION_libdrm =3D "2.4.46"
> > -
> >  PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
> >
> >  ARAGO_QT_PROVIDER =3D
> "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-
> embedded',d)}"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

