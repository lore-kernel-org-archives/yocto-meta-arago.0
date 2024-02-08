Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ABEC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:32:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12808.1707377564275907250
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 23:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QXQ8nRU8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4187WfbP035618;
	Thu, 8 Feb 2024 01:32:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707377562;
	bh=BUlveCG/dBAJqTuVhrigY/WN4GLJbSNxD+gwoITrwIM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QXQ8nRU81Frh4TAHVf+TxMH8kQyVZD3EKysnC/NAFlnDAtQVHBGI2FjBPeXPToGmR
	 xl+waDxP5mXEN6Jz1Jhi9HgdLkJDQVh3Z7sfPIBQNyobx0apGe9BP0KKnadkFqzjJD
	 4m5UHVtnp/GYtLXxNR6oobkjS9tI8DJCqd5/klD8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4187Wfqm103563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 01:32:41 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 01:32:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 01:32:41 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4187Wcv8060862;
	Thu, 8 Feb 2024 01:32:38 -0600
Message-ID: <1c7a7a6d-7e76-490a-85fc-43b4115c4746@ti.com>
Date: Thu, 8 Feb 2024 13:02:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] packagegroup: graphics-sdk-target: Add GLES3 headers
Content-Language: en-US
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>, <a-limaye@ti.com>
References: <20240208072859.2069312-1-s-adivi@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240208072859.2069312-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 07:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15133

NAK!
Target branch eg.[kirkstone/master] is missing in subject

On 08/02/24 12:58, Sai Sree Kartheek Adivi wrote:
> GLES3 headers are missing in the linux-devkit/sysroots since 09.00.
> These are needed for cross compiling QT, OpenGLES and other graphics applications.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
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

