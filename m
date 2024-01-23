Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF27BC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:35:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13997.1706020526964527571
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 06:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oMHPdp/7;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NEZQAu014468
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:35:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706020526;
	bh=L8m1q7De+Y4dN3fbEPUCr6xfNw9Pvr7z9aAO3y1GLX8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oMHPdp/7rGSyWpO5UWGHW7V5NLBLTyEJEYzKae9mmT2Gh8y8vmRJjEJ9oXM3X6hHo
	 8SQD+HvHaKxx9kElKygTKmFbkTtOjeA1ebVYOgqZSj6lg6vHzOCCr9xcbgqCNBDEjQ
	 /J19SKNFKQZEgNTDBI7zXuJ6N5wXmAqoPvnbwhgg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NEZPnk038131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:35:25 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 08:35:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 08:35:25 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NEZMvJ074395;
	Tue, 23 Jan 2024 08:35:23 -0600
Message-ID: <000a8c48-7f85-9a32-216a-4cae407c86ee@ti.com>
Date: Tue, 23 Jan 2024 20:05:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 2/2]
 gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
 <20240122162917.822825-3-r-ravikumar@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240122162917.822825-3-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 14:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15081

Hi Rahul,

Thanks for the patch.

On 22/01/24 21:59, Rahul T R wrote:
> This is required to avoid the frame drops and increase the tolrence
> for CSI capture using gsteamer
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  ...1-gstv4l2object-Increase-min-buffers.patch | 29 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
> new file mode 100644
> index 00000000..f9ff4faa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
> @@ -0,0 +1,29 @@
> +From 9c5e0ee19be372c0477a509889d76ceaf97bdc87 Mon Sep 17 00:00:00 2001
> +From: Rahul T R <r-ravikumar@ti.com>
> +Date: Tue, 10 Oct 2023 14:42:13 +0530
> +Subject: [PATCH] gstv4l2object: Increase min buffers for CSI capture
> +
> +This will improve the latency and tolerance
> +of CSI pipeline
> +

I can understand the tolerance but how does it increase latency.
> +Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 4ce9fac..9f5a85b 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -5172,6 +5172,8 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> +      * pool, we'll need what the driver one, and one more, so we can dequeu */
> +     if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
> +         own_min = obj->min_buffers + 3;
> ++    } else if (0 == strcmp(obj->vcap.driver, "j721e-csi2rx")) {
> ++        own_min = obj->min_buffers + 4;

Could you please mention in commit message why our csi driver requires extra
buffers ? Is it due to a hardware limitation ? Also mention the use-case and
pipeline for which this is helping.

I believe gstreamer has a fail safe flow where it allocates buffer on the fly
in case there is a starvation, ain't that helping ?

I think it is okay to have this here as short term as we have other patches,
but from upstream point of view it looks like a hack so let's document the
reason why we did it here so that it can act as reference.

Also I believe this increases the memory footprint in v4l2 export mode ?
For already memory constrained platforms such as am62xSIP this may have a
negative impact. I see some vendors putting in extra env variables to let user
modify the buffering part.

Regards
Devarsh

> +     } else {
> +         own_min = obj->min_buffers + 1;
> +     }
> +-- 
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> index 7ad943f6..bb4fdc09 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> @@ -5,6 +5,7 @@ SRC_URI:append = " \
>      file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>      file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>      file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> +    file://0001-gstv4l2object-Increase-min-buffers.patch \
>  "
>  
> -PR:append = ".arago1"
> +PR:append = ".arago2"

