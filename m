Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0B179529D8
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:38:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6JZbJK101270;
	Fri, 6 Nov 2020 13:35:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604691337;
	bh=Jg/ePWk8eanPd8gtmJqK0C6ZJpa/eO4B49XR/BJeXgY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QM50IHJMJz3Csd+By6cyYC1Fd3A2UjaPT980zp88JDF7DR1ds61sKPEEt3hLTUTWw
	IF8YxiRGHHLC43/CGFHFQIgJJLbaIogg2IijGd0RUgOEM7jDkuRdGCOybfpIX+LDTq
	YSsVWphCPJnNh1ZP6ufVL7WQEyG3ADgPmdBv3eX4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6JZbui031894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2020 13:35:37 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 6 Nov 2020 13:35:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 6 Nov 2020 13:35:37 -0600
Received: from [10.250.39.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6JZbSZ104319;
	Fri, 6 Nov 2020 13:35:37 -0600
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <20201106175807.E7BF2529D8@arago-project.org>
	<20201106193256.GJ19155@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4abef988-e8e1-08bb-e789-2e580ce2ee18@ti.com>
Date: Fri, 6 Nov 2020 13:35:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106193256.GJ19155@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [arago-commits] Dan Murphy : ti-sci-fw: Update to 2020.08b system firmware
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
X-List-Received-Date: Fri, 06 Nov 2020 19:38:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Denys

On 11/6/20 1:32 PM, Denys Dmytriyenko wrote:
> On Fri, Nov 06, 2020 at 05:58:07PM +0000, Arago Project git wrote:
>> Module: meta-ti
>> Branch: dunfell-next
>> Commit: f8979375632b7fc75233aaca5e420bbb37b2fef9
>> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f8979375632b7fc75233aaca5e420bbb37b2fef9
>>
>> Author: Dan Murphy <dmurphy@ti.com>
>> Date:   Fri Nov  6 09:12:33 2020 -0600
>>
>> ti-sci-fw: Update to 2020.08b system firmware
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>
>> ---
>>
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc    |    6 +++---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    2 ++
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 00e6118..24de33d 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
>>   LICENSE = "TI-TFL"
>>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>   
>> -PV = "2020.08-rc3"
>> +PV = "2020.08b"
>>   
>> -SRCREV = "8a22979dc944f6f4f867e2ac637c51a317efaacd"
>> +SRCREV = "f5685b5980d93709e20466ffa19145ffd83b4ca4"
>>   BRANCH ?= "ti-linux-firmware"
>> -SRCREV_imggen = "36fe2d183a734f65b9adbd3097e5d51a6f931521"
>> +SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
>>   SRCREV_FORMAT = "imggen"
>>   
>>   SRC_URI = " \
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 1239b27..f9a7cf4 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -19,6 +19,8 @@ SYSFW_SOC ?= "unknown"
>>   SYSFW_CONFIG ?= "unknown"
>>   
>>   SYSFW_PREFIX = "ti-sci-firmware"
>> +SYSFW_PREFIX_j7 = "ti-fs-firmware"
>> +SYSFW_PREFIX_j7200-evm = "ti-fs-firmware"
> This is not needed - j7200-evm is part of j7 SOC_FAMILY, so the first line
> would be enough...

Actually this is not even correct.  This fails to build because the 
MACHINE is for the k3r5.  Both of these still use the ti-sci prefix.

The working change actually will be

SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"

I am testing this now and the builds are now passing

Dan


