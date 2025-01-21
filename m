Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01169C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 16:08:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.19313.1737475720401377563
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 08:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LfRnMd6p;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LG8aQ6032336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 10:08:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737475716;
	bh=dNSPqahieOJQZ96vIRmMcmZlWMqk5Baj3Y4evvQvvgA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LfRnMd6p/42evUVdYTOpfX1sjCD9qygsU3Fyg374r/un1yMMuCfmp7wv3FkZCh7H/
	 DgaGOw4mWEXvKcOcUCkIN9b+cNVd+IZWBN2VSgujaNsdvTW4xa8JYshEcJtFgXKA2I
	 aR9wTjycE5lY7DODkkDLgEALPJcY7wjaiLlYli1U=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LG8a70026790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 10:08:36 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 10:08:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 10:08:35 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LG8ZbX115338;
	Tue, 21 Jan 2025 10:08:35 -0600
Message-ID: <4ef9eb11-63d0-4bea-8fdf-7403b34c0491@ti.com>
Date: Tue, 21 Jan 2025 10:08:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/5] ffmpeg: Remove bbappend
 to disable x264
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117211951.698377-1-afd@ti.com>
 <20250117211951.698377-5-afd@ti.com> <20250120211644.GL21836@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250120211644.GL21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 16:08:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15718

On 1/20/25 3:16 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 17, 2025 at 03:19:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> The x264 codec is no longer enabled by default in oe-core, remove the
>> extra disabling. The x264 codec is not the only codec that makes this
>> package license flag commercial, so removing that flag after only
>> disabling one codec is not correct. All potentially troublesome codecs
>> should be evaluated before setting LICENSE_FLAGS_ACCEPTED to approve
>> of the license flags.
> 
>  From what I see in the changes below, they are not limited to x264 codec,
> yet, there's no explanation for other changes in the description.
> 

I'll split out the other changes to LICENSE_FLAGS_ACCEPTED into a
different patch.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf                 | 9 ++++-----
>>   .../recipes-multimedia/ffmpeg/ffmpeg_%.bbappend          | 4 ----
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index baa526a9..85c7ddd1 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -164,11 +164,10 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
>>   # Disable meta-virtualization sanity check and warning
>>   SKIP_META_VIRT_SANITY_CHECK = "1"
>>   
>> -# oe-core uses external libav instead of internal libav for gst-ffmpeg. We
>> -# disable by default the codecs in libav that causes issues with shipping an
>> -# Arago based SDK. No need to prevent gst-ffmpeg from being used since we
>> -# disable troublesome software.
>> -LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
>> +# Codecs in libav and ffmpeg with questionable patent statuses are not
>> +# included by default. If you enable any of those codecs you should check
>> +# if the below acceptance flags still work for your software distribution
>> +LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
>>   
>>   # Do not package own copy of perl into devkit, rely on host one
>>   ASSUME_PROVIDED += "nativesdk-perl"
>> diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
>> deleted file mode 100644
>> index d2f22d8e..00000000
>> --- a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -PR:append = ".arago0"
>> -
>> -PACKAGECONFIG:remove = "x264"
>> -LICENSE_FLAGS = ""
>> -- 
>> 2.39.2

