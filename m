Return-Path: <afd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 108ED529EF
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 20:21:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TKKxxN109593
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556569259;
	bh=bI5j3/LhG/ZPYipfuKYD5Hl6hQy7LvyZi7moW+fr0Xw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RGjTVxYuN+3AWJ3p3mOKAHDlW9Od1XnwZ5isrdof1NSbEGReyFRe1fmGhHwd6oNMT
	YqpjbTKMQYTOMKdfFUPuoxQOmUBipeslHwG+gpKT84r/wpPgvsZD283I30Q289Vu1n
	92C1TaOV/Ht/PqTbczbgQotlIiTVvh0BbI9zREGQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TKKxv4084175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:20:59 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 15:20:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 15:20:59 -0500
Received: from [10.250.67.168] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TKKwng047056;
	Mon, 29 Apr 2019 15:20:58 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
	<20190429181337.GD19665@beryl>
	<3763781f-8243-8e62-0b0d-bc360193fbde@ti.com>
	<20190429201554.GH19665@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <ffd69583-358b-64d3-49c8-614fcc1d4073@ti.com>
Date: Mon, 29 Apr 2019 16:20:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429201554.GH19665@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Mon, 29 Apr 2019 20:21:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/29/19 4:15 PM, Denys Dmytriyenko wrote:
> On Mon, Apr 29, 2019 at 04:13:21PM -0400, Andrew F. Davis wrote:
>> On 4/29/19 2:13 PM, Denys Dmytriyenko wrote:
>>> On Tue, Apr 23, 2019 at 02:52:20PM -0400, Andrew F. Davis wrote:
>>>> On 4/23/19 2:40 PM, Dan Murphy wrote:
>>>>> +Andrew
>>>>>
>>>>> On 4/23/19 1:38 PM, Dan Murphy wrote:
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>> ---
>>>>>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>> index 2204a50c..ee87b3c7 100644
>>>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>>>>  
>>>>>>  PR_append = ".arago0"
>>>>>>  
>>>>>> -PV = "3.2.0+git${SRCPV}"
>>>>>> +PV = "3.5.0+git${SRCPV}"
>>>
>>>> Might want to do the same for client/test, but they got tagged at 3.4.0,
>>>> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
>>>> to move them here, it should not be a problem.
>>>
>>> Andrew,
>>>
>>> It seems there were few more commits that went into the official 3.5.0 
>>> release, which was released 3 days ago. Do you want to re-merge to include 
>>> those?
>>>
>>
>> Merged the extra patches as ti-optee-os (note the '-', not '_'), I want
>> to deprecate out the branch name with underscores if I can, none of the
>> other projects are named like that, so I'd like to start using this
>> branch. Not sure what churn that will cause but hopefully will be easy
>> enough to do now.
> 
> Thanks. client and test are still using underscores - plan to change those?
> 

Done, and test was reset to follow upstream master directly, before we
had the same content but some stray merges got in at some point, the
name change seems like a good opportunity to fix that.

Andrew

> 
>>>>>>  is_armv7 = "1"
>>>>>>  is_armv7_aarch64 = "0"
>>>>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>>>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>>>>  "
>>>>>>  BRANCH = "ti_optee_os"
>>>>>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>>>>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>>>>>>  
>>>>>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>>>>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>>>>>>

