Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B40DC52985
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2019 00:08:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3O07pY8104516
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556064471;
	bh=PdGJNILFuQ8yvPfgXJ99hJnAzU8+Hsl8+XUEMS+OrWM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=xRLPti9cvAy3No7a0c5CkEjYtyE4SrXZbYjCHzBl99wCi7z3KzUKu+Sy2xDT07CJD
	BRryWW9ojrivXTNlzNI1Oyfx6HnsRB1S4mnmIxCDSKTKj+vMwxhTfD9wDWw3BX1q9E
	QZKp74ibePzs3ZGdHfkevrUutIcdiZU+OzRNMqSI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3O07pLt011830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:07:51 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 19:07:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 19:07:50 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3O07od1054776;
	Tue, 23 Apr 2019 19:07:50 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
	<128ca4ca-f51a-1732-2293-25e000b03a5e@ti.com>
	<20190423214510.GB6705@beryl>
	<f3b645a0-4d38-58e2-b92c-13cf3ab41970@ti.com>
	<20190423215821.GD6705@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <5e742659-83f2-345e-02ad-ca8a1b2cacdb@ti.com>
Date: Tue, 23 Apr 2019 19:07:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423215821.GD6705@beryl>
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
X-List-Received-Date: Wed, 24 Apr 2019 00:08:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 4/23/19 4:58 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 23, 2019 at 04:47:05PM -0500, Dan Murphy wrote:
>> Denys
>>
>> On 4/23/19 4:45 PM, Denys Dmytriyenko wrote:
>>> ERROR: QA Issue: optee-os: The LIC_FILES_CHKSUM does not match for file://.../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE;md5=69663ab153298557a59c67a60a743e5b
>>> optee-os: Check if the license information has changed in .../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE to verify that the LICENSE value "BSD" remains valid [license-checksum]
>>>
>>
>> Is this a version mismatch then?  Andrew said this was 3.5.0-rc1 but it 
>> appears that this is not what is in the os code.
>>
>> Maybe the PV should be 
>>
>> PV = "3.4.0+git${SRCPV}"
> 
> Yes, it was already 3.4.0 in thud - looks like you used the old branch as a 
> base for your patch.

Oh you are right I updated to thud for meta-ti.
I have not done meta-arago in so long I forgot to update that

Dan


> 
>> Dan
>>
>>>
>>> On Tue, Apr 23, 2019 at 01:54:24PM -0500, Dan Murphy wrote:
>>>> Andrew
>>>>
>>>> On 4/23/19 1:52 PM, Andrew F. Davis wrote:
>>>>> On 4/23/19 2:40 PM, Dan Murphy wrote:
>>>>>> +Andrew
>>>>>>
>>>>>> On 4/23/19 1:38 PM, Dan Murphy wrote:
>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>> ---
>>>>>>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>>> index 2204a50c..ee87b3c7 100644
>>>>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>>>>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>>>>>  
>>>>>>>  PR_append = ".arago0"
>>>>>>>  
>>>>>>> -PV = "3.2.0+git${SRCPV}"
>>>>>>> +PV = "3.5.0+git${SRCPV}"
>>>>>
>>>>> Might want to do the same for client/test, but they got tagged at 3.4.0,
>>>>> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
>>>>> to move them here, it should not be a problem.
>>>>>
>>>>
>>>> Yeah rc1 was not tagged with these so rc2 we will update them
>>>>
>>>> Dan
>>>>
>>>>> Andrew
>>>>>
>>>>>>>  
>>>>>>>  is_armv7 = "1"
>>>>>>>  is_armv7_aarch64 = "0"
>>>>>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>>>>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>>>>>  "
>>>>>>>  BRANCH = "ti_optee_os"
>>>>>>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>>>>>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>>>>>>>  
>>>>>>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>>>>>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>>>>>>>

