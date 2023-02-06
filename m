Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF10BC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 22:05:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.68186.1675721115270317577
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 14:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dawis252;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 316M5D5C102655;
	Mon, 6 Feb 2023 16:05:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675721113;
	bh=8Rh1lMTkpT2feKojkTig/eQHeUuhpCtW9E9atOe39Zc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dawis252IlzKF7wqNNLqy3pVs/Fmruq3BM7dHtU9tpW756RKZcl8Z7wHazzxNbK/z
	 Z0pP9EF3FDsTLgAjuw5Z/5Sp42R1GnMtk7XmBwJ6051nKnLSih12iSvIihUNtrZagy
	 wS8zwSxVmCqPPY/GDxmk70yJnsIwUMOAdM0VJDh8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 316M5Dsi026436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Feb 2023 16:05:13 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Feb 2023 16:05:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Feb 2023 16:05:13 -0600
Received: from [10.250.32.73] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 316M5DDK015039;
	Mon, 6 Feb 2023 16:05:13 -0600
Message-ID: <85c00271-ca1b-9da5-9d8e-07ec57499963@ti.com>
Date: Mon, 6 Feb 2023 16:05:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-arago][master/kirkstone/dunfell][PATCH] stream: Enable
 stream benchmark again
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <17400CA9F7079A6F.3213@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17400CA9F7079A6F.3213@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Feb 2023 22:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14203


This patch will not apply to kirkstone/master.  I have sent a follow on 
patch that will.


On 2/2/2023 9:49, Ryan Eatmon via lists.yoctoproject.org wrote:
> We have worked through the hosting issues and found a new home for the stream
> benchmark.  Fix the SRC_URI and add the package back into the packagegroups.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 1 +
>   meta-arago-distro/recipes-core/packagegroups/ti-test.bb         | 1 +
>   meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb       | 2 +-
>   3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 073740a2..23fae8e0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -49,6 +49,7 @@ UTILS_append_ti43x = " mmc-utils \
>   UTILS_append_omap-a15 = " mmc-utils \
>                             switch-config \
>                             libdrm-omap \
> +                          stream-openmp \
>                             pru-icss \
>                             ti-ipc-rtos-fw \
>                             uio-test-pruss \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 5c33f5aa..53a8cd47 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -37,6 +37,7 @@ ARAGO_TEST = "\
>       linuxptp \
>       openntpd \
>       nbench-byte \
> +    stream \
>   "
>   
>   ARAGO_TEST_append_armv7a = " \
> diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> index fef8eb8f..d14fc884 100644
> --- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> +++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> @@ -9,7 +9,7 @@ PR = "r0"
>   BRANCH ?= "master"
>   SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
>   
> -SRC_URI = "git://git.ti.com/git/sitara-linux/stream.git;protocol=https;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/git/arago-project-org/stream.git;protocol=https;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

