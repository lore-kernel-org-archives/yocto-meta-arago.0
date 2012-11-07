Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 046E4529AD
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 23:11:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7NB5vU022783
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 17:11:05 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7NB5g2029584
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 17:11:05 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 17:11:05 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2] meta-toolchain-arago: make SDK/devkit
	relocatable
Thread-Index: AQHNvStZvFzI4fX2vUuK8FbOUvk1upffQYkA//+cMyA=
Date: Wed, 7 Nov 2012 23:11:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31AD06@DFLE09.ent.ti.com>
References: <1352322180-17306-1-git-send-email-denys@ti.com>
	<20121107210542.GG11967@edge>
In-Reply-To: <20121107210542.GG11967@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] meta-toolchain-arago: make SDK/devkit	relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 23:11:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Wednesday, November 07, 2012 3:06 PM
To: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCHv2] meta-toolchain-arago: make SDK/devkit r=
elocatable

On Wed, Nov 07, 2012 at 04:03:00PM -0500, Denys Dmytriyenko wrote:
> Implement poor man's relocation technique for self-contained crosssdk=20
> binaries
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> In v2 use stub shell scripts instead of aliases, to work in Makefiles

Ok, this seems to work fine in shell and in Makefiles too. And it also work=
s when environment-setup is sources before calling make, but not inside the=
 Makefile.

Franklin:
export LD_LIBRARY_PATH=3D$SDK_PATH/lib:$LD_LIBRARY_PATH is causing issues. =
Once I source that file I get a Segmentation fault when calling qmake, make=
,arm-arago-linux-gnueabi-gcc,ls , etc....
Removing that line from environment-setup gets rid of the Segmentation faul=
t issue but of course qmake and the other executables don't work. I get a "=
error while loading shared libraries: libstdc++.so.6: cannot open shared ob=
ject file: No such file or directory".

Since you got this working is there anything the host machine needs to conf=
igure to get this to work?

>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 13=20
> ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb=20
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index d2fe982..81bdeed 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${ARMPKGARCH}-${TA=
RGET_OS}-sdk-${SDK_ARCH}"
> =20
>  require recipes-core/meta/meta-toolchain.bb
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> =20
> @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
>  	echo 'export TARGET_SYS=3D${ARAGO_TARGET_SYS}' >> $script
>  	echo 'export TARGET_PREFIX=3D$TARGET_SYS-' >> $script
>  	echo 'export PATH=3D$SDK_PATH/bin:$PATH' >> $script
> +	echo 'export LD_LIBRARY_PATH=3D$SDK_PATH/lib:$LD_LIBRARY_PATH' >>=20
> +$script
>  	echo 'export CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $scri=
pt
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS' >> $script
>  	echo 'export=20
> PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script @@=
 -55,3 +56,13 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >> $script  }
> +
> +populate_sdk_ipk_append () {
> +	cd ${SDK_OUTPUT}/${SDKPATH}/bin
> +	binfiles=3D`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -ex=
ec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
> +	for i in $binfiles; do
> +		mv $i $i.real
> +		printf "#!/bin/sh\n\x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.=
real \x24\x2a\n" > $i
> +		chmod +x $i
> +	done
> +}
> --
> 1.8.0
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

