Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB4C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 20:06:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5438.1685736405664083852
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 13:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A8be/EfE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 352K6eXU052236;
	Fri, 2 Jun 2023 15:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685736400;
	bh=Bwy4TK+VVU+His2zz2UhRFZnLWyAoFnfzoNr/AWvBA0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A8be/EfEcLHSln7vjK129nPcx5MWKvfS8hCSQSKp3gPzVRS4cvcaslASPcsOZsSXP
	 2oI3O8YCC0Kgjvmt2N9bWZcxtb8LF/sZOvONVYZfqU3vSmARHgLzjR3elcfgRqmwsI
	 Ryr2u1RZbVQOuEPZ399Lo6DWAvuvdaBTEvd8f1KY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 352K6e7D087137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jun 2023 15:06:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 15:06:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 15:06:40 -0500
Received: from [10.249.39.97] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 352K6eVZ011654;
	Fri, 2 Jun 2023 15:06:40 -0500
Message-ID: <996bf1c3-980a-c1ff-96c1-e879156914ba@ti.com>
Date: Fri, 2 Jun 2023 15:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] clacc: Fix TARGET name
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230602182716.2344-1-reatmon@ti.com>
 <20230602191123.GP9226@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230602191123.GP9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Jun 2023 20:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14493



On 6/2/2023 14:11, Denys Dmytriyenko wrote:
> On Fri, Jun 02, 2023 at 01:27:16PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The last update that fixed the syntax of changing _ to : was a little
>> too aggressive and changed the TARGET values incorrectly.
> 
> Might want to drop this comment:

Yeah.  We figured it out after I had made the commit.  I should really 
not include things like in commit messages.  I'll fix it.


>> Not sure why it took this long to see this pop up.
> 
> Because opencl was disabled since dunfell until this commit:
> https://git.yoctoproject.org/meta-arago/commit/?id=1e2df30581aeb8c6f0e60bc0be788bc36f0f9d6a
> 
> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
>> index 4d78e7b7..f56d65cc 100644
>> --- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
>> +++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
>> @@ -9,9 +9,9 @@ RDEPENDS:${PN} += "clocl"
>>   
>>   S = "${WORKDIR}/git/host"
>>   
>> -TARGET:class-target = "clacc:arm"
>> -TARGET:class-native = "clacc:x86"
>> -TARGET:class-nativesdk = "clacc:x86"
>> +TARGET:class-target = "clacc_arm"
>> +TARGET:class-native = "clacc_x86"
>> +TARGET:class-nativesdk = "clacc_x86"
>>   
>>   export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
>>   export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

