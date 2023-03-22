Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F87C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 18:20:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.51744.1679509221820458081
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 11:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V1LzlOfa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MIKIVK113277;
	Wed, 22 Mar 2023 13:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679509218;
	bh=xA8JERexRqvnanavmzNd57lKJE/aW9XheC/gRHgK+48=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=V1LzlOfaFqnAK7oMshAvfp86GTW1fRgTqjkFYPYW4dMqYcn+9YKBsMQQKqMtIWLo3
	 2Am41VTUjuziBT632DDSSnf5zip97TVOS7MCMuV7loq1shBS+/bs8S4G0slOF1FBH1
	 XsZP3I0Q7zNOwsBdBWV0lC/RC4R0VgWGX6POvnOs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MIKIeL014943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 13:20:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 13:20:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 13:20:18 -0500
Received: from [10.250.32.28] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MIKHnK124033;
	Wed, 22 Mar 2023 13:20:18 -0500
Message-ID: <09bcf9cf-eb0f-24c0-ddbb-b1c5dcc58e56@ti.com>
Date: Wed, 22 Mar 2023 13:20:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-arago] [kirkstone/master][PATCH 1/4] irqbalance: Move to
 the latest tip v1.9.2+
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
References: <20230321190428.2818600-1-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230321190428.2818600-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Mar 2023 18:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14272

On 3/21/23 2:04 PM, Denys Dmytriyenko wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> This fixes timeouts seen on daemon stop during reboot
> Switches to using irqbalance provide irqbalance.service instead of
> custom one
> Fixes some IRQs not being classified and thus not balanced.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-extended/irqbalance/irqbalance_git.bbappend   | 8 ++++++++
>   1 file changed, 8 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> 
> diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> new file mode 100644
> index 00000000..3ba30b5d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> @@ -0,0 +1,8 @@
> +SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
> +PV = "1.9.2"
> +
> +do_install_append () {

Old override syntax here and below.

Andrew

> +         install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
> +}
> +
> +PR_append = ".arago3"

