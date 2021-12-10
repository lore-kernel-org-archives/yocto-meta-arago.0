Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1141.1639098370572318852
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 17:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=popRRNve;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BA165tR020668;
	Thu, 9 Dec 2021 19:06:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639098365;
	bh=hvzeeDRJI5oAMQJNTtvFrunXtlowvARkNuF5dGmrXks=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=popRRNveaZXE4jY7mw/FPgYcsNS6ExVqWzUnj/pRPEQbUedSAFbZABjMNxlBO4SlF
	 CwDtk5a0+XY1jCvN+QAGepwLqt9WfT1NQbMZxDN3UTd9mzJrqtXZzze7W1Moe589LC
	 UqU4NXP6DgD9NbdKAZiiYa3bxOubtlsn5l4z+Z18=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BA165XC055438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 19:06:05 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 19:06:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 19:06:04 -0600
Received: from [10.249.36.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BA164A0030148;
	Thu, 9 Dec 2021 19:06:04 -0600
Message-ID: <957e0aa8-f37c-a475-ab46-13b726f61855@ti.com>
Date: Thu, 9 Dec 2021 19:06:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-arago] [meta-ti][master/dunfell][PATCH] conf: j7200-hs: fix the wrong machine configuration included
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20211210004321.23793-1-yogeshs@ti.com>
 <20211210004635.GC18191@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211210004635.GC18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/9/2021 6:46 PM, Denys Dmytriyenko wrote:
> Wrong list?
> 
Used wrong alias. Please ignore

> On Fri, Dec 10, 2021 at 12:43:21AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> j7-evm instead of j7200-evm was included causing boot failure
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   conf/machine/j7200-hs-evm.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
>> index c55be005..a5bd637e 100644
>> --- a/conf/machine/j7200-hs-evm.conf
>> +++ b/conf/machine/j7200-hs-evm.conf
>> @@ -2,7 +2,7 @@
>>   #@NAME: J7200 HS EVM
>>   #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
>>   
>> -require conf/machine/j7-evm.conf
>> +require conf/machine/j7200-evm.conf
>>   
>>   UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
>>   
>> -- 
>> 2.17.1
