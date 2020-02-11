Return-Path: <angelabaker@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A758C5298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 19:36:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BJYlbv048834
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 13:34:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581449687;
	bh=FXH0phMpLkiPhKj0HyRsqXv2yiIHTtAC1k4p4eVLmbI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CUrsSdbfltdnvyyK13yOd7hNEmGXw3Km2/WPnXnlmkvhLPB8TFtH/01YATKPCpJxM
	nfvmCpBeYw1T0CZZsoCgYODXX3jgQPdcprP/4DXbFDxCL0T+GXR8TjJ17S6YUieWpm
	svo7Fm3vy8xPuUpl4Da1OTCbnOp9TizdM8Bfg0SE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BJYlJ3095256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 13:34:47 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 11 Feb 2020 13:34:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 11 Feb 2020 13:34:47 -0600
Received: from [128.247.77.48] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BJYksb088192;
	Tue, 11 Feb 2020 13:34:47 -0600
To: Denys Dmytriyenko <denys@ti.com>, Angela Stegmaier <angelabaker@ti.com>
References: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
	<20200211043348.GA20281@beryl>
From: Angela Stegmaier <a0866189@ti.com>
Message-ID: <36253987-2d6b-ac50-199d-343cd9db96af@ti.com>
Date: Tue, 11 Feb 2020 13:34:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200211043348.GA20281@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Tue, 11 Feb 2020 19:36:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/10/20 10:33 PM, Denys Dmytriyenko wrote:
> Have you tried building it?
> 

I did, but... looks like my setup had older pdk-fetch recipe in meta-ti. 
After updating all to latest I am seeing a build failure in board-rtos.

Thanks,
Angela

> 
> On Mon, Feb 10, 2020 at 10:25:18AM -0600, Angela Stegmaier wrote:
>> From: Santosh Jha <sjha@ti.com>
>>
>> Replacing ipc-lld-fw with ipc-lld-examples-rtos to
>> build from source.
>>
>> Signed-off-by: Santosh Jha <sjha@ti.com>
>> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> ---
>>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> index a1b55ee..1612322 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> @@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
>>                       jailhouse \
>>   "
>>   
>> -UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss pru-pwm-fw"
>> -UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>> +UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
>> +UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>>   
>>   UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>>   
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

