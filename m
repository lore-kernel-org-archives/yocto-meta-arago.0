Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AEE8F529D8
	for <meta-arago@arago-project.org>;
	Thu,  5 Nov 2020 19:08:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5J5XoM099112
	for <meta-arago@arago-project.org>; Thu, 5 Nov 2020 13:05:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604603133;
	bh=BElypf62tr+bfV1c+8SW9QB8avdw82X3XBQAnsz6A94=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=tq0UzBPLZM4rrHLM0YAH07LmU50aMKlicqqzavo0Y5aZbfrotFRnvCAzKJ/MCey8y
	5VjWT6yG2DIR6tHWIpM3rVenZC0RAPA6RUoZwDx/dkPdQBGMnb6TBlQYe8LWDm422p
	Jj8vswQdU75yieSpir+stNFN0amfnt1Mdzxd6sU0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5J5Xc6025500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Nov 2020 13:05:33 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 5 Nov 2020 13:05:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 5 Nov 2020 13:05:33 -0600
Received: from [10.250.64.205] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5J5W2O101368;
	Thu, 5 Nov 2020 13:05:33 -0600
To: "Weaver, Lucas" <l-weaver@ti.com>, Denys Dmytriyenko <denys@ti.com>
References: <20201027024112.5330-1-s-anna@ti.com>
	<20201027024533.GR19741@beryl>
	<21098998-f191-b9f0-79af-26b1045c6a54@ti.com>
	<20201027040839.GS19741@beryl>
	<39ea11fd-e4bf-3133-b280-ece903a9b9f8@ti.com>
	<20201027191149.GY19741@beryl>
	<4469fbf2-fe4f-df39-351c-318411f9e7ed@ti.com>
	<cac59c6e-b76b-6572-f8ad-a84d685a86d0@ti.com>
	<20201103000508.GA3224@beryl>
	<451e7d9c-e9a9-7744-680d-59446e8907bb@ti.com>
	<c14ddf42-e574-96ab-0077-044959659b89@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <78661ee3-096a-e18a-76e1-d257cdb98a82@ti.com>
