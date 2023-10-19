Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480D3C001DF
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 22:02:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.40662.1697752968718275745
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 15:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Oug7OEhn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JM2h7a049035;
	Thu, 19 Oct 2023 17:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697752964;
	bh=uBCdFdop90gYXy81FxOLsb9zu3zOZynz7zCLzHd3CdE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Oug7OEhn4TyR8hRg4Zo1Kzi7jVLn15n/VpZqnrvOqaA0c9AFVXBAWQGdGK8nZx3S4
	 2kY/pztn0UUAYjQLiJECzgMazYLtF/44R8mRsz3t7MjQ99XUPyS6yMzwsBzB4uGXGx
	 C/AqVmPFtraNWjVWyt9nOEQFKh8SId3FNO2hoA/g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JM2huL021548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 17:02:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 17:02:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 17:02:43 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JM2hxv016713;
	Thu, 19 Oct 2023 17:02:43 -0500
Message-ID: <a273b77b-9b5c-44ed-a0e3-647a2a7bc06e@ti.com>
Date: Thu, 19 Oct 2023 17:02:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCH 2/2]
 shadow-securetty: Do not allow root login over telnet
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Khasim <khasim@ti.com>
References: <20231016211840.23815-1-afd@ti.com>
 <20231016211840.23815-2-afd@ti.com>
 <ecff143a-22fe-4033-97ca-5ee6b884672a@ti.com>
 <20231017172812.GK2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231017172812.GK2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 22:02:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14958



On 10/17/2023 12:28 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 17, 2023 at 02:52:43PM +0530, Chirag Shilwant wrote:
>>
>> On 17/10/23 02:48, Andrew Davis via lists.yoctoproject.org wrote:
>>> I'm sure I don't have to explain why this was a bad idea..
>>
>> Still, It will be good to have a commit message explaining it :)
> 
> It is a very obvious major security weakness and is definitely a very bad
> idea for an end product!
> 
> But, there was never a clear definition of what meta-arago is - is it an
> end product distribution or simply a test environment for the BSP/SDK.
> 
> This was added over 10 years ago as part of AM-SDK for ease of testing.
> Even though the commit does not explain it [1], we had a discussion and
> the security implications of sending telnet passwords in clear text were
> questioned.
> 
> The counter-argument here is that we build "debug" images w/o root password
> anyway by default, so allowing password-less root logins over telnet is
> rather a moot point, as we already allow the same for ssh.
> 
> Mayve instead of completely removing this, it should be conditional and
> only enabled when "debug-tweaks" is enabled in EXTRA_IMAGE_FEATURES,
> similar to allowing ssh root logins w/o a password.
> 
> [1] https://git.yoctoproject.org/meta-arago/commit/?id=98b6209a3010e32da963a0f6f53fceebbc37f8f9
> 

Well, we have to keep this for now.  We will work to disable the telnet 
requirement in our testing flow and move to ssh.  At that point we can 
revisit this patch.


>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   .../shadow/shadow-securetty_%.bbappend            | 15 ---------------
>>>   1 file changed, 15 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
>>>
>>> diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
>>> deleted file mode 100644
>>> index 62999d2a..00000000
>>> --- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
>>> +++ /dev/null
>>> @@ -1,15 +0,0 @@
>>> -PR:append = ".arago0"
>>> -
>>> -do_install:append () {
>>> -    # Allow telnet sessions to login as root
>>> -    securetty_file=${D}${sysconfdir}/securetty
>>> -
>>> -    echo '' >> $securetty_file
>>> -    echo '# Allow 5 telnet login' >> $securetty_file
>>> -    echo 'pts/0' >> $securetty_file
>>> -    echo 'pts/1' >> $securetty_file
>>> -    echo 'pts/2' >> $securetty_file
>>> -    echo 'pts/3' >> $securetty_file
>>> -    echo 'pts/4' >> $securetty_file
>>> -
>>> -}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

