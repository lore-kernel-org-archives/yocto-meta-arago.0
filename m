Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C8741529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 13:04:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48D4AOL008029
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:04:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48D4Aw1032149
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:04:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 8 May 2013 08:04:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] initscript-debugfs recipe: needed by
	ti-multiprocmgr, system printf messages coming from debugfs
Thread-Index: AQHOSp9qDgiSSKfxeU2NkmGVUawgW5j7QvgQ
Date: Wed, 8 May 2013 13:04:09 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159546E35@DLEE11.ent.ti.com>
References: <1367875170-8518-1-git-send-email-zhoujt@ti.com>
In-Reply-To: <1367875170-8518-1-git-send-email-zhoujt@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] initscript-debugfs recipe: needed by	ti-multiprocmgr, system printf messages coming from debugfs
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
X-List-Received-Date: Wed, 08 May 2013 13:04:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Monday, May 06, 2013 4:19 PM
> To: meta-arago@arago-project.org; Zhou, Jingting
> Subject: [meta-arago] [PATCH 1/2] initscript-debugfs recipe:
> needed by ti-multiprocmgr, system printf messages coming from
> debugfs
>=20
> From: Jingting Zhou <a0221004@ares-ubuntu>

So close you are almost there.  A couple of points.

1. You need to fix your e-mail.  You should use your ti.com address.  This =
is the e-mail setting in your u-boot config.
2. The commit message should be something like:

Recipe: brief description of change

* Detail 1 about change and why
* Detail 2 about change and why

Signed-off-by: your name <your email>


If you have your e-mail configured then you can have your signed-off-by aut=
omatically added to your commit message by using -s when commiting.  I'll s=
end you a git presentation that has some info on setting these.

>=20
> ---
>  .../initscript-debugfs/files/debugfs.sh            |   40
> ++++++++++++++++++++
>  .../initscript-debugfs/initscript-debugfs.bb       |   20
> ++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/files/debugfs.sh
>  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> debugfs/initscript-debugfs.bb
>=20
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
> +}
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

