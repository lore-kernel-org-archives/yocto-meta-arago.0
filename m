Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32595C282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 18:32:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1219.1741199551336473331
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 10:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PpmNWtKZ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525IWULQ3941492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 12:32:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741199550;
	bh=D5RWZtuis0BF+aWGa/mZtPXtQwuePR2pQpBlfUGk/HE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PpmNWtKZzg/rsNbbQoxskHt1558yxXGILpicn4HrNId/zOiOSJYrXU51iWx0r0xGA
	 ZBToDG10TT/fkBq46fu+6BtesdVlVoMrg68cVfaThWN5LtXQmRWHXOpqV4pCd6QH07
	 j1kmbYaRcM1y0gTIH1RYwWipUYRKj7wE/uDgj8Z4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525IWUZL010309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 12:32:30 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 12:32:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 12:32:30 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525IWUXC083075;
	Wed, 5 Mar 2025 12:32:30 -0600
Message-ID: <affeb199-26ac-46fb-b931-d6d129c66f78@ti.com>
Date: Wed, 5 Mar 2025 12:32:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-graphics : Add ti-gc320-libs-dev package
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250305161648.351534-1-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250305161648.351534-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Mar 2025 18:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15945

On 3/5/25 10:16 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Reformat the packagegroup, by creating the GFX_GC320 variable which now
> includes ti-gc320-tests and the ti-gc320-libs-dev package. This is needed as
> the -dev package includes the symb link for the library.
> 
> This patch goes hand in hand with a patch series sent to meta-ti porting gc320
> to kernel 6.12 .
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-graphics.bb    | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index a82db154..60806446 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -16,11 +16,17 @@ GFX_UTILS:append:omap-a15  = "\
>       glsdk-util-scripts \
>   "
>   
> +GFX_GC320 = "\
> +    ti-gc320-libs-dev\

Do you really need this? The -dev package will be pulled into
the sysroot for any package that DEPENDS on the library.

> +    ti-gc320-tests\
> +"
> +
> +

Extra newline?

>   RDEPENDS:${PN} = "\
>       libegl \
>       glmark2 \
>       kmscube \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', "${GFX_GC320}", '', d)} \

Is there some test package that depends on ti-gc320-tests, maybe ltp-ddt?
If so then this should be a RDEPENDS in that package instead.

Andrew

>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
>       ${GFX_UTILS} \
>   "

