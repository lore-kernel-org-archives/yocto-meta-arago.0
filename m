Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 1B15C52C91
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:47:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 143LlwbB107823;
	Mon, 3 May 2021 16:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620078478;
	bh=rS/EF4jc7ALx8Itq362aPg/Mnt32DQPyCtYeCv1iBds=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=c1kcmSpywOt9iO9QMU2gzul82SMorg5XzmGwhL7xu1usAmdaQwfS+3Vc7q9OXKxu+
	rUUHZqW/abZ8nBvRcEvbhhnQqX+hA4h0hmJFuBPWek+DgKVNEuOxn3igoCCHOPJuup
	qKJjShT2bxQ3lKlcjd7RCU9XOodwLnMbdp/QxXXs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 143LlwrW099738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 May 2021 16:47:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 3 May 2021 16:47:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 3 May 2021 16:47:57 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 143Llvbv117024;
	Mon, 3 May 2021 16:47:57 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1611691726-9065-1-git-send-email-denis@denix.org>
	<20210503213630.GF21867@denix.org>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <68d98ded-6578-1986-7382-657c4c3a4d50@ti.com>
Date: Mon, 3 May 2021 16:47:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210503213630.GF21867@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH] branding-*: remove remnants of u-boot-k3-r5
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
X-List-Received-Date: Mon, 03 May 2021 21:47:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/3/21 4:36 PM, Denys Dmytriyenko wrote:
> Praneeth,
> 
> I noticed this patch has been merged to dunfell, but is missing on master.
> Could you please cherry-pick this to master? Let me know if you need this
> rebased, as branding-core-next is gone now.

Will rebase and pull to master (along with other patches missing from 
dunfell --> master in a day.


> 
> 
> On Tue, Jan 26, 2021 at 03:08:46PM -0500, Denys Dmytriyenko wrote:
>> u-boot-k3-r5 was deprecated some time ago by multiconfig support in meta-ti:
>> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7bd2c5d5fdf8cf0711e52454f76244373ee76d1d
>>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ---
>>   meta-arago-distro/conf/distro/include/branding-bleeding.inc  | 1 -
>>   meta-arago-distro/conf/distro/include/branding-core-next.inc | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> index 8b0811d..ca2aa9a 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> @@ -7,7 +7,6 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
>>   SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
>>   SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
>>   SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
>> -SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
>>   SRCREV_pn-ltp-ddt = "${AUTOREV}"
>>   #SRCREV_pn-optee-os = "${AUTOREV}"
>>   #SRCREV_pn-optee-client = "${AUTOREV}"
>> diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
>> index e435e4f..f453b3c 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
>> @@ -12,4 +12,3 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
>>   SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
>>   SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
>>   SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
>> -SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
>> -- 
>> 2.7.4
>>
> 

