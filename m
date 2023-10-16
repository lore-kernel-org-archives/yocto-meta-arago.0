Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658E0CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:08:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.111739.1697436499349145253
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 15 Oct 2023 23:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Mat3xGEH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39G68EKu008348;
	Mon, 16 Oct 2023 01:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697436495;
	bh=+cSfnobH/q04kWWeqA9NSySlaExaLWG2bvKwNVUF9II=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mat3xGEHvTPCFpWolSwFV4naftelYUPI1nQujhjdGNo64kxdl3azyiNDVz1Mx/0qe
	 9PXMgw/nvHglUXGicVUF0YU9Il+P8bui49jvSShhQzMs/ytP1cNwQHczK6g9dPIb2y
	 fWwzvq463YIaujCavwFO6WqLqUGibFwght33GJ48=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39G68EDI021073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 01:08:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 01:08:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 01:08:14 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39G68Buv059421;
	Mon, 16 Oct 2023 01:08:11 -0500
Message-ID: <96db37cd-0f5e-4c86-9208-325fe868463e@ti.com>
Date: Mon, 16 Oct 2023 11:38:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][master][PATCH] configs: processor-sdk: Add new
 config for AM62xSIP
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20231016053302.1009493-1-s-adivi@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231016053302.1009493-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 06:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14933


On 16/10/23 11:03, Sai Sree Kartheek Adivi wrote:
> Add new config processor-sdk-09.00.00-am62xxsip-config.txt for
> 09.00 release of am62xxsip-evm machine
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com> <mailto:c-shilwant@ti.com>


> ---
>   ...processor-sdk-09.00.00-am62xxsip-config.txt | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt
>
> diff --git a/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt b/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt
> new file mode 100644
> index 0000000..220ef8e
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt
> @@ -0,0 +1,18 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.0,41b6684489d0261753344956042be2cc4adb0159
> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,617ddf642233e7e83a86bb66c5b0edd268b93709,layers=
> +meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,09.00.00.003-AM62SIP,layers=
> +meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00.011,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,31930afca79b74e0c788452d71356c1f045e7979,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.011,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
> +#meta-clang,https://github.com/kraj/meta-clang,kirkstone,15e5c625ecf2adfdb8d05a7dae606953420d6db2,layers=
> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes

