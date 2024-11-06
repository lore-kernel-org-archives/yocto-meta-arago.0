Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155C9D59F6F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 19:55:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.55694.1730922919373739107
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 11:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L7kmlTP4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6JtGL2057923;
	Wed, 6 Nov 2024 13:55:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730922916;
	bh=JB1RL4TrBKdTLrJFmbvDE4wQN+cOT3n6KOl0u65qloc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L7kmlTP4xCdFwTgmId6+dKqBDZjhcEZQFxHbC7vzFcQZOS3CfJ5lopIIoZ2eJg2am
	 xUaG+7a04Yn76pSjSmko2KX4L0wEX0DADru3JHY1NFun23VZOSwElVVJAQrsQnvSRp
	 RgxqCvM6Vz4M3EEmDAH+tnkzY/I/AA4BVZh2sG4g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6JtGvI035887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 13:55:16 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 13:55:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 13:55:16 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6JtFfR122330;
	Wed, 6 Nov 2024 13:55:15 -0600
Message-ID: <a672632f-6bf0-49b5-85b2-2145527ea001@ti.com>
Date: Wed, 6 Nov 2024 13:55:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone/scarthgap][PATCH] ti-test: Add
 hwspinlocktest
To: Denys Dmytriyenko <denis@denix.org>
CC: <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko <denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
References: <20241101222330.1900615-1-jm@ti.com>
 <c8152810-3749-4f7e-81a2-1479dd3834f9@ti.com>
 <20241106185136.GN20070@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241106185136.GN20070@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Nov 2024 19:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15598

On 11/6/24 12:51 PM, Denys Dmytriyenko wrote:
> On Wed, Nov 06, 2024 at 12:38:22PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 11/1/24 5:23 PM, Mendez, Judith via lists.yoctoproject.org wrote:
>>> Add hwspinlock recipe to build out of tree module hwspinlock test.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   .../recipes-core/packagegroups/ti-test.bb     |   1 +
>>>   .../hwspinlocktest/files/LICENSE              |  29 ++
>>>   .../hwspinlocktest/files/Makefile             |  19 ++
>>>   .../files/omap_hwspinlock_test.c              | 251 ++++++++++++++++++
>>
>> Why are we adding the entire source of this project into meta-arago? Is this
>> not the upstream: https://github.com/sumananna/omap-hwspinlock-test ?
>>
>> You should point to that and fetch from there like normal recipes.
> 
> FYI, this has been asked and answered already:
> https://lists.yoctoproject.org/g/meta-arago/topic/109054399#msg15583
> 

Ah, didn't see any hint to this not being the first version of this series..

Copying the answer here to respond inline,

> Apparently we do not want to pull from personal repos

Since when? We do that for lots of recipes.

> there is a JIRA req to move
> the repo to ti.com, but the target date is for 11.0. Since we
> want to add the test asap, the idea is to add to yocto and update
> the recipe later when the repo has been moved.

If you really want to use a ti.com based source repo, then do that first.
If setting up the repo clone is not a priority, then this test can't be that
important either. Do this in the right order. Copying the whole source
into the layer is hacky.

Andrew

