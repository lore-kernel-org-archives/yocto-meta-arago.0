Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D49DC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:46:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1377.1659123961710004748
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VD7JUxsS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26TJjxkk126613;
	Fri, 29 Jul 2022 14:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659123959;
	bh=KOofl0WfHe8bfPmPmnWCRaBcjWkZTdu88Y/3Gw9C3+Q=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=VD7JUxsS7W9bWAF/nTcVjvPgFYfOToYyUHnEtOwoACJEPdnYJqanfe6fF1k/lehoJ
	 1uTQLwsXfLpEKof4LRa2pb+ZTHl/D6Xef2JeEoKgStlATdDds2RPCeyVM3Co0V1AEp
	 02u/E6fjhooi7eVstk+8aYUu9qqIANobpnJDqhjE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26TJjxZi021833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 29 Jul 2022 14:45:59 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Jul 2022 14:45:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Jul 2022 14:45:59 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26TJjwGj116740;
	Fri, 29 Jul 2022 14:45:58 -0500
Message-ID: <ede06e39-18a5-579e-5080-01ab52255201@ti.com>
Date: Fri, 29 Jul 2022 14:45:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][dunfell][PATCH] ti-linux-fw: Create
 K3_IMAGE_GEN_BRANCH variable
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1706646529B30D3A.19696@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1706646529B30D3A.19696@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:46:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13970

Wrong list.  Ran the wrong script.  Ignore...


On 7/29/2022 14:44, Ryan Eatmon via lists.yoctoproject.org wrote:
> For the upcoming CICD flow we need to control the branch for
> all of the needed packages.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 8aaf1559..0d947b49 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -29,9 +29,11 @@ K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
>   SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
>   SRCREV_FORMAT = "imggen"
>   
> +K3_IMAGE_GEN_BRANCH ?= "master"
> +
>   SRC_URI = " \
>   	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
> -	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
> +	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=${K3_IMAGE_GEN_BRANCH};destsuffix=imggen;name=imggen \
>   "
>   
>   S = "${WORKDIR}/git"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

