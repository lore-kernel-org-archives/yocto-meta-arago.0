Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A37C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:18:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.45607.1655828323215166095
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 09:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e8OeC9jz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25LGIcoc035508;
	Tue, 21 Jun 2022 11:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655828318;
	bh=lPSnnNvX//olSKXSfgEFJVsKBg2oRZkQi3xnuTTgZPQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e8OeC9jzBCYDGdIcFa5JiPsTPDhV0LVLgYiWUDGfI4rxD8PIam5evCKiIoziNftfp
	 S5B0w266r3aASVaqLqRLSp3EShDtM+GMmfWAGfH/yeuI6w992PnzMvA8yxqSmHG1uf
	 E+I09ndWtjc2OPVKv3QyOxBcPFMaGmMO2JjXlzIg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25LGIcXQ042946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jun 2022 11:18:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Jun 2022 11:18:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Jun 2022 11:18:38 -0500
Received: from [10.250.33.138] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25LGIbsB048665;
	Tue, 21 Jun 2022 11:18:37 -0500
Message-ID: <c0fa45c2-cd6d-55de-7914-9db76af0c92c@ti.com>
Date: Tue, 21 Jun 2022 11:18:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-arago][dunfell/master][PATCH] tisdk-bundle: fix
 prebuilt-images U-Boot binary name for HS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20220621153900.27066-1-afd@ti.com>
 <20220621155047.GA9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220621155047.GA9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jun 2022 16:18:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13914

On 6/21/22 10:50 AM, Denys Dmytriyenko wrote:
> On Tue, Jun 21, 2022 at 10:39:00AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> HS builds do not generate a -${MACHINE} version of the u-boot.img binary.
>> Not sure why we deploy these named this way to begin with, maybe a left-
>> over from when we had multiple machines per SDK.. To fix the HS builds
>> lets ship the binary named as-is for all platforms.
> 
> This could potentially mess up with the way Processor SDK (installer, setup
> scripts, etc.) expects U-boot binary to be called. I.e. the stuff outside of
> CoreSDK and the Yocto build... But I'm not sure, just speculating here.
> 
What the installers expect U-Boot to be called doesn't change what it should
be called. To boot from filesystem it should be called 'u-boot.img`, this
is the name made by U-Boot build, this is how it is called in the public
u-boot docs, and the name we should use.

I cannot check every workflow, if it is different outside of Yocto build,
then it is wrong there and should be fixed at that level.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-arago-distro/classes/tisdk-bundle.bbclass | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> index 7e3f4c26..9e961e1b 100644
>> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> @@ -777,9 +777,9 @@ tisdk_image_build () {
>>       fi
>>   
>>       # Copy the U-Boot image if it exists
>> -    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ]
>> +    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot.img ]
>>       then
>> -        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ${prebuilt_dir}/
>> +        cp ${DEPLOY_DIR_IMAGE}/u-boot.img ${prebuilt_dir}/
>>       elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
>>       then
>>           cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ${prebuilt_dir}/
>> -- 
>> 2.36.1

