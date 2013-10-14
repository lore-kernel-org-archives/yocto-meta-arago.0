Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7D4F45299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 20:52:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EKqtpS024909
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 15:52:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EKqtxW019231
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 15:52:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 15:52:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] udev: fix touchscreen detection rule
Thread-Index: AQHOyRWVkY1hgl3E+Eeu91TGpj7OSZn0rIHA
Date: Mon, 14 Oct 2013 20:52:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C576262@DFLE08.ent.ti.com>
References: <1381782728-11639-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381782728-11639-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] udev: fix touchscreen detection rule
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
X-List-Received-Date: Mon, 14 Oct 2013 20:52:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, October 14, 2013 3:32 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] udev: fix touchscreen detection rule
>=20
> * Fix the rule to detect the touchscreen and create the
>   /dev/input/touchscreen0 device node.
> * This has already been submitted upstream and can be removed
>   when meta-arago switches to Dora
> * The patch has already been submitted to oe-core at:
>=20
> http://article.gmane.org/gmane.comp.handhelds.openembedded.core/43958
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/udev/udev/local.rules             |   23 ++++++++++++++=
++++++
>  .../recipes-core/udev/udev_182.bbappend            |    8 +++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)  create mode 100644 me=
ta-
> arago-distro/recipes-core/udev/udev/local.rules
>  create mode 100644 meta-arago-distro/recipes-
> core/udev/udev_182.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-=
arago-
> distro/recipes-core/udev/udev/local.rules
> new file mode 100644
> index 0000000..d0cbf91
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
> @@ -0,0 +1,23 @@
> +# There are a number of modifiers that are allowed to be used in some #
> +of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an
> +existing node # %k the kernel name for the device # %M the kernel major
> +number for the device # %m the kernel minor number for the device # %b
> +the bus id for the device # %c the string returned by the PROGRAM #
> +%s{filename} the content of a sysfs attribute # %% the '%' char itself
> +#
> +
> +# Try and modprobe for drivers for new hardware ACTION=3D=3D"add",
> +DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RUN+=3D"/sbin/modpro=
be
> $env{MODALIAS}"
> +
> +# Create a symlink to any touchscreen input device # Trigger based on
> +input type, that the evbit (-e) has EV_SYN and EV_ABS, # has an EV_ABS
> +value (-a) which is used for touchscreen type devices.
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-
> e0*,3,*a0,1,*", SYMLINK+=3D"input/touchscreen0"
> +
> diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta=
-
> arago-distro/recipes-core/udev/udev_182.bbappend
> new file mode 100644
> index 0000000..27bf4da
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> @@ -0,0 +1,8 @@
> +# This fixes an issue with touchscreens not being detected with the
> +default # local.rules.  This can be removed when this change is picked
> +up and # meta-arago switches to Dora
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +PR_append =3D "-arago0"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

