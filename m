Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0B4B452A85
	for <meta-arago@arago-project.org>;
	Thu, 25 Apr 2013 23:42:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3PNgtbq005619
	for <meta-arago@arago-project.org>; Thu, 25 Apr 2013 18:42:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3PNgtWj020766
	for <meta-arago@arago-project.org>; Thu, 25 Apr 2013 18:42:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 25 Apr 2013 18:42:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
	and	.out support in Matrix PHP
Thread-Index: AQHOQRmm2v4/ekKE60WHst7aJ2e8gZjlvKuggABYQYD//64o4IAArISAgAEpsdA=
Date: Thu, 25 Apr 2013 23:42:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C435693@DFLE08.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C432969@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7@DLEE09.ent.ti.com>
In-Reply-To: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7@DLEE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-lighttpd-config: add static cgi and	.out support in Matrix PHP
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
X-List-Received-Date: Thu, 25 Apr 2013 23:42:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hao,
Ok this makes a lot more sense :)

What your trying to do looks very difficult using shell script. Reading rad=
io buttons, form submissions and handling file uploads really should be han=
dled by a web server side programming language.

I would recommend not pushing this patch until you at least get one of thes=
e examples working like you expect.=20

Since this might be keystone specific we can't perhaps try using sed to twe=
ak this config file for only your platform. But let's discuss this once you=
 have everything working.

> -----Original Message-----
> From: Zhang, Hao
> Sent: Wednesday, April 24, 2013 7:51 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi =
and .out
> support in Matrix PHP
>=20
> Franklin,
>=20
> I gave you the wrong example, please see attached for the eeprom read/wri=
te
> example, which uses cgi. Our utility examples follow this basic structure=
 for a
> main html page calling the cgi.
>=20
> Hao.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, April 24, 2013 3:41 PM
> To: Zhang, Hao; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi =
and .out
> support in Matrix PHP
>=20
> Matrix already has the ability to run shell scripts so I don't understand=
 why you
> need this .cgi which still executes shell commands. Is there  some kind o=
f
> limitation your running into?
>=20
> Your utility_info.sh would contain:
>=20
> echo " System Up Time"
> cat /proc/uptime
>=20
> echo "CPU Info"
> cat /proc/cpuinfo
>=20
> echo "Linux version
> uname -srm
>=20
> TMPFILE=3D`mktemp`
> mount | awk ' {print "device ", $1," mounted on ",$3, " as ", $5, "filesy=
stem"}' >
> $TMPFILE
>=20
> echo "Mount Info"
> cat $TMPFILE
> rm $TMPFILE
>=20
> echo "Network Interfaces"
>=20
> ifconfig
>=20
> echo "Routing table"
> route
>=20
> echo "Module Info"
> lsmod
>=20
> And your utility_info.desktop will be set to:
> Exec=3Dutility_info.sh
>=20
>=20
> > -----Original Message-----
> > From: Zhang, Hao
> > Sent: Wednesday, April 24, 2013 2:27 PM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static
> > cgi and .out support in Matrix PHP
> >
> > See attached the example.
> >
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Wednesday, April 24, 2013 3:17 PM
> > To: Zhang, Hao; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static
> > cgi and .out support in Matrix PHP
> >
> > cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi=
" =3D> "/bin/sh",  ".o"
> =3D>
> > "" )
> >
> > Can you give an example of the .cgi and .o file that requires this chan=
ge?
> >
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Zhang, Hao
> > > Sent: Wednesday, April 24, 2013 1:29 PM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
> > > and .out support in Matrix PHP
> > >
> > > From: Hao Zhang <hzhang@ti.com>
> > >
> > > ---
> > >  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > > config/lighttpd.conf.matrix b/meta-arago-extras/recipes-
> > > core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> > > index 82a9fb8..2dce736 100755
> > > --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > > config/lighttpd.conf.matrix
> > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/l
> > > +++ ig
> > > +++ ht
> > > +++ tpd.conf.matrix
> > > @@ -137,7 +137,7 @@ $HTTP["url"] =3D~ "\.pdf$" {  # which extensions
> > > should not be handle via static-file transfer  #  # .php, .pl, .fcgi
> > > are most often handled by mod_fastcgi or mod_cgi
> > > -static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi" )
> > > +static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi", ".cgi",=
 ".o"
> > > +)
> > >
> > >  ######### Options that are good to be but not neccesary to be
> > > changed #######
> > >
> > > @@ -225,7 +225,7 @@ compress.filetype          =3D ("text/plain",
> > > "text/html","text/javascript","text/
> > >  #                            )
> > >
> > >  #### CGI module
> > > -cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi")
> > > +cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".=
cgi" =3D>	"/bin/sh",
> > > ".o" =3D> "" )
> > >  #cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
> > >  #                               ".cgi" =3D> "/usr/bin/perl" )
> > >  #
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

