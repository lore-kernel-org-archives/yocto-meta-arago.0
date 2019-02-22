Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 986E252960
	for <meta-arago@arago-project.org>;
	Fri, 22 Feb 2019 20:31:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1MKUvSG012439
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:30:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550867457;
	bh=DosEd23GfyFbcg7Q0TvuPGY1OfGuOy9SsAA1HsH48N8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=pVH4auY1PFDcK8aoguOCRa+4/3VJEh3sEz+fXFWpr1h6ESrQm54KdXpUO/kZ+WZ+j
	glEPk9Kez5alf1o073WUQTLsW/2mUKYnQzVS3L7WrZ2K5+D+bflCg1Nle/zotPTdRJ
	lZwK7HKZUFdIqcnhlmB5CEIUCLBxxkhLIrnkfMfY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1MKUvQq115676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:30:57 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 22 Feb 2019 14:30:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 22 Feb 2019 14:30:57 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1MKUuum001883;
	Fri, 22 Feb 2019 14:30:56 -0600
To: Denys Dmytriyenko <denys@ti.com>, Qin Su <qsu@ti.com>
References: <1550862122-8951-1-git-send-email-qsu@ti.com>
	<20190222201908.GC19654@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <867b84f4-ce9e-109f-df37-7f9efc030ff3@ti.com>
Date: Fri, 22 Feb 2019 15:30:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190222201908.GC19654@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [PATCH] arm-compute-library: bump SRCREV
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
X-List-Received-Date: Fri, 22 Feb 2019 20:31:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/22/2019 3:19 PM, Denys Dmytriyenko wrote:
> Is this required for rocko?


Yes, this is required for both rocko and master.


> On Fri, Feb 22, 2019 at 02:02:02PM -0500, Qin Su wrote:
>> Upgraded to Linaro version 19.02.
>>
>> Signed-off-by: Qin Su <qsu@ti.com>
>> ---
>>   .../arm-compute-library/arm-compute-library_git.bb                | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>> index 865f7f8..a93ff6c 100644
>> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
>>   COMPATIBLE_MACHINE = "armv7a|aarch64"
>>   
>>   SRC_URI = " \
>> -    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
>> +    git://review.mlplatform.org/ml/ComputeLibrary;protocol=https;branch=${BRANCH} \
>>       file://0001-add-ti-benchmark-test-group.patch \
>>       file://0002-add-ti-benchmark-test-group.patch \
>>       file://0003-add-ti-benchmark-test-group.patch \
>> @@ -19,12 +19,12 @@ SRC_URI = " \
>>       file://0010-add-ti-benchmark-test-group.patch \
>>       file://0011-add-ti-benchmark-test-group.patch \
>>   "
>> -
>> -PV  = "18.08"
>> +PR = "r0"
>> +PV  = "19.02"
>>   PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>>   
>>   BRANCH = "master"
>> -SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
>> +SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
>>   
>>   S = "${WORKDIR}/git"
>>   
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

