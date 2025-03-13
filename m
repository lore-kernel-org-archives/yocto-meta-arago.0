Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF77DC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:46:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.22883.1741891589305992501
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 11:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EcGpV37W;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DIkOTw1426704
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 13:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741891584;
	bh=f/ls259x9/e2yjT73MyMhKkFYr+xyaFwFCODk3kxAMk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EcGpV37Ws/J++OSNt0PelzIIJjmtdbu0uhv4yi6p2ETDx7AHsXG0jam+4kvIRJT2a
	 rKh1cUGNzMRxF+NlWiSoZ5Bjr0nwCB/o2IKUo32I13qxJnDk/FsyFQc4g3fFR2UXHl
	 8iPJ8FPdzbsSPXCToZyFKNBVuu09bEImDQdbWlqg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DIkO5o029546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 13:46:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 13:46:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 13:46:24 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DIkO2C003848;
	Thu, 13 Mar 2025 13:46:24 -0500
Message-ID: <8a18e914-d59c-4d27-af11-0c80acac3c69@ti.com>
Date: Thu, 13 Mar 2025 13:46:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 03/13] libyang: Add BBCLASSEXTEND for
 native
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250313104029.14977-1-reatmon@ti.com>
 <20250313104029.14977-4-reatmon@ti.com> <20250313180212.GC23729@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250313180212.GC23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 18:46:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16031



On 3/13/2025 1:02 PM, Denys Dmytriyenko wrote:
> This patch is incorrect - it got extra stuff in it.
> 

Got to love rebasing...  I'll fix it.


> On Thu, Mar 13, 2025 at 05:40:19AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We need to add BBCLASSEXTEND for native so that we can build
>> sysrepo-native for the netopeer2-server install.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb          | 6 +++---
>>   .../recipes-sysrepo/libyang/libyang_%.bbappend              | 1 +
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>   create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
>> index c62d3faa..6b3f73ca 100644
>> --- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
>> +++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
>> @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
>>   
>>   SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
>>   
>> -PV = "2.1.34+git"
>> -SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
>> +PV = "3.5.5+git"
>> +SRCREV = "4c7858c9c41f1ac04d2b15c032291e335fc0f5f5"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -DEPENDS = "libssh openssl libyang libxcrypt \
>> +DEPENDS = "libssh openssl libyang libxcrypt mbedtls curl \
>>       ${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)} \
>>   "
>>   
>> diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
>> new file mode 100644
>> index 00000000..608377e3
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
>> @@ -0,0 +1 @@
>> +BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

