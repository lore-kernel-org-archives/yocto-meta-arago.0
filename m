Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01550C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 17:08:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18802.1700068091497302692
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 09:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LP77f3In;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AFH8ArY055945;
	Wed, 15 Nov 2023 11:08:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700068090;
	bh=rWlftQOufVty689xGndnMdlAHyqIegbFKJ56nX2nG1M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LP77f3InfscZ/Y+JmkuLejaeGmQAUgK9pXAS2NhUU9a6sEL4eRKH985LIxgw1CsGp
	 B+qesrne/sZMscU0tnhDJsNpmC4g3SJ1IGnc4zji4idUon59yhDOUNUu5dBOWZo3Ya
	 wCYW5fBUTmRvCsuV5Qpw3L1I3CWWoiaSqqZ4R+d8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AFH8AgI113311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Nov 2023 11:08:10 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Nov 2023 11:08:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Nov 2023 11:08:10 -0600
Received: from [10.250.33.185] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AFH894l006361;
	Wed, 15 Nov 2023 11:08:10 -0600
Message-ID: <be9f53ce-a2a4-440a-b1f7-d57d2ab1163a@ti.com>
Date: Wed, 15 Nov 2023 11:08:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH 1/2] branding-core: Add gc320
 driver for AM57x platforms
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sinthu Raja <sinthu.raja@ti.com>
References: <20231115110033.4746-1-sinthu.raja@ti.com>
 <20231115110033.4746-2-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231115110033.4746-2-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 17:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15012

On 11/15/23 5:00 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Enable the GC320 driver support for AM57x platforms which was temporarily
> disabled for LTS prep.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   .../conf/distro/include/branding-core.inc           | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index 79dadc11..ed1dc6b8 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -15,6 +15,13 @@ ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
>   # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
>   MACHINE_FEATURES:remove = "mmip"
>   
> -# GC320 support requires out-of-tree drivers not available in until LTS prep is
> -# complete. Disable for now.
> -MACHINE_FEATURES:remove = "gc320"

No machine other than `omap-a15` has this in its features anyway,
all you have to do here is remove the above lines, all below additions
are not needed.

Andrew

> +MACHINE_FEATURES:remove:am62xx = "gc320"
> +MACHINE_FEATURES:remove:am62axx = "gc320"
> +MACHINE_FEATURES:remove:am64xx = "gc320"
> +MACHINE_FEATURES:remove:j784s4 = "gc320"
> +MACHINE_FEATURES:remove:j721s2 = "gc320"
> +MACHINE_FEATURES:remove:j7200 = "gc320"
> +MACHINE_FEATURES:remove:j721e = "gc320"
> +MACHINE_FEATURES:remove:am335x = "gc320"
> +MACHINE_FEATURES:remove:am65xx = "gc320"
> +MACHINE_FEATURES:remove:am437x = "gc320"


