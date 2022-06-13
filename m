Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3681C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 16:18:27 +0000 (UTC)
Subject: Re: [dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: Rowlett, Texas, US (192.228.67.13)
X-Originating-Platform: Windows Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jun 2022 09:18:21 -0700
References: <20220609170520.31162-1-afd@ti.com>
In-Reply-To: <20220609170520.31162-1-afd@ti.com>
Message-ID: <16989.1655137101944524297@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Jun 2022 16:18:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13896

On Thu, Jun  9, 2022 at 10:05 AM, Andrew Davis wrote:

>
> This fixup should have been done in u-boot and not in a uEnv.txt
> file. It is not correct for all K3 anymore either. Remove it.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>=20
> Changes from v1:
>  - Subject s/tiusdk-uenv/tisdk-uenv
>=20
>  .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644
> meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEn=
v.txt
> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> deleted file mode 100644
> index 80ea34f5..00000000
> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# This uEnv.txt file can contain additional environment settings that yo=
u
> -# want to set in U-Boot at boot time.  This can be simple variables such
> -# as the serverip or custom variables.  The format of this file is:
> -#    variable=3Dvalue
> -# NOTE: This file will be evaluated after the bootcmd is run and the
> -#       bootcmd must be set to load this file if it exists (this is the
> -#       default on all newer U-Boot images.  This also means that some
> -#       variables such as bootdelay cannot be changed by this file since
> -#       it is not evaluated until the bootcmd is run.
> -

Shouldn't we keep the above, as this is generic information about how to us=
e uEnv.txt and when it is invoked?

> -# The specific board is not able to be automatically detected. The below=
 is a
> -# workaround to set a sane default incase the user has not manually
> configured
> -# a specific board.
> -def_board_name=3D"am65x"
> -
> -# Check if using default board_name when name_overlays is not set
> -check_for_board=3Dif test $name_overlays; then echo "Using board_name =
=3D
> $board_name"; else setenv board_name $def_board_name; fi
> -
> -uenvcmd=3Drun check_for_board; run findfdt
> --=20
> 2.36.1
>=20
>

