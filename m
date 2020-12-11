Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id B416C52A1A
	for <meta-arago@arago-project.org>;
	Fri, 11 Dec 2020 12:14:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBCEgtK034460
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 06:14:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607688882;
	bh=sTOOjmYDDCBNLsfKxhF5pyxD+OqLmRbX7AvF4GD/qus=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lFdmTTr1VoCXtyyjLr3KMIjCszujGAMJ5nDH9bZPAkHkKVUX0Ty+ajCwlMVxqWzQn
	rS0ND8elRY7hR+iT4j6DkUfJUDOSzvGAA4YT87yyMJE/HfKJsEkXDreRR6Oxz41DUI
	ru8OfkC16vRuRVhyhxc4D72eV3jcQjJ5ZLBC2Byc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBCEgce123514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 06:14:42 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 11 Dec 2020 06:14:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 11 Dec 2020 06:14:42 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBCEfBe060241;
	Fri, 11 Dec 2020 06:14:42 -0600
To: Suman Anna <s-anna@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>
References: <20201210223235.12724-1-praneeth@ti.com>
	<d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
	<ea15b5a1-4326-8dce-6c8c-f14bfb27ba8f@ti.com>
	<42d9765f-4e2e-c8d7-1fc7-db89425dffab@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <91439790-2254-0085-025a-92cec9fbfa0e@ti.com>
Date: Fri, 11 Dec 2020 06:14:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42d9765f-4e2e-c8d7-1fc7-db89425dffab@ti.com>
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
X-List-Received-Date: Fri, 11 Dec 2020 12:14:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Praneeth

On 12/10/20 4:42 PM, Suman Anna wrote:
> On 12/10/20 4:36 PM, Bajjuri, Praneeth wrote:
>>
>> On 12/10/2020 4:33 PM, Dan Murphy wrote:
>>> Praneeth
>>>
>>> On 12/10/20 4:32 PM, praneeth@ti.com wrote:
>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>
>>>> updating SRCREV to pick the latest commit on
>>>> repo: ti-optee-os.git
>>>> branch: ti-optee-os
>>>>
>>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>>> ---
>>>>    .../recipes-security/optee/optee-os_git.bbappend            | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> index 677c6dd0..28b9b6c5 100644
>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> @@ -1,7 +1,9 @@
>>>>    PR_append = ".arago0"
>>>>    SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>> +       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
>>> Why is this 0006? What are the other 5 patches?
>> As per this ,
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch?id=715c9f8f98534655c3a368c50ceaf7a1f12da084
>>
>>
>> that patch has been updated for 3.10+ recipe update.
> That's on master branch...dunfell branch has only one file, the previous one.
> So, I guess you need to patch it up separately...

This patch fails to build as Suman pointed out this is on the master 
branch and not applicable to dunfell.

Dan



