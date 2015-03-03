Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 95D6952A9C
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 11:37:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23Bbwkn009222
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 05:37:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23BbvKp008438
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 05:37:57 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 05:37:57 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2]
	packagegroup-arago-tisdk-connectivity-sdk-host: Add
	ti-compat-wireless-wl18xx-src.
Thread-Index: AQHQVQAAe1Ea489hXEqeIEYt5sAosZ0KsYgA///xZ0A=
Date: Tue, 3 Mar 2015 11:37:56 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814103B7F@DFLE09.ent.ti.com>
References: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
	<20150303062959.GR6052@edge>
In-Reply-To: <20150303062959.GR6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] packagegroup-arago-tisdk-connectivity-sdk-host: Add ti-compat-wireless-wl18xx-src.
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
X-List-Received-Date: Tue, 03 Mar 2015 11:38:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I do not have any history on this...

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 03, 2015 1:30 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/2] packagegroup-arago-tisdk-connectivity=
-sdk-host: Add ti-compat-wireless-wl18xx-src.

The patch is fine, but have we found out what is the deal with in-tree and =
compat mopules?


On Mon, Mar 02, 2015 at 10:46:06AM -0500, Jacob Stiffler wrote:
> From: Jake Stiffler <j-stiffler@ti.com>
>=20
> * Add out of tree wl18xx driver sources to the SDK.
>=20
> Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
> ---
>  ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
> index e367c28..3862816 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth sources into the SDK=
"
>  LICENSE =3D "MIT"
> -PR =3D "r9"
> +PR =3D "r10"
> =20
>  inherit packagegroup
> =20
> @@ -8,6 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  FIRMWARE_AND_DRIVERS_SRC =3D "\
>      wl18xx-firmware-src \
> +    ti-compat-wireless-wl18xx-src \
>  "
> =20
>  CONNECTIVITY_RDEPENDS =3D ""
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

