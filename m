Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744BFC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:32:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13579.1707381158610568550
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 00:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mYNvpzdS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4188WYSP099507;
	Thu, 8 Feb 2024 02:32:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707381154;
	bh=jHebaX7kSWqCKyCgYK5rfixEW6QUcjkrIUefk1R33YY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mYNvpzdSu4nY2D92iwpjBGJm6xArYiIOw0W/shD/Kd/hwGTgq2o7RjBi2V5f98a0H
	 cTeaHok747qPLO+rqnvmSfRHeoRVXY9adDwfarIdKCHcADRQuMsPZj36BGy4aCPXCe
	 3SXXYWw6+YDikLDhdXn1DDsLHogIs6J1X9q7KlIs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4188WYWg015405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 02:32:34 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 02:32:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 02:32:34 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4188WUpD084715;
	Thu, 8 Feb 2024 02:32:31 -0600
Message-ID: <8c995751-ba5a-4fc7-912f-6f081577552f@ti.com>
Date: Thu, 8 Feb 2024 14:02:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v2] packagegroup:
 graphics-sdk-target: Add GLES3 headers
Content-Language: en-US
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>, <a-limaye@ti.com>
References: <20240208073806.2072814-1-s-adivi@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240208073806.2072814-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 08:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15135


On 08/02/24 13:08, Sai Sree Kartheek Adivi wrote:
> GLES3 headers are missing in the linux-devkit/sysroots since 09.00.
> These are needed for cross compiling QT, OpenGLES and other graphics applications.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
> v2 :
> * Added target branch in subject
>   .../packagegroup-arago-tisdk-graphics-sdk-target.bb              | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> index acb06558..6f576a18 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> @@ -9,6 +9,7 @@ inherit packagegroup
>   RDEPENDS:${PN} = "\
>       libegl-dev \
>       libdrm-dev \
> +    libgles3-mesa-dev \
>       wayland-dev \
>       weston-dev \
>       ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \

