Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F8FC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:15:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1392.1686093337384764767
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SXarVNGa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356NFY6Y104984;
	Tue, 6 Jun 2023 18:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686093334;
	bh=iDfXvqOycfw4JY9GW5r+DVfyrrZeyD1dAN/VT9UewvA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SXarVNGaMEqz0F13YJhqL/FSZ4htW95QXj8PV3+aHPfQNrwPHKDJKMRRTXbOpB/60
	 ajBZNO3Ll2wmhAYllQvXOYNzw8GWk+J6Mk5/mTYVdBDDhAwvSjrA0mCFeRRpyAfKbl
	 e+6jJr8PLZS3CjPGrHZ+38Ci/kgrYBb+6ShVhG60=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356NFYsb003348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 18:15:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 18:15:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 18:15:34 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356NFY3m056030;
	Tue, 6 Jun 2023 18:15:34 -0500
Message-ID: <c4200cdc-0cb5-71de-3113-09958b7eec72@ti.com>
Date: Tue, 6 Jun 2023 18:15:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH] arago.conf:
 make things more readable and fix the virtuals
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <detheridge@ti.com>, <reatmon@ti.com>, <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230606191019.702649-1-rs@ti.com>
 <20230606221554.GT9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230606221554.GT9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:15:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14510

On 6/6/23 17:15, Denys Dmytriyenko wrote:
> On Tue, Jun 06, 2023 at 02:10:19PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Make things more readable and reliable by useing the built in boolean
>> check instead of python's type casting. Drop the array indexing in favor
>> of a more direct if else statememnt.
> 
> Heh, it's just a matter of personal preference :) Array indexing conditionals
> is how OE used to do things from the early days and I'm well used to that. But
> these days using Python if/else directly gained lots of traction, so why not?
> 
> 
>> Also fix the virtual provider for login manager. There should only be 1
>> login provider and it should be shadow-base for systemd *or* busybox for
>> sysVinit systemd.
>>
>> Also explicitly remove the sysvinit distro feature if ARAGO_SYSVINIT
>> isn't set, because whatever arago inherits expects sysvinit for some
>> reason. This should fix the duplicate init.d and systemd service files
>> we've been seeing.
> 
> How much testing have you done with this change?
> 
> The reason it was done this way is because many packages only provided
> sysvinit rc scripts and not systemd unit files and we were relying on
> systemd-sysv-generator to handle those, which has dependency on "sysvinit"
> PACKAGECONFIG and DISTRO_FEATURES. There were fixes to handle duplications
> when both sysvinit rc script and systemd unit file are provided by a package
> and install only one of them. It was better than not having any startup script
> for a package at all.
> 

Everything in the layers below us provides both from everything I've 
seen. The only incompliant layers are meta-arago and maybe something in 
meta-ti still expecting sysVinit scripts.

If you set both sysVinit and systemd as a distro feature it actually 
*confuses* core packages and they end up shipping both, which clash. 
Systemd typically just resolves this by forcing everything with a 
sysvinit script into the sysvinit compatibility stage leading to 
increased boot time because that's all still serialized.

> 
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 9164657c..6390a916 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -59,13 +59,14 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>>   
>>   # Set global runtime providers for major components
>>   ARAGO_SYSVINIT ?= "0"
>> -VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>> -VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>> -VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>> -VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>> -VIRTUAL-RUNTIME_login_manager = "busybox shadow"
>> -
>> -DISTRO_FEATURES:append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>> +VIRTUAL-RUNTIME_dev_manager = "${@ 'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>> +VIRTUAL-RUNTIME_init_manager = "${@ 'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>> +VIRTUAL-RUNTIME_initscripts = "${@ 'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
>> +VIRTUAL-RUNTIME_initramfs = "${@ 'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
>> +VIRTUAL-RUNTIME_login_manager = "${@ 'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>> +
>> +DISTRO_FEATURES:append = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
>> +DISTRO_FEATURES:remove = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
>>   
>>   # Distro-specific package configuration
>>   PACKAGECONFIG:append:pn-systemd = " coredump"
>> -- 
>> 2.40.1


