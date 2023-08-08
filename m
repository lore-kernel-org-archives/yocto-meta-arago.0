Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1500FC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 13:14:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.60877.1691500456945167171
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 06:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rFS0C4CI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 378DEC5W095047;
	Tue, 8 Aug 2023 08:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691500452;
	bh=UTehCZeZTWfSAFHK7K/IMFjvOGg3wIKekHBU0+huLh8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rFS0C4CISKx3MUBPaFVZHVDLL4OlYhZ/D2F7SDgNH9s1Hnsr0T+0snMi0HF9You3J
	 hR9Ndyg1MUpuNGeXgF0ehleuerBU6sXZzbM/m081a0fc8U/AuscD0xEYVpingDJ6to
	 2rwN7j0KkayUAQ0g2nUwIjUsJ/oj8CoxTGITkXAw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 378DECSO014077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Aug 2023 08:14:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Aug 2023 08:14:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Aug 2023 08:14:12 -0500
Received: from [10.249.33.158] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 378DECDI011470;
	Tue, 8 Aug 2023 08:14:12 -0500
Message-ID: <dc266958-a27d-2484-6f2d-43a0ce4e9041@ti.com>
Date: Tue, 8 Aug 2023 08:14:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] init-manager-*: Mimic
 poky method of choosing init manager
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230804185529.13282-1-reatmon@ti.com>
 <20230804224613.GC3359@denix.org>
 <c2e2fdff-1b62-b6ff-7024-165819b7d66f@ti.com>
 <20230808005908.GE3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230808005908.GE3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 08 Aug 2023 13:14:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14830



On 8/7/2023 7:59 PM, Denys Dmytriyenko wrote:
> On Sat, Aug 05, 2023 at 09:02:17PM -0500, Ryan Eatmon wrote:
>> I thought about it.  But we have so many other ARAGO_* variables
>> that it seemed more on brand to use ARAGO_INIT_MANAGER...
>>
>> As for not reusing the files... ours have a minor difference.  One
>> variable I think.  So again for consistency I made the files local.
>> Plus, it can be really confusing to bounce between layers when
>> including files and what not.  If we did use those files, then I
>> would definitely want to add a comment next the include line that
>> states that the files are in oe-core.  But
> 
> Was this reply truncated accidentally? ^^^
> 
> So, the only difference in those .inc files between OE-Core and meta-arago was
> due to trying to use both systemd and sysvinit at the same time. I had to add
> a custom VIRTUAL-RUNTIME_initramfs for that:
> 
> https://git.yoctoproject.org/meta-arago/commit/?id=78efe456a884176cfd1f6794fd317fc1e51b9358
> 
> systemd recipe in OE-Core alredy provides a subpackage systemd-initramfs with
> the /init symlink pointing to systemd binary:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd_254.bb#n273
> 
> When not using any init managers for a barebone ramdisk boot, you should
> provide a custom /init script to do boot chores, like initramfs-framework
> in OE-Core does:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework/init
> 
> BTW, sysvinit has /sbin/init and that one should be used first, or used as a
> fallback (don't remember the exact order now), so doing /init -> /sbin/init
> shouldn't be strictly necessary and was done for consistency with systemd.
> Also, I don't remember all the details, but it could have been also done to
> workaround early K3 simulation boot issues...
> 
> 
> Anyway, since you are now dismantling all this custom logic, it might be
> better to drop sysvinit-initramfs, VIRTUAL-RUNTIME_initramfs and fully embrace
> upstream INIT_MANAGER variable and existing init-manager-*.inc files from
> OE-Core. Maybe a bit of extra testing to ensure everything still boots as
> expected... :)


Ok.  I'll try that out.


