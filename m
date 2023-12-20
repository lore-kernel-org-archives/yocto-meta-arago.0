Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07685C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 05:42:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15656.1703050921616301403
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 21:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IPT/lhIo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BK5g06K118893
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Dec 2023 23:42:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703050920;
	bh=VPj4kmsjNX2I0Z9j7Y2ghhuPlEUDh8iEhvwchLzJSMU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IPT/lhIoteKUIOvZsK+QF+6iy3G9CvCZTwAOrPyQSyDeizOKOTHen60wEA+SidEIN
	 FYcI06rHDCbQn3c/jFXpFI0l0pobICioo2ZJd++nLmSzGjF3Npg9FYukdtfjzM2SHD
	 bAPXDdddgo+rN0Lclfad3XQp0a0pdNfYvERIZd78=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BK5g0o6067101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Dec 2023 23:42:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Dec 2023 23:42:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Dec 2023 23:42:00 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BK5fwjb099589;
	Tue, 19 Dec 2023 23:41:59 -0600
Message-ID: <5f043199-7b8e-41f5-ad9a-9980e7df4ade@ti.com>
Date: Wed, 20 Dec 2023 11:11:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 9.1 release config
Content-Language: en-US
To: <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>
References: <20231219093155.186246-1-r-ravikumar@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231219093155.186246-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 05:42:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15064

NAK

Why are we pushing a oe-config with internal bit-bucket links on public 
lists?

On 19/12/23 15:01, Rahul T R via lists.yoctoproject.org wrote:
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   .../processor-sdk-analytics-09.01.00-config.txt  | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
>
> diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
> new file mode 100644
> index 0000000..1fe0f1f
> --- /dev/null
> +++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.0,42a1c9fe698a03feb34c5bba223c6e6e0350925b
> +meta-arago,ssh://git@bitbucket.itg.ti.com/coresdk/meta-arago.git,kirkstone-j722s-wakeup,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,402affcc073db39f782c1ebfd718edd5f11eed4c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,ssh://git@bitbucket.itg.ti.com/coresdk/meta-ti.git,kirkstone-j722s-wakeup,HEAD,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,b77cd331199fa62e3b162f37efca3b927c68d8e5,layers=meta
> +meta-tisdk,ssh://git@bitbucket.itg.ti.com/ti-sdk-linux/meta-tisdk.git,kirkstone-j722s-wakeup,HEAD,layers=
> +meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgeai.git,kirkstone-j722s-wakeup,HEAD,layers=
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes

