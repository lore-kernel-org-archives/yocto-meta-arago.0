Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F1C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 16:26:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.24278.1679070406232190465
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 09:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sAtl47tW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HGQhZA064276;
	Fri, 17 Mar 2023 11:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679070403;
	bh=xwKFyTDMH/nInbEkbHBFMsb1aXqwEz8pzPPIFoiSMVs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sAtl47tWIyEz0jNYl6MMP/J2TYvuEu4oy+QjfhgukCvGxtMgmuhoOX+JxupLXhaoW
	 HrgRQtrKUkhaDkcfc/qO8zp0RlKjw4TYbJKHGOSieENCIJrMJy3t4wP84I/RKulPEe
	 CUksAw0s/CZHhe6g+yuXzQmiu9qD5EqE8yF9YhfE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HGQhDX032192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 11:26:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 11:26:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 11:26:43 -0500
Received: from [128.247.81.25] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HGQgrf014828;
	Fri, 17 Mar 2023 11:26:43 -0500
Message-ID: <2fd6cad5-3b61-e9cc-30d7-77e74c522c0c@ti.com>
Date: Fri, 17 Mar 2023 11:26:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] branding-ltsprep: LTS
 migration brand
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230317161550.17946-1-reatmon@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
In-Reply-To: <20230317161550.17946-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Mar 2023 16:26:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14260


On 3/17/23 11:15, Ryan Eatmon wrote:
> Add a new brand to control picking the next LTS version of kernel and
> u-boot while they are under development.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>


Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


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
> +PREFERRED_PROVIDER_virtual/gpudriver = ""
> +