Date: Thu, 5 Nov 2020 13:05:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c14ddf42-e574-96ab-0077-044959659b89@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Thu, 05 Nov 2020 19:08:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/5/20 12:31 PM, Weaver, Lucas wrote:
> 
> 
> On 11/2/2020 6:14 PM, Suman Anna wrote:
>> On 11/2/20 6:05 PM, Denys Dmytriyenko wrote:
>>> On Mon, Nov 02, 2020 at 04:53:56PM -0600, Suman Anna wrote:
>>>> Hi Dan,
>>>>
>>>> On 11/2/20 4:18 PM, Dan Murphy wrote:
>>>>> Suman
>>>>>
>>>>> On 10/27/20 2:11 PM, Denys Dmytriyenko wrote:
>>>>>> On Tue, Oct 27, 2020 at 09:37:18AM -0500, Suman Anna wrote:
>>>>>>> Hi Denys,
>>>>>>>
>>>>>>> On 10/26/20 11:08 PM, Denys Dmytriyenko wrote:
>>>>>>>> On Mon, Oct 26, 2020 at 09:48:26PM -0500, Suman Anna wrote:
>>>>>>>>> On 10/26/20 9:45 PM, Denys Dmytriyenko wrote:
>>>>>>>>>> On Mon, Oct 26, 2020 at 09:41:12PM -0500, Suman Anna wrote:
>>>>>>>>>>> Add the ti-rpmsg-char dev packages to make the public headers
>>>>>>>>>>> available in
>>>>>>>>>>> the target fileystem so that applications can be compiled natively on
>>>>>>>>>>> the
>>>>>>>>>>> target.
>>>>>>>>>> -sdk-target is not for the target filesystem!
>>>>>>>>>> It is for the target sysroot in the devkit.
>>>>>>>>> Hmm, is this supposed to go into a different file or my patch description
>>>>>>>>> needs
>>>>>>>>> correcting?
>>>>>>>> It depends on what you actually need.
>>>>>>> I want the files from the  ti-rpmsg-char-dev package (the public header
>>>>>>> files
>>>>>>> and libti_rpmsg_char.so) to be part of the FS tarball.
>>>>>> Then you need to pull corresponding -dev package into the packagegroup that
>>>>>> builds up the rootfs.
>>>>>>
>>>>>> At least in Arago, I kept the namespace convention that -sdk-target and
>>>>>> -sdk-host suffixes are used to identify packagegroups for the devkit -
>>>>>> cross-compile development environment on the host, target and host sysroots.
>>>>>>
>>>>>>> regards
>>>>>>> Suman
>>>>>>>
>>>>>>>>
>>>>>>>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>>>>>>>> ---
>>>>>>>>>>>    .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 8
>>>>>>>>>>> ++++++--
>>>>>>>>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git
>>>>>>>>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>>>>>>>>>>
>>>>>>>>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> index e372dd67744e..b55c79a4d4df 100644
>>>>>>>>>>> ---
>>>>>>>>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> +++
>>>>>>>>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> @@ -1,6 +1,6 @@
>>>>>>>>>>>    DESCRIPTION = "Task to install headers and libraries related to
>>>>>>>>>>> addons
>>>>>>>>>>> into the SDK"
>>>>>>>>>>>    LICENSE = "MIT"
>>>>>>>>>>> -PR = "r43"
>>>>>>>>>>> +PR = "r44"
>>>>>>>>>>>      PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>>>>>>>    @@ -143,7 +143,11 @@ UTILS_append_dra7xx = " can-utils-dev \
>>>>>>>>>>>                            elfutils-staticdev \
>>>>>>>>>>>    "
>>>>>>>>>>>    UTILS_append_k2g = " can-utils-dev"
>>>>>>>>>>> -UTILS_append_k3 = " can-utils-dev"
>>>>>>>>>>> +UTILS_append_k3 = "\
>>>>>>>>>>> +    can-utils-dev \
>>>>>>>>>>> +    ti-rpmsg-char-dev \
>>>>>>>>>>> +    ti-rpmsg-char-staticdev \
>>>>>>>>>>> +"
>>>>>>>>>>>      EXTRA_LIBS = ""
>>>>>>>>>>>    EXTRA_LIBS_append_ti43x = "\
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.28.0
>>>>>>>>>>>
>>>>>
>>>>> Does this need to go in or are you going to send in v2?
>>>>
>>>> I am confused by the terminology above, I am not sure if I need to move this to
>>>> the packagegroup-arago-tisdk-addons.bb file, or if this is just a question of
>>>> writing the proper patch description. I cannot verify myself until I fix my OE
>>>> build issues.
>>>
>>> Suman,
>>>
>>> If you do need these development packages on the target rootfs, then you do
>>> need to add them to packagegroup-arago-tisdk-addons.bb
>>>
>>> But if you need them to be part of the devkit (cross-compile development
>>> environment on the host), then you need to add to the corresponding
>>> packagegroup-arago-tisdk-addons-sdk-target.bb
>>>
>>> In other words, do you expect someone to compile natively on the target
>>> against your library and headers? Then it's the first one. But, enabling
>>> native development environment on the target should not be decided lightly.
>>> As a matter of fact, for 7.0 we removed this from the default rootfs,
>>> expecting users to be able to add it optionally from package feeds. Though
>>> public package feeds were not ready and got postponed...
>>>
>>> So, my point is - what are you trying to achieve here? Why do you need -dev
>>> package on the target filesystem? If you are trying to enable other developers
>>> to build apps against your library, could they just write a recipe? Is it
>>> really necessary for the default rootfs? Anyway, hopefully these questions
>>> could guide you towards the proper solution. Please let me know if you still
>>> have questions :)
>>>
>>
>> Thanks for the explanation Denys. The ask is to be able to compile on the
>> target, believe for some Vision Apps.
>>
>> Lucas,
>> Can you confirm/clarify the need/usage exactly?
> Suman,
> 
> Sorry for the delay.  We need this for cross compiling on the host, so including
> in the devkit should be sufficient.

Lucas,

Hmm, ok. Then I misunderstood what you were asking before. So, does this patch
work for you? If it is, then I will post a v2 correcting the patch description.

regards
Suman


