Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10580.1639051077694761305
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 03:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xQtjWOEy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9BvmaQ008981;
	Thu, 9 Dec 2021 05:57:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639051068;
	bh=wIQPnXGccHvjtZqAwWODh9WuJVv0IDK7Q1MmGkvN+wk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=xQtjWOEyzIQKg22+tmzJxTn6+jXoPuGSWFwGtJMpmeHTgF9jogWKjTz5e2WEf1afp
	 YQIBqIS9+U8z5wSblvLjnGLGUp315dWuDJECdDBrYiSAMUQNoIda3EG9px2jAIvWxf
	 z6RgpFsQ4eb2jztxEQ61e2rRT4Nd6Rb8k0LUrVio=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9BvmC4108235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 05:57:48 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 05:57:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 05:57:48 -0600
Received: from [10.249.35.7] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9BvlHi064326;
	Thu, 9 Dec 2021 05:57:47 -0600
Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] secdev: Add script to update k3 secdev package
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20211208085841.45926-1-yogeshs@ti.com>
 <20211208130806.GV18191@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <2604a193-9fca-d103-91ff-a80a202a3c20@ti.com>
Date: Thu, 9 Dec 2021 05:57:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211208130806.GV18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/8/21 7:08 AM, Denys Dmytriyenko wrote:
> tisdk-build-scripts is the wrong place to update secdev. Like toolchains,
> secdev package is considered an external system tool and is usually installed
> in a central location systemwide (e.g. /opt). It may not be writable by a
> regular user executing this build script.
> 
Agree. Will revert the patch.
> 
> On Wed, Dec 08, 2021 at 08:58:41AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   build-oesdk.sh             | 3 +++
>>   lib/oesdk/update_secdev.sh | 7 +++++++
>>   2 files changed, 10 insertions(+)
>>   create mode 100755 lib/oesdk/update_secdev.sh
>>
>> diff --git a/build-oesdk.sh b/build-oesdk.sh
>> index 038a7ab..3d32fb2 100755
>> --- a/build-oesdk.sh
>> +++ b/build-oesdk.sh
>> @@ -14,6 +14,9 @@ source ./lib/oesdk/machine-specific-functions
>>   source ./lib/oesdk/package-sdks
>>   source ./lib/oesdk/generate-report
>>   
>> +# Update secdev package
>> +./lib/oesdk/update_secdev.sh
>> +
>>   # This variable holds the architectures that are being built based
>>   # on the machines.
>>   ARCHS=""
>> diff --git a/lib/oesdk/update_secdev.sh b/lib/oesdk/update_secdev.sh
>> new file mode 100755
>> index 0000000..1f0a409
>> --- /dev/null
>> +++ b/lib/oesdk/update_secdev.sh
>> @@ -0,0 +1,7 @@
>> +#!/bin/bash
>> +
>> +cd $TI_SECURE_DEV_PKG_K3
>> +git pull origin master
>> +if [ $? != 0 ]; then
>> +        echo "Updating the secdev failed"
>> +fi
>> -- 
>> 2.17.1
> 
