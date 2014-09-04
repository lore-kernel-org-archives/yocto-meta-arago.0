Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1E94352992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:39:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HdGXI014864
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:39:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HdGvC024175
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:39:16 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 12:39:16 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 1/4]
	config-build-env: Add	support for adding a source mirror
Thread-Index: AQHPyGYKj9lEnjPPjUOHXO2UkeMBtpvxPXYA
Date: Thu, 4 Sep 2014 17:39:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C728A41@DFLE08.ent.ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 1/4] config-build-env: Add	support for adding a source mirror
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
X-List-Received-Date: Thu, 04 Sep 2014 17:39:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, September 04, 2014 12:31 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 1/4] config-build-env: =
Add
> support for adding a source mirror
>=20
> * Source mirrors may be used by setting the SOURCE_MIRROR_URL
> parameter in the
>   configuration file.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/config-build-env |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env inde=
x
> 655a7eb..cace93f 100644
> --- a/lib/oesdk/config-build-env
> +++ b/lib/oesdk/config-build-env
> @@ -74,5 +74,10 @@ config_build_dir() {
>      sed -i "s+^SSTATE_DIR =3D.*+STATE_DIR =3D \"$BUILD_ROOT/sstate-
> cache\"+" local.conf
>      sed -i "s+^TMPDIR =3D.*+TMPDIR =3D \"$BUILD_ROOT/$build_dir/arago-
> tmp\"+" local.conf
>      sed -i "s+^export BUILDDIR=3D.*+export
> BUILDDIR=3D\"$BUILD_ROOT/$build_dir\"+" setenv
> +
> +    if [ ! -z "$SOURCE_MIRROR_URL" ]; then
> +      echo "SOURCE_MIRROR_URL =3D \"$SOURCE_MIRROR_URL\"" >>
> local.conf
> +      echo "INHERIT +=3D \"own-mirrors\"" >> local.conf
> +    fi
>      cd - > /dev/null 2>&1
>  }
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

