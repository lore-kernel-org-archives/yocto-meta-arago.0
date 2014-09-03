Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8DBCE52976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:45:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Ejf3d027688
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:45:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83Ejfg2020293
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:45:41 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:45:41 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 09/12] recipes-connectivity:
	remove remaining unnecessary exec permissions
Thread-Index: AQHPx3R+jivd88WtrkqQ2ekEUdEST5vvfIzQ
Date: Wed, 3 Sep 2014 14:45:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72706B@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-10-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-10-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 09/12] recipes-connectivity:	remove remaining unnecessary exec permissions
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
X-List-Received-Date: Wed, 03 Sep 2014 14:45:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 09/12] recipes-connectivity:
> remove remaining unnecessary exec permissions
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch   =
  |
> 0
>  .../obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
> | 0
>  .../wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb             =
  | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)  mode change 100755 =3D=
>
> 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-
> synchronization-between-bluetoothd-and-dr.patch
>  mode change 100755 =3D> 100644 meta-arago-distro/recipes-
> connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-
> longer.patch
>  mode change 100755 =3D> 100644 meta-arago-extras/recipes-
> connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-f=
ix-
> synchronization-between-bluetoothd-and-dr.patch b/meta-arago-
> distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-
> between-bluetoothd-and-dr.patch
> old mode 100755
> new mode 100644
> diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001=
-
> obexd-make-OPP-push-timeout-longer.patch b/meta-arago-distro/recipes-
> connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-
> longer.patch
> old mode 100755
> new mode 100644
> diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-
> scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-
> connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> old mode 100755
> new mode 100644
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

