Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DFECE529EA
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 23:01:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PN1n0e003918
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 17:01:49 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PN1ndQ025349
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 17:01:49 -0600
Received: from [158.218.103.195] (158.218.103.195) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 17:01:47 -0600
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1456440810-23861-1-git-send-email-e-ruei1@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581423B553@DFLE09.ent.ti.com>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <56CF87D6.8040906@ti.com>
Date: Thu, 25 Feb 2016 18:01:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581423B553@DFLE09.ent.ti.com>
X-Originating-IP: [158.218.103.195]
Subject: Re: [PATCH V2] tisdk Makefile: Replace PVR_NULLDRM with TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 23:01:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/2016 5:57 PM, Stiffler, Jacob wrote:
>
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Ruei, Eric
>> Sent: Thursday, February 25, 2016 5:54 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH V2] tisdk Makefile: Replace PVR_NULLDRM
>> with TARGET_PRODUCT per graphics DDK change
>>
>> PVR_NULLDRM is only applicable for DDK 1.9 and is no longer used.
>> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>> tisdk-makefile_1.0.bb
>> index bcd78ba..ccfd734 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>> makefile_1.0.bb
>> @@ -156,10 +156,9 @@ PLATFORM_OMAPDRM_ti33x = "omap335x"
>>   PLATFORM_OMAPDRM_ti43x = "omap437x"
>>   PLATFORM_OMAPDRM_omap-a15 = "omap5430"
>>
>
> What about PLATFORM_OMAPDRM? Use for this was also removed with the change to the makefile fragment.
>
>  From commit (346c53c5e38d02b1901936bfb7388db55e3e30ec):
>
> -       make -C ./eurasia_km/eurasiacon/build/linux2/__PLATFORM_OMAPDRM___linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) PVR_NULLDRM=__PVR_NULLDRM__
> +       make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
>
>

You are right. It should be removed, too.

Eric


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
>> @@ -239,7 +238,7 @@ do_install () {
>>       sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
>>
>>       sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/"
>> ${D}/Makefile
>> -    sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
>> +    sed -i -e "s/__TARGET_PRODUCT__/${TARGET_PRODUCT}/" ${D}/Makefile
>>       sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g"
>> ${D}/Makefile
>>       sed -i -e
>> "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g"
>> ${D}/Makefile
>>       sed -i -e
>> "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}
>> /g" ${D}/Makefile
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


