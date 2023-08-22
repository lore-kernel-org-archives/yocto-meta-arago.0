Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F876EE49AF
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:37:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7056.1692736655228578627
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 13:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nxdJfG2h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MKbWoq061687;
	Tue, 22 Aug 2023 15:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692736652;
	bh=HePoMLvabek5GP9RxlX69/3HohebJgojls7T8Qprx5U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nxdJfG2h2k8j7TwmuYYDjgRWNhv4xvvtNn3E1eP6EUQBU2cwpxqepqpIcZ25gQ6LS
	 FErHerOSy7eOqijfeGCRAjBQg4MswEuhfjTbjLPLSF/RrxT06uQY0nvyAOiNEMvVpt
	 8iMDu/KQL0JvZWZvivqvKW/v4tvspuV3MsGkOk9U=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MKbVhL093326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 15:37:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 15:37:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 15:37:31 -0500
Received: from [10.249.36.124] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MKbVBK106064;
	Tue, 22 Aug 2023 15:37:31 -0500
Message-ID: <2ea79acc-5ce3-639e-725b-dbbec91f4419@ti.com>
Date: Tue, 22 Aug 2023 15:37:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-distro: add meta-clang
 dependency and llvmpipe
Content-Language: en-US
To: <rs@ti.com>, <denis@denix.org>
CC: <k-bhargav@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230822012914.3184998-2-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230822012914.3184998-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Aug 2023 20:37:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14861



On 8/21/2023 8:29 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Devices that must use software rendering should use llvmpipe over the
> default softpipe. There are significant performance improvements
> associated with this change for devices like AM62A which lack a GPU.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 4 ++++
>   meta-arago-distro/conf/layer.conf        | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 48f053bb..ffa10cfa 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -102,6 +102,10 @@ PACKAGECONFIG:append:pn-piglit = " \
>   PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>   PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>   
> +# Use llvmpipe for better performance with software rendering
> +PACKAGECONFIG:append:pn-mesa = "gallium-llvm"
> +PACKAGECONFIG:append:pn-mesa-pvr = "gallium-llvm"

In addition to the test that I'm running on omapl138-lcdk, the above 
append lines need spaces at the beginning of the string.  I'll let you 
know the results of the test for a v2 of this patch.

> +
>   # Enable encryption support in open62541
>   PACKAGECONFIG:append:pn-open62541 = " encrypt"
>   
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 5de46fc9..02d5beaa 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -19,6 +19,7 @@ LAYERDEPENDS_meta-arago-distro = " \
>       meta-python \
>       qt5-layer \
>       meta-arago-extras \
> +    clang-layer \
>   "
>   
>   LAYERRECOMMENDS_meta-arago-distro = " \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

