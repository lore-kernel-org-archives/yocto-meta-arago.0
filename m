Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1489C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 06:17:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.16737.1706077067799086826
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 22:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QAZLUfqK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40O6Hl8d036448
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 00:17:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706077067;
	bh=I1NIHgOTn3PAYDcR83rdgkwK7ld0SeMtLfkQxENS9os=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QAZLUfqKD2XRU2KFEjqRsbw8faDW31Gic8i9e9/Ce8xcaH3FTM9I/68G0WM7Ht1mL
	 HHullM+OfchqF+dlVAnMhYFhbfSpm59fWXfCOyumRHswMtI0Mwv6odbhXQxUXMte0t
	 UE6PL4wwmaNUOfZlzrwUPaBa19IaBSyRXo33FGaA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40O6HlRr037324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 00:17:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jan 2024 00:17:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jan 2024 00:17:46 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40O6Hh9T026667;
	Wed, 24 Jan 2024 00:17:44 -0600
Message-ID: <a16d5fdf-f21d-5168-806b-da52fa350ec0@ti.com>
Date: Wed, 24 Jan 2024 11:47:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 2/2]
 gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240123155304.832636-1-r-ravikumar@ti.com>
 <20240123155304.832636-3-r-ravikumar@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240123155304.832636-3-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 06:17:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15089



On 23/01/24 21:23, Rahul T R wrote:
> This is required to avoid the frame drops and increase the tolrence
> for CSI capture using gsteamer
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

> ---
>  ...ct-Increase-min-buffers-for-CSI-capt.patch | 32 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
> new file mode 100644
> index 00000000..cd3ff613
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
> @@ -0,0 +1,32 @@
> +From a314ac52a306f8ddde1b53321b8cba5e35f5fa72 Mon Sep 17 00:00:00 2001
> +From: Rahul T R <r-ravikumar@ti.com>
> +Date: Tue, 10 Oct 2023 14:42:13 +0530
> +Subject: [PATCH] HACK: gstv4l2object: Increase min buffers for CSI capture
> +
> +With default min buffers, frame drops are observed with CSI capture
> +pipeline with VISS, LDC and DSS with DMABuf Import mode
> +
> +Increasing min buffers queued in v4l2src seems to fix this issue.
> +Need more amalysis on the exact root cause
> +
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
> +     } else {
> +         own_min = obj->min_buffers + 1;
> +     }
> +-- 
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> index 2a1a6e68..782b54a4 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> @@ -5,6 +5,7 @@ SRC_URI:append = " \
>      file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>      file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>      file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> +    file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>  "
>  
> -PR:append = ".arago1"
> +PR:append = ".arago2"

