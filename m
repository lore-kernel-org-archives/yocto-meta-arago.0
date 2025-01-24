Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3092EC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:58:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1935.1737748693333128852
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 11:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d4kXVx3k;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: detheridge@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OJw9G41409238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 13:58:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737748689;
	bh=sLzSxQ39d4t211Q1Fkc09VyuwXrBvE2u0AOXeoV8Dd0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d4kXVx3kB7Car1daUtu/OE9NX9MiTYebtfl1gAVDsNuoX3W3PkOlNkjZ1pKTMTCK6
	 425h3lS1l75O//1qcxHAs6HhWAQSmhluX4tEd84l3IuikEsoKv/IEAsUIRz99jCx9o
	 DAk/9JD/It4KpbDz8y3WakEwl81yNnRkAsSP8Auc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50OJw9do016579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 13:58:09 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 13:58:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 13:58:08 -0600
Received: from [10.250.38.125] ([10.250.38.125])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OJw8KJ116938;
	Fri, 24 Jan 2025 13:58:08 -0600
Message-ID: <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
Date: Fri, 24 Jan 2025 13:58:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
To: Denys Dmytriyenko <denis@denix.org>
CC: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
References: <20250123201215.2812931-1-detheridge@ti.com>
 <20250123212031.GZ21836@denix.org>
Content-Language: en-US
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20250123212031.GZ21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 19:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15757



On 1/23/2025 3:20 PM, Denys Dmytriyenko wrote:
> A more generic question:
> 
> There are now multiple configs with meta-browser and meta-selinux listed:
> 
> * arago-scarthgap: both meta-browser and meta-selinux are disabled
> * arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is disabled
> * arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is enabled
> 
> Since there are now separate configs, should they be cleaned up and layers
> that are disabled or unused removed from them? That way when you need to bump
> say meta-browser, you just need to update one config, not all 3.
> 

This whole thing was a compromise because we didn't want to take the hit 
of building Chromium for every config.  But we did want to give the 
ability to enable Chromium easily in every config.  So we just comment 
it out and leave it up to the end user to uncomment it if they want 
Chromium to get built and burn several hours.  Maybe there is a nicer 
way to do it, but at the time this is what we came up with that worked 
for everybody involved.

> 
> Moreover, why only scarthgap is being updated? Are there any changes to the
> master configs?
> 

Master points to HEAD of the meta-browser layer,  as such the recipes 
don't make any sense for master, as they really attempt to enable GPU 
support on a specific version of Chromium.   If you build master you get 
whatever the latest Chromium is on the meta-browser layer without any of 
these tweaks applied.

