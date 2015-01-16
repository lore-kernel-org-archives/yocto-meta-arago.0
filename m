Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 698D8529AF
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 03:33:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0G3XLCY010806
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 21:33:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0G3XL8w032322
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 21:33:21 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 15 Jan 2015 21:33:20 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] parse-ip: Add support for keystone platforms
Thread-Index: AQHQMTBhkHdBe76/DU69pw6tjIZiKpzCdP0A//+gFuA=
Date: Fri, 16 Jan 2015 03:33:20 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580F9754@DLEE11.ent.ti.com>
References: <1421373703-13583-1-git-send-email-sam.nelson@ti.com>
	<20150116030616.GA4759@edge>
In-Reply-To: <20150116030616.GA4759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] parse-ip: Add support for keystone platforms
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
X-List-Received-Date: Fri, 16 Jan 2015 03:33:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, January 15, 2015 10:06 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] parse-ip: Add support for keystone
> platforms
>=20
> On Thu, Jan 15, 2015 at 09:01:43PM -0500, Sam Nelson wrote:
> > - Added separate script for keystone platforms
> > - Script parses ip and sends to uart, picked up by BMC and display on L=
CD
> screen
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-tisdk/parse-ip/parse-ip.bb             |   12 ++++---
> >  .../recipes-tisdk/parse-ip/parse-ip/init.keystone  |   37
> ++++++++++++++++++++
> >  2 files changed, 45 insertions(+), 4 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-
> ip/init.keystone
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/met=
a-
> arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > index f20db31..5353ac6 100644
> > --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > @@ -2,23 +2,27 @@ DESCRIPTION =3D "Script to parse ip address during
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
> > -SRC_URI =3D "file://init"
> > +SRC_URI =3D "file://init \
> > +	   file://init.keystone"
>=20
> I don't remember if SOC_FAMILY was added to file overrides, but have you
> tried
> placing your specific init under recipes-tisdk/parse-ip/parse-
> ip/keystone/init?
>=20
> That way you don't need to make changes to the recipe itself, it should p=
ick
> up your keystone-specific version of the file automatically.
[Sam] Even if the file is put under: recipes-tisdk/parse-ip/parse- ip/keyst=
one/init,
 the recipe copies the specific init file:  see line below
install -m 0755 ${WORKDIR}/init  > ${D}${sysconfdir}/init.d/parse-ip
which I had to  replace with=20
install -m 0755 ${WORKDIR}/${INITSCRIPT_FILENAME} ${D}${sysconfdir}/init.d/=
parse-ip

So it won't be automatically picked up. Still recipe change is needed.
( Unless you have a way to work around this).
>=20
>=20
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  S =3D "${WORKDIR}"
> >
> >  INITSCRIPT_NAME =3D "parse-ip"
> >  INITSCRIPT_PARAMS =3D "defaults 98"
> > +INITSCRIPT_FILENAME =3D "init"
> > +
> > +INITSCRIPT_FILENAME_keystone =3D "init.keystone"
> >
> >  inherit update-rc.d
> >
> >  do_install() {
> >      install -d ${D}${sysconfdir}/init.d
> > -    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
> > +    install -m 0755 ${WORKDIR}/${INITSCRIPT_FILENAME}
> ${D}${sysconfdir}/init.d/parse-ip
> >  }
> >
> >  FILES_${PN} =3D "${sysconfdir}"
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.key=
stone
> b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone
> > new file mode 100644
> > index 0000000..7ea199e
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone
> > @@ -0,0 +1,37 @@
> > +#*
> > +#* Copyright (C) 2012-2014 Texas Instruments Incorporated -
> http://www.ti.com/
> > +#*
> > +#*
> > +#*  Redistribution and use in source and binary forms, with or without
> > +#*  modification, are permitted provided that the following conditions
> > +#*  are met:
> > +#*
> > +#*    Redistributions of source code must retain the above copyright
> > +#*    notice, this list of conditions and the following disclaimer.
> > +#*
> > +#*    Redistributions in binary form must reproduce the above copyrigh=
t
> > +#*    notice, this list of conditions and the following disclaimer in =
the
> > +#*    documentation and/or other materials provided with the
> > +#*    distribution.
> > +#*
> > +#*    Neither the name of Texas Instruments Incorporated nor the names
> of
> > +#*    its contributors may be used to endorse or promote products deri=
ved
> > +#*    from this software without specific prior written permission.
> > +#*
> > +
> > +#! /bin/sh
> > +
> > +case "$1" in
> > +    start )
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
> > +    ;;
> > +    stop )
> > +        exit 0;;
> > +esac
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

