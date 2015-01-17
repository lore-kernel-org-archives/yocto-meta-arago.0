Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 16FA452090
	for <meta-arago@arago-project.org>;
	Sat, 17 Jan 2015 04:18:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0H4IqAh028889
	for <meta-arago@arago-project.org>; Fri, 16 Jan 2015 22:18:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0H4IqBW019842
	for <meta-arago@arago-project.org>; Fri, 16 Jan 2015 22:18:52 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 16 Jan 2015 22:18:51 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v3] parse-ip: Add support for keystone
	platforms
Thread-Index: AQHQMUFMTNts6fyzqkym3+0/Yj/EcJzEEYeA//+lL4A=
Date: Sat, 17 Jan 2015 04:18:49 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580F9C2D@DLEE11.ent.ti.com>
References: <1421380969-17405-1-git-send-email-sam.nelson@ti.com>
	<20150117034316.GE4759@edge>
In-Reply-To: <20150117034316.GE4759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3] parse-ip: Add support for keystone platforms
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
X-List-Received-Date: Sat, 17 Jan 2015 04:18:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes.  I have tested on k2 platform.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, January 16, 2015 10:43 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v3] parse-ip: Add support for keystone
> platforms
>=20
> This looks good now! I take it that you've tested it yourself :)
>=20
> --
> Denys
>=20
>=20
> On Thu, Jan 15, 2015 at 11:02:49PM -0500, Sam Nelson wrote:
> > - Added separate script for keystone platforms
> > - Script parses ip and sends to uart, picked up by BMC and display on L=
CD
> screen
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Changes from previous patch
> > - Removed keystene/init from SRC URI
> > ---
> > ---
> >  .../recipes-tisdk/parse-ip/parse-ip.bb             |    4 ++--
> >  .../parse-ip/parse-ip/{ =3D> keystone}/init          |   16 ++++++++--=
------
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >  copy meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/{ =3D> keystone=
}/init
> (87%)
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/met=
a-
> arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > index f20db31..2cfc675 100644
> > --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > @@ -2,12 +2,12 @@ DESCRIPTION =3D "Script to parse ip address during
> boot and make it available to t
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D
> "file://init;beginline=3D3;endline=3D31;md5=3Dfc4b04a33df6d892c9f4d4a9d92=
b94
> 5e"
> >
> > -COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|keystone"
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  SRC_URI =3D "file://init"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  S =3D "${WORKDIR}"
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/m=
eta-
> arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> > similarity index 87%
> > copy from meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> > copy to meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> > index 4050efb..7f260fb 100644
> > --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> > @@ -32,15 +32,15 @@
> >
> >  case "$1" in
> >      start )
> > -        if [ -e /run/media/mmcblk0p1 ]
> > -        then
> > -            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' |=
 cut -d: -f2 |
> awk '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
> > -            sync
> > -	    sync
> > -	fi
> > +        echo '#>>>>> LCD 12' > ipaddr
> > +        echo 'IP Address:' >> ipaddr
> > +        cat ipaddr
> > +
> > +        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut=
 -d: -f2 | awk
> '{print $1}'` > ipaddr
> > +        cat ipaddr
> > +
> > +        sleep 1
> >      ;;
> >      stop )
> >          exit 0;;
> >  esac
> > -
> > -exit 0
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

