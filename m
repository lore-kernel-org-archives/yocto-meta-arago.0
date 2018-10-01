Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3D51352079
	for <meta-arago@arago-project.org>;
	Mon,  1 Oct 2018 12:26:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w91CQAMS009898
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 07:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538396770;
	bh=CXa2BZCoVptAjxiD2CfN25X8epWngxtA9CbLRIXRzxE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=bspAV7+BNUHEcuQvhsj/dpaaXqGBj9HE3bwDa3F2B4dI3dLooWznF5yVg+aSyE6GB
	1nzJNAyJHtuSs7Af+Wwb8HEQWCrfuf5jD6uqjEWCFUc/k6O2emH0Vp0zgMxqLYYbSG
	sB5wdCqeXq8tHLgndUxWEyiZ/1DujGGw9hc+Q+eA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91CQAA0031620
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 07:26:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 07:26:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 1 Oct 2018 07:26:10 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91CQ9uD027885;
	Mon, 1 Oct 2018 07:26:10 -0500
To: Denys Dmytriyenko <denys@ti.com>, Mahesh Radhakrishnan
	<m-radhakrishnan2@ti.com>
References: <1538081991-52963-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081991-52963-2-git-send-email-m-radhakrishnan2@ti.com>
	<20180927213401.GK8582@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ccc36500-c140-f519-5d0f-1cf62e5e8801@ti.com>
Date: Mon, 1 Oct 2018 08:26:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180927213401.GK8582@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [rocko/master/ti2018.03][PATCH v2 1/2] posix-smp-demo: Update to versin 01.01.00.02B
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
X-List-Received-Date: Mon, 01 Oct 2018 12:26:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this set to the ti2018.03 branch?


Thank you,

Jake


On 9/27/2018 5:34 PM, Denys Dmytriyenko wrote:
> ACK
>
> On Thu, Sep 27, 2018 at 04:59:50PM -0400, Mahesh Radhakrishnan wrote:
>> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>> ---
>>   meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
>> index b89ebd4..77b61ac 100644
>> --- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
>> +++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
>> @@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
>>   POSIX_SMP_GIT_PROTOCOL = "git"
>>   POSIX_SMP_GIT_BRANCH = "master"
>>   
>> -# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.01"
>> -POSIX_SMP_SRCREV = "99834751f63f8f418e659b251f10e8e13b900881"
>> +# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.02B"
>> +POSIX_SMP_SRCREV = "339039e281586a79c5b04fac6c2ae84eb30c0576"
>>   
>>   BRANCH = "${POSIX_SMP_GIT_BRANCH}"
>>   SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
>>   
>>   SRCREV = "${POSIX_SMP_SRCREV}"
>> -PV = "01.01.00.01"
>> +PV = "01.01.00.02B"
>>   INC_PR = "r0"
>>   
>>   S = "${WORKDIR}/git"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

