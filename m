Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 06A5952972
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:15:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJF5QD027670
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:15:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJF4l3019498
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:15:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 14:15:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: copy relocate_sdk
	from	COREBASE
Thread-Index: AQHOyQ+kd55TUG/Hy0q6wyW9ftGZq5n0kTZQ
Date: Mon, 14 Oct 2013 19:15:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C575F62@DFLE08.ent.ti.com>
References: <1381780175-15257-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381780175-15257-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] meta-toolchain-arago: copy relocate_sdk from	COREBASE
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
X-List-Received-Date: Mon, 14 Oct 2013 19:15:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, October 14, 2013 2:50 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] meta-toolchain-arago: copy relocate_sdk fro=
m
> COREBASE
>=20
> * Copy the relocate_sdk.py script from the COREBASE instead of
>   from the ARAGOBASE since it was removed from ARAGOBASE
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index cd39b4a..ff74a95 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -10,7 +10,7 @@ require recipes-core/meta/meta-toolchain.bb
>  # Add in linux-libc-headers version so that is taken into consideration
> REAL_MULTIMACH_TARGET_SYS =3D "${TUNE_PKGARCH}-
> ${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-
> ${TARGET_OS}"
>=20
> -PR =3D "r27"
> +PR =3D "r28"
>=20
>  # This function creates an environment-setup-script for use in a deploya=
ble SDK
> toolchain_create_sdk_env_script () { @@ -107,7 +107,7 @@ fakeroot
> create_sdk_files() {
>  	# Add version information
>  	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-
> ${REAL_MULTIMACH_TARGET_SYS}
>=20
> -	cp ${ARAGOBASE}/scripts/relocate_sdk.py
> ${SDK_OUTPUT}/${SDKPATH}/
> +	cp ${COREBASE}/scripts/relocate_sdk.py
> ${SDK_OUTPUT}/${SDKPATH}/
>=20
>  	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
>  	# Escape special characters like '+' and '.' in the SDKPATH
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

