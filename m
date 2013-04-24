Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 98B8D529F2
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 19:40:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OJeksJ001091
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:40:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OJek4i021746
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:40:46 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 24 Apr 2013 14:40:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
	and	.out support in Matrix PHP
Thread-Index: AQHOQRmm2v4/ekKE60WHst7aJ2e8gZjlvKuggABYQYD//64o4A==
Date: Wed, 24 Apr 2013 19:40:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C432969@DFLE08.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
In-Reply-To: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
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
X-List-Received-Date: Wed, 24 Apr 2013 19:40:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Matrix already has the ability to run shell scripts so I don't understand w=
hy you need this .cgi which still executes shell commands. Is there  some k=
ind of limitation your running into?

Your utility_info.sh would contain:

echo " System Up Time"
cat /proc/uptime

echo "CPU Info"
cat /proc/cpuinfo

echo "Linux version
uname -srm

TMPFILE=3D`mktemp`
mount | awk ' {print "device ", $1," mounted on ",$3, " as ", $5, "filesyst=
em"}' > $TMPFILE

echo "Mount Info"
cat $TMPFILE
rm $TMPFILE

echo "Network Interfaces"

ifconfig

echo "Routing table"
route

echo "Module Info"
lsmod

And your utility_info.desktop will be set to:
Exec=3Dutility_info.sh


> -----Original Message-----
> From: Zhang, Hao
> Sent: Wednesday, April 24, 2013 2:27 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi =
and .out
> support in Matrix PHP
>=20
> See attached the example.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, April 24, 2013 3:17 PM
> To: Zhang, Hao; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi =
and .out
> support in Matrix PHP
>=20
> cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi" =
=3D> "/bin/sh",  ".o" =3D>
> "" )
>=20
> Can you give an example of the .cgi and .o file that requires this change=
?
>=20
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Zhang, Hao
> > Sent: Wednesday, April 24, 2013 1:29 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
> > and .out support in Matrix PHP
> >
> > From: Hao Zhang <hzhang@ti.com>
> >
> > ---
> >  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix b/meta-arago-extras/recipes-
> > core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> > index 82a9fb8..2dce736 100755
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lig
> > +++ ht
> > +++ tpd.conf.matrix
> > @@ -137,7 +137,7 @@ $HTTP["url"] =3D~ "\.pdf$" {  # which extensions
> > should not be handle via static-file transfer  #  # .php, .pl, .fcgi
> > are most often handled by mod_fastcgi or mod_cgi
> > -static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi" )
> > +static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi", ".cgi", "=
.o"
> > +)
> >
> >  ######### Options that are good to be but not neccesary to be changed
> > #######
> >
> > @@ -225,7 +225,7 @@ compress.filetype          =3D ("text/plain",
> > "text/html","text/javascript","text/
> >  #                            )
> >
> >  #### CGI module
> > -cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi")
> > +cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cg=
i" =3D>	"/bin/sh",
> > ".o" =3D> "" )
> >  #cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
> >  #                               ".cgi" =3D> "/usr/bin/perl" )
> >  #
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

