Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01D7E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:30:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21589.1736260199283700693
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 06:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lpbeof9C;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 507ETwGD2655508
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Jan 2025 08:29:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736260198;
	bh=ijiwYVP65+tGc6KJo3kr5OOToHC9TiV+crUTU79lX1o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lpbeof9CLzRtR1eFQxF4jRI9apX3+j8nF3h7RI9qkg9vbY2TONwlZJvsS5lCoHIKv
	 w67TSunFZUFiJU98hi8srIogfDPmC9/E6co8eJFIDOYNkUo+dMNvIuNs4FvEF46vQU
	 I+ONI/wxV+pGha9ys/UPsEoLHWPA7iRwayyK9muk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507ETwbl023996
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Jan 2025 08:29:58 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 08:29:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 08:29:57 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507ETvVq107906;
	Tue, 7 Jan 2025 08:29:57 -0600
Message-ID: <a296424c-e83e-4dc9-9bb5-6a2b0bc478db@ti.com>
Date: Tue, 7 Jan 2025 08:29:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 10.1 release config
To: Shreyash Sinha <s-sinha@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <r-ravikumar@ti.com>
References: <20250107131429.1575406-1-s-sinha@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250107131429.1575406-1-s-sinha@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Jan 2025 14:30:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15686


NAK.  We have moved the configs over to an XML format so that we can 
support multiple layer setup tools.  You need to convert this file into 
an appropriate XML file, run make to generate all of the correct setup 
files, and then submit all of those files in this patch.

More information can be found in the README at the top of the repository.


On 1/7/2025 7:14 AM, Shreyash Sinha wrote:
> Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
> ---
>   .../processor-sdk-analytics-10.01.00-config.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
> 
> diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
> new file mode 100644
> index 0000000..df51b1b
> --- /dev/null
> +++ b/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,f40a3a477d5241b697bf2fb030dd804c1ff5839f
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b6349e47760397add572cc27468e0f30b40474c1,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,a1af9bdf2bcf06df85aeac997bfbdcb414d8e0e0,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,f06324bc1649e4f437686560cbd66f973ba920f5,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7dabefdd4544951b4746b48476,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abdf3870a94f00199eb53e276e5,layers=
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7,layers=meta
> +meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,fcd7661087b0dd5b5b57d30ba0d45f2698e962f8,layers=
> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,41499d7bcc8d37862b93c0d56cf782f9182d0be1,layers=
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

