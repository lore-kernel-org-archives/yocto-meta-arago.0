Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE3D7877F
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:29:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1024.1732202964017615053
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 07:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=feb8vSbj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFTNge105751;
	Thu, 21 Nov 2024 09:29:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732202963;
	bh=s0XrJu0SxrVZuyBK3anj2rimYbQk2TAh9I7wruTqlrc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=feb8vSbjc8J8cWahdyNyOQ0tSHkmhC7ueykekwotfrGfaUMq4SFUxrGhr+qGdpSd2
	 oZYwFBqZ6Gz7q5Ou13NQvITp1QBzyyDGAtNYpPG/T6YPxwUcG1r/I+tYB1eq7zwyCF
	 rlIqdPK1sAtflvV+fFRwDXCP/MkCjpU4wMMAPvRs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALFTNUh030821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Nov 2024 09:29:23 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 09:29:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 09:29:22 -0600
Received: from [10.249.33.223] ([10.249.33.223])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFTMGp115641;
	Thu, 21 Nov 2024 09:29:22 -0600
Message-ID: <28e8573a-9615-4f82-88e0-6323d56f3a17@ti.com>
Date: Thu, 21 Nov 2024 09:29:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone/scarthgap][PATCH RESEND v2] Add
 hwspinlocktest
To: Judith Mendez <jm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
References: <20241119011723.3762206-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241119011723.3762206-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 15:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15625



On 11/18/2024 7:17 PM, Judith Mendez wrote:
> Add hwspinlock recipe to build out of tree module hwspinlock test.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v2:
> - Add v2 to subject
> Changes since v1:
> - Change SRC_URI to pull from remote repo and add patches on top
> ---
>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>   .../0001-Add-support-for-AM62-SoCs.patch      | 31 +++++++++++++
>   ...Fix-Makefile-for-to-build-with-yocto.patch | 46 +++++++++++++++++++
>   .../hwspinlocktest/hwspinlocktest_0.1.bb      | 18 ++++++++
>   4 files changed, 96 insertions(+)
>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support-for-AM62-SoCs.patch
>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 695bed5c..91ebec44 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -17,6 +17,7 @@ TI_TEST_BASE = "\
>       evtest \
>       fio \
>       git \
> +    hwspinlocktest \
>       hdparm \
>       i2c-tools \
>       iozone3 \
> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support-for-AM62-SoCs.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support-for-AM62-SoCs.patch
> new file mode 100644
> index 00000000..b2b99814
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support-for-AM62-SoCs.patch
> @@ -0,0 +1,31 @@
> +From 2d8d169898fb6615dd5100c4ac4e307c54678153 Mon Sep 17 00:00:00 2001
> +From: Judith Mendez <jm@ti.com>
> +Date: Mon, 18 Nov 2024 14:57:45 -0600
> +Subject: [PATCH] Add support for AM62* SoCs
> +
> +The K3 AM62* SoCs have a hwspinlock IP in MAIN domain.
> +Extend the test to add the desired SoC compatible so that
> +the test can be exercised on these new SoC families.
> +

Both of the patches need an Upstream-Status entry to tell maintainers 
what the disposition of the patch is.

Add this to both:

Upstream-Status: Inactive-Upstream [private repo]




> +Signed-off-by: Judith Mendez <jm@ti.

com>
> +---
> + omap_hwspinlock_test.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
> +index b180138..46fcc08 100644
> +--- a/omap_hwspinlock_test.c
> ++++ b/omap_hwspinlock_test.c
> +@@ -199,6 +199,9 @@ static const struct hwspinlock_data soc_data[] = {
> + 	{ "ti,j7200",	256, },
> + 	{ "ti,am642",	256, },
> + 	{ "ti,j721s2",	256, },
> ++	{ "ti,am625",	256, },
> ++	{ "ti,am62a7",	256, },
> ++	{ "ti,am62p5",	256, },
> + 	{ /* sentinel */ },
> + };
> +
> +--
> +2.47.0
> +
> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
> new file mode 100644
> index 00000000..ac362b2c
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
> @@ -0,0 +1,46 @@
> +From 3e1a3e3b9455f4cd40f7cc86a8eaff80206f77ce Mon Sep 17 00:00:00 2001
> +From: Judith Mendez <jm@ti.com>
> +Date: Mon, 18 Nov 2024 10:26:55 -0600
> +Subject: [PATCH] Fix Makefile for to build with yocto
> +
> +Fix Makefile that builds hwspinlocktest out-of-tree-module
> +for yocto recipie to be able to build the module.
> +
> +Signed-off-by: Judith Mendez <jm@ti.com>
> +---
> + Makefile | 18 ++++++++++--------
> + 1 file changed, 10 insertions(+), 8 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 23ee629..d8fe76d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -3,15 +3,17 @@
> + # TI OMAP HwSpinlock Unit Test
> + #
> +
> +-obj-m = omap_hwspinlock_test.o
> ++obj-m := omap_hwspinlock_test.o
> ++
> ++SRC := $(shell pwd)
> +
> + all:
> +-ifeq ($(KERNELDIR),)
> +-	@echo "Error: KERNELDIR not set, exiting..."
> +-	@echo "Eg: make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- KERNELDIR=<linux-kernel rootdir>"
> +-	@exit 1
> +-endif
> +-	make ${MAKE_OPTS} -C $(KERNELDIR) M=$(PWD) modules
> ++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
> ++
> ++modules_install:
> ++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
> +
> + clean:
> +-	$(RM) -r *.o *.ko *.mod* *.dwo .*.dwo .*.cmd *.symvers modules.order
> ++	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
> ++	rm -f Module.markers Module.symvers modules.order
> ++	rm -rf .tmp_versions Modules.symvers
> +--
> +2.47.0
> +
> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> new file mode 100644
> index 00000000..6de7bbb5
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Build hwspinlock test as an external Linux kernel module"
> +DESCRIPTION = "${SUMMARY}"
> +LICENSE = "GPL-2.0-only | BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
> +
> +inherit module
> +
> +SRC_URI = "git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
> +		   file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
> +		   file://0001-Add-support-for-AM62-SoCs.patch "
> +SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
> +
> +S = "${WORKDIR}/git"
> +
> +# The inherit of module.bbclass will automatically name module packages with
> +# "kernel-module-" prefix as required by the oe-core build environment.
> +
> +RPROVIDES:${PN} += "kernel-module-hwspinlocktest"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

