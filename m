Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328BFC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:59:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2583.1698767987921475947
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 08:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GvZe8u4a;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39VFxh36104590;
	Tue, 31 Oct 2023 10:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698767983;
	bh=vMV3xnvPoaZ85NQ+HExPJR3fBVYeDwmN9iKCCMB+lRE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GvZe8u4a2rXMJHT/W8YW6DOthB8Eol8rES9MtJKTCqRInQMGPgbeMdptuZxW6NcCx
	 u43sUNyE5gSkj5Zy6/vBwszqwETXqt/odbaVRldOuqOFeFmih5hDvaX3Yfhxmra5RE
	 ebC7gv7XiM78dT0QLMy/CtnsTlCcP5Ac7c3hyQdw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39VFxh9R076927
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Oct 2023 10:59:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 10:59:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 10:59:43 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39VFxhAN119196;
	Tue, 31 Oct 2023 10:59:43 -0500
Message-ID: <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
Date: Tue, 31 Oct 2023 10:59:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add
 code to not fail on tar error
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231031154434.GF2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 15:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14980



On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
> On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We want to add an image into the core bundle, but that image does not
>> have any opkg .control files.  tar apparently errors out if you ask it
>> to extract out files but the files are not in the archive, and the
>> recipes are setup that if any of the commands in the shell error out,
>> then the entire recipe fails.
>>
>> Simple fix, add an || (or) condition to the tar command to print a
>> message that there were not any control files instead of erroring out.
> 
> So, simply bypassing tar error due to missing *.control files still won't
> enable you to properly generate the SW manifest. As those *.control files
> from individual packages are parsed to extract the license information.
> And they are missing because tiny image specifically disables "package
> management" to save on space. Therefore tiny image was not included in
> the bundle, since it doesn't generate the SW manifest.

And this is why I sent the patch in rather than just taking it.  This 
patch was a response to Chirag running in the above error when trying to 
add the tiny image into the core bundle in the processor sdk.

So, why do we want to add tiny to the bundle?  Since tiny should be a 
subset of the other images, is there anything not covered in the 
software manifest that should prevent this patch?

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>> index 14d14f08..b9c63610 100644
>> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>> @@ -405,10 +405,10 @@ sw_manifest_target() {
>>           # Only extract tar.gz or tar.bz2 types
>>           if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
>>           then
>> -            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>> +            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
>>           elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
>>           then
>> -            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>> +            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
>>           fi
>>       done
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

