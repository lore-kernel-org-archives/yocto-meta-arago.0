Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8C7C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:08:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2336.1651003736121807653
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S+t/CAht;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK8qpR016019;
	Tue, 26 Apr 2022 15:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003732;
	bh=yIeDPQaOs8rgSPwPo6owkPDrxEC0kGtH5GUH8MX1E5c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S+t/CAhtiaHUan4QKGtkaU2e/WiLfYtks4vdI0I3YUhlDaVS5UxIpdfh6pOBQy8Nf
	 C5+Doq6wCZndp/8CX5g51QSP9Uf9zPZXZuiflOBTIdVQQBjEuxOSt3tfdJOko+OQEd
	 RIdCRDZznr6ZwzsGfEOcT6vokJj5ccVUnn3tj4IQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK8qf7051250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:08:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:08:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:08:52 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK8qkl120225;
	Tue, 26 Apr 2022 15:08:52 -0500
Message-ID: <b570cad2-52f1-41fe-9a29-4e12e9dfdd81@ti.com>
Date: Tue, 26 Apr 2022 15:08:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago] [oe-layersetup PATCH] oe-layer-setup.sh: Stop
 claiming generic sh support
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426142651.22361-1-nm@ti.com>
 <06b88161-bfc8-ea5d-be90-63533e472c48@ti.com>
 <20220426182558.yyxcxitwqarjbemc@sandworm>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426182558.yyxcxitwqarjbemc@sandworm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13800

On 4/26/22 1:25 PM, Nishanth Menon wrote:
> On 09:35-20220426, Andrew Davis wrote:
>> On 4/26/22 9:26 AM, Nishanth Menon via lists.yoctoproject.org wrote:
>>> Lets be clear that we work with bash and not variants such as dash.
>>>
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>> ---
>>>
>>> There has been a bit of bashism that has crept into various checks,
>>> which is fine as long as folks use bash ;) OR we can start cleaning up
>>> in a manner to support dash and variants of that form.
>>>
>>
>>
>> I'd rather just fix the bashisms, this fixes us at least enough
>> to get dash back working:
> 
>>
>>
>>  From 4e46cf04046aee084b4e83cef28d4500d1d3dc56 Mon Sep 17 00:00:00 2001
>> From: Andrew Davis <afd@ti.com>
>> Date: Mon, 25 Apr 2022 16:31:35 -0500
>> Subject: [PATCH] Fix non-standard shell usage
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   oe-layertool-setup.sh | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index f171f94..e05737b 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -780,7 +780,7 @@ print_image_names() {
>>       for FOLDER in ${FOLDERS}
>>       do
>>           RECO=""
>> -        if [ "${FOLDER}" == "meta-arago" ]; then
>> +        if [ "${FOLDER}" = "meta-arago" ]; then
>>               RECO="[recommended]"
>>           fi
>>           echo "From ${FOLDER}${RECO}:"
>> @@ -796,7 +796,7 @@ print_image_names() {
>>                       if [ -z "${summary}" ]; then
>>                           summary="No Summary available"
>>                       fi
>> -                    echo -e "\t${name}: ${summary}"
>> +                    echo "    ${name}: ${summary}"
> 
> 
> Yep, fair enough - I am still not a dash fan. could you post this as an
> formal patch?
> 


Sure, sent.

Andrew


>>                   done
>>               fi
>>           done
>> -- 
>> 2.17.1
>>
>>
>>>    oe-layertool-setup.sh | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>>> index f171f94cf0fc..6654869ac061 100755
>>> --- a/oe-layertool-setup.sh
>>> +++ b/oe-layertool-setup.sh
>>> @@ -1,4 +1,4 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    # OE Build Enviroment Setup Script
>>>    #
> 

