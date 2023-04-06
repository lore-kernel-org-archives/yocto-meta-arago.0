Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C96DC77B6C
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:18:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.167986.1680808732559476495
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aVZUlT2G;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336JIotm073620;
	Thu, 6 Apr 2023 14:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680808730;
	bh=NIzqgOhjT+NL/KHJV91BZ/9zg5j0z5Da0QQIyrDN+es=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=aVZUlT2GeDddYFRklDoY98RJirQSrHHb2V4mmbMrCsmzlToDcHtKH8VaWrgIlHV7h
	 4EEIYgpufY5XprfnK3Gy9fpjXaUwt5pZLIqjeN24DxE6H+Etp4UOH7hfvHjRIrvNQE
	 8YDs3S/4KlhBcv7Z2xXXHs3OKGOZjfNGzmZyLtsE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336JIoGO050075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 14:18:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 14:18:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 14:18:50 -0500
Received: from [10.247.31.254] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336JIoT7004763;
	Thu, 6 Apr 2023 14:18:50 -0500
Message-ID: <ce7a5d36-1634-cbe1-1c25-8eb152ac3bf7@ti.com>
Date: Thu, 6 Apr 2023 14:18:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-arago][kirkstone/master][PATCH] branding-ltsprep:
 Temporarily disable GC320 driver
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230406191508.7031-1-afd@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230406191508.7031-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14297



On 4/6/2023 2:15 PM, Andrew Davis via lists.yoctoproject.org wrote:

A one line description will be great.

apart from that, the patch makes sense.

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> index a944bcdf..ee8761f9 100644
> --- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -9,3 +9,6 @@ PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
>   MACHINE_FEATURES:remove = "gpu"
>   PREFERRED_PROVIDER_virtual/gpudriver = ""
>   
> +# GC320 support requires out-of-tree drivers not available in until LTS prep is
> +# complete. Disable for now.
> +MACHINE_FEATURES:remove = "gc320"

