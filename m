Return-Path: <lokeshvutla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 274A252A60
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2021 09:01:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11O92AxJ124158
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2021 03:02:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614157330;
	bh=rZ/rCXJtZ5IkqGHInZrp7OneVIM0PHitrtJnqTY05QU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aMUkJ3YWn/hITX3gDe7RfDwXcqwoWBCqD/upZHIg2OrJd1Z834s6QDhkvSshOX1ck
	YoXIOFfAdZky/mVHcaw9OvCRBF8ZbA9a9Y26rCvvaPWdbRnXRcJKcNh3HWbHUG/prB
	osXGaedE6GY9ju1QcaEB8BCygpD8XJeS76Br24HE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11O92A8B025823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2021 03:02:10 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 24 Feb 2021 03:02:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 24 Feb 2021 03:02:09 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11O927uP076779;
	Wed, 24 Feb 2021 03:02:08 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>,
	<praneeth@ti.com>
References: <20210223150412.5124-1-nikhil.nd@ti.com>
	<14633cdf-dc04-5132-0f1d-49c25b50f614@ti.com>
	<3bdd1121-11e2-1caa-0270-01bfb401349a@ti.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <76b55ef3-1645-7e0f-a0a5-49b6627b2856@ti.com>
Date: Wed, 24 Feb 2021 14:32:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3bdd1121-11e2-1caa-0270-01bfb401349a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsekhar@ti.com, kishon@ti.com
Subject: Re: [dunfell PATCH] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 24 Feb 2021 09:01:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 24/02/21 11:12 am, Nikhil Devshatwar wrote:
> 
> 
> On 23/02/21 9:09 pm, Lokesh Vutla wrote:
>>
>>
>> On 23/02/21 8:34 pm, Nikhil Devshatwar wrote:
>>> Currently, the K3 platforms do not include the TI wlan related packages.
>>> Add in the tisdk-connectivity packagegroup.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> It is always good to give Suggested-by credits. >
>> Suggested-by: Hari Nagalla <hnagalla@gmail.com>
> 
> Thank you, I will keep in mind for next time
> 
> 
>>
>> Also this is a v2 of your previous patch[0]. This should be specified in
>> $subject tag and add change log in notes section. Otherwise,
> 
> I intentionally did not mark this as v3 since this patch is different from
> previous version since we are not adding any new recipe here.

How does maintainer know your previous version is stale? Only the patch version
tells that and indicate the changes as needed in your notes

Thanks and regards,
Lokesh

> 
>> > Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Thanks,
> Nikhil D
> 
>>
>> [0] http://patchwork.dal.design.ti.com/patch/59321/
>>
>> Thanks and regards,
>> Lokesh
>>

