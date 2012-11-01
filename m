Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0A841529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 19:07:37 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1J7alw029267;
	Thu, 1 Nov 2012 14:07:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1J7alk003059;
	Thu, 1 Nov 2012 14:07:36 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 1 Nov 2012 14:07:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago-tisdk: Add Arago SDK
	specific toolchain recipe
Thread-Index: AQHNuGDFsi88327+tkCk7cuCXZOwk5fVqegA//+sVTA=
Date: Thu, 1 Nov 2012 19:07:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C313834@DFLE09.ent.ti.com>
References: <1351795396-5146-1-git-send-email-fcooper@ti.com>
	<20121101190222.GF22705@edge>
In-Reply-To: <20121101190222.GF22705@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago-tisdk: Add Arago SDK specific toolchain recipe
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
X-List-Received-Date: Thu, 01 Nov 2012 19:07:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, November 01, 2012 2:02 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago-tisdk: Add Arago SDK=
 specific toolchain recipe

On Thu, Nov 01, 2012 at 01:43:16PM -0500, Franklin S. Cooper Jr wrote:
> * Add a meta toolchain recipe that builds on top of meta-toolchain-arago-=
qte
>   but includes components and tasks specific to the Arago SDK.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../meta/meta-toolchain-arago-tisdk.bb             |   18 ++++++++++++++=
++++
>  1 files changed, 18 insertions(+), 0 deletions(-)  create mode 100644=20
> meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
>=20
> diff --git=20
> a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb=20
> b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> new file mode 100644
> index 0000000..17f3966
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.b
> +++ b
> @@ -0,0 +1,18 @@
> +require recipes-core/meta/meta-toolchain-arago-qte.bb
> +
> +TOOLCHAIN_TARGET_TASK =3D "task-arago-toolchain-tisdk-target"
> +TOOLCHAIN_OUTPUTNAME =3D "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${S=
DK_ARCH}"

Hmm, this essentially returns it back to the one used by the generic meta-t=
oolchain-arago...

Franklin:
Your right. I originally did this because I believe some of the backend scr=
ipts expected this output name.=20
Would changing it to "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_AR=
CH}" be a better option? I can then make changes in the backend scripts.

> +
> +PR =3D "0"

^^^^ it's "r0"
Franklin:
Don't know how this keeps showing up....

> +
> +toolchain_create_sdk_env_script_append() {
> +    echo -e 'export CPP=3D"\x24{TARGET_PREFIX}gcc -E"' >> $script
> +    echo -e 'export NM=3D\x24{TARGET_PREFIX}nm' >> $script
> +    echo -e 'export RANLIB=3D\x24{TARGET_PREFIX}ranlib' >> $script
> +    echo -e 'export OBJCOPY=3D\x24{TARGET_PREFIX}objcopy' >> $script
> +    echo -e 'export STRIP=3D\x24{TARGET_PREFIX}strip' >> $script
> +    echo -e 'export AS=3D\x24{TARGET_PREFIX}as' >> $script
> +    echo -e 'export AR=3D\x24{TARGET_PREFIX}ar' >> $script
> +    echo -e 'export OBJDUMP=3D\x24{TARGET_PREFIX}objdump' >> $script
> +    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1' >> $script

All these vars are not TI-SDK specific, should we rather place them in the =
meta-toolchain-arago instead?
Franklin:
That makes sense. I can do that then.

