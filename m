Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0042352A21
	for <meta-arago@arago-project.org>;
	Fri,  2 Nov 2012 02:30:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA22UKnI031836
	for <meta-arago@arago-project.org>; Thu, 1 Nov 2012 21:30:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA22UKKF005261
	for <meta-arago@arago-project.org>; Thu, 1 Nov 2012 21:30:20 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 1 Nov 2012 21:30:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: remove
	MULTIMACH_TARGET_SYS suffix from top level files
Thread-Index: AQHNuGekFoaEsLXMnEqYtNcRukLe2ZfVsvgAgAAfO2A=
Date: Fri, 2 Nov 2012 02:30:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C313CA6@DFLE09.ent.ti.com>
References: <1351798334-12904-1-git-send-email-denys@ti.com>
	<20121101193500.GH22705@edge>
In-Reply-To: <20121101193500.GH22705@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] meta-toolchain-arago: remove MULTIMACH_TARGET_SYS suffix from top level files
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
X-List-Received-Date: Fri, 02 Nov 2012 02:30:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Would creating a symlink solve this issue?=20

You wouldn't need this patch and current apps, scripts and users will have =
the "environment-setup" file that they know and love?=20
A simple appends in meta-arago-distro could have this fix which will leave =
your recipe untouched.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, November 01, 2012 2:35 PM
To: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: remove MULTIMACH_TA=
RGET_SYS suffix from top level files

On Thu, Nov 01, 2012 at 03:32:14PM -0400, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Well, I don't like this patch - to drop those suffixes, I need to duplicate=
 two more general functions locally. Arguably, having own copy of "version"=
=20
function is good - we can extend it. But there's no use for the "site-confi=
g"=20
one. As an alternative, we can leave "site-config" one with the suffix, whi=
ch is not very consistent, but bearable... Thoughts?

--
Denys


> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      | 40 ++++++++++++++++=
+++---
>  1 file changed, 35 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 1e5d140..8c92b10 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,19 +4,19 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${ARMPKGARCH}-${=
TARGET_OS}-sdk-${SDK_ARCH}"
> =20
>  require recipes-core/meta/meta-toolchain.bb
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> =20
>  # This function creates an environment-setup-script for use in a deploya=
ble SDK
>  toolchain_create_sdk_env_script () {
>  	# Create environment setup script
> -	script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${MULTIMACH_TARGET_=
SYS}
> +	script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup
>  	rm -f $script
>  	touch $script
>  	echo 'SDK_PATH=3D"${SDKPATHNATIVE}"' >> $script
> -	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" =3D "x./environment-setup-${MULT=
IMACH_TARGET_SYS}" ]; then' >> $script
> -	echo '    echo "Error: This script needs to be sourced. Please run as \=
". ./environment-setup-${MULTIMACH_TARGET_SYS}\""' >> $script
> +	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" =3D "x./environment-setup" ]; th=
en' >> $script
> +	echo '    echo "Error: This script needs to be sourced. Please run as \=
". ./environment-setup\""' >> $script
>  	echo '    exit 1' >> $script
>  	echo 'else' >> $script
>  	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
> @@ -31,7 +31,7 @@ toolchain_create_sdk_env_script () {
>  	echo 'export CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $scri=
pt
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS' >> $script
>  	echo 'export PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig=
' >> $script
> -	echo 'export CONFIG_SITE=3D$SDK_PATH/site-config-${MULTIMACH_TARGET_SYS=
}' >> $script
> +	echo 'export CONFIG_SITE=3D$SDK_PATH/site-config' >> $script
>  	echo -e 'export CC=3D\x24{TARGET_PREFIX}gcc' >> $script
>  	echo -e 'export CXX=3D\x24{TARGET_PREFIX}g++' >> $script
>  	echo -e 'export GDB=3D\x24{TARGET_PREFIX}gdb' >> $script
> @@ -46,3 +46,33 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >> $script
>  }
> +
> +#This function create a site config file
> +toolchain_create_sdk_siteconfig () {
> +	local siteconfig=3D${SDK_OUTPUT}/${SDKPATH}/site-config
> +
> +	rm -f $siteconfig
> +	touch $siteconfig
> +
> +	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
> +		cat $sitefile >> $siteconfig
> +	done
> +
> +	#get cached site config
> +	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
> +		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; the=
n
> +			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $sitec=
onfig
> +		fi
> +	done
> +}
> +
> +#This function create a version information file
> +toolchain_create_sdk_version () {
> +	local versionfile=3D${SDK_OUTPUT}/${SDKPATH}/version
> +	rm -f $versionfile
> +	touch $versionfile
> +	echo 'Distro: ${DISTRO}' >> $versionfile
> +	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
> +	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
> +	echo 'Timestamp: ${DATETIME}' >> $versionfile
> +}
> --=20
> 1.7.12.4
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

