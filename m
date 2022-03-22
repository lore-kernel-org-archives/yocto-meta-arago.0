Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDA0C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:51:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.807.1647982313814166296
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=umGlxgqg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MKpqnL009104;
	Tue, 22 Mar 2022 15:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647982312;
	bh=OE7eXM+j7RTcZwOoXBLcbJ6QDIHflto6k8MxPRp+tgQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=umGlxgqgK5F3d1S2F3hgklJsjoMS3LgcwfCuAdveCx6SUi7eCIJVr1i1PFmz+tXuG
	 d1MUOytMLcjSr+Idl8ko7ooqjUTWS9Wq/v5domaiGNisKIecZMCi1JabOCSHxvvCgk
	 iaCpJne/7/NRr5V25r+mpw9HCcss0yqrR8HQibYw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MKpqGU044690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 15:51:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 15:51:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 15:51:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MKpq5C064338;
	Tue, 22 Mar 2022 15:51:52 -0500
Date: Tue, 22 Mar 2022 15:51:52 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 3/3] busybox: Enable rtcwake
Message-ID: <20220322205152.pv57ek6qm2tc4aux@coffee>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-4-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322193554.24404-4-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13716

On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> This is esp useful for testing low power states with a minimal system.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/recipes-core/busybox/busybox/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> index 65470bc7..351b80d4 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -583,7 +583,7 @@ CONFIG_PIVOT_ROOT=y
>  CONFIG_RDATE=y
>  # CONFIG_RDEV is not set
>  # CONFIG_READPROFILE is not set
> -# CONFIG_RTCWAKE is not set
> +CONFIG_RTCWAKE=y
>  # CONFIG_SCRIPT is not set
>  # CONFIG_SCRIPTREPLAY is not set
>  # CONFIG_SETARCH is not set

OR we could use base-image cpio
..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

