Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E668CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:35:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.282747.1697639741545722321
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CpUIHLeH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39IEZe8G113696
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 09:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697639740;
	bh=VQ1svixDfvSdUjbJzBTLaFk+fIL/2e4X7sYyz1E/vUA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CpUIHLeH9y4P2j4swy00i0KZNulL6ejWQYxm7XVSgrjwiO8hZ9OkcNXVRjKxAsf0W
	 hfmR7JH7sj/1XWYPwdLw+QiQqjh1Qx7R2V+HgQuNBGp92ckrN6Ylx62U7j4SXTmx+k
	 EF405RSjm64CE0XYWqTqjTBnF9bjLLnKCh95JsDI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39IEZehj094637
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 09:35:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 09:35:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 09:35:38 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39IEZcC9005618;
	Wed, 18 Oct 2023 09:35:39 -0500
Message-ID: <9f8c5f0c-50a8-4f1a-b5da-9d8c1b025361@ti.com>
Date: Wed, 18 Oct 2023 09:35:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH v2]
 gstreamer1.0-plugins-good: wave5-codec: Set max buffers same as min buffers
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <p-mantena@ti.com>, <devarsht@ti.com>, <denys@ti.com>
References: <20231018091946.754458-1-r-ravikumar@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231018091946.754458-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14950


Unfortunately I had already applied, tested, and marked the v1 patch for 
inclusion in CICD.  And the patch has already been promoted onto the 
master branch.

You sent a message in webex that implied a level of urgency with getting 
this patch in for CICD.  In the future, if there is no urgency and you 
want feedback on a patch, then do not send urgency messages off mailing 
list.  I am watching this list and checking things on a regular basis.



On 10/18/2023 4:19 AM, Rahul T R wrote:
> v4l2src plugin queues same external buffer with different v4l2 buffer
> with different index. This workaround was implemented as a workaround
> for this. Workaround needs all buffers to be allocated during the init
> phase, if new buffers are allocated post stream start it fails. Avoid
> such issues by enforcing max buffers same as min buffers
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
> 
> Notes:
>      v2:
>          Updated commit message as per the comments
>          Added the reviewed bys
> 
>   .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> index a1471661..bf73e257 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> @@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>   ---
>    sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
>    sys/v4l2/gstv4l2bufferpool.h |  2 ++
> - sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
> + sys/v4l2/gstv4l2object.c     | 16 +++++++++++++---
>    sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
> - 4 files changed, 42 insertions(+), 12 deletions(-)
> + 4 files changed, 43 insertions(+), 12 deletions(-)
>   
>   diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
>   index d85f036..e6a60dc 100644
> @@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
>        own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
>   
>        /* for the downstream pool, we keep what downstream wants, though ensure
> -@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> +@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>        min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
>   
>        /* To import we need the other pool to hold at least own_min */
> @@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
>   +    if (obj_pool == pool) {
>   +        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
>   +            min = own_min;
> ++            max = min;
>   +        } else {
>   +            min += own_min;
>   +        }

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

