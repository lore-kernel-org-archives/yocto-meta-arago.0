Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BA2805297F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 14:44:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91Ei2GB026945
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 09:44:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91Ei2QA023202
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 09:44:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 09:44:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt5,
	bump distro version
Thread-Index: AQHOvqooOs1YxVWjy0uPHvdOItdJzJnf62qA
Date: Tue, 1 Oct 2013 14:44:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C566C43@DFLE08.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-12-git-send-email-denis@denix.org>
	<4FEEA6A8-A5F9-41F2-A88D-731FC280F154@ti.com>
	<20131001132846.GE26572@edge>
In-Reply-To: <20131001132846.GE26572@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt5, bump distro version
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
X-List-Received-Date: Tue, 01 Oct 2013 14:44:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, October 01, 2013 8:29 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt=
5,
> bump distro version
>=20
> On Tue, Oct 01, 2013 at 01:23:27PM +0000, Cooper Jr., Franklin wrote:
> > As long as we put this on a separate branch based on my reasoning I
> > mentioned on this patch set cover sheet then I have no problem with thi=
s.
>=20
> Yeah, this was rather meant for the demo of Qt5-based matrix-browser, not=
 as a
> default value right away. I'd rather drop this and stick with Qt4 for a w=
hile, if we
> can get everything else in to the master.
[Franklin] Sounds good.
>=20
>=20
> > > On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org>
> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > > meta-arago-distro/conf/distro/arago.conf | 4 +++-
> > > 1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/conf/distro/arago.conf
> > > b/meta-arago-distro/conf/distro/arago.conf
> > > index 18299bd..7ecd2b4 100644
> > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > @@ -1,6 +1,8 @@
> > > # Name and version of the distribution DISTRO_NAME =3D "Arago"
> > > -DISTRO_VERSION =3D "2013.08"
> > > +DISTRO_VERSION =3D "2013.10"
> > > +
> > > +QT_PROVIDER =3D "qt5"
> > >
> > > # SDK paths and names
> > > SDK_NAME_PREFIX =3D "arago"
> > > --
> > > 1.8.3.2
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

