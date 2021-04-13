Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 45FE952CB2
	for <meta-arago@arago-project.org>;
	Tue, 13 Apr 2021 15:18:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DFJI1w116064;
	Tue, 13 Apr 2021 10:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618327158;
	bh=CHC3gG4hj6/LdrtKpkbV8Vk0JWKALdoUVyKDnYE9XYI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=X8fxO+fZsUQTM6y0xlE1TQQBLyFwTw30WS4Zzf2XYWQT/cZ92WVx2oBwyZaaEgSwr
	8jCFyjHHM8L+Z/Ma/qVntqi+ts5rQ6x84JW2/U4OIPenJtuH9dXy2XZx9Jx1QJyGBo
	kJAIewq8jpPWA2TEp5kvkXp+gjbwBfJ2mC95TpFw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DFJGZJ047785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 10:19:18 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 13 Apr 2021 10:19:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 13 Apr 2021 10:19:16 -0500
Received: from [10.250.68.143] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DFJE4R115936;
	Tue, 13 Apr 2021 10:19:15 -0500
To: Denys Dmytriyenko <denis@denix.org>, <praneeth@ti.com>
References: <20210412034540.18980-1-praneeth@ti.com>
	<20210412035855.GJ15937@denix.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <edb7035e-fa10-dc3d-eccd-b6321ea6d451@ti.com>
Date: Tue, 13 Apr 2021 10:19:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412035855.GJ15937@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master PATCH] branding-core: Remove PREFERRED_VERSION to pick 2021LTS baseline
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
X-List-Received-Date: Tue, 13 Apr 2021 15:18:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/11/21 10:58 PM, Denys Dmytriyenko wrote:
> On Sun, Apr 11, 2021 at 10:45:40PM -0500, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> commit 400d58becfb5 ("branding: Add branding-core-next to aid in migration")
>> added support of PREFERRED_VERSION as 2020LTS kernel and uboot for branding core.
>>
>> Now that migration to 2021LTS (i.e 5.10 kernel and 2021.01 u-boot) is added,
>> removing the PREFERRED_VERSION so that core brand picks the expected
>> kernel and uboot baseline.
> 
> I assume everything has been ported to 5.10, including ipc/rpmsg, SGX/RGX, 

IPC 3.x stack and K2 MPM and dependent components will break, since I haven't
added the rpmsg-proto and rpmsg-rpc drivers yet (legacy SoCs).

SGX/RGX kernel dts nodes are added, and Gowtham is working through the driver
changes to get them functional.

regards
Suman

> etc. and everything in CoreSDK builds w/o issues in Dunfell?
> 
> 
> Probably best to completely remove core-next branding, i.e. reverting:
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=f90d1bed7e775ac59bf1fcd95e95e9109d0953db
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=400d58becfb53a62d9cc9ad75ddfcd0933e426f5
> 
> Also, revert this in meta-ti:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=a0e26c1caf7d36953bd41f6a763101f5a65919e2
> 
> And when updating the kernel, don't forget to re-add the minor version:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=efa402ee13689e61b4a5758334e71aae302310c3
> 
> 
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>  meta-arago-distro/conf/distro/include/branding-core.inc | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
>> index 10853d8b..3d259d2d 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
>> @@ -12,10 +12,5 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
>>  # Raise priority for sample IPC FW images
>>  ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
>>  
>> -PREFERRED_VERSION_linux-ti-staging = "5.4%"
>> -PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
>> -PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
>> -PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
>> -
>>  # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
>>  MACHINE_FEATURES_remove = "mmip"
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>
> 


