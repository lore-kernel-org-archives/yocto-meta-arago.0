Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9116BC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 15:35:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.175.1652369733561189997
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VnXqpwCl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CFZUmN029708;
	Thu, 12 May 2022 10:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652369730;
	bh=/Gbd5P49vapW0GMF8hMBgrZQxHLltqXIeqnSkWX9pto=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VnXqpwClnjUQxJKj5NKonbWHZne0RdK8DB1ApnD3oIE+ABaQHWr0sBkXfxHlGPxOM
	 SRdx1ALA5Pfj2+zFIIdjnHxWDUMdrbTVRu6GdFpIhZq/dFHbNg7MOkkQHBopXBiB5U
	 +nsiSf2TysskXrLdY15ScVp3tpX0Ld3C1UO43NZc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CFZUYW024227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 10:35:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 10:35:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 10:35:29 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CFZTwC116012;
	Thu, 12 May 2022 10:35:29 -0500
Message-ID: <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
Date: Thu, 12 May 2022 10:35:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add
 ti-sci-firmware binary to prebuilt-images directory of SDK
Content-Language: en-US
To: Aparna M <a-m1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
References: <20220512152846.661-1-a-m1@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220512152846.661-1-a-m1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 15:35:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13850



On 5/12/2022 10:28, Aparna M wrote:
> Add ti-sci-firmware binaries required for uboot build to the
> prebuilt-images directory of SDK.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> This patch is dependent on
> https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_patch_ti_sci_fw/91058279
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index 9ebcbb0e..d5a11f36 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -21,6 +21,9 @@ DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
>   DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
>   DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
>   DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
> +DEPLOY_IMAGES_NAME_append_am64xx-evm = " ti-sci-firmware-am64x-gp.bin"
> +DEPLOY_IMAGES_NAME_append_am64xx-hs-evm = " ti-sci-firmware-am64x-hs-cert.bin ti-sci-firmware-am64x-hs-enc.bin fitImage-its.its"
> +DEPLOY_IMAGES_NAME_append_am62xx-evm = " ti-fs-firmware-am62x-gp.bin ipc_echo_testb_mcu1_0_release_strip.xer5f"
>   
>   ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
>   export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"


Same as the other patch on meta-ti.  I think the 
ipc_echo_testb_mcu1_0_release_strip.xer5f file needs to not be in this 
file.  The other changes are fine, but remove that one.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

