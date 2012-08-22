Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2B58E52A61
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 01:40:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7M1eNJh027444
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:40:23 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7M1eNrG030736
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:40:23 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 21 Aug 2012 20:40:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH] php: Add libiconv as a
	dependency. (Temporary)
Thread-Index: AQHNfuvsqDokfge+tUWol6CwrTnjQ5dk594AgAAjyjA=
Date: Wed, 22 Aug 2012 01:40:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A7DE4@DFLE09.ent.ti.com>
References: <1345478683-6539-1-git-send-email-fcooper@ti.com>
	<20120821181530.GA3173@denix.org>
In-Reply-To: <20120821181530.GA3173@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-distro][PATCH] php: Add libiconv as a dependency. (Temporary)
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
X-List-Received-Date: Wed, 22 Aug 2012 01:40:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I agree with your suggestion did you want me to send the patch or tweak it =
like you did for my other patch?=20



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, August 21, 2012 1:16 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-distro][PATCH] php: Add libiconv as a=
 dependency. (Temporary)

On Mon, Aug 20, 2012 at 11:04:43AM -0500, Franklin S Cooper Jr wrote:
> * Adding libiconv as a dependency since external-linaro-toolchain.bb who
>   PROVIDES virtual/libiconv isn't providing the needed files for PHP.
> * Configuring PHP fails with
>   /home/<user>/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_li=
nux/bin/../
>   lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld:
>   cannot find -liconv collect2: ld returned 1 exit status
> * This should be a temporary fix until a proper fix is made in the toolch=
ain.

When the first php patch is only applied to -native, this issue never happe=
ns,=20
as it's masked by configure script satisfying the check with the host iconv=
=20
library. It's not correct, but it's only a check and the host library is no=
t=20
actually being linked during the build...

--=20
Denys


> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-devtools/php/php_5.3.6.bbappend        |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/=
meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> index 0d16ebe..e30664d 100644
> --- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> +++ b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> @@ -4,3 +4,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>  PR_append =3D "-arago0"
> =20
>  SRC_URI +=3D "file://0001-php-native-Fix-host-contamination-issue.patch"
> +
> +DEPENDS +=3D "libiconv"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

