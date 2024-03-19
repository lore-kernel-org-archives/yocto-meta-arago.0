Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96967CD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:18:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18368.1710861501177824103
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C6yrAk+s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42JFIFpf020684;
	Tue, 19 Mar 2024 10:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710861495;
	bh=C+hNCVCPkXbDmUS6VrGsR6kuibMZMLP07Av9z5P49Fg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=C6yrAk+sOCGnbbPWlq028IwDjASDTbHSw8fB4gH0p1l8a1cVT7aeZIpqEQgbW9V++
	 pPmqH/Dv8NMa3YJfDQchwgKpablxfe2NCH4puiGdSiC2CvMk7Zh+AddusrRVkSVodx
	 Cv3cy+QrG2WX+jmPx125miKczSrxACBXRdbFYa0c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42JFIFuw037037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 10:18:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 10:18:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 10:18:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42JFIECH018279;
	Tue, 19 Mar 2024 10:18:14 -0500
Message-ID: <ac416e5d-0e01-4db8-a780-f35fc1f73b27@ti.com>
Date: Tue, 19 Mar 2024 10:18:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] base-files: Remove fstab override
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191145.67894-1-afd@ti.com>
 <20240305204954.GI6072@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240305204954.GI6072@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:18:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15240

On 3/5/24 2:49 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 05, 2024 at 01:11:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> There is already a version of this file provided by oe-core that
>> is kept up to date. Do not override it.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../recipes-core/base-files/base-files/fstab        | 13 -------------
>>   .../recipes-core/base-files/base-files_%.bbappend   |  2 +-
>>   2 files changed, 1 insertion(+), 14 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-core/base-files/base-files/fstab
>>
>> diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> deleted file mode 100644
>> index 8ddadd98..00000000
>> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -# stock fstab - you probably want to override this with a machine specific one
>> -
>> -/dev/root            /                    auto       defaults              1  1
>> -proc                 /proc                proc       defaults              0  0
>> -devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
>> -usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
>> -tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> 
>> -tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
>> -tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
> 
> The major difference is these 2 tmpfs entries - upstream doesn't have
> /media/ram, as that was something TI testing framework was using. Plus
> upstream doesn't set the size parameter - by default up to 50% of RAM can
> get used by tmpfs and there were issues with some low-RAM legacy platforms
> in the past.
> 
> If neither of these differences matter any longer, this can be removed.
> 

If the tests do need this, then they should mount the needed tmpfs as part
of the test setup, not just assume it to be setup by the distro. Simple as:

# mount -t tmpfs -o size=50M tmpfs /media/ram

The only way to push the test framework to do the right thing is to
stop doing it for it.

Andrew

> 
>> -# uncomment this if your device has a SD/MMC/Transflash slot
>> -#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
>> -
>> diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
>> index e5c53e80..7d1f6751 100644
>> --- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
>> +++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
>> @@ -1,4 +1,4 @@
>>   # look for files in this layer first
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>   
>> -PR:append = ".arago4"
>> +PR:append = ".arago5"
>> -- 
>> 2.39.2

