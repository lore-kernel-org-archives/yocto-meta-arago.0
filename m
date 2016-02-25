Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 18A3E52ABE
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 22:30:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PMUWm9017599
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:30:32 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PMUWUh012233
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:30:32 -0600
Received: from [158.218.103.195] (158.218.103.195) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 16:30:32 -0600
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1456429962-17649-1-git-send-email-e-ruei1@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581423B4D5@DFLE09.ent.ti.com>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <56CF806E.3060806@ti.com>
Date: Thu, 25 Feb 2016 17:30:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581423B4D5@DFLE09.ent.ti.com>
X-Originating-IP: [158.218.103.195]
Subject: Re: [PATCH] tisdk Makefile: Replace PVR_NULLDRM with TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 22:30:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/2016 5:08 PM, Stiffler, Jacob wrote:
>
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Ruei, Eric
>> Sent: Thursday, February 25, 2016 2:53 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH] tisdk Makefile: Replace PVR_NULLDRM with
>> TARGET_PRODUCT per graphics DDK change
>>
>> PVR_NULLDRM is only applicable for DDK 1.9 and is no longer used.
>> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>> tisdk-makefile_1.0.bb
>> index bcd78ba..a9ced7e 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb
>> @@ -156,10 +156,9 @@ PLATFORM_OMAPDRM_ti33x = "omap335x"
>>   PLATFORM_OMAPDRM_ti43x = "omap437x"
>>   PLATFORM_OMAPDRM_omap-a15 = "omap5430"
>
> Is PLATFORM_OMAPDRM used anymore?
>

I did a search and it looks like that PLATFORM_OMAPDRM is no longer use.
Besides, I need to remove all PVR_NULLDRM references and add the 
corresponding one for TARGET_PRODUCT.

     sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile

==>

     sed -i -e "s/__TARGET_PRODUCT__/${TARGET_PRODUCT}/" ${D}/Makefile

I should re-submit this one.

>>
>> -PVR_NULLDRM = ""
>> -PVR_NULLDRM_ti33x = "1"
>> -PVR_NULLDRM_ti43x = "0"
>> -PVR_NULLDRM_omap-a15 = "0"
>> +TARGET_PRODUCT = "jacinto6evm"
>> +TARGET_PRODUCT_ti33x = "ti335x"
>> +TARGET_PRODUCT_ti43x = "ti437x"
>>
>>   PLATFORM_DEBUGSS = ""
>>   PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


