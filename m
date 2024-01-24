Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EDDC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 22:51:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1754.1706136657517340724
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 14:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k106tF7o;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40OMouws127815
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 16:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706136656;
	bh=P3nrpHmJe0cgrO6KtwQr/wwZF5MX/jtj1HB9Xp8oS+s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k106tF7oqvc2ClHNlfXI58b79FJDqPFv57ncKVUIaf8k0mr2yy0pUOHMRNeHazF5U
	 KE/30PDBp8875JwG+3u8Z0uX9EXM4TAEmx7Q7YetkT+GgExDNSCp5yF/xcOvRqkKlT
	 F8k96JZ0/nPuVzDmQeq48QgUkaDeDG77ZhTCKDmg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40OMouPP120084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 16:50:56 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jan 2024 16:50:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jan 2024 16:50:55 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40OMotcT080121;
	Wed, 24 Jan 2024 16:50:55 -0600
Message-ID: <c5e34b90-4ea7-4bd9-9ff1-adc42f62981d@ti.com>
Date: Wed, 24 Jan 2024 16:50:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 2/2]
 gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240123155304.832636-1-r-ravikumar@ti.com>
 <20240123155304.832636-3-r-ravikumar@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240123155304.832636-3-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 22:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15092



On 1/23/2024 9:53 AM, Rahul T R wrote:
> This is required to avoid the frame drops and increase the tolrence
> for CSI capture using gsteamer
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   ...ct-Increase-min-buffers-for-CSI-capt.patch | 32 +++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
>   2 files changed, 34 insertions(+), 1 deletion(-)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
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

NAK.  This patch file is missing an Upstream-Status entry.  There are 
now QA checks in master that require that to be present for long term 
auditing purposes.  More info can be found at:

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status

Please fix and send a v3.



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
>       file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>       file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>       file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> +    file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>   "
>   
> -PR:append = ".arago1"
> +PR:append = ".arago2"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

