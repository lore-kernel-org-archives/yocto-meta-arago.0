Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F286252978
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2019 21:09:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2KL98qO121945
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 16:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553116148;
	bh=Eu38iN1WN1RqxbRk8tN4JRlgZlhMj1875InLVcxdTo8=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=FeG56QufXdtg1LUzQQzpmcE7LXTdV+pMdOVqTggC+8lcb7re4VgNQNyPDyN9dCfqR
	Z+b9dBS3tO34wzmT3qdFXV8Hc1WSw+fSO+DjRP/nPP4Jk7of0GdnIIX/Id2cMlT+bP
	HJYtkpl32KCQgIM3CN3WveKYwlMuxm242FOmlQgE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2KL98re056384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 16:09:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 20 Mar 2019 16:09:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Wed, 20 Mar 2019 16:09:08 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2KL97Ae017012;
	Wed, 20 Mar 2019 16:09:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1553101598-12744-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553101598-12744-2-git-send-email-m-radhakrishnan2@ti.com>
	<38c163e7-915d-15e6-e957-6e1aea8981f1@ti.com>
Message-ID: <0e55919a-e540-81c0-a0fd-1c5a29bc4499@ti.com>
Date: Wed, 20 Mar 2019 17:09:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <38c163e7-915d-15e6-e957-6e1aea8981f1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH] fftlib: SRCREV bump
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
X-List-Received-Date: Wed, 20 Mar 2019 21:09:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I tried this on 2 other setups and could not recreate the error, so I 
will accept this.


- Jake

On 3/20/2019 1:18 PM, Jacob Stiffler wrote:
> I get an error with this:
>
>
> "././src/common//fft/fft_dp_mixed_bs.c", line 42: fatal error: cannot 
> open source file "ti/dsplib/src/DSPF_dp_fftDPxDP/DSPF_dp_fftDPxDP.h"
> 1 catastrophic error detected in the compilation of 
> "././src/common//fft/fft_dp_mixed_bs.c".
> Compilation terminated.
>
>
> On 3/20/2019 1:06 PM, Mahesh Radhakrishnan wrote:
>> This srcrev update deprecates the c64P big endian support
>>
>> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>> ---
>>   recipes-ti/fftlib/fftlib.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-ti/fftlib/fftlib.inc b/recipes-ti/fftlib/fftlib.inc
>> index 87d86cc..7addb90 100644
>> --- a/recipes-ti/fftlib/fftlib.inc
>> +++ b/recipes-ti/fftlib/fftlib.inc
>> @@ -1,5 +1,5 @@
>>   PV = "3_1_0_0"
>> -INC_PR = "r0"
>> +INC_PR = "r1"
>>     require recipes-ti/includes/tisdk-paths.inc
>>   @@ -7,4 +7,4 @@ DESTSUFFIX = "${WORKDIR}/git"
>>     BRANCH = "master"
>>   SRC_URI = 
>> "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
>> -SRCREV = "1527e517aa43f9ade14b7a4e16e2b6522eb5bbb9"
>> +SRCREV = "3d5ebada3cd94096fb798548d68059dc4c34a1ea"

