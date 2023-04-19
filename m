Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E84C77B75
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 02:30:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28863.1681871436788227704
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 19:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y1FalgSt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33J2UUM1101776;
	Tue, 18 Apr 2023 21:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681871430;
	bh=RGGiBuUjWRC0frUFOgF5y9cKi+vvP7V6yLxsF2rAaK8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y1FalgStIDVywF+JIYNxrkhCiC+qQwItaNnQv8RohxdzATziynSlx0uUFrQrbt0Gc
	 rruAee2bTIciAShnGq4hk9l3vlFwpWPk6j+5rP6xq/u5nJUZKBk4HSMJ9juQh8TObN
	 dXoTEGZb2kyc52lqxULJiCIYnEwuiGess8/QLOsc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33J2UUHS047823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 21:30:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 21:30:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 21:30:30 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33J2UTMx068126;
	Tue, 18 Apr 2023 21:30:30 -0500
Message-ID: <c0a547bd-bf97-a58c-3c60-e1530731325f@ti.com>
Date: Tue, 18 Apr 2023 21:30:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [EXTERNAL] Re: [DISCUSSION] Weston-Init and non-root weston
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
 <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
 <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
 <ca43165d-5958-0cf9-bac4-527c4bdf94ac@ti.com>
 <d47ad5c3-d613-6aec-bb38-390cda358621@ti.com>
 <94b6af33-a7ed-e5d3-de44-81ca8a58fb2c@ti.com>
 <dfc09bbf-10c0-ec5e-95b0-8e520fb1d782@ti.com>
 <20230418225101.GY9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230418225101.GY9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Apr 2023 02:30:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14323

On 4/18/23 17:51, Denys Dmytriyenko wrote:
> On Mon, Apr 17, 2023 at 06:16:19PM -0500, Randolph Sapp wrote:
>> On 4/17/23 18:08, Andrew Davis wrote:
>>> On 4/17/23 6:01 PM, Randolph Sapp wrote:
>>>> On 4/17/23 17:52, Andrew Davis wrote:
>>>>> On 4/17/23 5:43 PM, Randolph Sapp wrote:
>>>>>> On 4/17/23 17:39, Andrew Davis wrote:
>>>>>>> On 4/17/23 5:32 PM, Randolph Sapp wrote:
>>>>>>>> Finally getting around to weston-init issue I
>>>>>>>> highlighted a while back and there's only one real issue
>>>>>>>> preventing us from reusing the base weston-init recipe
>>>>>>>> -- our touchscreen auto-configuration script.
>>>>>>>>
>>>>>>>> That script has to have root access to setup and reload
>>>>>>>> udev rules and as we know setuid won't work for shell
>>>>>>>> scripts.
>>>>>>>>
>>>>>>>> I propose we rewrite it in something that can use setuid
>>>>>>>> (perl or c or something of the sort). I'm currently
>>>>>>>> looking at perl as there's already quite a few core
>>>>>>>> recipes that rdepend on it.
>>>>>>>>
>>>>>>>> Then we just need to inject it into the runWeston script
>>>>>>>> and adjust the two init scripts to point at that.
>>>>>>>>
>>>>>>>> Any concerns or objections?
>>>>>>>
>>>>>>> Why not just drop out that old touchscreen script, it is a
>>>>>>> non-standard way of doing
>>>>>>> this task and should be removed.
>>>>>>>
>>>>>>> Andrew
>>>>>>
>>>>>> It's non-standard, but that's because there really isn't a
>>>>>> good standard for calibrating touch screens under Weston.
>>>>>> AFAIK this is still useful.
>>>>>
>>>>> https://wiki.st.com/stm32mpu/wiki/How_to_calibrate_the_touchscreen
>>>>>
>>>>> This seems like the standard ^^
>>>>>
>>>>> Andrew
>>>>
>>>> That does save the config for the user running weston. Currently
>>>> our script saves and loads the config for all users. This could
>>>> technically be seen as a regression, but it doesn't seem that
>>>> bad to me.

Whoops, that does not save the config for the user, it just applies it 
for the session. We'll still need a script to launch the calibrator on 
detection of a touch screen, and a helper script to hook into the 
calibration_helper [1].

[1] https://man.archlinux.org/man/weston.ini.5.html#calibration_helper=

