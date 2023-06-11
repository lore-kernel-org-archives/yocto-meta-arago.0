Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6B6C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 19:56:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.43408.1686513360105855977
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 11 Jun 2023 12:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xfH6v8l1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35BJtwTW003485;
	Sun, 11 Jun 2023 14:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686513358;
	bh=w7NGtGdDPd7pf3+o3pJbEj+crLWpcgIXbVsIRpay9ys=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xfH6v8l1+ah+1EAgxG5nbjY1BB3wSaa38EAc4PXYsdgqupVpbyfRER7/V4OSnmHgQ
	 xZE7Ey1CI6KM+pwP1CN9Wi87sl0M86nFRa2jxwtRImDrgxIB4YiRTmHa4DdX1zJP9t
	 NyGn8amjAl4L+AMxdFKAgiKiDKIhW8D2An0ZtYII=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35BJtwrn118263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Jun 2023 14:55:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 Jun 2023 14:55:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 11 Jun 2023 14:55:58 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35BJtwxo031991;
	Sun, 11 Jun 2023 14:55:58 -0500
Message-ID: <72003ffd-f35e-fd24-b167-328d6a4b32aa@ti.com>
Date: Sun, 11 Jun 2023 14:55:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][RFC] meta-arago-distro: Add recipe
 for jailhouse image
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1767B2E51299FC86.11286@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1767B2E51299FC86.11286@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 11 Jun 2023 19:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14591


This is a rework of the previous patch series that is part of the one on 
meta-ti.  The only big change from the other patch is the removal of the 
brand.  Please see the patch on meta-ti.


On 6/11/2023 2:54 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Paresh Bhagat <p-bhagat@ti.com>
> 
> Add a recipe to build and package jailhouse image for am62xx-evm. new
> image will be named as tisdk-jailhouse-image. jailhouse recipe will
> also package overlay used for jailhouse.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../recipes-core/images/tisdk-jailhouse-image.bb     | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> new file mode 100644
> index 00000000..7df2404a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> @@ -0,0 +1,12 @@
> +# Produces wic image for jailhouse
> +
> +require recipes-core/images/tisdk-default-image.bb
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +IMAGE_INSTALL:append:am62xx-evm = " jailhouse"
> +
> +export IMAGE_BASENAME = "tisdk-jailhouse-image"
> +
> +WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
> +

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

