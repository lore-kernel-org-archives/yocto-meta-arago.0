Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B47EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:52:00 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.16964.1688632581286540876
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 01:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=YEiHJn/u;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF017F3;
	Thu,  6 Jul 2023 10:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1688632533;
	bh=aZFKrBqVeDYE+O+SgryurigNlMiR3q9jEYanTW9V1K8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=YEiHJn/uAqOIUzAy8X1FwHTflPVTtv7Tc+axPCqx7YPnIYq0QDNfWwWZZFLgRgJI4
	 UffSr8y8Z/0ssIBG+W/MS5uRTaWxILJ+arEEyO3OQVVoNCGmQdCJG+jHFYqdIVTxGM
	 mtn0XUcpRaEahN76YFDw7pYqz92rCKcXoKBs3MHc=
MIME-Version: 1.0
In-Reply-To: <20230706041652.1843102-2-j-luthra@ti.com>
References: <20230706041652.1843102-1-j-luthra@ti.com> <20230706041652.1843102-2-j-luthra@ti.com>
Subject: Re: [master/kirkstone][PATCH v3 2/3] libcamera: Add support for TI CSI-RX
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>, meta-arago@lists.yoctoproject.org
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>, libcamera-devel@lists.libcamera.org,
Date: Thu, 06 Jul 2023 09:36:15 +0100
Message-ID: <168863257579.780480.1385426120296814998@Monstersaurus>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 12:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14766

Hi Jai,

Quoting Jai Luthra (2023-07-06 05:16:51)
> TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
> does not recognize it.
>=20

Has this driver been posted to the linux-media mailing list?


> Apply a patch to the simple pipeline so that it can recognize the media
> entity for TI's CSI-RX driver.
>=20
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>=20
> v3: Add Upstream-Status tag
> Link to v2: https://lore.kernel.org/all/20230706035522.1817402-2-j-luthra=
@ti.com/
>=20
>  .../0001-simple-Support-TI-CSI-RX.patch       | 33 +++++++++++++++++++
>  .../libcamera/libcamera_0.0.5.bb              |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcam=
era/0001-simple-Support-TI-CSI-RX.patch
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/000=
1-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/lib=
camera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> new file mode 100644
> index 00000000..82b02200
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simpl=
e-Support-TI-CSI-RX.patch
> @@ -0,0 +1,33 @@
> +From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
> +From: Jai Luthra <j-luthra@ti.com>
> +Date: Thu, 23 Mar 2023 11:38:46 +0530
> +Subject: [PATCH] simple: Support TI CSI-RX
> +
> +Add support for TI's CSI-RX pixel grabber device for the simple
> +pipeline.
> +
> +The driver is not yet merged, but v7 is posted [1] upstream.
> +
> +Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com=
/ [1]

I'll take that as a yes!

> +Upstream-Status: Pending
> +Signed-off-by: Jai Luthra <j-luthra@ti.com>
> +---
> + src/libcamera/pipeline/simple/simple.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pi=
peline/simple/simple.cpp
> +index e1f8b989..520405a1 100644
> +--- a/src/libcamera/pipeline/simple/simple.cpp
> ++++ b/src/libcamera/pipeline/simple/simple.cpp
> +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] =
=3D {
> +       { "mxc-isi", {} },
> +       { "qcom-camss", {} },
> +       { "sun6i-csi", {} },
> ++      { "j721e-csi2rx", {} },


So this line could already be merged to libcamera directly.

Could you post this patch to the libcamera mailing list please?
(libcamera-devel@lists.libcamera.org).

I'm planning the next release of libcamera in the next week - and I
believe we could get this in quite quickly.

--
Regards

Kieran

> ++
> + };
> +=20
> + } /* namespace */
> +--=20
> +2.41.0
> +
> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0=
.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> index 6ad376f2..b2eb5fac 100644
> --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "\
> =20
>  SRC_URI =3D " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
> +        file://0001-simple-Support-TI-CSI-RX.patch \
>  "
> =20
>  SRCREV =3D "fb44403f1c5571549ac128c21daee9761eb9249c"
> --=20
> 2.41.0
>=20
>

