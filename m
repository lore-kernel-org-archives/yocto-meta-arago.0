Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06871FC6166
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 16:36:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.78008.1726245389692710668
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Sep 2024 09:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WdOTQoBR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DGaSLG028824;
	Fri, 13 Sep 2024 11:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726245388;
	bh=ynkuThM924w/2ZalOp4CpF5kyV8Iifrr6id5pqUtNE8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=WdOTQoBRsbetrqKWyn3xG5TkY/9R1w4lBWdjElT88JL0jGK08Xm3Uvn/dfgJ2W6B/
	 CGdbcT2ZPrBmo908DdfBsLnDBycfOMUnrJF6gwabO6Jln4t00e4GZkSM4VU3qz0oce
	 BvxHnE7BJCzaRGu9pskd8cPC824uzQ3DjLGZ0/mE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48DGaSOw027490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2024 11:36:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 11:36:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 11:36:28 -0500
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DGaRh2112205;
	Fri, 13 Sep 2024 11:36:28 -0500
Message-ID: <01d7a23c-99b5-4c09-8291-43c34785bd8c@ti.com>
Date: Fri, 13 Sep 2024 11:36:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] yavta: Patch for 32bit compiles
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <17F4DAC192BBB920.21522@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17F4DAC192BBB920.21522@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Sep 2024 16:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15558


Ignore this.  I though the builds were passing, but 64 bits are failing 
now... clearly this patch is not correct.  Back to the drawing board.




On 9/13/2024 11:31 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Seeing compile error on 32bit platforms.  Apply patch for the printf
> formats to accommodate the longer numbers.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../yavta/0001-yavta-Fix-32-bit-compile.patch | 55 +++++++++++++++++++
>   .../v4l2apps/yavta_%.bbappend                 |  7 +++
>   2 files changed, 62 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
> new file mode 100644
> index 00000000..bad6dcf6
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
> @@ -0,0 +1,55 @@
> +From a588c79237548931300d67a1f174ba01dad954fa Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Fri, 13 Sep 2024 09:05:29 -0500
> +Subject: [master][PATCH] yavta: Fix 32-bit compile
> +
> +The format for printing various time elements are not working for 64bit
> +times on a 32bit compile.
> +
> +../git/yavta.c:2195:51: error: format '%ld' expects argument of type 'long int', but argument 8 has type '__time64_t' {aka 'long long int'} [-Werror=format=]
> + 2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
> +      |                                                 ~~^
> +      |                                                   |
> +      |                                                   long int
> +      |                                                 %lld
> +......
> + 2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec,
> +      |                         ~~~~~~~~~~~~~~~~~~~~
> +      |                                      |
> +      |                                      __time64_t {aka long long int}
> +
> +Change the formats to be lld/llu to accommodate the change for 32bit
> +compiles.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + yavta.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/yavta.c b/yavta.c
> +index 3bf82b3..1e3b268 100644
> +--- a/yavta.c
> ++++ b/yavta.c
> +@@ -2192,7 +2192,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
> +
> + 		clock_gettime(CLOCK_MONOTONIC, &ts);
> + 		get_ts_flags(buf.flags, &ts_type, &ts_source);
> +-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
> ++		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
> + 			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
> + 			v4l2_field_name(buf.field),
> + 			buf.sequence, video_buffer_bytes_used(dev, &buf),
> +@@ -2254,7 +2254,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
> + 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
> + 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
> +
> +-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
> ++	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
> + 		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
> +
> + done:
> +--
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> new file mode 100644
> index 00000000..c3c22a55
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> @@ -0,0 +1,7 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI:append = " \
> +    file://0001-yavta-Fix-32-bit-compile.patch \
> +"
> +
> +PR:append = ".arago0"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

