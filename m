Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A10C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 18:31:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.351.1648578691911147705
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 11:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qEzSyPtU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TIVS23089684;
	Tue, 29 Mar 2022 13:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648578688;
	bh=drlbESHgfXoHy/4jCFgmvdFXA6G4yEtoX/erESY4p8M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qEzSyPtUaNtjlMMPSDfW3DSp5Dv3GBgyJ30NsqqVtDBymkHzbJT39lQ60BE5g7KtW
	 iyyLJwLdzTVtxqP6Yu2aEmu5nOrpUF6SWtGk03DQtUCgoykPRxrBsKPvCZmiLF72TO
	 MduGgTj68LRgxN+DurMsgJVCqoz+ybDjH72oA38A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TIVSco007606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 13:31:28 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 13:31:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 13:31:28 -0500
Received: from [10.247.23.244] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TIVRJ2119623;
	Tue, 29 Mar 2022 13:31:27 -0500
Message-ID: <baf9e1ae-b03f-5ae2-3c3f-be9bbd5fc609@ti.com>
Date: Tue, 29 Mar 2022 13:31:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [master/dunfell PATCH V6 00/12] recipes-core: Add a bootstrap
 Linux image
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Nishanth Menon <nm@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>
References: <20220324132526.26497-1-nm@ti.com>
 <20220324203944.GA23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220324203944.GA23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 18:31:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13764



On 3/24/2022 15:39, Denys Dmytriyenko wrote:
> On Thu, Mar 24, 2022 at 08:25:14AM -0500, Nishanth Menon wrote:
>> Board bringups are typically painful. however, over the years, folks
>> know of minimal debug tools that are pretty effective in helping debug
>> basic peripherals. Lets create a reusable packagegroup balancing the
>> tools from wisdom from various folks vs the size of the resultant
>> package.
>>
>> We would like to base such a system on more simplistic sysvinit (no
>> offence systemd, you are still our fav), as it has a much smaller
>> footprint.
>>
>> The board startup is best done with a minimal u-boot and kernel device
>> tree configurations.
>>
>> Dependency (for patch #12, depends on https://lore.kernel.org/all/20220314202840.18904-1-reatmon@ti.com/ )
>>
>> Changes since V5:
>> * Patch #10 - switch from GPLv2 to MIT to stick with standard licensing.
> 
> Thanks for addressing all the comments! The series looks good to me:
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 

Applied to dunfell-next.  I could not apply these patches to master as 
master has already started moving towards Kirkstone and the various 
syntax changes that entails.  We will work on migrating the patches to 
master and have another patch series for that branch.



>> V5: https://lore.kernel.org/all/20220322174808.16341-1-nm@ti.com/
>> V4: https://lore.kernel.org/all/20220319123310.8546-1-nm@ti.com/
>> V3: https://lore.kernel.org/all/20220318184045.11246-1-nm@ti.com/
>> V2: https://lore.kernel.org/all/20220318143735.17642-1-nm@ti.com/
>> V1: https://lore.kernel.org/all/20220309021316.28370-1-nm@ti.com/
>>
>>
>> Nishanth Menon (12):
>>    Revert "tisdk-tiny-image: remove packagedata task breaking initramfs
>>      packaging"
>>    tisdk-tiny-image: Split common components into include file
>>    tisdk-tiny-image: Add some usability notes
>>    tisdk-base-image: Reformat documentation and clarify usage
>>    tisdk-default-image: Reformat documentation and clarify usage
>>    tisdk-thinlinux-image: Reformat documentation
>>    tisdk-core-bundle: Add documentation to clarify usage
>>    packagegroups: Add a new bootstrap package group
>>    recipes-core: images: Add a basic bootstrap base image
>>    recipes-bsp: Create a bootstrap-initrd package
>>    recipes-core: images: Introduce tisdk-bootstrap-image
>>    images: Build tisdk-bootstrap-image with tisdk-core-bundle
>>
>>   .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 ++++++++
>>   .../recipes-core/images/arago-tiny-image.inc  |  9 ++++
>>   .../recipes-core/images/tisdk-base-image.bb   |  6 ++-
>>   .../images/tisdk-bootstrap-base-image.bb      | 22 ++++++++
>>   .../images/tisdk-bootstrap-image.bb           | 22 ++++++++
>>   .../recipes-core/images/tisdk-core-bundle.bb  |  7 +++
>>   .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
>>   .../images/tisdk-default-image.bb             |  5 +-
>>   .../images/tisdk-thinlinux-image.bb           |  6 ++-
>>   .../recipes-core/images/tisdk-tiny-image.bb   | 23 ++++----
>>   .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
>>   11 files changed, 162 insertions(+), 15 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
>>   create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>>   create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
>>   create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
>>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
>>
>> -- 
>> 2.31.1
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

