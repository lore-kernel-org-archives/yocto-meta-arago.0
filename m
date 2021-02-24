Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id D402952A94
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2021 05:42:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11O5gYs8048397
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 23:42:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614145354;
	bh=GBb1RHm4bHgeLCMZYhAROWwcSZckCyA6GtY45lj1+OU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=JEv2P8YaDpl5M5DNDAiHeIgQN20yY9Cg4oHPN4oquzpuR/MnGDTStzDe4VrW5SuC1
	lukpVHAFxqkg4LTugSxTeteGZbaI8nKft/PLumh72Rniz1NZk1QB6vteqJ3og7rSRM
	TyJ63OP/trIaM86sTn01XnekwuaYfiUKynQYP708=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11O5gYOH092012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 23:42:34 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 23 Feb 2021 23:42:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 23 Feb 2021 23:42:34 -0600
Received: from [10.250.229.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11O5gVei084773;
	Tue, 23 Feb 2021 23:42:32 -0600
To: Lokesh Vutla <lokeshvutla@ti.com>, <meta-arago@arago-project.org>,
	<praneeth@ti.com>
References: <20210223150412.5124-1-nikhil.nd@ti.com>
	<14633cdf-dc04-5132-0f1d-49c25b50f614@ti.com>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <3bdd1121-11e2-1caa-0270-01bfb401349a@ti.com>
Date: Wed, 24 Feb 2021 11:12:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14633cdf-dc04-5132-0f1d-49c25b50f614@ti.com>
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
X-List-Received-Date: Wed, 24 Feb 2021 05:42:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23/02/21 9:09 pm, Lokesh Vutla wrote:
> 
> 
> On 23/02/21 8:34 pm, Nikhil Devshatwar wrote:
>> Currently, the K3 platforms do not include the TI wlan related packages.
>> Add in the tisdk-connectivity packagegroup.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> It is always good to give Suggested-by credits. >
> Suggested-by: Hari Nagalla <hnagalla@gmail.com>

Thank you, I will keep in mind for next time


> 
> Also this is a v2 of your previous patch[0]. This should be specified in
> $subject tag and add change log in notes section. Otherwise,

I intentionally did not mark this as v3 since this patch is different 
from previous version since we are not adding any new recipe here.

> > Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks,
Nikhil D

> 
> [0] http://patchwork.dal.design.ti.com/patch/59321/
> 
> Thanks and regards,
> Lokesh
> 

