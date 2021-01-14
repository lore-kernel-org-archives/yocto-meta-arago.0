Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 25BF552975
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2021 18:46:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EIk2uE084825;
	Thu, 14 Jan 2021 12:46:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610649962;
	bh=XpOz74IqGQQ0O/NnbexLpHZVFStiTO1T06VgrIkioPM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=TK2IrMpbtRGlcyTswp6lkYr5RCWzXakCjqTeslD4/3N5PY2Kjzt4PSRYrjQMggUtk
	rDSF8b9AU60gF8FxjkD01OlHrXWHHyI2CyxRzzWbLZnwdWx77vaZjg0bv7tX7GaRF+
	ekhoQTULwshMNIkcX/w0dlloCCJRpXjptIFWWE90=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EIk2oY102569
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Jan 2021 12:46:02 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 14 Jan 2021 12:46:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 14 Jan 2021 12:46:01 -0600
Received: from [10.250.36.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EIk1aN011703;
	Thu, 14 Jan 2021 12:46:01 -0600
To: Denys Dmytriyenko <denis@denix.org>
References: <20210114164743.2340-1-dmurphy@ti.com>
	<20210114182451.GH4892@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ff340441-e184-c004-2628-44d8075a8c49@ti.com>
Date: Thu, 14 Jan 2021 12:46:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114182451.GH4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master] [RFC PATCH] branding: Add branding-core-next to aid in migration
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
X-List-Received-Date: Thu, 14 Jan 2021 18:46:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 1/14/21 12:24 PM, Denys Dmytriyenko wrote:
> On Thu, Jan 14, 2021 at 10:47:43AM -0600, Dan Murphy wrote:
>> Add a core-next brand branding type to be able to re-direct the recipe
>> preferred providers or versions to highest PV'd recipe. The
>> branding-core should indicate the current version to build if not the
>> highest version.
>>
>> For the purpose of an example the Arago distribution will be migrating
>> from the 5.4 kernel to the 5.10 during the 2021 time frame.  In order to
>> assist with a smoother migration the distribution needs to be able to
>> build the 5.4 kernel for the core brand and build the 5.10 kernel for
>> the core-next.
>>
>> Once the transition from 5.4->5.10 kernel is done then the
>> PREFERRED_VERSION in the branding-core.inc can be removed.
>>
>> From: Dan Murphy <dmurphy@ti.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../conf/distro/include/branding-core-next.inc              | 6 ++++++
>>   meta-arago-distro/conf/distro/include/branding-core.inc     | 3 +++
>>   2 files changed, 9 insertions(+)
>>   create mode 100644 meta-arago-distro/conf/distro/include/branding-core-next.inc
>>
>> diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
>> new file mode 100644
>> index 000000000000..d65c5db2f379
>> --- /dev/null
>> +++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
>> @@ -0,0 +1,6 @@
>> +# Special "migration" branding for testing components that are to be updated in LTS migration
>> +
>> +require branding-core.inc
>> +
>> +PREFERRED_VERSION_linux-ti-staging = ""
>> +PREFERRED_VERSION_u-boot-ti-staging = ""
>> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
>> index cab9831be9f9..a0abc6230780 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
>> @@ -11,3 +11,6 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
>>   
>>   # Raise priority for sample IPC FW images
>>   ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
>> +
>> +PREFERRED_VERSION_linux-ti-staging = "5.4%"
> Should also include linux-ti-staging-rt and linux-ti-staging-systest
>
Thanks I will add them in v2

Do you see anything wrong with this approach?

Dan


