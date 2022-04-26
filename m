Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89568C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:38:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.846.1651009132784710686
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mnx1mw3R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLcoiN074600;
	Tue, 26 Apr 2022 16:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651009130;
	bh=QpnQWlePMQ5G+iWS4qNy8Fqw6/VJmdFXvRVrsk9jALc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mnx1mw3Ry5JsHyjwrEqEEvrRsXjM1YI4ZFX/H+Mm17Lt9l5YBg0wV/zxH1jCo/ZX4
	 8iEvNVq8SudFmmhIBgkdUkFXK9fPTgwoCbrMFV050b0+wNQNUkqUafhsDMntwfMK56
	 MLPAZ9j6YYH9K+DAUBIx9ycoyWj4eN/cbCnV44yY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLco1t010521
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:38:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:38:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:38:49 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLcn6x033537;
	Tue, 26 Apr 2022 16:38:49 -0500
Message-ID: <d995f042-0c44-c782-7ae1-c8b0d711ac32@ti.com>
Date: Tue, 26 Apr 2022 16:38:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][oe-layersetup PATCH] Fix non-standard shell usage
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20220426200529.19956-1-afd@ti.com>
 <20220426210436.GB9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220426210436.GB9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13814


Patch applied to master.


On 4/26/2022 16:04, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:05:29PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> Remove some Bashisms that prevent prevent this script from working
>> on stock Ubuntu (with Dash default interpreter).
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
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
>>                   done
>>               fi
>>           done
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

