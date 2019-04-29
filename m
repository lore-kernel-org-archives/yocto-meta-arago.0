Return-Path: <afd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6D5C152987
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 20:13:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TKDLpL112441
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556568801;
	bh=WFrnfOpVmunxuNXbfRCwAm/r8UzcVFQyUrX6rek7goM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=R27YL/GmBzHXcrGJ/EJy4HdfIKzbbFhvONa2b6aldc7hZIBHFSmoqO1PjS+ndrcnJ
	J9SOxlvpa9JL6bJKD3wkRdnvbv/sRHnKZ/iA3pEbkij3QFt6jlJqkKAJ7jwxi1rf8Z
	KtaUtbu9HmGuhyv8JsmEuqQPMXwxYQQPO/EAVSwk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TKDLNb073554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:13:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 15:13:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 15:13:20 -0500
Received: from [10.250.67.168] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TKDKca015767;
	Mon, 29 Apr 2019 15:13:20 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
	<20190429181337.GD19665@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <3763781f-8243-8e62-0b0d-bc360193fbde@ti.com>
Date: Mon, 29 Apr 2019 16:13:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429181337.GD19665@beryl>
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
X-List-Received-Date: Mon, 29 Apr 2019 20:13:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/29/19 2:13 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 23, 2019 at 02:52:20PM -0400, Andrew F. Davis wrote:
>> On 4/23/19 2:40 PM, Dan Murphy wrote:
>>> +Andrew
>>>
>>> On 4/23/19 1:38 PM, Dan Murphy wrote:
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> index 2204a50c..ee87b3c7 100644
>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>>  
>>>>  PR_append = ".arago0"
>>>>  
>>>> -PV = "3.2.0+git${SRCPV}"
>>>> +PV = "3.5.0+git${SRCPV}"
> 
>> Might want to do the same for client/test, but they got tagged at 3.4.0,
>> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
>> to move them here, it should not be a problem.
> 
> Andrew,
> 
> It seems there were few more commits that went into the official 3.5.0 
> release, which was released 3 days ago. Do you want to re-merge to include 
> those?
> 

Merged the extra patches as ti-optee-os (note the '-', not '_'), I want
to deprecate out the branch name with underscores if I can, none of the
other projects are named like that, so I'd like to start using this
branch. Not sure what churn that will cause but hopefully will be easy
enough to do now.

Thanks,
Andrew

> Denys
> 
> 
>>>>  is_armv7 = "1"
>>>>  is_armv7_aarch64 = "0"
>>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>>>  "
>>>>  BRANCH = "ti_optee_os"
>>>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>>>>  
>>>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>>>>

