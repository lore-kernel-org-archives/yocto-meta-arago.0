Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A369ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 19:08:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.218.1666638513652031084
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 12:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OEluN0Lw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29OJ8T9t032053;
	Mon, 24 Oct 2022 14:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666638509;
	bh=hk4hxmAUGlWOZ29/vLKt1ttp06+HvGxprs3abB3dXUo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OEluN0LwfMoqHw2t8YbIjCzwlVNN+6Yr78nJUdkxMPR6HhUQNxV5xV/uKAeoNYRYQ
	 d3ZBPuabFk9X6dqrKk8FwRRBf+M6zBaZ8O4ez8UTUuGQFjO9yz9MR5D5boR5L2MUGT
	 /j0G4repVjkdYhz6Nn4rOBZpSOsfpqgGskBV4STw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29OJ8Ts5051267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Oct 2022 14:08:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 24
 Oct 2022 14:08:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 24 Oct 2022 14:08:28 -0500
Received: from [10.250.34.50] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29OJ8SSq118732;
	Mon, 24 Oct 2022 14:08:28 -0500
Message-ID: <9226da23-7ef8-32e3-ac97-8ff6b30b40ff@ti.com>
Date: Mon, 24 Oct 2022 14:08:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 0/6] Deprecated recipe
 removals
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20221011175320.26843-1-afd@ti.com>
 <20221011192215.GB22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221011192215.GB22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Oct 2022 19:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14088

On 10/11/22 2:22 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 11, 2022 at 12:53:14PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Hello all,
>>
>> Same series as last time, just removed that last patch
>> (meta-arago: Use new J7 SoC names over specific board names)
>> as it will be expanded into a new series.
> 
> LGTM, thanks!
> 
> 


Ryan,

Ping? This series will merge-conflict with Denys' patch removing
the makefiles, so this needs to go in first.

Andrew


>> Thanks,
>> Andrew
>>
>> Andrew Davis (6):
>>    ti-crypto-examples: Remove ti-crypto-examples
>>    big-data-ipc-demo: Merge include file and rename
>>    cmem: Remove Makefile_cmem-mod and cmem refrences
>>    meta-arago: Remove remaining bits of ti-ocf-crypto-module
>>    ti-pru-sw: Remove old TI-PRU-SW examples and helpers
>>    ti-tisdk: Remove uio-module-drv kernel module
>>
>>   .../conf/distro/include/arago-source-ipk.inc  | 19 ++---------
>>   ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 19 +----------
>>   ...kagegroup-arago-tisdk-addons-sdk-target.bb |  5 ---
>>   .../packagegroup-arago-tisdk-addons.bb        | 24 +-------------
>>   .../packagegroup-arago-tisdk-crypto.bb        |  1 -
>>   .../recipes-core/packagegroups/ti-test.bb     |  2 --
>>   .../ti-tisdk-makefile/Makefile_cmem-mod       | 33 -------------------
>>   .../Makefile_ti-crypto-examples               | 24 --------------
>>   .../Makefile_ti-ocf-crypto-module             | 18 ----------
>>   .../ti-tisdk-makefile/Makefile_uio-module-drv | 28 ----------------
>>   .../ti-tisdk-makefile_1.0.bb                  | 11 -------
>>   .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -----------------
>>   ...-linux_git.bb => big-data-ipc-demo_git.bb} | 30 +++++++++++------
>>   .../ti-crypto-examples_git.bb                 | 30 -----------------
>>   .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ---------------
>>   .../ti-pru-sw-edma-library_1.00.00.bb         | 30 -----------------
>>   .../ti-pru-sw-examples_1.00.00.bb             | 31 -----------------
>>   17 files changed, 24 insertions(+), 337 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
>>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
>>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
>>   delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
>>   rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-demo-linux_git.bb => big-data-ipc-demo_git.bb} (54%)
>>   delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
>>   delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
>>   delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
>>   delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb

