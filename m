Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10010EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:23:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4074.1687814625183342208
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 14:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fQLY9r3c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QLNhjN028944
	for <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 16:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687814623;
	bh=pO+9vinrGBuM4HI+Hp4M0Lovy3aF/6ffjocZgAY+bds=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fQLY9r3cubALYSNkbNY0W5nMTeIY97zB+Lvq2KQS5eU9tlFI6z20aPBudYfqIwKYn
	 qY7KIuEjJWUt7JD8AHSTROGPHqxLQ1ju5AigbHdUhdOyiAK052bwzuL0kVjjL6JJfG
	 yyoliOr3ZJWRx4JI4Sd4omA0oVg3XRAD1oFdMfok=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QLNhDk066068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 16:23:43 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 16:23:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 16:23:43 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QLNgon030830;
	Mon, 26 Jun 2023 16:23:42 -0500
Message-ID: <0fc32cbc-e68c-edec-8e19-c7854f576844@ti.com>
Date: Mon, 26 Jun 2023 16:23:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] classes: tisdk-bundle: Move
 the licenses directory out of docs/
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <c-shilwant@ti.com>
References: <20230626134336.1169017-1-a-limaye@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230626134336.1169017-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 21:23:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14690


This patch fails to build.  Was it tested?


On 6/26/2023 8:43 AM, Aniket Limaye wrote:
> We plan on not having docs populated in the intaller, to allow for
> easier doc updates on the release pages without having to update the
> installer.
> So move the licenses directory out of the docs directory
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-arago-distro/classes/tisdk-bundle.bbclass | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index b92ca0c0..4e613c6f 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -240,7 +240,7 @@ echo "
>   <h2>Credits</h2>
>   
>   <h2>Licenses</h2>
> -<p>Licenses can be found in the \"docs/licenses\" directory of the SDK install directory</p>
> +<p>Licenses can be found in the \"licenses\" directory of the SDK install directory</p>
>   
>   <h2><u><b>GCC RUNTIME LIBRARY EXCEPTION</b></u></h2>
>   <p>Version 3.1, 31 March 2009</p>
> @@ -287,7 +287,7 @@ cat >> ${SW_MANIFEST_TEXT} << 'EOF'
>   
>   <Licenses>
>   
> -Licenses can be found in the "docs/licenses" directory of the SDK install directory
> +Licenses can be found in the "licenses/" directory of the SDK install directory
>   GCC RUNTIME LIBRARY EXCEPTION
>   
>   Version 3.1, 31 March 2009
> @@ -876,11 +876,7 @@ tisdk_image_build () {
>       # the licenses that were used in the build.
>       if [ -d ${DEPLOY_DIR}/licenses ]
>       then
> -        if [ ! -d ${IMAGE_ROOTFS}/docs ]
> -        then
> -            mkdir -p ${IMAGE_ROOTFS}/docs
> -        fi
> -        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/docs/
> +        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/
>       fi
>   
>       # Create the TI software manifest

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

