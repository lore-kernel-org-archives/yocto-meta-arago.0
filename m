Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B68DC54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 19:19:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.25038.1674587954987449035
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 11:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lbIFqnXF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30OJJ9Pc042906;
	Tue, 24 Jan 2023 13:19:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674587949;
	bh=th9WEDdrAqq7wLrNVZEITAHS79TJn0xu/3COK/IrHbI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lbIFqnXFIoCoezqz+BzADIxEJ+JOdWhpye7WnKw8KzrAyGwHWFKEIaMSKoTzJa2c4
	 CPPwU2eSTL5Kmx53kSRMgVsJRiUuYynHEMdJNju9rV7ioi1pYNXtuSyiYUQPLO0I56
	 71tiiNNT2Wrm0XwfrdUlAEFQM4ptEKisOxU53j0g=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30OJJ9Zd013297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 13:19:09 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 13:19:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 13:19:09 -0600
Received: from [10.250.32.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30OJJ8S4013392;
	Tue, 24 Jan 2023 13:19:09 -0600
Message-ID: <e7ae3521-373c-28c0-fc39-d30553f6afd3@ti.com>
Date: Tue, 24 Jan 2023 13:19:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-arago] [master/kirkstone][PATCH] libdrm: remove alternative
 setup for kmstest
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>
References: <20230105212608.2105546-1-denis@denix.org>
 <7668158d-2a76-3025-d01f-3b48e0692a2e@ti.com>
 <20230124191506.GY22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230124191506.GY22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Jan 2023 19:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14182


Well... that would certainly make a difference.  Let me test that.


On 1/24/2023 13:15, Denys Dmytriyenko wrote:
> Sorry, my bad, this is only for master with latest libdrm, not kirkstone:
> https://git.yoctoproject.org/meta-arago/commit/?id=548657e4d8118af98ad047a7c19b3cc49b7480bb
> 
> 
> On Tue, Jan 24, 2023 at 08:16:00AM -0600, Ryan Eatmon wrote:
>> I'm not 100% certain, but all of the builds are now failing with this error:
>>
>>
>> tisdk-default-image_1.0-r0_do_rootfs.log
>> ----------------------------------------
>>
>> WARNING: kms++.postinst returned 1, marking as unpacked only,
>> configuration required on target.
>> ERROR: Postinstall scriptlets of ['kms++'] have failed. If the
>> intention is to defer them to first boot,
>> then please place them into pkg_postinst_ontarget:${PN} ().
>> Deferring to first boot via 'exit 1' is no longer supported.
>> Details of the failure are in /scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
>> DEBUG: Python function do_rootfs finished
>>
>>
>> Seeing as this is the only recent change that mentions kms, this
>> might be culprit?
>>
>>
>> On 1/5/2023 15:26, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> libdrm no longer provides kms driver and tests for it.
>>>
>>> Fixes:
>>>
>>> WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alternative target (/usr/bin/kmstest or /usr/bin/kmstest.libdrm) does not exist, skipping...
>>> WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: NOT adding alternative provide /usr/bin/kmstest: /usr/bin/kmstest.libdrm does not exist
>>> WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alt_link == alt_target: /usr/bin/kmstest == /usr/bin/kmstest
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend | 8 +-------
>>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
>>> index 85152b5f..ea8b5ca1 100644
>>> --- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
>>> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
>>> @@ -8,10 +8,4 @@ file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
>>>   file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
>>>   "
>>> -PR:append = ".arago3"
>>> -
>>> -inherit update-alternatives
>>> -
>>> -ALTERNATIVE_PRIORITY = "10"
>>> -ALTERNATIVE:${PN} = "kmstest"
>>> -ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
>>> +PR:append = ".arago4"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

