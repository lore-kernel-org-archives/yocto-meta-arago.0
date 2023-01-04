Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C9FC54E76
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:15:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5172.1672870550703996162
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 14:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D54Rxynl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304MFjw5060849;
	Wed, 4 Jan 2023 16:15:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672870545;
	bh=GY8ghRE8yNvidAt9fMyx+LY3rqG+cqb79hM/rIr1go8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D54RxynlQ497Chu+ZR8t2Ve0FYj1GEYa5u5nU7f35GFoqeIFEOJoD6MVkl9e0giJS
	 Bz+AJU/CPpK4PPJbOHpxK2ZotpiiVnBGeqqfRMKKQ2TPuS5756JnJfoCoGj7MOnhpS
	 hAG220wZhh7+/2TjFWG8Ki9Y1JdZ5TLvBH2nD4sU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304MFjgM095839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 16:15:45 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 16:15:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 16:15:45 -0600
Received: from [10.250.33.81] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304MFiQA026955;
	Wed, 4 Jan 2023 16:15:44 -0600
Message-ID: <703f4c52-85a0-598e-c6c9-2e08d2048614@ti.com>
Date: Wed, 4 Jan 2023 16:15:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] weston: update bbappend
 9.0.0 -> 10.0.2
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230104190739.27676-1-afd@ti.com>
 <20230104210711.GL22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230104210711.GL22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 22:15:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14155

On 1/4/23 3:07 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 04, 2023 at 01:07:39PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> To match upstream oe-core/master.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   ...equire-GL_EXT_unpack_subimage-commit.patch | 91 +++++++++++++++++++
>>   ...ct-plane-based-on-current-attached-C.patch | 52 +++++------
>>   ..._9.0.0.bbappend => weston_10.0.2.bbappend} |  3 +-
>>   3 files changed, 115 insertions(+), 31 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>   rename meta-arago-distro/recipes-graphics/wayland/{weston_9.0.0.bbappend => weston_10.0.2.bbappend} (78%)
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> new file mode 100644
>> index 00000000..8bc882fb
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> @@ -0,0 +1,91 @@
>> +From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
>> +From: Andrew Davis <afd@ti.com>
>> +Date: Thu, 6 Oct 2022 15:49:31 -0500
>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>> +
>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>> +
>> +That commit removed support for GPU drivers without GL_EXT_unpack_subimage
>> +which SGX does not support. Add back support for GPUs without this
>> +extension.
> 
> The obvious question - how safe is it to assume GL_EXT_unpack_subimage is
> not being used some place else outside of this commit and not guarded by:
> 
> if (!gr->has_unpack_subimage)
> 
> 
> Is this extention really in the driver, or just in a Mesa API translation
> layer? Could it be better fixed in the DDK?
> 

You are right, it is not a very safe assumption, this patch is almost certainly
not complete for all cases. And even if it was, it only fixes Weston, others like
wlroots have the same issues[0], so other compositors are going to be broken too.

Long term this extension will need added to the driver. Unfortunately all work on
keeping this driver alive is unofficial, and I just don't have the free time to
add and test new extensions right now :(

Andrew

[0] https://github.com/tmlind/wlroots/commit/04491889240bbadb693aa37036dc55835118b2cc

