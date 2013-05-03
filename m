Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 771ED52A5E
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 20:58:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43Kwgw1032362
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 15:58:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43KwgPh017936
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 15:58:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 3 May 2013 15:58:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv3] added mounting debugfs recipe
Thread-Index: AQHOSCxkHTgfa8pDpECkTyWIKkMosZjz8T+g
Date: Fri, 3 May 2013 20:58:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159535AA0@DLEE11.ent.ti.com>
References: <1367605867-24027-1-git-send-email-zhoujt@ti.com>
In-Reply-To: <1367605867-24027-1-git-send-email-zhoujt@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv3] added mounting debugfs recipe
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
X-List-Received-Date: Fri, 03 May 2013 20:58:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Friday, May 03, 2013 1:31 PM
> To: meta-arago@arago-project.org
> Cc: Zhou, Jingting
> Subject: [meta-arago] [PATCHv3] added mounting debugfs recipe
>=20
> From: Jingting Zhou <a0221004@ares-ubuntu>

Need to fix your from line and the commit message

>=20
> Thanks for all the comments~
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    1 +
>  .../initscript-debugfs/files/debugfs.sh            |   40
> ++++++++++++++++++++
>  .../initscript-debugfs/initscript-debugfs.bb       |   20
> ++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
>=20
> diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> index 46db7c2..3d65d17 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> @@ -95,4 +95,5 @@ RDEPENDS_${PN} =3D "\
>      ti-netapi \
>      ti-ipc \
>      ebtables \
> +    initscript-debugfs \
>  	"

Please split into two patches as Denys mentioned as well.  Also you should =
bump the PR here.

> diff --git a/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh b/meta-arago-extras/recipes-
> bsp/initscript-debugfs/files/debugfs.sh
> new file mode 100755
> index 0000000..9b26279
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
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
> index 0000000..f8145ba
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Initscripts for debugfs"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D
> "file://debugfs.sh;startline=3D3;endline=3D32;md5=3D4d96701a693bf321ad2
> d15026a285446"
> +
> +PR =3D"r0"
> +
> +SRC_URI =3D "file://debugfs.sh"
> +
> +INITSCRIPT_NAME =3D "debugfs.sh"
> +INITSCRIPT_PARAMS =3D "start 09 S ."
> +
> +inherit update-rc.d
> +
> +S =3D "${WORKDIR}"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${WORKDIR}/debugfs.sh
> ${D}${sysconfdir}/init.d/debugfs.sh

Do you really want the .sh extention?

Aside from these notes this is getting much better.  Thanks for working on =
the feedback.

> +}
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

