Return-Path: <vigneshr@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7195352A5D
	for <meta-arago@arago-project.org>;
	Thu,  3 Jun 2021 08:55:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1538uJti104566
	for <meta-arago@arago-project.org>; Thu, 3 Jun 2021 03:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622710579;
	bh=v4p5P4J7dsV1QJPW2KzpQPrzrwHxHivOIFR4++TMNlc=;
	h=Subject:To:References:From:CC:Date:In-Reply-To;
	b=srGiwAbnMCzYuNVf/8qewGEakxdQK63G6Wgsooss11juAk8+3EWXez8f+WC63IRS8
	VCN6ZGYMS6xG5JiYCt0oZML6QyAX50p4x9iRaVecybvzVB/bB3pTAjdbfcgalJ0Wep
	1yUVcp/no2GH00FJWrfZs8N8o9c+yb5EiHlEEJmU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1538uJmA093237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 3 Jun 2021 03:56:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 3 Jun 2021 03:56:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 3 Jun 2021 03:56:19 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1538uH5Q127239;
	Thu, 3 Jun 2021 03:56:18 -0500
To: Aparna M <a-m1@ti.com>, <meta-arago@arago-project.org>
References: <20210603032020.23448-1-a-m1@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <092132a2-c918-b0c6-ca4d-82239523dc6a@ti.com>
Date: Thu, 3 Jun 2021 14:26:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210603032020.23448-1-a-m1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-arago PATCH] tisdk-core-bundle: Install sysfw.itb in the prebuilt-images directory
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jun 2021 08:55:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+praneeth

On 6/3/21 8:50 AM, Aparna M wrote:
> Install the sysfw.itb file in the prebuilt images directory of the
> tisdk-core-bundle package.
> 

Why do we need to package sysfw.itb given that its already part of
tiboot3.bin in case of am64x?



> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index 253bfbb6..d1bfdc55 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -14,6 +14,7 @@ DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
>  DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
>  DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
>  DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
> +DEPLOY_IMAGES_NAME_append_am64xx-evm = " sysfw.itb"
>  
>  ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
>  export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> 

