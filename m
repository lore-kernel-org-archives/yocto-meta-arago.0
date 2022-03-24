Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81801C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 22:27:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1155.1648160819101389212
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 15:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S54+G+ls;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22OMQtuH086876;
	Thu, 24 Mar 2022 17:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648160815;
	bh=r572kppr233Q42bv8BvteiXjEiuSR+B08VDxBaFILFo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S54+G+lskqZD/CxFC/M6phZlx4YCddHHCCEbWKV42sIYDvTMJ7lA4Xh86P8+IOa2X
	 14CbMErG79HGHxoSS/jjjeiefJCZUW+gdOSDhdNdndc2kKaKKQJoaAUMylU3qeQrNu
	 LS2E0/h8EuRQ86GH2Ju0b6NC9JxaTWTgysPIKHCw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22OMQs5d034543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 17:26:54 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 17:26:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 17:26:54 -0500
Received: from [10.249.37.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22OMQsnm003689;
	Thu, 24 Mar 2022 17:26:54 -0500
Message-ID: <70b9782b-4606-e096-90a7-d2e941bafe03@ti.com>
Date: Thu, 24 Mar 2022 17:26:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][master/dunfell][PATCH v2 1/2] ti-tisdk-makefile:
 adding uboot r5 config variable for am62xx
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220323210750.3959-1-reatmon@ti.com>
 <20220323210750.3959-2-reatmon@ti.com> <20220324203424.GZ23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220324203424.GZ23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 22:27:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13754



On 3/24/2022 15:34, Denys Dmytriyenko wrote:
>> ti-tisdk-makefile: adding uboot r5 config variable for am62xx
> 
> The patch below does a lot more than what the subject says...
> 
> And this patchset depends on the corresponding change in meta-ti, which needs
> some more work.

I will clean up the commit message and submit a v3 once we have closed 
on the meta-ti patches.


> 
> On Wed, Mar 23, 2022 at 04:07:49PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Nishanth Menon <nm@ti.com>
>>
>> lets add support for the latest of TI SoC.
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 4 ++++
>>   .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
>>   .../ti-tisdk-makefile/Makefile_sysfw-image                  | 1 +
>>   .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 6 ++++++
>>   4 files changed, 12 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> index c44f95ca..062948d0 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> @@ -57,6 +57,10 @@ UTILS_append_am64xx = " \
>>       pru-icss-src \
>>   "
>>   
>> +UTILS_append_am62xx = " \
>> +    pru-icss-src \
>> +"
>> +
>>   EXTRA_LIBS = ""
>>   
>>   EXTRA_LIBS_append_omap-a15 = " \
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> index 099817c3..094c47a2 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> @@ -65,6 +65,7 @@ UTILS_append_k3 = " mmc-utils \
>>   "
>>   
>>   UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
>> +UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
>>   UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>>   UTILS_append_j7 = " ti-rtos-firmware"
>>   UTILS_append_j7-evm = " pru-icss"
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
>> index aaf1f112..316483df 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
>> @@ -12,6 +12,7 @@ SYSFW_SOC_am65xx-evm = am65x
>>   SYSFW_SOC_am65xx-hs-evm = am65x
>>   SYSFW_SOC_am64xx-evm = am64x
>>   SYSFW_SOC_am64xx-hs-evm = am64x
>> +SYSFW_SOC_am62xx-evm = am62x
>>   SYSFW_SOC_j7-evm = j721e
>>   SYSFW_SOC_j7-hs-evm = j721e
>>   SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> index 7bda8eed..f0a044f7 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> @@ -202,6 +202,10 @@ MAKEFILES_append_am64xx = " \
>>                           pru-icss \
>>   "
>>   
>> +MAKEFILES_append_am62xx = " \
>> +                        pru-icss \
>> +"
>> +
>>   # Use this to export kernel arch to ARCH
>>   #
>>   # We need to be very careful here. This class will also overwrite UBOOT_ARCH
>> @@ -239,6 +243,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
>>   PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
>>   PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
>>   PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
>> +PRU_ICSS_INSTALL_TARGET_am62xx = "pru-icss_install_am62x"
>>   
>>   # Path to toolchains for the various cores in TI SOCs
>>   #
>> @@ -363,6 +368,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
>>   K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
>>   K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
>>   K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
>> +K3_UBOOT_MACHINE_R5_am62xx-evm = "am62xx_evm_r5_config"
>>   
>>   do_install_append_k3() {
>>       cat >> ${D}/Rules.make << __EOF__
>> -- 
>> 2.17.1
> 

-- 
Ryan Eatmon
reatmon@ti.com

