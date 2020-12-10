Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 5C2F4529A2
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 22:42:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMgp74015858
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:42:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607640171;
	bh=597p6RFypgYAsVh/skiy2ZHmhZj4y1tG51gizd2jyR0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=M7sO4YLKOSQeFHVeTzwL0EDcpeS+7gcwA6+rvYLbdmlehkUEW8ZPlvLXmwH/0ql5D
	6UNpfo/tbyOWfl2kvchqpMDwbBNoE6ZquBpAl5Hn2a0uanFpJ9HJ4NxgLaYNJlc9qd
	h+aAWNFCurXlXeE2RAujjZf17XN3zzh7Dpm7RzPM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAMgpqu020965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:42:51 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 10 Dec 2020 16:42:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 10 Dec 2020 16:42:50 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMgokP063657;
	Thu, 10 Dec 2020 16:42:50 -0600
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
References: <20201210223235.12724-1-praneeth@ti.com>
	<d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
	<ea15b5a1-4326-8dce-6c8c-f14bfb27ba8f@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <42d9765f-4e2e-c8d7-1fc7-db89425dffab@ti.com>
Date: Thu, 10 Dec 2020 16:42:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea15b5a1-4326-8dce-6c8c-f14bfb27ba8f@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] optee-os: update SRCREV to pick latest
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2020 22:42:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/10/20 4:36 PM, Bajjuri, Praneeth wrote:
> 
> 
> On 12/10/2020 4:33 PM, Dan Murphy wrote:
>> Praneeth
>>
>> On 12/10/20 4:32 PM, praneeth@ti.com wrote:
>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>
>>> updating SRCREV to pick the latest commit on
>>> repo: ti-optee-os.git
>>> branch: ti-optee-os
>>>
>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>> ---
>>>   .../recipes-security/optee/optee-os_git.bbappend            | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> index 677c6dd0..28b9b6c5 100644
>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> @@ -1,7 +1,9 @@
>>>   PR_append = ".arago0"
>>>   SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>> +       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
>>
>> Why is this 0006? What are the other 5 patches?
> 
> As per this ,
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch?id=715c9f8f98534655c3a368c50ceaf7a1f12da084
> 
> 
> that patch has been updated for 3.10+ recipe update.

That's on master branch...dunfell branch has only one file, the previous one.
So, I guess you need to patch it up separately...

regards
Suman


