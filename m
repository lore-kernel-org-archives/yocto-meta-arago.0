Return-Path: <afd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6C53952987
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2019 18:52:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NIqLgU124016
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556045541;
	bh=h9UaUw07DhLCH/++x7K1bRe9qI3HwFc0wQDDHG6QFBc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=yBUyKtZ4grPLaoi/ixjOXOwTKZ+NVc162hQyJ6/oEPY7eZPuhZvhjpNykN1IfXaqd
	zKjJM7vLBDhS9VianKQpodI0M0juewPsX2nW4hxrnzGhuD6949v+MCb3fJWBaGQsYd
	enGXxkoG5J8NRnNqvDmK/HZiNWbqbBRVm7nT2oig=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NIqL5r067281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 13:52:21 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 13:52:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 13:52:20 -0500
Received: from [10.250.67.168] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NIqKkH114186;
	Tue, 23 Apr 2019 13:52:20 -0500
To: Dan Murphy <dmurphy@ti.com>, <meta-arago@arago-project.org>, <denys@ti.com>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
Date: Tue, 23 Apr 2019 14:52:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Tue, 23 Apr 2019 18:52:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/23/19 2:40 PM, Dan Murphy wrote:
> +Andrew
> 
> On 4/23/19 1:38 PM, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 2204a50c..ee87b3c7 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>  
>>  PR_append = ".arago0"
>>  
>> -PV = "3.2.0+git${SRCPV}"
>> +PV = "3.5.0+git${SRCPV}"

Might want to do the same for client/test, but they got tagged at 3.4.0,
I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
to move them here, it should not be a problem.

Andrew

>>  
>>  is_armv7 = "1"
>>  is_armv7_aarch64 = "0"
>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH = "ti_optee_os"
>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
>>  
>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>>

