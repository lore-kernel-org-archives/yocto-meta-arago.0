Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 388AF52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:35:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICZ6Z9037176
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861306;
	bh=VVuWH5qElED1guz0qqX2hQolPlrZLFTgkcfUUkwaYWs=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=VGNR14Hc7h0aR2jwdGwfGM8dtcfsQguhDC0e/cuw9y61dstil4vRwybQtIOvIbZE2
	no2Ey8paUGMIfARdx6NFPTqfeTeAAO5U/81VzeMTgU+DRpghqsviDZFaM7fbcU6BSa
	cL34JWFcZwSuE/NtnbzBdYnSlAaAaF4LuUzOiVxs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICZ5Mw072948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:35:06 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:35:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 07:35:04 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ICZ4VJ099632;
	Tue, 18 Jun 2019 07:35:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190607140503.29694-1-e-ruei1@ti.com>
	<552df4b0-0d00-e9cc-6c01-8be539a3b286@ti.com>
Message-ID: <5935582e-1df1-4040-f70c-7d1de2b1f358@ti.com>
Date: Tue, 18 Jun 2019 08:35:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <552df4b0-0d00-e9cc-6c01-8be539a3b286@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH 1/2] packagegroup-arago-tisdk-matrix: remove matrix-gui browser demo tentatively
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
X-List-Received-Date: Tue, 18 Jun 2019 12:35:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

On 6/12/2019 7:30 AM, Jacob Stiffler wrote:
> Denys,
>
> Can you please backport this to the ti2019.01 branch?
>
>
> Thank you,
>
> Jake
>
> On 6/7/2019 10:05 AM, Eric Ruei wrote:
>> Matrix-gui browser demos depend on qtwebengine which has been 
>> disabled for
>> now
>>
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-tisdk-matrix.bb      | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git 
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb 
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb 
>>
>> index 100d4070..ad131dca 100644
>> --- 
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
>> +++ 
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Task to include Matrix v2"
>>   LICENSE = "MIT"
>> -PR = "r79"
>> +PR = "r80"
>>     PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   @@ -159,12 +159,14 @@ MATRIX_APPS_append_omap-a15 = "     \
>>       matrix-gui-generic-pm           \
>>       matrix-gui-clocks               \
>>       matrix-gui-pm-demos-governor    \
>> - 
>> ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) 
>> and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
>> -                                \
>>       ${MATRIX_ARMNN_APPS}            \
>>       matrix-analytics-pdm-anomaly-detection \
>>   "
>>   +# 
>> ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) 
>> and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
>> +#                                \
>> +#
>> +
>>   MATRIX_APPS_append_k3 = "           \
>>       matrix-multimedia-demo-aac      \
>>       matrix-multimedia-demo-audiocapture \

