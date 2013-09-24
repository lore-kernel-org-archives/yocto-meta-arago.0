Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 24D5552998
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 20:10:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OKAmIq031119
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:10:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OKAm38007530
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:10:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 15:10:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
Thread-Index: AQHOuWG4M/kbvSx1ikSC3FWzdsCOt5nVUYAQ
Date: Tue, 24 Sep 2013 20:10:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
References: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Tue, 24 Sep 2013 20:10:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, September 24, 2013 3:50 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DI=
R
>=20
> * This script took a parameter using -d to set the DL_DIR but
>   ignored that setting.  Now if that is set make it the DL_DIR
>   value in conf/local.conf
> * When running this script to get updates changes that were made
>   to DL_DIR were lost because local.conf was copied over.  Now
>   the script will use the old DL_DIR setting.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>=20
> ---
> * Updated in version 2
>     * Removed sh -x setting which was accidentally left over
>     * Fixed typo in commit message
> ---
>  oe-layertool-setup.sh |   17 ++++++++++++++++-
>  1 files changed, 16 insertions(+), 1 deletions(-)
>=20
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh index
> 55cd174..72e36a2 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -732,6 +732,22 @@ EOM
>      threads=3D`cat /proc/cpuinfo | grep -c processor`
>      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE =3D \"-j ${threads}\"/"
> $confdir/local.conf
>      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =3D
> \"${threads}\"/" $confdir/local.conf
> +
> +    # Find if old DL_DIR was set
> +    if [ -e $confdir/local.conf.bak ]
> +    then
> +        old_dldir=3D`cat $confdir/local.conf.bak | grep -e "^DL_DIR =3D"=
 | sed
> 's|DL_DIR =3D ||' | sed 's/"//g'`
> +    else
> +        old_dldir=3D"$dldir"
> +    fi
> +
> +    # If command line option was not set use the old dldir
> +    if [ "x$dldir" =3D=3D "x" ]
> +    then
> +        dldir=3D$old_dldir
> +    fi
> +
> +    sed -i "s|^DL_DIR.*|DL_DIR =3D \"${dldir}\"|" $confdir/local.conf
>  }
>=20
>=20
> @@ -838,7 +854,6 @@ cd -
>  sourcedir=3D"$oebase/sources"
>  builddir=3D"$oebase/build"
>  confdir=3D"$builddir/conf"
> -dldir=3D"$oebase/downloads"
>=20
>  check_input
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

