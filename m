Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 984CA52A08
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 15:58:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43FwCtU005025
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 10:58:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43FwC3a025266
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 10:58:12 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 3 May 2013 10:58:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 3 May 2013 10:58:12 -0500
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] added mounting debugfs recipe
Thread-Index: AQHOR2PzDmWYRKknqkKs9wtOMvnyxJjyos0A///G2nCAAUVngP//7++g
Date: Fri, 3 May 2013 15:58:11 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E3944C4C@DFLE08.ent.ti.com>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 03 May 2013 15:58:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey Chase, thanks for the comments. Here's the patch.=20

From a1684ac257292855c03e58f3fee60232ed039b81 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Fri, 3 May 2013 11:56:05 -0400
Subject: [PATCH] using inherit update-rc.d in the initscript-debugfs recipe

---
 .../recipes-bsp/initscript-debugfs/files/LICENSE   |   30 ----------------=
--
 .../initscript-debugfs/files/debugfs.sh            |   32 ++++++++++++++++=
++++
 .../initscript-debugfs/initscript-debugfs.bb       |   16 +++++-----
 3 files changed, 41 insertions(+), 37 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/initscript-debugfs/files/=
LICENSE

diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/LICENSE=
 b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/LICENSE
deleted file mode 100644
index 33b30bf..0000000
--- a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/LICENSE
+++ /dev/null
@@ -1,30 +0,0 @@
- *  Copyright 2012, Texas Instruments, Inc.
- *=20
- *  Redistribution and use in source and binary forms, with or without=20
- *  modification, are permitted provided that the following conditions=20
- *  are met:
- *
- *    Redistributions of source code must retain the above copyright=20
- *    notice, this list of conditions and the following disclaimer.
- *
- *    Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the=
=20
- *    documentation and/or other materials provided with the  =20
- *    distribution.
- *
- *    Neither the name of Texas Instruments Incorporated nor the names of
- *    its contributors may be used to endorse or promote products derived
- *    from this software without specific prior written permission.
- *
- *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS=20
- *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT=20
- *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT=20
- *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,=
=20
- *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT=20
- *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT=20
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
=20
- *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs=
.sh b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
index 17e2474..9b26279 100755
--- a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
@@ -1,5 +1,37 @@
 #!/bin/sh
=20
+#   Copyright 2012, Texas Instruments, Inc.
+# =20
+#   Redistribution and use in source and binary forms, with or without=20
+#   modification, are permitted provided that the following conditions=20
+#   are met:
+#=20
+#     Redistributions of source code must retain the above copyright=20
+#     notice, this list of conditions and the following disclaimer.
+#=20
+#     Redistributions in binary form must reproduce the above copyright
+#     notice, this list of conditions and the following disclaimer in the=
=20
+#     documentation and/or other materials provided with the  =20
+#     distribution.
+#=20
+#     Neither the name of Texas Instruments Incorporated nor the names of
+#     its contributors may be used to endorse or promote products derived
+#     from this software without specific prior written permission.
+#=20
+#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS=20
+#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT=20
+#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+#   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT=20
+#   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,=
=20
+#   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT=20
+#   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+#   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT=20
+#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
=20
+#   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+#=20
+
+
 if ! [ -e /debug ] ; then
   mkdir -p /debug
 fi
diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-de=
bugfs.bb b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debu=
gfs.bb
index eaf316a..0137214 100755
--- a/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.b=
b
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.b=
b
@@ -1,18 +1,20 @@
 DESCRIPTION =3D "Initscripts for debugfs"
 LICENSE =3D "BSD"
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3c1998754d846b48ba935ea0b7ada19=
a"
+LIC_FILES_CHKSUM =3D "file://debugfs.sh;md5=3Da530203f3f8bf332686f4abf1e43=
4e21"
=20
 PR =3D"r0"
=20
-SRC_URI =3D "file://debugfs.sh \
-		   file://LICENSE"
+SRC_URI =3D "file://debugfs.sh"
+		  =20
+INITSCRIPT_NAME =3D "debugfs.sh"
+INITSCRIPT_PARAMS =3D "defaults 10"
+
+inherit update-rc.d
=20
 S =3D "${WORKDIR}"
=20
 do_install () {
-	install -d ${D}${sysconfdir}/init.d/
-	install -d ${D}${sysconfdir}/rcS.d/
-	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.=
sh
-	ln -sf ../init.d/debugfs.sh ${D}${sysconfdir}/rcS.d/S09debugfs
+	install -d ${D}${sysconfdir}/init.d/=20
+	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.=
sh=20
 }
--=20
1.7.9.5


-----Original Message-----
From: Maupin, Chase=20
Sent: Friday, May 03, 2013 7:55 AM
To: Zhou, Jingting; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe

> -----Original Message-----
> From: Zhou, Jingting
> Sent: Thursday, May 02, 2013 4:34 PM
> To: Maupin, Chase; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
>=20
> Don't want to create another email thread using git send-email.
> So I just copy-pasted the subsequent patch here. I can resend it using=20
> git send-email if you want.
>=20
> Had a quick look at update-rc.d.bbclass. But I didn't figure out how=20
> to use it.

Check out meta-arago/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.b=
b

