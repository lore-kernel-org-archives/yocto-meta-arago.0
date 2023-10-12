Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75733CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:34:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13383.1697121257293877107
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 07:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y4TrnzeC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CEYEgf128996;
	Thu, 12 Oct 2023 09:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697121254;
	bh=XieJ9QZAtq9QTpEVT5bIroO/w9oeqJokHUkpdue8UVk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=y4TrnzeC4UeZC3hh0wbGslUzG18+lrkOpeU4R2PWiBDP5KrcVIxito1rOoa25IEV5
	 YWLeD9YpX3qaP4ad7/SjPDgtpP5R6HY8zP5030PgCWbZwhS7Huq016VkvY+mZ2VyhH
	 DoaaTgeAW4RH2UKpsPZftc3Z6dhjklm+jOwRDqiY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CEYEUO028315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Oct 2023 09:34:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 09:34:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 09:34:13 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CEYDDA027468;
	Thu, 12 Oct 2023 09:34:13 -0500
Message-ID: <ff425d61-ac16-4d41-91e6-0601148652f4@ti.com>
Date: Thu, 12 Oct 2023 09:34:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ti-test: Add various tools
To: LCPD Automation Script <lcpdbld@list.ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1697100333-93247-1-git-send-email-lcpdbld@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1697100333-93247-1-git-send-email-lcpdbld@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Oct 2023 14:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14929


This was an error in our CICD flow.  I forgot to update our config that 
the ltp-ddt recipe moved to meta-arago-test.  Ignore this patch.


On 10/12/2023 3:45 AM, LCPD Automation Script wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> Testing with poky shows that we were missing some needed utilities
> that our internal tests were calling.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../recipes-core/packagegroups/ti-test.bb          | 37 ++++++++++++++++++++--
>   1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 44f4f75..cf720c0 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -6,24 +6,36 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   inherit packagegroup
>   
>   TI_TEST_BASE = "\
> +    alsa-utils \
>       bc \
>       bonnie++ \
>       bridge-utils \
>       cryptodev-tests \
>       dma-heap-tests \
> +    dosfstools \
> +    ethtool \
>       evtest \
>       fio \
>       git \
>       hdparm \
> +    i2c-tools \
>       iozone3 \
> +    iproute2-tc \
> +    iproute2-devlink \
> +    iperf3 \
> +    kernel-modules \
>       kernel-selftest \
>       libdrm-tests \
>       linuxptp \
>       lmbench \
> +    lsof \
>       memtester \
>       mstpd \
> +    mtd-utils \
> +    mtd-utils-ubifs \
>       mtd-utils-ubifs-tests \
>       nbench-byte \
> +    netperf \
>       openntpd \
>       pcitest \
>       perf \
> @@ -36,6 +48,7 @@ TI_TEST_BASE = "\
>       stream \
>       stress \
>       stress-ng \
> +    tcpdump \
>       v4l-utils \
>       yavta \
>   "
> @@ -64,16 +77,22 @@ TI_TEST_TI_TOOLS = " \
>   
>   TI_TEST_TI_TOOLS:append:ti33x = " \
>       omapconf \
> +    pru-icss \
> +    switch-config \
>   "
>   
>   TI_TEST_TI_TOOLS:append:ti43x = " \
>       omapconf \
> +    pru-icss \
> +    switch-config \
>   "
>   
>   NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
>   
>   TI_TEST_TI_TOOLS:append:omap-a15 = " \
>       omapconf \
> +    pru-icss \
> +    switch-config \
>       ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
>           ti-ipc-test \
>   	    ${NOT_MAINLINE_MMIP_DEPS} \
> @@ -82,15 +101,29 @@ TI_TEST_TI_TOOLS:append:omap-a15 = " \
>   
>   TI_TEST_TI_TOOLS:append:k3 = " \
>       k3conf \
> +    switch-config \
> +    ti-rtos-firmware \
> +    ti-rpmsg-char \
> +    ti-rpmsg-char-examples \
>   "
>   
> -TI_TEST_TI_TOOLS:append:j721e = " \
> -    ufs-utils \
> +TI_TEST_TI_TOOLS:append:am62xx   = " \
> +    pru-icss \
> +"
> +
> +TI_TEST_TI_TOOLS:append:am64xx   = " \
> +    pru-icss \
> +"
> +
> +TI_TEST_TI_TOOLS:append:am65xx   = " \
> +    pru-icss \
>   "
>   
>   # Disable due to breakage
>   #    viddec-test-app
>   TI_TEST_TI_TOOLS:append:j721e = " \
> +    pru-icss \
> +    ufs-utils \
>       videnc-test-app \
>   "
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

