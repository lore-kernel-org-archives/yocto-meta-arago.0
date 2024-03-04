Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885CBC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 07:06:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.92948.1709535974315984552
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 03 Mar 2024 23:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=N5gp8Adz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42476D4n027427
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Mar 2024 01:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709535973;
	bh=V41AVUqpTiUd3lctcG2gsjx2lwGc4qBj0yrz9xXmHKI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N5gp8Adzr/BDORkn8m0Qgf4vmGmBsuivot8Rhs14i4+7pTNqfCgCb5eT6Xy56V+j6
	 Nar8H/TxDxkUCivzzDVd+P60SAzrZz22QALOdeIH938q19QGJTjKvi4rHBjD6rjl+b
	 7qFRNKhRg+1cUAh3FZzYT5RrkPrWzcNJx8Us2GhU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42476DCA001252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Mar 2024 01:06:13 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Mar 2024 01:06:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Mar 2024 01:06:13 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42476BBj038703;
	Mon, 4 Mar 2024 01:06:11 -0600
Message-ID: <40f115c5-474d-4690-911e-d46265dfe2f3@ti.com>
Date: Mon, 4 Mar 2024 12:36:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] Add description and summary for jailhouse
 image recipe
To: <meta-arago@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <g-gupta@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        <reatmon@ti.com>
References: <20240304065853.452896-1-p-bhagat@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240304065853.452896-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Mar 2024 07:06:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15216

On 04/03/24 12:28, Paresh Bhagat wrote:
> Image recipe for jailhouse does not have a summary and description. Due to
> which oe-layersetup also shows No Summary available for tisdk-jailhouse-image
> as compared to other targets for which we have proper summary.
>
> So to ensure good practice and help other users understand the purpose and
> functionality of recipe, add a summary and description for jailhouse image.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   .../recipes-core/images/tisdk-jailhouse-image.bb           | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> index b28dfd5a..c53cf9c0 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> @@ -1,4 +1,9 @@
> -# Produces wic image for jailhouse
> +SUMMARY = "Arago TI SDK image for Jailhouse Hypervisor"
> +
> +DESCRIPTION = "Arago TI SDK image meant for running Jailhouse, a partitioning \
> +Hypervisor based on Linux. This image is derived from tisdk-default-image and \
> +contains additional firmware and management tools for Jailhouse.\
> +"
>   
>   require recipes-core/images/tisdk-default-image.bb
>   

