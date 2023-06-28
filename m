Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A6EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:09:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.19191.1687964969110053963
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09724408CD;
	Wed, 28 Jun 2023 15:09:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1n1BYHDoVEIZ; Wed, 28 Jun 2023 15:09:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C13F840031;
	Wed, 28 Jun 2023 15:09:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DA82A163B7B; Wed, 28 Jun 2023 11:09:21 -0400 (EDT)
Date: Wed, 28 Jun 2023 11:09:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, vigneshr@ti.com,
	praneeth@ti.com, r-ravikumar@ti.com
Subject: Re: [meta-arago][kirkstone][PATCH] receipes-multimedia: gstreamer:
 Increase decode display delay
Message-ID: <20230628150921.GS1518@denix.org>
References: <20230628135941.29206-1-p-mantena@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628135941.29206-1-p-mantena@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:09:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14722

> receipes-multimedia: gstreamer: Increase decode display delay

^^^^ "receipes" has a typo, plus it shouldn't even be there


On Wed, Jun 28, 2023 at 07:29:41PM +0530, Prasanth Babu Mantena wrote:
> Increase the number of buffers between the decoder and display to
> support smooth streaming of decoded data to downstream pool.
> This has been set to ref_frame plus 3 which was 2 before.
> 
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
>  .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> index 45ad91ee..0e155ef1 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> @@ -1,4 +1,4 @@
> -From b46a76bc1010aee88828eddcb4b3da01ce710b27 Mon Sep 17 00:00:00 2001
> +From 6b01fbb7785a0c950d7b4b0a3767aa35c9f7e60f Mon Sep 17 00:00:00 2001
>  From: Prasanth Babu Mantena <p-mantena@ti.com>
>  Date: Wed, 7 Jun 2023 18:24:55 +0530
>  Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
> @@ -6,6 +6,7 @@ Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
>  Add checks to release the buffer to downstream pool when returned with
>  error flag from the driver. This buffer which registered with driver is
>  used a an offset buffer without any new allocation in downstram pool.
> +Set buffer offset to ref_frames plus 3.
>  
>  Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>  ---
> @@ -67,7 +68,7 @@ index 60340c2..cec4207 100644
>   
>   #endif /*__GST_V4L2_BUFFER_POOL_H__ */
>  diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> -index ee60540..e9026da 100644
> +index ee60540..0952bb4 100644
>  --- a/sys/v4l2/gstv4l2object.c
>  +++ b/sys/v4l2/gstv4l2object.c
>  @@ -5040,7 +5040,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> @@ -75,7 +76,7 @@ index ee60540..e9026da 100644
>       /* In this case we'll have to configure two buffer pool. For our buffer
>        * pool, we'll need what the driver one, and one more, so we can dequeu */
>  -    own_min = obj->min_buffers + 1;
> -+    own_min = obj->min_buffers + 2;
> ++    own_min = obj->min_buffers + 3;
>       own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
>   
>       /* for the downstream pool, we keep what downstream wants, though ensure
> -- 
> 2.39.0

