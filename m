Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F560C27C50
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 16:23:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.88226.1717431782086446756
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 09:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J491573t;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453GN19a099125
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 11:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717431781;
	bh=n2Oc8s9zr1OGDEaryesiRbaCb//syJOgQcrbWyQ7j3k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J491573tlwUCpPzHa+M0ahB9CNZKMIc1hCpm0G3IGptRojwR4lUg47/o7QGz2fXSd
	 0HqAdKgKtgq9qdXxLkVjbmyEor2+VGCfKOKrzKOiiM2GO25sgt3JgISg4PtnNsv9xJ
	 w3xbOfZvrbEd4gAbr1AWuzaKr1/z46vhGfsUgmNA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453GN1w4067560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 11:23:01 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 11:23:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 11:23:01 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453GN14c072820;
	Mon, 3 Jun 2024 11:23:01 -0500
Message-ID: <d43cd99f-7f9f-4a54-8e4b-ee9158d93e7c@ti.com>
Date: Mon, 3 Jun 2024 11:23:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-core:
 packagegroup-arago-tisdk-addons: Add back kmscube
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
References: <20240603063846.2815948-1-c-shilwant@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240603063846.2815948-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15355



On 6/3/2024 1:38 AM, Chirag Shilwant wrote:
> - kmscube was earlier packaged as a run time dependency for matrix-gui.
> But now as matrix-gui is removed [1], add kmscube manually.
> 
> - kmscube can be used by developers to quickly validate the GPU and display
> after driver or userspace changes. So it is good to add it back.
> 
> [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=master&id=e4b33fbc34aa90d156310b3cd1cb23f1d0cadab4
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 8dbffa81..d25c9eb1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -79,6 +79,7 @@ EXTRA_PACKAGES = " \
>       nodejs-npm \
>       protobuf \
>       ccief-basic \
> +    kmscube \
>   "

Previously the kmscube was only included for builds that support 
graphics.  This change just adds it in for all builds.  I think we need 
to limit the scope of when it gets added in.

Plus, is tisdk-addons the right place to add this?  Versus 
tisdk-graphics?  I think tisdk-graphics is already gated behind the 
check that I was mentioning above.



>   EXTRA_PACKAGES:omapl138 = " \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

