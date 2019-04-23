Return-Path: <dmurphy@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5148D52987
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2019 18:54:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NIsOnr017386
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556045664;
	bh=TH8v9onY7YswAuOjUtQFeKWA8dKCSBKtJvIhV4phczg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=WGYE2EfrNlfX2hoK+O50VuHn/suqGCIQb/RM3MWV9WTj9Z9okCQTFyEFvr+N7JfAX
	b//RSC6kcfce2pgkhqSM1oq/jrEl6JVHXaaVhnjMz8NAoy5ztFFReK/im3Ox/IvQbs
	WCfKdkogkexI7DhYabiXgwXkVwiVf76F8y+qK4GE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NIsOg1026480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:54:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 13:54:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 13:54:24 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NIsNfM081857;
	Tue, 23 Apr 2019 13:54:23 -0500
To: "Andrew F. Davis" <afd@ti.com>, <meta-arago@arago-project.org>,
	<denys@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <128ca4ca-f51a-1732-2293-25e000b03a5e@ti.com>
Date: Tue, 23 Apr 2019 13:54:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Tue, 23 Apr 2019 18:54:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andrew

On 4/23/19 1:52 PM, Andrew F. Davis wrote:
> On 4/23/19 2:40 PM, Dan Murphy wrote:
>> +Andrew
>>
>> On 4/23/19 1:38 PM, Dan Murphy wrote:
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> index 2204a50c..ee87b3c7 100644
>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>  
>>>  PR_append = ".arago0"
>>>  
>>> -PV = "3.2.0+git${SRCPV}"
>>> +PV = "3.5.0+git${SRCPV}"
> 
> Might want to do the same for client/test, but they got tagged at 3.4.0,
> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
> to move them here, it should not be a problem.
> 

Yeah rc1 was not tagged with these so rc2 we will update them

Dan

> Andrew
> 
>>>  
>>>  is_armv7 = "1"
>>>  is_armv7_aarch64 = "0"
>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>  "
>>>  BRANCH = "ti_optee_os"
>>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>>>  
>>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>>>

