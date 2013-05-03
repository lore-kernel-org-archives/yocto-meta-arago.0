Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CB78852A45
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 16:23:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43GN0m3008030
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:23:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43GMx3S022384
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:23:00 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 3 May 2013 11:22:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] added mounting debugfs recipe
Thread-Index: AQHOR2P3HVfWcywHP0+djyDQUd6X8ZjyTkAQgABwSICAAJwnYIAAmGCA//+w1HA=
Date: Fri, 3 May 2013 16:22:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101595346E5@DLEE11.ent.ti.com>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944C4C@DFLE08.ent.ti.com>
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E3944C4C@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] added mounting debugfs recipe
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
X-List-Received-Date: Fri, 03 May 2013 16:23:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Zhou, Jingting
> Sent: Friday, May 03, 2013 10:58 AM
> To: Maupin, Chase; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
>=20
> Hey Chase, thanks for the comments. Here's the patch.
>=20
> From a1684ac257292855c03e58f3fee60232ed039b81 Mon Sep 17 00:00:00
> 2001
> From: Jingting Zhou <a0221004@ares-ubuntu>
> Date: Fri, 3 May 2013 11:56:05 -0400
> Subject: [PATCH] using inherit update-rc.d in the initscript-
> debugfs recipe


You need to use a proper commit message here.  See http://www.openembedded.=
org/wiki/Commit_Patch_Message_Guidelines=20

This should probably be squashed with the commit that adds the recipe

>=20
> ---
>  .../recipes-bsp/initscript-debugfs/files/LICENSE   |   30 ------
> ------------
>  .../initscript-debugfs/files/debugfs.sh            |   32
> ++++++++++++++++++++
>  .../initscript-debugfs/initscript-debugfs.bb       |   16 +++++-
> ----
>  3 files changed, 41 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
>=20
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
> deleted file mode 100644
> index 33b30bf..0000000
> --- a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
> +++ /dev/null
> @@ -1,30 +0,0 @@
> - *  Copyright 2012, Texas Instruments, Inc.
> - *
> - *  Redistribution and use in source and binary forms, with or
> without
> - *  modification, are permitted provided that the following
> conditions
> - *  are met:
> - *
> - *    Redistributions of source code must retain the above
> copyright
> - *    notice, this list of conditions and the following
> disclaimer.
> - *
> - *    Redistributions in binary form must reproduce the above
> copyright
> - *    notice, this list of conditions and the following
> disclaimer in the
> - *    documentation and/or other materials provided with the
> - *    distribution.
> - *
> - *    Neither the name of Texas Instruments Incorporated nor the
> names of
> - *    its contributors may be used to endorse or promote
> products derived
> - *    from this software without specific prior written
> permission.
> - *
> - *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS
> - *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> BUT NOT
> - *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> FITNESS FOR
> - *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> - *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> INCIDENTAL,
> - *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> NOT
> - *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> LOSS OF USE,
> - *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> AND ON ANY
> - *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> OR TORT
> - *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> OF THE USE
> - *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> DAMAGE.
> - *
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh b/meta-arago-extras/recipes-
> bsp/initscript-debugfs/files/debugfs.sh
> index 17e2474..9b26279 100755
> --- a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
> @@ -1,5 +1,37 @@
>  #!/bin/sh
>=20
> +#   Copyright 2012, Texas Instruments, Inc.
> +#
> +#   Redistribution and use in source and binary forms, with or
> without
> +#   modification, are permitted provided that the following
> conditions
> +#   are met:
> +#
> +#     Redistributions of source code must retain the above
> copyright
> +#     notice, this list of conditions and the following
> disclaimer.
> +#
> +#     Redistributions in binary form must reproduce the above
> copyright
> +#     notice, this list of conditions and the following
> disclaimer in the
> +#     documentation and/or other materials provided with the
> +#     distribution.
> +#
> +#     Neither the name of Texas Instruments Incorporated nor the
> names of
> +#     its contributors may be used to endorse or promote
> products derived
> +#     from this software without specific prior written
> permission.
> +#
> +#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS
> +#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> BUT NOT
> +#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> FITNESS FOR
> +#   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> +#   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> INCIDENTAL,
> +#   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> NOT
> +#   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> LOSS OF USE,
> +#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> AND ON ANY
> +#   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> OR TORT
> +#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> OF THE USE
> +#   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> DAMAGE.
> +#
> +
> +
>  if ! [ -e /debug ] ; then
>    mkdir -p /debug
>  fi
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> bsp/initscript-debugfs/initscript-debugfs.bb
> index eaf316a..0137214 100755
> --- a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> @@ -1,18 +1,20 @@
>  DESCRIPTION =3D "Initscripts for debugfs"
>  LICENSE =3D "BSD"
>=20
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3c1998754d846b48ba935ea0b7ada19a"
> +LIC_FILES_CHKSUM =3D
> "file://debugfs.sh;md5=3Da530203f3f8bf332686f4abf1e434e21"

