Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0E6215298C
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2013 14:14:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r49EE1kX030653
	for <meta-arago@arago-project.org>; Thu, 9 May 2013 09:14:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r49EE0ku008628
	for <meta-arago@arago-project.org>; Thu, 9 May 2013 09:14:01 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 9 May 2013 09:14:00 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] Recipe initscript-debugfs: mount
	debugfs	in the initscripts when linux starts up
Thread-Index: AQHOTDug0ETHHN7SeUKksWCmMl59B5j85ltw
Date: Thu, 9 May 2013 14:13:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015954D710@DLEE11.ent.ti.com>
References: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
In-Reply-To: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Recipe initscript-debugfs: mount debugfs	in the initscripts when linux starts up
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
X-List-Received-Date: Thu, 09 May 2013 14:14:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Wednesday, May 08, 2013 5:30 PM
> To: meta-arago@arago-project.org
> Cc: Zhou, Jingting
> Subject: [meta-arago] [PATCH 1/2] Recipe initscript-debugfs:
> mount debugfs in the initscripts when linux starts up
>=20
> From: Jingting Zhou <zhoujt@ti.com>
>=20
> needed by ti-multiprocmgr, when the mgm loads the dsp image, the
> system printf messages come from the debugfs
>=20
> Signed-off-by: Jingting Zhou <zhoujt@ti.com>
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