> 
> On Thu, Jan 23, 2025 at 02:12:15PM -0600, Etheridge, Darren via lists.yoctoproject.org wrote:
>> Update the various Scarthgap config files to point the meta-browser layer at the
>> correct sha for Chromium 130.0.6723.91.
>>
>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>> ---
>>   configs/arago-scarthgap-chromium-config.txt     | 2 +-
>>   configs/arago-scarthgap-config.txt              | 2 +-
>>   configs/arago-scarthgap-next-config.txt         | 2 +-
>>   configs/arago-scarthgap-selinux-config.txt      | 2 +-
>>   configs/arago-scarthgap-wip-config.txt          | 2 +-
>>   kas/arago-scarthgap-chromium-config.yml         | 2 +-
>>   src/configs/arago-scarthgap-chromium-config.xml | 2 +-
>>   src/configs/arago-scarthgap-config.xml          | 2 +-
>>   src/configs/arago-scarthgap-next-config.xml     | 2 +-
>>   src/configs/arago-scarthgap-selinux-config.xml  | 2 +-
>>   src/configs/arago-scarthgap-wip-config.xml      | 2 +-
>>   11 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
>> index 9a1bd08..61d0bdb 100644
>> --- a/configs/arago-scarthgap-chromium-config.txt
>> +++ b/configs/arago-scarthgap-chromium-config.txt
>> @@ -3,7 +3,7 @@
>>   
>>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> -meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
>> index 3275f35..5c7adcb 100644
>> --- a/configs/arago-scarthgap-config.txt
>> +++ b/configs/arago-scarthgap-config.txt
>> @@ -3,7 +3,7 @@
>>   
>>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
>> index 58e8f96..8e96289 100644
>> --- a/configs/arago-scarthgap-next-config.txt
>> +++ b/configs/arago-scarthgap-next-config.txt
>> @@ -11,7 +11,7 @@ MOTD: NOTE:
>>   
>>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>> diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
>> index 17dc6a4..79a1136 100644
>> --- a/configs/arago-scarthgap-selinux-config.txt
>> +++ b/configs/arago-scarthgap-selinux-config.txt
>> @@ -3,7 +3,7 @@
>>   
>>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>>   meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>> diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
>> index 8dd69c8..4cc4556 100644
>> --- a/configs/arago-scarthgap-wip-config.txt
>> +++ b/configs/arago-scarthgap-wip-config.txt
>> @@ -3,7 +3,7 @@
>>   
>>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>> diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
>> index 35e9e36..a6d5a51 100644
>> --- a/kas/arago-scarthgap-chromium-config.yml
>> +++ b/kas/arago-scarthgap-chromium-config.yml
>> @@ -19,7 +19,7 @@ repos:
>>     meta-browser:
>>       url: "https://github.com/OSSystems/meta-browser.git"
>>       branch: "master"
>> -    commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
>> +    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
>>       layers:
>>         meta-chromium:
>>   
>> diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
>> index 6ccf049..739ab88 100644
>> --- a/src/configs/arago-scarthgap-chromium-config.xml
>> +++ b/src/configs/arago-scarthgap-chromium-config.xml
>> @@ -17,7 +17,7 @@
>>                   <layer>meta-arago-test</layer>
>>               </layers>
>>           </repo>
>> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
>> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4'>
>>               <layers>
>>                   <layer>meta-chromium</layer>
>>               </layers>
>> diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
>> index 5efd7cc..dc960b4 100644
>> --- a/src/configs/arago-scarthgap-config.xml
>> +++ b/src/configs/arago-scarthgap-config.xml
>> @@ -17,7 +17,7 @@
>>                   <layer>meta-arago-test</layer>
>>               </layers>
>>           </repo>
>> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
>> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>>               <layers>
>>                   <layer>meta-chromium</layer>
>>               </layers>
>> diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
>> index f31c917..b8c096d 100644
>> --- a/src/configs/arago-scarthgap-next-config.xml
>> +++ b/src/configs/arago-scarthgap-next-config.xml
>> @@ -18,7 +18,7 @@
>>                   <layer>meta-arago-test</layer>
>>               </layers>
>>           </repo>
>> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
>> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>>               <layers>
>>                   <layer>meta-chromium</layer>
>>               </layers>
>> diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
>> index f0d8f14..e580d4c 100644
>> --- a/src/configs/arago-scarthgap-selinux-config.xml
>> +++ b/src/configs/arago-scarthgap-selinux-config.xml
>> @@ -17,7 +17,7 @@
>>                   <layer>meta-arago-test</layer>
>>               </layers>
>>           </repo>
>> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
>> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>>               <layers>
>>                   <layer>meta-chromium</layer>
>>               </layers>
>> diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
>> index 667bf89..d330ef2 100644
>> --- a/src/configs/arago-scarthgap-wip-config.xml
>> +++ b/src/configs/arago-scarthgap-wip-config.xml
>> @@ -17,7 +17,7 @@
>>                   <layer>meta-arago-test</layer>
>>               </layers>
>>           </repo>
>> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
>> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>>               <layers>
>>                   <layer>meta-chromium</layer>
>>               </layers>
>> -- 
>> 2.34.1

