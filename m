Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14347CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 07:38:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.276788.1697614706995019990
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 00:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fpeMO1c3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I7cPKl074987
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 02:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697614705;
	bh=yVetpIi1elamposM3UJCBS1hUvFFxejVEAQ3gf76LCk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fpeMO1c3WniyGN28Gh1mZAVIFEVjLxp+o/y6cbeJ3U7Vf2e6XRjdaHlOEYW7ilxm2
	 k3YxKzJTERKkPUn4YVOKDmknIQd55roZ3sjWeKFO4ack1bGbdhNHg0axdG8VLUMGNM
	 tTAQh86VtCdI0fsuTjQq/gTO+tuSVpo7L1jR2FZs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I7cPw2094980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 02:38:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 02:38:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 02:38:25 -0500
Received: from [172.24.227.6] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I7cNdG019218;
	Wed, 18 Oct 2023 02:38:24 -0500
Message-ID: <28e54a94-ce33-4dd3-ec49-9e8c8db01486@ti.com>
Date: Wed, 18 Oct 2023 13:08:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] gstreamer1.0-plugins-good:
 wave5-codec: Set max buffers same as min buffers
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <p-mantena@ti.com>, Ryan Eatmon <reatmon@ti.com>, <denys@ti.com>
References: <20231017115119.306574-1-r-ravikumar@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20231017115119.306574-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 07:38:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14946

Hi Rahul,

On 17/10/23 17:21, Rahul T R wrote:
> wave5 codec driver can not work with new buffers allocated post stream

I am not aware of such bug in wave5 driver also iiuc it's actually not a wave5
driver problem but probably related to v4l2 plugin not able to provide the
buffer with same index always to the driver for which the workaround patch
0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch was made to maintain 1-to-1
between v4l2 buffer indices and buffer.

I assume the problem related to the workaround not able to handle 1-to-1 for
dynamically allocated buffers post streaming right(if required you can
probably check with Prasanth if it would be possible to support this), if
that's the case then I would suggest to update commit message likewise.

> start. To avoid issues because of this set max_buffers same as min
> buffers, so that new buffers are not allocated post stream start
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

With the suggested changes in commit message,

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> index a1471661..bf73e257 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> @@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>  ---
>   sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
>   sys/v4l2/gstv4l2bufferpool.h |  2 ++
> - sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
> + sys/v4l2/gstv4l2object.c     | 16 +++++++++++++---
>   sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
> - 4 files changed, 42 insertions(+), 12 deletions(-)
> + 4 files changed, 43 insertions(+), 12 deletions(-)
>  
>  diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
>  index d85f036..e6a60dc 100644
> @@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
>       own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
>  
>       /* for the downstream pool, we keep what downstream wants, though ensure
> -@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> +@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>       min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
>  
>       /* To import we need the other pool to hold at least own_min */
> @@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
>  +    if (obj_pool == pool) {
>  +        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
>  +            min = own_min;
> ++            max = min;
>  +        } else {
>  +            min += own_min;
>  +        }

