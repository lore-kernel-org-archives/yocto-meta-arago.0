Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E4DCF0445
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:44:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9185.1728452668319244098
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 22:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A3gyyEWW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-vadapalli@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4995iRrq090620;
	Wed, 9 Oct 2024 00:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728452667;
	bh=KCoBQFKySqFju9AoJV5j2eFYg8WKfJOqRSvomATEI7U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=A3gyyEWW57k/uYiMnLWp7J8pzeec1H3ssawWf+fFZeSO7f3guP7aYcEaaSqVVRTHT
	 iaFqcoxDzDHSn01iu+SuyY7rd8P8b+EpnbfBEvSNtoCW6mNfU1cwOHyTIy70p51KnE
	 X21/2pGEAQPZuylSPsOOqpt6CzpXP9TaEhEyHlfY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4995iRF9005918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Oct 2024 00:44:27 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 00:44:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 00:44:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4995iPeL008872;
	Wed, 9 Oct 2024 00:44:26 -0500
Date: Wed, 9 Oct 2024 11:14:25 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <s-vadapalli@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-base:
 Add lldpd package
Message-ID: <98ae4444-e803-4f69-b5ae-4c6bd9ff4af2@ti.com>
References: <20240927084635.1182552-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927084635.1182552-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 09 Oct 2024 05:44:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15564

On Fri, Sep 27, 2024 at 02:16:35PM +0530, Siddharth Vadapalli wrote:

Please review and merge this patch in case of no concerns.

Regards,
Siddharth.

> Add the lldpd package to support LLDP (Link Layer Discovery Protocol).
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 8b37aab9..121fa432 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -49,6 +49,7 @@ ARAGO_EXTRA = "\
>      nfs-utils-client \
>      cifs-utils \
>      phytool \
> +    lldpd \
>  "
>  
>  OPTEE_PKGS = " \
> -- 
> 2.40.1
> 

