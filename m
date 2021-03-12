Return-Path: <aparnab@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 6AD2352AA8
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 18:48:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CImTdU109429
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 12:48:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615574909;
	bh=4yqQuHvUQishoq+zFN15bbo5rp22tY3xSy6x7H4DHBY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=zJgq3c4eYwOwQ8ytpZLRUzqrdIBz8KjINZhQwzcDOYnslzMaTU8A8ekdn7wunfXLP
	QLj8SN86OQJGfY9G5B9Io+9GBYb5/aPhUpwAOGibgPF3RErr4RdGFKV6ryVYAW5u/B
	dW0REhPDAENZUuQXiHfySMRCpjHngwoYFsovvUkE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CImTB6101234
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 12:48:29 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 12:48:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 12:48:29 -0600
Received: from [128.247.81.129] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CImTRJ030603;
	Fri, 12 Mar 2021 12:48:29 -0600
To: Nishanth Menon <nm@ti.com>
References: <20210312161817.2581-1-aparnab@ti.com>
	<20210312163956.ti7erugzz6hcvx2m@carmaker>
From: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <ee3daee0-c656-fc2f-bcd2-e0734af92f22@ti.com>
Date: Fri, 12 Mar 2021 12:48:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312163956.ti7erugzz6hcvx2m@carmaker>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 12 Mar 2021 18:48:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nishanth,

Sure, will send v2 with change information.

I will update filename as part of 2021 lts updates.

Regards,

Aparna

On 3/12/21 10:39 AM, Nishanth Menon wrote:
> On 10:18-20210312, Aparna Balasubramanian wrote:
>
> Can you please add change information in the commit message?
>
> Is this still 20200120 are'nt we in 2021?
>> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
>> ---
>>   .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> index d8eb5918..be8bea98 100644
>> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>>   DEPENDS += "alsa-lib"
>>   
>>   PE = "1"
>> -PR = "r11"
>> +PR = "r12"
>>   PV_append = "+git${SRCPV}"
>>   
>> -SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
>> +SRCREV = "3543cba63326976b5fb184c88b56158e91b7626a"
>>   BRANCH ?= "master"
>>   
>>   SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

