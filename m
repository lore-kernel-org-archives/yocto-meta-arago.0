Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F11A3529A4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 14:50:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TEoxTu015428
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 08:50:59 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TEowPe030164
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 08:50:58 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 29 Jan 2015 08:50:58 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
Thread-Index: AQHQO9BKu1iTos4y3U2qHhB6zZMpfpzXKifw
Date: Thu, 29 Jan 2015 14:50:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F048A@DFLE08.ent.ti.com>
References: <1422541885-5800-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1422541885-5800-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 29 Jan 2015 14:51:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think the size just determines the "maximum" amount of RAM that can be us=
ed. So your basically your allowing the tmpfs to consume upto 50MB of memor=
y. I never seen an issue on Beaglebone Black and AM57 with the current tmpf=
s being too small. Are the problems your seeing related to a particular app=
lication/demo? If its specific to a particular platform maybe just create a=
 custom fstab for that platform.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Thursday, January 29, 2015 8:31 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
>=20
> * Weston applications allocate memory from tmpfs, need to
>   increase the tmpfs area to atleast 50M. Can this be
>   increased more - what are the pros/cons?
>=20
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/base-files/base-files/fstab       |    2 +-
>  .../base-files/base-files_3.0.14.bbappend          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> index 9ed6f33..8ddadd9 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> +++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> @@ -5,7 +5,7 @@ proc                 /proc                proc       defa=
ults              0  0
>  devpts               /dev/pts             devpts     mode=3D0620,gid=3D5=
       0  0
>  usbdevfs             /proc/bus/usb        usbdevfs   noauto             =
   0  0
>  tmpfs                /run                 tmpfs      mode=3D0755,nodev,n=
osuid,strictatime 0
> 0
> -tmpfs                /var/volatile        tmpfs      defaults,size=3D16M=
     0  0
> +tmpfs                /var/volatile        tmpfs      defaults,size=3D50M=
     0  0
>  tmpfs                /media/ram           tmpfs      defaults,size=3D16M=
     0  0
>=20
>  # uncomment this if your device has a SD/MMC/Transflash slot diff --git
> a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> index 40b7722..956a057 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappen=
d
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
> +++ nd
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> -PR_append =3D "-arago3"
> +PR_append =3D "-arago4"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