> 
>> On 8/4/2023 5:46 PM, Denys Dmytriyenko wrote:
>>> In such case, why not use existing INIT_MANAGER variable along with the
>>> corresponding init-manager-*.inc files from OE-Core?
>>>
>>>
>>> On Fri, Aug 04, 2023 at 01:55:29PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> Change arago over to a single init-manager for all images instead of a
>>>> mixture of systemd/sysvinit based on perceived image size.  With the
>>>> migration to a more targeted initramfs we have the space in the image to
>>>> support systemd and not require sysvinit for the smaller images.
>>>>
>>>> We will still support setups that use ARAGO_SYSVINIT, but the preferred
>>>> method will be to set ARAGO_INIT_MANAGER in the local.conf with the
>>>> deault being systemd.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>> v2: - Add missing .inc in require.
>>>>      - Fix assignment in init-manager-*.inc files.
>>>>      - Remove packagegroup-arago-sysvinit-boot.bb since we stopped using
>>>>        it.
>>>>
>>>>   meta-arago-distro/conf/distro/arago.conf          | 11 +++--------
>>>>   .../conf/distro/include/init-manager-systemd.inc  | 10 ++++++++++
>>>>   .../conf/distro/include/init-manager-sysvinit.inc | 10 ++++++++++
>>>>   .../recipes-core/images/arago-image.inc           |  2 +-
>>>>   .../recipes-core/images/arago-tiny-image.inc      |  4 ----
>>>>   .../packagegroup-arago-sysvinit-boot.bb           | 15 ---------------
>>>>   6 files changed, 24 insertions(+), 28 deletions(-)
>>>>   create mode 100644 meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>>>>   create mode 100644 meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>>>>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>>>
>>>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>>>> index 38c42ef8..698053cb 100644
>>>> --- a/meta-arago-distro/conf/distro/arago.conf
>>>> +++ b/meta-arago-distro/conf/distro/arago.conf
>>>> @@ -58,14 +58,9 @@ DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
>>>>   DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>>>>   # Set global runtime providers for major components
>>>> -ARAGO_SYSVINIT ?= "0"
>>>> -VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>>>> -VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>>>> -VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
>>>> -VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
>>>> -VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>>>> -
>>>> -DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
>>>> +ARAGO_SYSVINIT ??= "0"
>>>> +ARAGO_INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
>>>> +require conf/distro/include/init-manager-${ARAGO_INIT_MANAGER}.inc
>>>>   # Distro-specific package configuration
>>>>   PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
>>>> diff --git a/meta-arago-distro/conf/distro/include/init-manager-systemd.inc b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>>>> new file mode 100644
>>>> index 00000000..5d9d9a8e
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
>>>> @@ -0,0 +1,10 @@
>>>> +# Use systemd for system initialization
>>>> +
>>>> +DISTRO_FEATURES:append = " systemd"
>>>> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
>>>> +
>>>> +VIRTUAL-RUNTIME_dev_manager = "systemd"
>>>> +VIRTUAL-RUNTIME_init_manager = "systemd"
>>>> +VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>>>> +VIRTUAL-RUNTIME_initramfs = "systemd-initramfs"
>>>> +VIRTUAL-RUNTIME_login_manager = "shadow-base"
>>>> diff --git a/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>>>> new file mode 100644
>>>> index 00000000..6ee41d6c
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
>>>> @@ -0,0 +1,10 @@
>>>> +# Use sysvinit for system initialization
>>>> +
>>>> +DISTRO_FEATURES:append = " sysvinit"
>>>> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
>>>> +
>>>> +VIRTUAL-RUNTIME_dev_manager = ""
>>>> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
>>>> +VIRTUAL-RUNTIME_initscripts = "initscripts"
>>>> +VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
>>>> +VIRTUAL-RUNTIME_login_manager = "busybox"
>>>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
>>>> index d00c1f70..1c87afd5 100644
>>>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>>>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>>>> @@ -30,6 +30,6 @@ BAD_RECOMMENDATIONS += " \
>>>>       coreutils \
>>>>       coreutils-dev \
>>>>   "
>>>> -BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", "busybox-syslog", d)}"
>>>> +BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
>>>>   inherit core-image remove-net-rules
>>>> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>>>> index 242e763c..6c726c4d 100644
>>>> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>>>> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>>>> @@ -1,9 +1,5 @@
>>>> -ARAGO_SYSVINIT = "1"
>>>>   require arago-image.inc
>>>>   IMAGE_FEATURES:remove = "splash"
>>>> -IMAGE_INSTALL = " \
>>>> -	packagegroup-arago-sysvinit-boot \
>>>> -"
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>>> deleted file mode 100644
>>>> index df7ff960..00000000
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>>> +++ /dev/null
>>>> @@ -1,15 +0,0 @@
>>>> -REQUIRED_DISTRO_FEATURES = "sysvinit"
>>>> -inherit features_check
>>>> -
>>>> -require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>> -
>>>> -PR = "r0"
>>>> -
>>>> -# Cannot use eudev:
>>>> -#   "eudev was skipped: 'systemd' in DISTRO_FEATURES"
>>>> -#VIRTUAL-RUNTIME_dev_manager = "eudev"
>>>> -VIRTUAL-RUNTIME_dev_manager = ""
>>>> -VIRTUAL-RUNTIME_init_manager = "sysvinit"
>>>> -VIRTUAL-RUNTIME_initscripts = "initscripts"
>>>> -VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
>>>> -VIRTUAL-RUNTIME_login_manager = "busybox"
>>>> -- 
>>>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

