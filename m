Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id D6E6152975
	for <meta-arago@arago-project.org>;
	Wed, 17 Feb 2021 02:14:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11H2EnV9077197
	for <meta-arago@arago-project.org>; Tue, 16 Feb 2021 20:14:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613528089;
	bh=RbIxTIAzJOxrcAAjvItfK/C1BXYnZbDOUqc8eu6x/VI=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=Eqa9Q8U0Vw85B9tgcHs4072hoaY4Z5KdavVw55R5BWsc367+wYfGP6LVj4hprXJIE
	HnWulF0CE7dUKNW0L2+GO6HR1TMTIjZRVSzwcE+QtOiyynHUGh/GzQAk2SKS8uwP9Z
	eFLxBP0BrMQgFuNtcjF32a9knq7s772kNw0XGG4k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11H2EnZ8042390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Feb 2021 20:14:49 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 16 Feb 2021 20:14:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 16 Feb 2021 20:14:49 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11H2En5t116656;
	Tue, 16 Feb 2021 20:14:49 -0600
From: "Bajjuri, Praneeth" <praneeth@ti.com>
To: Aparna Balasubramanian <aparnab@ti.com>, <meta-arago@arago-project.org>
References: <20210211130003.8210-1-aparnab@ti.com>
	<1c99e4b4-ed84-4bf2-0aec-4efb68ef375a@ti.com>
Message-ID: <e083c760-ae77-2dbd-039e-c18656f756d2@ti.com>
Date: Tue, 16 Feb 2021 20:14:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1c99e4b4-ed84-4bf2-0aec-4efb68ef375a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [[master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 17 Feb 2021 02:14:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/11/2021 12:06 PM, Bajjuri, Praneeth wrote:
> 
> 
> On 2/11/2021 7:00 AM, Aparna Balasubramanian wrote:
>> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> 
> Can you add some description?
> Looks like this patch brings am64xx-sk support.

Aparna, took care of updating commit message and pushed to dunfell-next.

Please add a valid description whenever a major change is coming.


> 
>> ---
>>   .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb 
>> b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> index f0824a94..d8eb5918 100644
>> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
>> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>>   DEPENDS += "alsa-lib"
>>   PE = "1"
>> -PR = "r10"
>> +PR = "r11"
>>   PV_append = "+git${SRCPV}"
>> -SRCREV = "b0459d9aa364d07699ae6f273280358aae509d56"
>> +SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
>>   BRANCH ?= "master"
>>   SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

