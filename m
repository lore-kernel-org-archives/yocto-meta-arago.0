Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE27C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:38:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.3830.1652409509375254987
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 19:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y29PUHQD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D2cOQC012123;
	Thu, 12 May 2022 21:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652409504;
	bh=/esdhv5ADzeHS8sboKDhl4eS8+ZLOsoQ97pEb2NYjmM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=y29PUHQDxUBxWZezAlzm1/lwaHVYeEoRTjAhntDfSP6zLTKruXuBm/9cRFWleuIwo
	 o/yEvgbB5R6S+phOqQpytGk+5aR8PrfPVnbn3XoSb0+glXBSnoT5uvshcj7ahVGjFk
	 0/Z4KyD/B/evHuEm8ObekQCBNcQoC/DBwPnxsYMU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D2cOjf082984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 21:38:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 21:38:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 21:38:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D2cNCs115240;
	Thu, 12 May 2022 21:38:23 -0500
Date: Thu, 12 May 2022 21:38:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>
Subject: Re: [meta-arago] [kirkstone/master][PATCH] arago.conf: switch to
 internal toolchain for now
Message-ID: <20220513023823.glror67rchv56mah@bottom>
References: <20220513020008.3048052-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513020008.3048052-1-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 02:38:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13854

On 02:00-20220513, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Set default to build and use internal toolchain for now, instead of a pre-built
> external one, as external gcc-11.2 toolchain still requires some work and syncup
> with latest meta-arm codebase.

I wonder if we should just settle for internal toolchain and dump the
entire external toolchain argumentation?


Is'nt that more inline with what the rest of the ecosystem is doing?

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index b2246537..e24cace9 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -170,7 +170,7 @@ IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') ==
>  # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
>  # Set some sane defaults, in case someone forgets to set them in local.conf
>  TC_SANE_DEFAULT ?= "arm"
> -TOOLCHAIN_TYPE ?= "external"
> +TOOLCHAIN_TYPE ?= "internal"
>  TOOLCHAIN_TYPE:omapl1 = "internal"
>  TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

