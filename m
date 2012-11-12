Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D56F05296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 23:40:10 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qACNe916021145;
	Mon, 12 Nov 2012 17:40:10 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qACNe9Bx004478;
	Mon, 12 Nov 2012 17:40:09 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 12 Nov 2012 17:40:09 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: de-bashify
Thread-Index: AQHNwSW7xI0gNRoS806E0Ip6dB9WvZfnOuWA//+euFA=
Date: Mon, 12 Nov 2012 23:40:09 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31EA02@DFLE09.ent.ti.com>
References: <1352759598-5183-1-git-send-email-fcooper@ti.com>
	<20121112232029.GB8900@denix.org>
In-Reply-To: <20121112232029.GB8900@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago: de-bashify
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
X-List-Received-Date: Mon, 12 Nov 2012 23:40:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Denys Dmytriyenko [mailto:denis@denix.org]=20
Sent: Monday, November 12, 2012 5:20 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: de-bashify

On Mon, Nov 12, 2012 at 04:33:18PM -0600, Franklin S. Cooper Jr wrote:
> * Replacing "echo -e" with "printf".
> * This mimics a previous de-bashify patch applied to this same recipe.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

How is it different from this:
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3D7f47dba=
d47a44c8d16c12139260a00b80d603e71

I'd suggest you update your tree to the latest code base...

Franklin:
I see what happened. http://arago-project.org/pipermail/meta-arago/2012-Nov=
ember/000483.html you made a comment about pulling in this environment vari=
ables into meta-toolchain-arago and I made that change. You ended up doing =
the same thing that my patch http://arago-project.org/pipermail/meta-arago/=
2012-November/000520.html also did. Which this patch builds on top of.


> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |   20 ++++++++++----=
------
>  1 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 09996d6..3d3fb0d 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${ARMPKGARCH}-${TA=
RGET_OS}-sdk-${SDK_ARCH}"
> =20
>  require recipes-core/meta/meta-toolchain.bb
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> =20
> @@ -54,15 +54,15 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_ACLOCAL_OPTS=3D"-I $SDK_PATH/usr/share/aclocal"' >>=
 $script
>  	echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >> $script
> -    echo -e 'export CPP=3D"\x24{TARGET_PREFIX}gcc -E"' >> $script
> -    echo -e 'export NM=3D\x24{TARGET_PREFIX}nm' >> $script
> -    echo -e 'export RANLIB=3D\x24{TARGET_PREFIX}ranlib' >> $script
> -    echo -e 'export OBJCOPY=3D\x24{TARGET_PREFIX}objcopy' >> $script
> -    echo -e 'export STRIP=3D\x24{TARGET_PREFIX}strip' >> $script
> -    echo -e 'export AS=3D\x24{TARGET_PREFIX}as' >> $script
> -    echo -e 'export AR=3D\x24{TARGET_PREFIX}ar' >> $script
> -    echo -e 'export OBJDUMP=3D\x24{TARGET_PREFIX}objdump' >> $script
> -    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1' >> $script
> +	printf 'export CPP=3D"\x24{TARGET_PREFIX}gcc -E"\n' >> $script
> +	printf 'export NM=3D\x24{TARGET_PREFIX}nm\n' >> $script
> +	printf 'export RANLIB=3D\x24{TARGET_PREFIX}ranlib\n' >> $script
> +	printf 'export OBJCOPY=3D\x24{TARGET_PREFIX}objcopy\n' >> $script
> +	printf 'export STRIP=3D\x24{TARGET_PREFIX}strip\n' >> $script
> +	printf 'export AS=3D\x24{TARGET_PREFIX}as\n' >> $script
> +	printf 'export AR=3D\x24{TARGET_PREFIX}ar\n' >> $script
> +	printf 'export OBJDUMP=3D\x24{TARGET_PREFIX}objdump\n' >> $script
> +	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1' >> $script
>  }
> =20
>  populate_sdk_ipk_append () {
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

