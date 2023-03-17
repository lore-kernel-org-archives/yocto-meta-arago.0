Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D33C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 17:15:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25515.1679073304289577611
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 10:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fpwQgSe1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HHF3bn130555;
	Fri, 17 Mar 2023 12:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679073303;
	bh=un+j3939hnqZ63HV9x8YnUz0sQB+XZoIy83uGReb3WQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=fpwQgSe16vVKAz1s5kzpJrU8Pk1Dk9CWa6/m699408kpYtk7mBVnz3JtBNnvTFuVl
	 3LLho1ZZZpPTQklUHHBOs6VAcemgJY6NW58BXjtkCT7UDCNLCP9qWb6kt1nlbgrhKv
	 YJXoCHoyGjU8bgesCgJnIVU7KxEP/pyRNZHRhoFU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HHF28e023474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 12:15:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 12:15:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 12:15:02 -0500
Received: from [10.250.33.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HHF1Ki024679;
	Fri, 17 Mar 2023 12:15:02 -0500
Message-ID: <97a18261-4c62-5cc1-b7b2-4f00befadfd3@ti.com>
Date: Fri, 17 Mar 2023 12:15:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] branding-ltsprep: LTS
 migration brand
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230317161550.17946-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230317161550.17946-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Mar 2023 17:15:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14261

On 3/17/23 11:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add a new brand to control picking the next LTS version of kernel and
> u-boot while they are under development.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Make the versions wildcarded so that they actually match...
> 
>   .../conf/distro/include/branding-ltsprep.inc          | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> new file mode 100644
> index 00000000..0238327c
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -0,0 +1,11 @@
> +
> +PREFERRED_VERSION_linux-ti-staging = "6.1%"
> +PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
> +PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
> +PREFERRED_VERSION_u-boot-ti-staging = "2023.01%"
> +
> +# GPU support requires out-of-tree SGX and RGX drivers not available in until
> +# LTS prep is complete.  fall back to software rendering
> +MACHINE_FEATURES:remove = "gpu"

We can leave the MACHINE_FEATURES as is, that way we still build the GUI bits,
only the below line is needed to switch to software rendering.

Otherwise, I would have preferred this patch the other way, have a new branding
to use the old unsupported kernel. Either way this seems reasonable for now.

Acked-by: Andrew Davis <afd@ti.com>

> +PREFERRED_PROVIDER_virtual/gpudriver = ""
> +

