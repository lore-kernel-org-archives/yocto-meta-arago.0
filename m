Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412C8EB64DD
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 02:02:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4348.1691287342135389019
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 05 Aug 2023 19:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u8ew9/Oa;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37622HPW117058;
	Sat, 5 Aug 2023 21:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691287337;
	bh=smR8/xhW1yVKXltu5JwXbzH4RJiTulRCPSH5i2+eKCs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u8ew9/OacA2iHnA6UhLvaJwJU4ZO15PeVDSG1e6D3oY8QLEC7NQdt83IHe7zUk2C1
	 R7xek80elLuhaH1jq2ORZcgHmUHc0titbPt5BVdb7OBxgoTNzvgYg6PZsDUPe0PHF1
	 qwlVXuPTDofAzq/bi1mHc7oUSziWyFDupXzyYdPo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37622HTj014166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 5 Aug 2023 21:02:17 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 5
 Aug 2023 21:02:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 5 Aug 2023 21:02:17 -0500
Received: from [10.249.33.158] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37622GjX015806;
	Sat, 5 Aug 2023 21:02:16 -0500
Message-ID: <c2e2fdff-1b62-b6ff-7024-165819b7d66f@ti.com>
Date: Sat, 5 Aug 2023 21:02:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] init-manager-*: Mimic
 poky method of choosing init manager
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230804185529.13282-1-reatmon@ti.com>
 <20230804224613.GC3359@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230804224613.GC3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 06 Aug 2023 02:02:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14826

I thought about it.  But we have so many other ARAGO_* variables that it 
seemed more on brand to use ARAGO_INIT_MANAGER...

As for not reusing the files... ours have a minor difference.  One 
variable I think.  So again for consistency I made the files local. 
Plus, it can be really confusing to bounce between layers when including 
files and what not.  If we did use those files, then I would definitely 
want to add a comment next the include line that states that the files 
are in oe-core.  But


On 8/4/2023 5:46 PM, Denys Dmytriyenko wrote:
> In such case, why not use existing INIT_MANAGER variable along with the
> corresponding init-manager-*.inc files from OE-Core?
> 
> 
> On Fri, Aug 04, 2023 at 01:55:29PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Change arago over to a single init-manager for all images instead of a
>> mixture of systemd/sysvinit based on perceived image size.  With the
>> migration to a more targeted initramfs we have the space in the image to
>> support systemd and not require sysvinit for the smaller images.
>>
>> We will still support setups that use ARAGO_SYSVINIT, but the preferred
>> method will be to set ARAGO_INIT_MANAGER in the local.conf with the
>> deault being systemd.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: - Add missing .inc in require.
>>      - Fix assignment in init-manager-*.inc files.
>>      - Remove packagegroup-arago-sysvinit-boot.bb since we stopped using
>>        it.
>>
>>   meta-arago-distro/conf/distro/arago.conf          | 11 +++--------
>>   .../conf/distro/include/init-manager-systemd.inc  | 10 ++++++++++
>>   .../conf/distro/include/init-manager-sysvinit.inc | 10 ++++++++++
>>   .../recipes-core/images/arago-image.inc           |  2 +-
>>   .../recipes-core/images/arago-tiny-image.inc      |  4 ----
>>   .../packagegroup-arago-sysvinit-boot.bb           | 15 ---------------
>>   6 files changed, 24 insertions(+), 28 deletions(-)
>>   create mode 100644 meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>>   create mode 100644 meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 38c42ef8..698053cb 100644
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
>> +ARAGO_INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
>> +require conf/distro/include/init-manager-${ARAGO_INIT_MANAGER}.inc
>>   
>>   # Distro-specific package configuration
>>   PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
>> diff --git a/meta-arago-distro/conf/distro/include/init-manager-systemd.inc b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>> new file mode 100644
>> index 00000000..5d9d9a8e
>> --- /dev/null
>> +++ b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>> @@ -0,0 +1,10 @@
>> +# Use systemd for system initialization
>> +
>> +DISTRO_FEATURES:append = " systemd"
>> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
>> +
>> +VIRTUAL-RUNTIME_dev_manager = "systemd"
>> +VIRTUAL-RUNTIME_init_manager = "systemd"
>> +VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>> +VIRTUAL-RUNTIME_initramfs = "systemd-initramfs"
>> +VIRTUAL-RUNTIME_login_manager = "shadow-base"
>> diff --git a/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>> new file mode 100644
>> index 00000000..6ee41d6c
>> --- /dev/null
>> +++ b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>> @@ -0,0 +1,10 @@
>> +# Use sysvinit for system initialization
>> +
>> +DISTRO_FEATURES:append = " sysvinit"
>> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
>> +
>> +VIRTUAL-RUNTIME_dev_manager = ""
>> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
>> +VIRTUAL-RUNTIME_initscripts = "initscripts"
>> +VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
>> +VIRTUAL-RUNTIME_login_manager = "busybox"
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
>>   
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

