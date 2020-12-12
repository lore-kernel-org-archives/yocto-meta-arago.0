Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 9D787529D4
	for <meta-arago@arago-project.org>;
	Sat, 12 Dec 2020 04:09:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BC49Z5m102007
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 22:09:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607746175;
	bh=ZgN4nvqTlBIjMYcZigK71FnMHgh+wujsqo3J3PiUVnI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Dug0hmCHbgx2F8wuCsTauyz9zi+iL6vLgB9p9zJ6BJe3MkKdeyHuYxb8/ZqywSWN7
	CUIePzkMHqO1kekFCcYMwxbSWtS69WeQeKLyaSafbZGZFr+3Q/UBye69If17JS7b9r
	Jn18pIRodtve4ImVezCc6lJY/yPDmZ3NG//GClvE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BC49ZOr016012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 22:09:35 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 11 Dec 2020 22:09:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 11 Dec 2020 22:09:34 -0600
Received: from [10.250.38.234] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BC49YYY040486;
	Fri, 11 Dec 2020 22:09:34 -0600
To: Dan Murphy <dmurphy@ti.com>, Suman Anna <s-anna@ti.com>
References: <20201210223235.12724-1-praneeth@ti.com>
	<d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
	<ea15b5a1-4326-8dce-6c8c-f14bfb27ba8f@ti.com>
	<42d9765f-4e2e-c8d7-1fc7-db89425dffab@ti.com>
	<91439790-2254-0085-025a-92cec9fbfa0e@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <f06d1813-5681-08da-52b0-16673c1fec88@ti.com>
Date: Fri, 11 Dec 2020 22:09:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <91439790-2254-0085-025a-92cec9fbfa0e@ti.com>
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
X-List-Received-Date: Sat, 12 Dec 2020 04:09:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/11/20 6:14 AM, Dan Murphy wrote:
> Praneeth
> 
> On 12/10/20 4:42 PM, Suman Anna wrote:
>> On 12/10/20 4:36 PM, Bajjuri, Praneeth wrote:
>>>
>>> On 12/10/2020 4:33 PM, Dan Murphy wrote:
>>>> Praneeth
>>>>
>>>> On 12/10/20 4:32 PM, praneeth@ti.com wrote:
>>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>>
>>>>> updating SRCREV to pick the latest commit on
>>>>> repo: ti-optee-os.git
>>>>> branch: ti-optee-os
>>>>>
>>>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>>>> ---
>>>>>    .../recipes-security/optee/optee-os_git.bbappend            | 6 
>>>>> ++++--
>>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git 
>>>>> a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>> index 677c6dd0..28b9b6c5 100644
>>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>> @@ -1,7 +1,9 @@
>>>>>    PR_append = ".arago0"
>>>>>    SRC_URI = 
>>>>> "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>>> -           
>>>>> file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>>> +       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>> Why is this 0006? What are the other 5 patches?
>>> As per this ,
>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch?id=715c9f8f98534655c3a368c50ceaf7a1f12da084 
>>>
>>>
>>>
>>> that patch has been updated for 3.10+ recipe update.
>> That's on master branch...dunfell branch has only one file, the 
>> previous one.
>> So, I guess you need to patch it up separately...
> 
> This patch fails to build as Suman pointed out this is on the master 
> branch and not applicable to dunfell.

Will send separate patches for each branch.

> 
> Dan
> 
> 

