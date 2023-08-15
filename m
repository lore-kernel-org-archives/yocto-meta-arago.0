Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D0C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:23:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.146064.1692134632208388392
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eIMF0DIs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FLNkOj011057;
	Tue, 15 Aug 2023 16:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692134626;
	bh=wO323OauAEwj7X386InSqXqDAwiyBPCzFiKH1eqyRi8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eIMF0DIsdBeF1ptwLaYz7f3rngDPyZgFJz+Sc2VJW2fjrn4jc260lctVwBfm9VEWh
	 wkt3yPs7QGiCpDt1H6qvTpiLRP+sYVSprAWr+SlC9SaERy11+xylwzZ/06sTityctv
	 riWG9kE5e/pe8Lk7sGYmzaPEwKW8tsjnDGx8PrJ8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FLNk3J014972
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 16:23:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 16:23:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 16:23:45 -0500
Received: from [10.249.36.124] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FLNjDF081798;
	Tue, 15 Aug 2023 16:23:45 -0500
Message-ID: <cfed03db-f86c-b034-9091-dcdd510bffe6@ti.com>
Date: Tue, 15 Aug 2023 16:23:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v3] init-manager-*: Leverage
 oe-core method of choosing init manager
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230815210806.12404-1-reatmon@ti.com>
 <20230815211959.GI3359@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230815211959.GI3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14849



On 8/15/2023 4:19 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 15, 2023 at 04:08:06PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Change arago over to the oe-core init-manager setup for all images instead
>> of a mixture of systemd/sysvinit based on perceived image size.  With the
>> migration to a more targeted initramfs we have the space in the image to
>> support systemd and not require sysvinit for the smaller images.
>>
>> We will still support setups that use ARAGO_SYSVINIT, but the preferred
>> method will be to set INIT_MANAGER in the local.conf with the default
>> being systemd.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v3: - Remove our own verisons of init-manager-*.inc and just use the
>>        oe-core versions.
>> v2: - Add missing .inc in require.
>>      - Fix assignment in init-manager-*.inc files.
>>      - Remove packagegroup-arago-sysvinit-boot.bb since we stopped using
>>        it.
>>
>>   meta-arago-distro/conf/distro/arago.conf          | 11 +++--------
>>   .../recipes-core/images/arago-image.inc           |  2 +-
>>   .../recipes-core/images/arago-tiny-image.inc      |  4 ----
>>   .../packagegroup-arago-sysvinit-boot.bb           | 15 ---------------
>>   4 files changed, 4 insertions(+), 28 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 38c42ef8..abae3724 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -58,14 +58,9 @@ DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
>>   DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>>   
>>   # Set global runtime providers for major components
>> -ARAGO_SYSVINIT ?= "0"
>> -VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>> -VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>> -VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
>> -VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
>> -VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>> -
>> -DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
>> +ARAGO_SYSVINIT ??= "0"
>> +INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
>> +require conf/distro/include/init-manager-${INIT_MANAGER}.inc
>>   
>>   # Distro-specific package configuration
>>   PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
>> index d00c1f70..1c87afd5 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>> @@ -30,6 +30,6 @@ BAD_RECOMMENDATIONS += " \
>>       coreutils \
>>       coreutils-dev \
>>   "
>> -BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", "busybox-syslog", d)}"
>> +BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
> 
> No more ARAGO_INIT_MANAGER
> 

Good catch.  v5 incoming.


>>   inherit core-image remove-net-rules
>> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>> index 242e763c..6c726c4d 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>> @@ -1,9 +1,5 @@
>> -ARAGO_SYSVINIT = "1"
>>   
>>   require arago-image.inc
>>   
>>   IMAGE_FEATURES:remove = "splash"
>>   
>> -IMAGE_INSTALL = " \
>> -	packagegroup-arago-sysvinit-boot \
>> -"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>> deleted file mode 100644
>> index df7ff960..00000000
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -REQUIRED_DISTRO_FEATURES = "sysvinit"
>> -inherit features_check
>> -
>> -require recipes-core/packagegroups/packagegroup-core-boot.bb
>> -
>> -PR = "r0"
>> -
>> -# Cannot use eudev:
>> -#   "eudev was skipped: 'systemd' in DISTRO_FEATURES"
>> -#VIRTUAL-RUNTIME_dev_manager = "eudev"
>> -VIRTUAL-RUNTIME_dev_manager = ""
>> -VIRTUAL-RUNTIME_init_manager = "sysvinit"
>> -VIRTUAL-RUNTIME_initscripts = "initscripts"
>> -VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
>> -VIRTUAL-RUNTIME_login_manager = "busybox"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

