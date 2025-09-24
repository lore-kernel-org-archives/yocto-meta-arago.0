Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE088CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 13:45:48 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13494.1758721544628625472
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 06:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YA65SSk8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ODjgsx1682588;
	Wed, 24 Sep 2025 08:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758721542;
	bh=IScy5FZNIM38y0DStHxfa1zaTKDhYrLo2PDsG57GZbM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YA65SSk8PLT9Z148Z1FPBGx04RV19guTTP8dIUTkZFbaEPNjXXZK2oVacO8FaqnHM
	 zP2twjyG/MGBlovo/a7DYC2cahh1hZxEXpefgTPAjqKXX7yw1NbNZQBg16FRbf9QfH
	 tqFx2L47asLow2Z1aCbNqsSR6LZdqjeTlYQHkT9E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ODjfqT3607991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 08:45:41 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 08:45:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 08:45:41 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ODjfcr2090833;
	Wed, 24 Sep 2025 08:45:41 -0500
Message-ID: <d7a104c3-3b2f-4a2f-aaf6-2f92404f4575@ti.com>
Date: Wed, 24 Sep 2025 08:45:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
To: Randolph Sapp <rs@ti.com>
CC: <denis@denix.org>, <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250922184556.3586969-2-rs@ti.com>
 <20250922185018.1666131-1-prc@list.ti.com> <DCZKQGDZYL21.VSHSC8JWZZJ5@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DCZKQGDZYL21.VSHSC8JWZZJ5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 13:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16621



On 9/22/2025 2:25 PM, Randolph Sapp wrote:
> On Mon Sep 22, 2025 at 1:50 PM CDT, PRC Automation wrote:
>> meta-arago / na / 20250922184556.3586969-2-rs
>>
>> PRC Results: FAIL
>>
>> =========================================================
>>    check-yocto-patches: PASS
>> =========================================================
>> Patches
>> ----------------------------------------
>> All patches passed
>>
>>
>>
>> =========================================================
>>    apply-yocto-patch: PASS
>> =========================================================
>> scarthgap
>> =====================
>> Summary:
>> - Patch Series: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
>> - Submitter: From: <rs@ti.com>
>> From: Randolph Sapp <rs@ti.com>
>> - Date: Date: Mon, 22 Sep 2025 13:45:57 -0500
>> - Num Patches: 1
>> - Mailing List (public inbox) Commit SHA: 99ee4cd55925bd5cddc29108415cb4e5fd1b8979
>>
>> Applied to:
>> - Repository: lcpd-prc-meta-arago
>> - Base Branch: scarthgap-wip
>> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
>> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
>> - Commit SHA: 96f3c5b8e2efec96de9db131992e56272becc174
>>
>> Patches
>> ----------------------------------------
>> All patches applied
>>
>>
>>
>> =========================================================
>>    check-yocto-repo: FAIL
>> =========================================================
>> scarthgap
>> =====================
>> FAIL
>>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>>          meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:10
>>              GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
>>      
>>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>>          meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:11
>>              GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
>>      
>>      
>>      Code Summary
>>      ============
>>      
>>      APPEND-2
>>      -------------------------------------------
>>        :append simply takes the specified string and concatenates it
>>        directly to the variable.  Most of the time we want there to spaces
>>        between entries.  This check flags us to check if the missing space
>>        is actually needed.
> 
> This check in this particular instance is invalid. GO_TAGS is a comma separated
> list of flags. Any whitespace will break parsing of that variable.

I updated the rules to use file regex instead of full path.  There was a 
rule for the emptty_0.13.0.bb recipe, but not emptty_0.14.0.bb.  This 
warning should not reappear in future patches.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


