Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B429652974
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:06:34 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03K6YNi014199;
	Thu, 3 Jan 2013 14:06:34 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03K6Ytd011055;
	Thu, 3 Jan 2013 14:06:34 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:06:33 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] busybox: Enable telnetd
Thread-Index: AQHNvIVjK1oZYVLjdkKjcAfh2kYU+pg4YnQQ
Date: Thu, 3 Jan 2013 20:06:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3598E4@DFLE09.ent.ti.com>
References: <1352250925-12259-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352250925-12259-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] busybox: Enable telnetd
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
X-List-Received-Date: Thu, 03 Jan 2013 20:06:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Tuesday, November 06, 2012 7:15 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] busybox: Enable telnetd
>=20
> * Enable telnetd to allow someone to connect to the target device via tel=
net
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/busybox/busybox/defconfig         |    4 ++--
>  .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/m=
eta-
> arago-distro/recipes-core/busybox/busybox/defconfig
> index 31fbec2..f681eb7 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -810,8 +810,8 @@ CONFIG_TCPSVD=3Dy
>  CONFIG_TELNET=3Dy
>  # CONFIG_FEATURE_TELNET_TTYPE is not set
> CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy -# CONFIG_TELNETD is not set -#
> CONFIG_FEATURE_TELNETD_STANDALONE is not set
> +CONFIG_TELNETD=3Dy
> +CONFIG_FEATURE_TELNETD_STANDALONE=3Dy
>  # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set  CONFIG_TFTP=3Dy
> CONFIG_TFTPD=3Dy diff --git a/meta-arago-distro/recipes-
> core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-
> core/busybox/busybox_1.19.4.bbappend
> index 35b1243..b2d2540 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> -PR_append =3D "-arago3"
> +PR_append =3D "-arago4"
>=20
>  SRC_URI +=3D " \
>  	file://inetd \
> --
> 1.7.0.4


