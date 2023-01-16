Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AAFC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 07:16:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.161219.1673853379238299760
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 15 Jan 2023 23:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iySlJt+O;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30G7GE96041939;
	Mon, 16 Jan 2023 01:16:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673853374;
	bh=7KaxFQfsFFjLJQ7e73RKuOQkw0TAFuYaANJgL67lWwo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iySlJt+OIaw7kVuYavGGvEZ6Ak9rxdSfkdCFzxaoBXRgcE26kj51GToJi/hNLeigl
	 uTG4Z8nRaysLy76TYHQPahVekwehXU4kOWA9Uf4HhaWZ5rgKPlpW4/vcpsKRxiTzE9
	 o5IQDVL/zxtUyYNe1mURGyAEa1Nkof3p0damEp+I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30G7GESC126271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Jan 2023 01:16:14 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 16
 Jan 2023 01:16:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 16 Jan 2023 01:16:14 -0600
Received: from [172.24.145.85] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30G7GB2L017980;
	Mon, 16 Jan 2023 01:16:12 -0600
Message-ID: <99a65689-d4da-3efb-8957-e3d3604d2b31@ti.com>
Date: Mon, 16 Jan 2023 12:46:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago][master/dunfell][PATCH 1/2] systemd: fix the local
 rule to load modules when new hardware is added
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>
References: <20230104141150.186773-1-j-choudhary@ti.com>
 <20230104141150.186773-2-j-choudhary@ti.com>
 <4e1c65ab-2028-a556-a539-a6ead6cab8ab@ti.com>
 <20230112162014.GX22689@denix.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20230112162014.GX22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Jan 2023 07:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14171



On 12/01/23 21:50, Denys Dmytriyenko wrote:
> On Wed, Jan 04, 2023 at 10:12:42AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 1/4/23 8:11 AM, Jayesh Choudhary via lists.yoctoproject.org wrote:
>>> Using modprobe causes the rule to fail when the module is builtin in kernel
>>> and it is logged in journalctl. So use the builtin command 'kmod' instead.
>>> This makes the journalctl logs clean and significantly easier to read.
>>>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>   meta-arago-distro/recipes-core/systemd/systemd/local.rules | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
>>> index b0e9f84f..4829ca14 100644
>>> --- a/meta-arago-distro/recipes-core/systemd/systemd/local.rules
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
>>> @@ -14,7 +14,7 @@
>>>   #
>>>   # Try and modprobe for drivers for new hardware
>>> -ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
>>> +ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
>>
>> Is the builtin version as full featured? Does this work in non-systemd systems? Is this just
>> masking all errors or do real errors still get logged somewhere? If this is just a way
>> to mask errors then --quiet might be more portable.


Andrew,

Even with --quiet, the error logs were there in journalctl as modprobe
has a non-zero exit status. I looked at other udev rules for loading
modules and since they were also using `kmod`, I used this command.

For instance, in /lib/udev/rules.d/80-drivers.rules:
ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"


>>
>> (BTW I ran into this same issue of having no good way to know if a module was builtin or just
>> missing when adding dynamic kernel module support for Android [0])
>>
>> Andrew
>>
>> [0] https://android.googlesource.com/platform/system/core/+/9963847419f41c76ca008cf0c09e986c79f04e4c
> 
> Ping! I haven't seen any answers to the above questions, but the patch
> unfortunately already got merged...
> 

Denys,

I missed this email thread.
I am extremely sorry about that.

-Jayesh