> 
>>>   .../hwspinlocktest/hwspinlocktest_0.1.bb      |  18 ++
>>>   5 files changed, 318 insertions(+)
>>>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>>>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>>>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
>>>   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>>
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index 85398eaf..98fd0f56 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -18,6 +18,7 @@ TI_TEST_BASE = "\
>>>       evtest \
>>>       fio \
>>>       git \
>>> +    hwspinlocktest \
>>>       hdparm \
>>>       i2c-tools \
>>>       iozone3 \
>>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>>> new file mode 100644
>>> index 00000000..f5351a25
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>>> @@ -0,0 +1,29 @@
>>> +BSD 3-Clause License
>>> +
>>> +Copyright (c) 2019, Suman Anna
>>> +All rights reserved.
>>> +
>>> +Redistribution and use in source and binary forms, with or without
>>> +modification, are permitted provided that the following conditions are met:
>>> +
>>> +1. Redistributions of source code must retain the above copyright notice, this
>>> +   list of conditions and the following disclaimer.
>>> +
>>> +2. Redistributions in binary form must reproduce the above copyright notice,
>>> +   this list of conditions and the following disclaimer in the documentation
>>> +   and/or other materials provided with the distribution.
>>> +
>>> +3. Neither the name of the copyright holder nor the names of its
>>> +   contributors may be used to endorse or promote products derived from
>>> +   this software without specific prior written permission.
>>> +
>>> +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
>>> +AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>>> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
>>> +DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
>>> +FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
>>> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
>>> +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
>>> +CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
>>> +OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>>> +OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>>> new file mode 100644
>>> index 00000000..d8fe76dc
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>>> @@ -0,0 +1,19 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +#
>>> +# TI OMAP HwSpinlock Unit Test
>>> +#
>>> +
>>> +obj-m := omap_hwspinlock_test.o
>>> +
>>> +SRC := $(shell pwd)
>>> +
>>> +all:
>>> +	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
>>> +
>>> +modules_install:
>>> +	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
>>> +
>>> +clean:
>>> +	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
>>> +	rm -f Module.markers Module.symvers modules.order
>>> +	rm -rf .tmp_versions Modules.symvers
>>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
>>> new file mode 100644
>>> index 00000000..b1801389
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
>>> @@ -0,0 +1,251 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +/*
>>> + * OMAP hardware spinlock test driver
>>> + *
>>> + * Copyright (C) 2014-2021 Texas Instruments Incorporated - https://www.ti.com
>>> + *	Suman Anna <s-anna@ti.com>
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/init.h>
>>> +#include <linux/err.h>
>>> +#include <linux/sched.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +
>>> +#include <linux/hwspinlock.h>
>>> +
>>> +/* load-time options */
>>> +static int count = 2;
>>> +module_param(count, int, 0444);
>>> +
>>> +struct hwspinlock_data {
>>> +	const char *compatible;
>>> +	const unsigned int max_locks;
>>> +};
>>> +
>>> +static int hwspin_lock_test(struct hwspinlock *hwlock)
>>> +{
>>> +	int i;
>>> +	int ret;
>>> +
>>> +	pr_err("\nTesting lock %d\n", hwspin_lock_get_id(hwlock));
>>> +	for (i = 0; i < count; i++) {
>>> +		ret = hwspin_trylock(hwlock);
>>> +		if (ret) {
>>> +			pr_err("%s: Initial lock failed\n", __func__);
>>> +			return -EFAULT;
>>> +		}
>>> +		pr_err("trylock #1 status[%d] = %d\n", i, ret);
>>> +
>>> +		/* Verify lock actually works - re-acquiring it should fail */
>>> +		ret = hwspin_trylock(hwlock);
>>> +		pr_err("trylock #2 status[%d] = %d\n", i, ret);
>>> +		if (!ret) {
>>> +			/* Keep locks balanced even in failure cases */
>>> +			hwspin_unlock(hwlock);
>>> +			hwspin_unlock(hwlock);
>>> +			pr_err("%s: Recursive lock succeeded unexpectedly\n",
>>> +			       __func__);
>>> +			return -EFAULT;
>>> +		}
>>> +
>>> +		/* Verify unlock by re-acquiring the lock after releasing it */
>>> +		hwspin_unlock(hwlock);
>>> +		ret = hwspin_trylock(hwlock);
>>> +		pr_err("trylock after unlock status[%d] = %d\n", i, ret);
>>> +		if (ret) {
>>> +			pr_err("%s: Unlock failed\n", __func__);
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		hwspin_unlock(hwlock);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int hwspin_lock_test_all_locks(unsigned int max_locks)
>>> +{
>>> +	int i;
>>> +	int ret = 0, ret1 = 0;
>>> +	struct hwspinlock *hwlock = NULL;
>>> +
>>> +	pr_err("Testing %d locks\n", max_locks);
>>> +	for (i = 0; i < max_locks; i++) {
>>> +		hwlock = hwspin_lock_request_specific(i);
>>> +		if (!hwlock) {
>>> +			pr_err("request lock %d failed\n", i);
>>> +			ret = -EIO;
>>> +			continue;
>>> +		}
>>> +
>>> +		ret1 = hwspin_lock_test(hwlock);
>>> +		if (ret1) {
>>> +			pr_err("hwspinlock tests failed on lock %d\n", i);
>>> +			ret = ret1;
>>> +			goto free_lock;
>>> +		}
>>> +
>>> +free_lock:
>>> +		ret1 = hwspin_lock_free(hwlock);
>>> +		if (ret1) {
>>> +			pr_err("hwspin_lock_free failed on lock %d\n", i);
>>> +			ret = ret1;
>>> +		}
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static const struct of_device_id omap_hwspinlock_test_of_match[] = {
>>> +	{ .compatible = "ti,omap-hwspinlock-test",   },
>>> +	{ .compatible = "ti,omap4-hwspinlock-test",  },
>>> +	{ .compatible = "ti,omap5-hwspinlock-test",  },
>>> +	{ .compatible = "ti,dra7-hwspinlock-test",   },
>>> +	{ .compatible = "ti,am33xx-hwspinlock-test", },
>>> +	{ .compatible = "ti,am43xx-hwspinlock-test", },
>>> +	{ .compatible = "ti,am654-hwspinlock-test",  },
>>> +	{ /* end */ },
>>> +};
>>> +
>>> +static int hwspin_lock_test_all_phandle_locks(unsigned int max_locks)
>>> +{
>>> +	struct device_node *np = NULL;
>>> +	struct hwspinlock *hwlock = NULL;
>>> +	int ret = 0, ret1 = 0;
>>> +	unsigned int i;
>>> +	int num_locks;
>>> +	int hwlock_id;
>>> +
>>> +	np = of_find_matching_node_and_match(NULL,
>>> +					     omap_hwspinlock_test_of_match,
>>> +					     NULL);
>>> +	if (!np) {
>>> +		pr_err("\nNo test node provided\n");
>>> +		return 0;
>>> +	}
>>> +
>>> +	num_locks = of_count_phandle_with_args(np, "hwlocks", "#hwlock-cells");
>>> +	pr_err("Number of phandles = %d max_locks = %d\n",
>>> +	       num_locks, max_locks);
>>> +
>>> +	for (i = 0; i < num_locks; i++) {
>>> +		hwlock_id = of_hwspin_lock_get_id(np, i);
>>> +		if (hwlock_id < 0) {
>>> +			pr_err("unable to get hwlock_id : %d\n", hwlock_id);
>>> +			ret = -EINVAL;
>>> +			continue;
>>> +		};
>>> +
>>> +		hwlock = hwspin_lock_request_specific(hwlock_id);
>>> +		if (!hwlock) {
>>> +			pr_err("unable to get hwlock\n");
>>> +			ret = -EINVAL;
>>> +			continue;
>>> +		}
>>> +
>>> +		ret1 = hwspin_lock_test(hwlock);
>>> +		if (ret1) {
>>> +			pr_err("hwspinlock test failed on DT lock %d, ret = %d\n",
>>> +			       hwspin_lock_get_id(hwlock), ret1);
>>> +			ret = ret1;
>>> +		}
>>> +
>>> +		ret1 = hwspin_lock_free(hwlock);
>>> +		if (ret1) {
>>> +			pr_err("hwspin_lock_free failed on lock %d\n",
>>> +			       hwspin_lock_get_id(hwlock));
>>> +			ret = ret1;
>>> +		}
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static
>>> +unsigned int omap_hwspinlock_get_locks(const struct hwspinlock_data *data)
>>> +{
>>> +	unsigned int locks = 0;
>>> +
>>> +	while (data->compatible) {
>>> +		if (of_machine_is_compatible(data->compatible)) {
>>> +			locks = data->max_locks;
>>> +			break;
>>> +		}
>>> +		data++;
>>> +	}
>>> +
>>> +	return locks;
>>> +}
>>> +
>>> +static const struct of_device_id omap_hwspinlock_of_match[] = {
>>> +	{ .compatible = "ti,omap4-hwspinlock", },
>>> +	{ .compatible = "ti,am654-hwspinlock", },
>>> +	{ .compatible = "ti,am64-hwspinlock",  },
>>> +	{ /* end */ },
>>> +};
>>> +
>>> +static const struct hwspinlock_data soc_data[] = {
>>> +	{ "ti,omap4",	32, },
>>> +	{ "ti,omap5",	32, },
>>> +	{ "ti,dra7",	256, },
>>> +	{ "ti,am33xx",	128, },
>>> +	{ "ti,am43",	128, },
>>> +	{ "ti,am654",	256, },
>>> +	{ "ti,j721e",	256, },
>>> +	{ "ti,j7200",	256, },
>>> +	{ "ti,am642",	256, },
>>> +	{ "ti,j721s2",	256, },
>>> +	{ /* sentinel */ },
>>> +};
>>> +
>>> +static int omap_hwspinlock_test_init(void)
>>> +{
>>> +	struct device_node *np;
>>> +	unsigned int max_locks;
>>> +	int ret;
>>> +
>>> +	pr_err("\n** HwSpinLock Unit Test Module initiated **\n");
>>> +
>>> +	max_locks = omap_hwspinlock_get_locks(soc_data);
>>> +	if (!max_locks) {
>>> +		pr_err("\nNot a compatible platform\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	np = of_find_matching_node_and_match(NULL, omap_hwspinlock_of_match,
>>> +					     NULL);
>>> +	if (!np || !of_device_is_available(np)) {
>>> +		pr_err("\nNo HwSpinlock node provided/enabled\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	pr_err("\n***** Begin - Test All Locks ****\n");
>>> +	ret = hwspin_lock_test_all_locks(max_locks);
>>> +	if (ret)
>>> +		pr_err("hwspin_lock_test_all_locks failed, ret = %d\n", ret);
>>> +	pr_err("\n***** End - Test All Locks ****\n");
>>> +
>>> +	pr_err("\n***** Begin - Test All pHandle Locks ****\n");
>>> +	ret = hwspin_lock_test_all_phandle_locks(max_locks);
>>> +	if (ret)
>>> +		pr_err("hwspin_lock_test_all_locks failed, ret = %d\n", ret);
>>> +	pr_err("\n***** End - Test All pHandle Locks ****\n");
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void omap_hwspinlock_test_exit(void)
>>> +{
>>> +	pr_err("\n** HwSpinLock Unit Test Module finished **\n");
>>> +}
>>> +
>>> +module_init(omap_hwspinlock_test_init);
>>> +module_exit(omap_hwspinlock_test_exit);
>>> +
>>> +MODULE_LICENSE("Dual BSD/GPL");
>>> +MODULE_DESCRIPTION("Hardware spinlock Test driver for TI SoCs");
>>> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
>>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>> new file mode 100644
>>> index 00000000..2edd93f6
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>> @@ -0,0 +1,18 @@
>>> +SUMMARY = "Build hwspinlock test as an external Linux kernel module"
>>> +DESCRIPTION = "${SUMMARY}"
>>> +LICENSE = "GPL-2.0-only | BSD-3-Clause"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
>>> +
>>> +inherit module
>>> +
>>> +SRC_URI = "file://Makefile \
>>> +           file://omap_hwspinlock_test.c \
>>> +           file://LICENSE \
>>> +          "
>>> +
>>> +S = "${WORKDIR}"
>>> +
>>> +# The inherit of module.bbclass will automatically name module packages with
>>> +# "kernel-module-" prefix as required by the oe-core build environment.
>>> +
>>> +RPROVIDES:${PN} += "kernel-module-hwspinlocktest"