>=20
> From 5cd281ab3e6eed71d5a9a899911e9b4485cb39fb Mon Sep 17 00:00:00
> 2001
> From: Jingting Zhou <a0221004@ares-ubuntu>
> Date: Thu, 2 May 2013 17:15:23 -0400
> Subject: [PATCH] some fix on the initscript-debugfs recipe
>=20
> ---
>  .../recipes-bsp/initscript-debugfs/files/LICENSE   |   30
> ++++++++++++++++++++
>  .../initscript-debugfs/initscript-debugfs.bb       |    7 +++--
>  2 files changed, 34 insertions(+), 3 deletions(-)  create mode 100644=20
> meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
>=20
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
> new file mode 100644
> index 0000000..33b30bf
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/LICENSE
> @@ -0,0 +1,30 @@
> + *  Copyright 2012, Texas Instruments, Inc.
> + *
> + *  Redistribution and use in source and binary forms, with or
> without
> + *  modification, are permitted provided that the following
> conditions
> + *  are met:
> + *
> + *    Redistributions of source code must retain the above
> copyright
> + *    notice, this list of conditions and the following
> disclaimer.
> + *
> + *    Redistributions in binary form must reproduce the above
> copyright
> + *    notice, this list of conditions and the following
> disclaimer in the
> + *    documentation and/or other materials provided with the
> + *    distribution.
> + *
> + *    Neither the name of Texas Instruments Incorporated nor the
> names of
> + *    its contributors may be used to endorse or promote
> products derived
> + *    from this software without specific prior written
> permission.
> + *
> + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS
> + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> BUT NOT
> + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> FITNESS FOR
> + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> INCIDENTAL,
> + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> NOT
> + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> LOSS OF USE,
> + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> AND ON ANY
> + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> OR TORT
> + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> OF THE USE
> + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> DAMAGE.
> + *
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-=20
> bsp/initscript-debugfs/initscript-debugfs.bb
> index c9cb7d0..eaf316a 100755
> --- a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> @@ -1,11 +1,12 @@
>  DESCRIPTION =3D "Initscripts for debugfs"
>  LICENSE =3D "BSD"
>=20
> -LIC_FILES_CHKSUM =3D
> "file://debugfs.sh;md5=3Decbae24c97c0fa80c5977bf22eec1f32"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3c1998754d846b48ba935ea0b7ada19a"

You should either add the license in the .sh text file or point to the one =
that already exists in OE-Core.  No need to make your own copy.

>=20
> -PR =3D"r1"
> +PR =3D"r0"
>=20
> -SRC_URI =3D "file://debugfs.sh"
> +SRC_URI =3D "file://debugfs.sh \
> +		   file://LICENSE"
>=20
>  S =3D "${WORKDIR}"
>=20
> --
> 1.7.9.5
>=20
>=20
> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, May 02, 2013 3:55 PM
> To: Zhou, Jingting; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > bounces@arago-project.org] On Behalf Of Zhou, Jingting
> > Sent: Thursday, May 02, 2013 1:36 PM
> > To: meta-arago@arago-project.org
> > Cc: Zhou, Jingting
> > Subject: [meta-arago] [PATCH] added mounting debugfs recipe
> >
> > From: Jingting Zhou <a0221004@ares-ubuntu>
> >
> > ---
> >  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
> >  .../initscript-debugfs/files/debugfs.sh            |    8
> > ++++++++
> >  .../initscript-debugfs/initscript-debugfs.bb       |   17
> > +++++++++++++++++
> >  3 files changed, 27 insertions(+), 1 deletion(-)  create mode
> 100755
> > meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh
> >  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> >
> > diff --git a/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-base-tisdk-server-
> extra.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > index 46db7c2..ba618b2 100755
> > --- a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > @@ -66,7 +66,7 @@ RDEPENDS_${PN} =3D "\
> >      ptpd \
> >      vsftpd \
> >      syslog-ng \
> > -	syslog-ng-plugins \
> > +    syslog-ng-plugins \
>=20
> This looks like a mistake.  Either in the other patch or this one.
>=20
> >      dtc \
> >      strongswan \
> >      strongswan-plugins \
> > @@ -95,4 +95,5 @@ RDEPENDS_${PN} =3D "\
> >      ti-netapi \
> >      ti-ipc \
> >      ebtables \
> > +    initscript-debugfs \
>=20
> Usually this should be split into apatch that adds the recipe and one=20
> that adds it to the packagegroup.
>=20
> >  	"
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh b/meta-arago-extras/recipes-=20
> > bsp/initscript-debugfs/files/debugfs.sh
> > new file mode 100755
> > index 0000000..17e2474
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh
> > @@ -0,0 +1,8 @@
> > +#!/bin/sh
> > +
> > +if ! [ -e /debug ] ; then
> > +  mkdir -p /debug
> > +fi
> > +mount -t debugfs debugfs /debug
> > +
> > +exit 0
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-=20
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > new file mode 100755
> > index 0000000..c9cb7d0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "Initscripts for debugfs"
> > +LICENSE =3D "BSD"
> > +
> > +LIC_FILES_CHKSUM =3D
> > "file://debugfs.sh;md5=3Decbae24c97c0fa80c5977bf22eec1f32"
>=20
> This file does not have a real license header in it.  If you are going=20
> to point here you should put the license header in it or use the=20
> license file from the core layer.  And I wouldn't do the whole script=20
> because then you have to update this for every script change.
>=20
> > +
> > +PR =3D"r1"
>=20
> Why not start at r0?
>=20
> > +
> > +SRC_URI =3D "file://debugfs.sh"
> > +
> > +S =3D "${WORKDIR}"
> > +
> > +do_install () {
> > +	install -d ${D}${sysconfdir}/init.d/
> > +	install -d ${D}${sysconfdir}/rcS.d/
> > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> > ${D}${sysconfdir}/init.d/debugfs.sh
> > +	ln -sf ../init.d/debugfs.sh
> > ${D}${sysconfdir}/rcS.d/S09debugfs
> > +}
>=20
> Use the update-rc.d class instead.  Life will be better this way.
>=20
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