Do your checksum of only the license lines.  This prevents a script change =
from changing your license checksum.  Like meta-ti/recipes-connectivity/uim=
/uim_git.bb.  Notice the startline and end line fields.

>=20
>  PR =3D"r0"
>=20
> -SRC_URI =3D "file://debugfs.sh \
> -		   file://LICENSE"
> +SRC_URI =3D "file://debugfs.sh"
> +
> +INITSCRIPT_NAME =3D "debugfs.sh"
> +INITSCRIPT_PARAMS =3D "defaults 10"
> +
> +inherit update-rc.d
>=20
>  S =3D "${WORKDIR}"
>=20
>  do_install () {
> -	install -d ${D}${sysconfdir}/init.d/
> -	install -d ${D}${sysconfdir}/rcS.d/
> -	install -c -m 755 ${WORKDIR}/debugfs.sh
> ${D}${sysconfdir}/init.d/debugfs.sh
> -	ln -sf ../init.d/debugfs.sh
> ${D}${sysconfdir}/rcS.d/S09debugfs
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${WORKDIR}/debugfs.sh
> ${D}${sysconfdir}/init.d/debugfs.sh

Just a nitpick but there is no need to specify debugfs.sh in the destinatio=
n path.  Also, most init scripts don't bother with the .sh extension.  BTW,=
 using "defaults" for update-rc.d will put this script in run levels 2345. =
 If you want it in rcS then you need to change your INITSCRIPT_PARAMS setti=
ng.  Do a man of update-rc.d to find out how that utility works.

>  }
> --
> 1.7.9.5
>=20
>=20
> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, May 03, 2013 7:55 AM
> To: Zhou, Jingting; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
>=20
> > -----Original Message-----
> > From: Zhou, Jingting
> > Sent: Thursday, May 02, 2013 4:34 PM
> > To: Maupin, Chase; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
> >
> > Don't want to create another email thread using git send-email.
> > So I just copy-pasted the subsequent patch here. I can resend
> it using
> > git send-email if you want.
> >
> > Had a quick look at update-rc.d.bbclass. But I didn't figure
> out how
> > to use it.
>=20
> Check out meta-arago/meta-arago-extras/recipes-
> core/matrix/matrix-gui_2.0.bb
>=20
> >
> > From 5cd281ab3e6eed71d5a9a899911e9b4485cb39fb Mon Sep 17
> 00:00:00
> > 2001
> > From: Jingting Zhou <a0221004@ares-ubuntu>
> > Date: Thu, 2 May 2013 17:15:23 -0400
> > Subject: [PATCH] some fix on the initscript-debugfs recipe
> >
> > ---
> >  .../recipes-bsp/initscript-debugfs/files/LICENSE   |   30
> > ++++++++++++++++++++
> >  .../initscript-debugfs/initscript-debugfs.bb       |    7 +++-
> -
> >  2 files changed, 34 insertions(+), 3 deletions(-)  create mode
> 100644
> > meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/LICENSE
> >
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/LICENSE b/meta-arago-extras/recipes-
> bsp/initscript-
> > debugfs/files/LICENSE
> > new file mode 100644
> > index 0000000..33b30bf
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/LICENSE
> > @@ -0,0 +1,30 @@
> > + *  Copyright 2012, Texas Instruments, Inc.
> > + *
> > + *  Redistribution and use in source and binary forms, with or
> > without
> > + *  modification, are permitted provided that the following
> > conditions
> > + *  are met:
> > + *
> > + *    Redistributions of source code must retain the above
> > copyright
> > + *    notice, this list of conditions and the following
> > disclaimer.
> > + *
> > + *    Redistributions in binary form must reproduce the above
> > copyright
> > + *    notice, this list of conditions and the following
> > disclaimer in the
> > + *    documentation and/or other materials provided with the
> > + *    distribution.
> > + *
> > + *    Neither the name of Texas Instruments Incorporated nor
> the
> > names of
> > + *    its contributors may be used to endorse or promote
> > products derived
> > + *    from this software without specific prior written
> > permission.
> > + *
> > + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> > CONTRIBUTORS
> > + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> > BUT NOT
> > + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> > FITNESS FOR
> > + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> > COPYRIGHT
> > + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> > INCIDENTAL,
> > + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
> BUT
> > NOT
> > + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > LOSS OF USE,
> > + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> > AND ON ANY
> > + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> LIABILITY,
> > OR TORT
> > + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> > OF THE USE
> > + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> SUCH
> > DAMAGE.
> > + *
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > index c9cb7d0..eaf316a 100755
> > --- a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -1,11 +1,12 @@
> >  DESCRIPTION =3D "Initscripts for debugfs"
> >  LICENSE =3D "BSD"
> >
> > -LIC_FILES_CHKSUM =3D
> > "file://debugfs.sh;md5=3Decbae24c97c0fa80c5977bf22eec1f32"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D3c1998754d846b48ba935ea0b7ada19a"
>=20
> You should either add the license in the .sh text file or point
> to the one that already exists in OE-Core.  No need to make your
> own copy.
>=20
> >
> > -PR =3D"r1"
> > +PR =3D"r0"
> >
> > -SRC_URI =3D "file://debugfs.sh"
> > +SRC_URI =3D "file://debugfs.sh \
> > +		   file://LICENSE"
> >
> >  S =3D "${WORKDIR}"
> >
> > --
> > 1.7.9.5
> >
> >
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Thursday, May 02, 2013 3:55 PM
> > To: Zhou, Jingting; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> arago-
> > > bounces@arago-project.org] On Behalf Of Zhou, Jingting
> > > Sent: Thursday, May 02, 2013 1:36 PM
> > > To: meta-arago@arago-project.org
> > > Cc: Zhou, Jingting
> > > Subject: [meta-arago] [PATCH] added mounting debugfs recipe
> > >
> > > From: Jingting Zhou <a0221004@ares-ubuntu>
> > >
> > > ---
> > >  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3
> ++-
> > >  .../initscript-debugfs/files/debugfs.sh            |    8
> > > ++++++++
> > >  .../initscript-debugfs/initscript-debugfs.bb       |   17
> > > +++++++++++++++++
> > >  3 files changed, 27 insertions(+), 1 deletion(-)  create
> mode
> > 100755
> > > meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/files/debugfs.sh
> > >  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/initscript-debugfs.bb
> > >
> > > diff --git a/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-base-tisdk-server-
> > extra.bb
> > > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-base-tisdk-server-extra.bb
> > > index 46db7c2..ba618b2 100755
> > > --- a/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-
> > > arago-base-tisdk-server-extra.bb
> > > +++ b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-
> > > arago-base-tisdk-server-extra.bb
> > > @@ -66,7 +66,7 @@ RDEPENDS_${PN} =3D "\
> > >      ptpd \
> > >      vsftpd \
> > >      syslog-ng \
> > > -	syslog-ng-plugins \
> > > +    syslog-ng-plugins \
> >
> > This looks like a mistake.  Either in the other patch or this
> one.
> >
> > >      dtc \
> > >      strongswan \
> > >      strongswan-plugins \
> > > @@ -95,4 +95,5 @@ RDEPENDS_${PN} =3D "\
> > >      ti-netapi \
> > >      ti-ipc \
> > >      ebtables \
> > > +    initscript-debugfs \
> >
> > Usually this should be split into apatch that adds the recipe
> and one
> > that adds it to the packagegroup.
> >
> > >  	"
> > > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/files/debugfs.sh b/meta-arago-extras/recipes-
> > > bsp/initscript-debugfs/files/debugfs.sh
> > > new file mode 100755
> > > index 0000000..17e2474
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/files/debugfs.sh
> > > @@ -0,0 +1,8 @@
> > > +#!/bin/sh
> > > +
> > > +if ! [ -e /debug ] ; then
> > > +  mkdir -p /debug
> > > +fi
> > > +mount -t debugfs debugfs /debug
> > > +
> > > +exit 0
> > > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > > bsp/initscript-debugfs/initscript-debugfs.bb
> > > new file mode 100755
> > > index 0000000..c9cb7d0
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > > debugfs/initscript-debugfs.bb
> > > @@ -0,0 +1,17 @@
> > > +DESCRIPTION =3D "Initscripts for debugfs"
> > > +LICENSE =3D "BSD"
> > > +
> > > +LIC_FILES_CHKSUM =3D
> > > "file://debugfs.sh;md5=3Decbae24c97c0fa80c5977bf22eec1f32"
> >
> > This file does not have a real license header in it.  If you
> are going
> > to point here you should put the license header in it or use
> the
> > license file from the core layer.  And I wouldn't do the whole
> script
> > because then you have to update this for every script change.
> >
> > > +
> > > +PR =3D"r1"
> >
> > Why not start at r0?
> >
> > > +
> > > +SRC_URI =3D "file://debugfs.sh"
> > > +
> > > +S =3D "${WORKDIR}"
> > > +
> > > +do_install () {
> > > +	install -d ${D}${sysconfdir}/init.d/
> > > +	install -d ${D}${sysconfdir}/rcS.d/
> > > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> > > ${D}${sysconfdir}/init.d/debugfs.sh
> > > +	ln -sf ../init.d/debugfs.sh
> > > ${D}${sysconfdir}/rcS.d/S09debugfs
> > > +}
> >
> > Use the update-rc.d class instead.  Life will be better this
> way.
> >
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

