Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D8185520E5
	for <meta-arago@arago-project.org>;
	Sat, 10 Oct 2020 16:47:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AGiXpH124408
	for <meta-arago@arago-project.org>; Sat, 10 Oct 2020 11:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602348274;
	bh=Aue26Al4sJhVl5cr5yWGcxnzPuhNlYwLQFVUiIg9Vts=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=FQeTqSVsqZPnhY8CrezstY9ffk1PwFjnWpVuUIqYDpUJWn/qqlmEZ1ZcEAVHW5I7R
	fJJ+tjfbSVgsHCRujx6gmNrE95t/7c21phC66/arUyjuSwPStNekIVOit+6U2AjszH
	+D1F2hwdQhyks1KPd1STYaaqWEPoxvQkMYC8rfWQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AGiXZb031500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 10 Oct 2020 11:44:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 10 Oct 2020 11:44:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 10 Oct 2020 11:44:33 -0500
Received: from [10.250.67.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AGiX2r001502;
	Sat, 10 Oct 2020 11:44:33 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1602200997-36918-1-git-send-email-denis@denix.org>
	<20201009165645.GM23230@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <5e95a11d-4e45-adc8-cf20-f625373751c7@ti.com>
Date: Sat, 10 Oct 2020 11:44:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009165645.GM23230@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [oe-layersetup][PATCH] arago-dunfell/next: un-pin meta-arm layer
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
X-List-Received-Date: Sat, 10 Oct 2020 16:47:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/9/20 11:56 AM, Denys Dmytriyenko wrote:
> BTW, this is meant for oe-layersetup per subject prefix
>
> On Thu, Oct 08, 2020 at 07:49:57PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> It was pinned down some time ago due to baremetal toolchain conflicts, which
>> got resolved since.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   configs/arago-dunfell-config.txt      | 2 +-
>>   configs/arago-dunfell-next-config.txt | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
>> index c9428d9..e8ad1fa 100644
>> --- a/configs/arago-dunfell-config.txt
>> +++ b/configs/arago-dunfell-config.txt
>> @@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>>   meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
>> -meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
>> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
>>   oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>   OECORELOCALCONF=./sample-files/local-arago64.conf.sample
>> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
>> index 3f225b7..8820086 100644
>> --- a/configs/arago-dunfell-next-config.txt
>> +++ b/configs/arago-dunfell-next-config.txt
>> @@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>>   meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
>> -meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
>> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
>>   oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>   OECORELOCALCONF=./sample-files/local-arago64.conf.sample
>> -- 
>> 2.7.4
>>
> _______________________________________________

Applied

Thanks


