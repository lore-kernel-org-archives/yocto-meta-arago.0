Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2768.1644257262940645776
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 10:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fLm1O+Cg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217I7bZp015723;
	Mon, 7 Feb 2022 12:07:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644257257;
	bh=Ybb322/bmEIxCEHXUf6k5/FVr2OttsBqVbhcejvnTBQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fLm1O+Cg8A0moGzcbdfTO73OWfee0vI9IesDvQjUXZsfg52jIaBchxscAxQmUhGyg
	 NDlK3oSjd2ylCeY/kgAriC8HEh9Hi9Ph34o1IXguASbR7EBvlp89JwuxTVGQr8MbIV
	 8cON8PLPbTLfLDfY26tulLsdSbeXe8wxfzDO9k2E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217I7bol031916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 12:07:37 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 12:07:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 12:07:37 -0600
Received: from [10.250.33.180] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217I7agJ023609;
	Mon, 7 Feb 2022 12:07:37 -0600
Message-ID: <377472ec-779d-b612-2d6d-e34650821f11@ti.com>
Date: Mon, 7 Feb 2022 12:07:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001 release
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220207180541.28964-1-reatmon@ti.com>
 <20220207180637.GU26229@denix.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220207180637.GU26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


The hash changed.  Last minute request.


On 2/7/2022 12:06, Denys Dmytriyenko wrote:
> What's the difference since v1?
> 
> On Mon, Feb 07, 2022 at 12:05:41PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Updated the ltp-ddt version for 08.02.00.001
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>> index e9431796..34f4533b 100644
>> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>> @@ -14,7 +14,7 @@ PE = "1"
>>   PR = "r5"
>>   PV_append = "+git${SRCPV}"
>>   
>> -SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
>> +SRCREV = "f0cfba630340c4efa114285ea7a6d896861dd9c7"
>>   BRANCH ?= "master"
>>   
>>   SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon
reatmon@ti.com
