Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED0EC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:43:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.6072.1648557782111691109
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bLYsrp5n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCgx2D128874;
	Tue, 29 Mar 2022 07:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557779;
	bh=xmwhMbjE4gFm4cEyZwIjRDdYVylOC7/BkuHanBfJ2hU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bLYsrp5nRJrI/cOyscveRGCaJbiZY3cB7+maLuiVWy8Kw2fgw1qYuI1UXCjD3a4CX
	 vDs0w37IZV1+4C0M8rdaYsyoquDDS4crnLE4Fb4iD/YYsLR5Vx54LwZ/4TfFJZPDAc
	 Egd77tr/6StbMCOn5pJ8dZZlkE6wnZo+LFuSyTak=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCgx2V083967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:42:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:42:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:42:59 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCgx1O059635;
	Tue, 29 Mar 2022 07:42:59 -0500
Message-ID: <7ae6b5e5-1972-691e-d81b-1254702211ed@ti.com>
Date: Tue, 29 Mar 2022 07:42:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago] [master][PATCH] gnutls: update INCOMPATIBLE_LICENSE
 to SPDX format
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220329053929.2367932-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329053929.2367932-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13763



On 3/29/2022 12:39 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> All licenses have been migrated to SPDX format, so update their usage in
> variables like INCOMPATIBLE_LICENSE.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> index 7928a810..4ad4f70a 100644
> --- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> +++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> @@ -2,4 +2,4 @@ PR:append = ".arago0"
>   
>   # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
>   # version of gettext.
> -INCOMPATIBLE_LICENSE = "GPLv3"
> +INCOMPATIBLE_LICENSE = "GPL-3.0*"

Applied patch to master.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

