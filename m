Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E6DEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 23:15:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.830.1686957303416200674
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 16:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pIlMkpPL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35GNEv8Z024145;
	Fri, 16 Jun 2023 18:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686957297;
	bh=riirAn8kOy6L9waY5WMQdxd2gBRXMpw9k5c3tcNa/XE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pIlMkpPL4csphstyJrbJP++IcQrPuRSLwt6BmqvS5GB5ZOssmcDGNh7fQKxC3iVQC
	 vEtSxlC/i3odF/cYStW+qveZk4ygDJJYiOkaaPJDpYliLEjXulvrj35flrDFU1iXE/
	 7ZjOjY5wJCCIYrv7xfKQwoOGvIn5edC0sG/DHoJs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35GNEvWf054770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jun 2023 18:14:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 18:14:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 18:14:56 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35GNEu2R022286;
	Fri, 16 Jun 2023 18:14:56 -0500
Message-ID: <dc8d5f5c-4075-9a9e-7e2a-61bc7f2c6503@ti.com>
Date: Fri, 16 Jun 2023 18:14:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][kirkstone][PATCH 2/2] kms++: Renable kms++-python
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230616221010.18458-1-reatmon@ti.com>
 <20230616221010.18458-2-reatmon@ti.com> <20230616222420.GH1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230616222420.GH1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 23:15:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14650


I'll fix that.  I decided to split the second patch.  Fix kms++ with 
pybind.  and then add kms++-python back in.  That patch might be 
applicable to master as it should be the same patch.  The first two 
would be kirkstone only.


On 6/16/2023 5:24 PM, Denys Dmytriyenko wrote:
> Renable?
> 
> Otherwise LGTM
> 
> 
> On Fri, Jun 16, 2023 at 05:10:10PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> With the pybind11 backport, the kms++ package builds correctly.  Turn it
>> back on.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 3 +--
>>   meta-arago-extras/recipes-graphics/kms++/kms++_git.bb        | 5 ++---
>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> index 31d9ad5b..ff32112a 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> @@ -26,8 +26,6 @@ ARAGO_BASE = "\
>>       libgpiod-tools \
>>   "
>>   
>> -# these require meta-openembedded/meta-oe layer
>> -#    kms++-python is not provided yet
>>   ARAGO_EXTRA = "\
>>       devmem2 \
>>       tcpdump \
>> @@ -35,6 +33,7 @@ ARAGO_EXTRA = "\
>>       dropbear \
>>       openssh-sftp-server \
>>       kms++ \
>> +    kms++-python \
>>       can-utils \
>>       docker \
>>   "
>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> index eb39736c..2c0abaa7 100644
>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> @@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
>>   
>>   DEPENDS = "drm fmt"
>>   
>> -# New meson build system fails to find pybind11 in sysroot, disable for now
>> -#DEPENDS += "python3-pybind11"
>> -#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>> +DEPENDS += "libevdev python3-pybind11"
>> +EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>>   
>>   PACKAGES =+ "${PN}-python"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

