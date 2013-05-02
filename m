Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4D69352A47
	for <meta-arago@arago-project.org>;
	Thu,  2 May 2013 19:54:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42Jsgk0014990
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 14:54:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42Jsg9n023042
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 14:54:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 2 May 2013 14:54:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] added mounting debugfs recipe
Thread-Index: AQHOR2P3HVfWcywHP0+djyDQUd6X8ZjyTkAQ
Date: Thu, 2 May 2013 19:54:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
In-Reply-To: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
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
X-List-Received-Date: Thu, 02 May 2013 19:54:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Thursday, May 02, 2013 1:36 PM
> To: meta-arago@arago-project.org
> Cc: Zhou, Jingting
> Subject: [meta-arago] [PATCH] added mounting debugfs recipe
>=20
> From: Jingting Zhou <a0221004@ares-ubuntu>
>=20
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
>  .../initscript-debugfs/files/debugfs.sh            |    8
> ++++++++
>  .../initscript-debugfs/initscript-debugfs.bb       |   17
> +++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
>=20
> diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> index 46db7c2..ba618b2 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> @@ -66,7 +66,7 @@ RDEPENDS_${PN} =3D "\
>      ptpd \
>      vsftpd \
>      syslog-ng \
> -	syslog-ng-plugins \
> +    syslog-ng-plugins \

This looks like a mistake.  Either in the other patch or this one.

>      dtc \
>      strongswan \
>      strongswan-plugins \
> @@ -95,4 +95,5 @@ RDEPENDS_${PN} =3D "\
>      ti-netapi \
>      ti-ipc \
>      ebtables \
> +    initscript-debugfs \

Usually this should be split into apatch that adds the recipe and one that =
adds it to the packagegroup.

>  	"
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh b/meta-arago-extras/recipes-
> bsp/initscript-debugfs/files/debugfs.sh
> new file mode 100755
> index 0000000..17e2474
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +if ! [ -e /debug ] ; then
> +  mkdir -p /debug
> +fi
> +mount -t debugfs debugfs /debug
> +
> +exit 0
> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> bsp/initscript-debugfs/initscript-debugfs.bb
> new file mode 100755
> index 0000000..c9cb7d0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Initscripts for debugfs"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D
> "file://debugfs.sh;md5=3Decbae24c97c0fa80c5977bf22eec1f32"

This file does not have a real license header in it.  If you are going to p=
oint here you should put the license header in it or use the license file f=
rom the core layer.  And I wouldn't do the whole script because then you ha=
ve to update this for every script change.

> +
> +PR =3D"r1"

Why not start at r0?

> +
> +SRC_URI =3D "file://debugfs.sh"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -d ${D}${sysconfdir}/rcS.d/
> +	install -c -m 755 ${WORKDIR}/debugfs.sh
> ${D}${sysconfdir}/init.d/debugfs.sh
> +	ln -sf ../init.d/debugfs.sh
> ${D}${sysconfdir}/rcS.d/S09debugfs
> +}

Use the update-rc.d class instead.  Life will be better this way.

> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

