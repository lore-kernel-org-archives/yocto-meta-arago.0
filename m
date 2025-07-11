Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9765C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:31:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.16899.1752247891418257814
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 08:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bsjC2s9h;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BFVUW01481385
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752247890;
	bh=w5p1443vRDrRIewUy+Api44Vkm88fA1R0xiL1+cFVv4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=bsjC2s9hML6z3zBRmzGOwVI3/voqO95VzMIormPm42r/7gf8Wq2C+SLXPjOvWcAzX
	 gcCDdEk/Ax7SmuZY64nIqg1C9LCrkkKkhBTUHcQrSnSeTDHOT74OAA1x+TrCkBeRWY
	 XkuMmKA1yDoaNCwCLDBwqISgRFclUqvd4shqLmzg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BFVUjD439560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:31:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 10:31:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 10:31:30 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BFVUZr3714180;
	Fri, 11 Jul 2025 10:31:30 -0500
Message-ID: <6e514a86-4f33-4463-bfad-ef999540a90c@ti.com>
Date: Fri, 11 Jul 2025 10:31:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][1/2] meta-arago-test:
 recipes-graphics: Add lightweight off-screen demo
To: <a-christidis@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250711142611.3567574-1-a-christidis@ti.com>
 <20250711142611.3567574-2-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250711142611.3567574-2-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 15:31:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16287

On 7/11/25 9:26 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add recipe for lightweight off-screen rendering demo.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../offscreen-demo/offscreendemo_0.0.1.bb        | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> new file mode 100644
> index 00000000..f0b6a1fd
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Lightweight Render Example"
> +DESCRIPTION = "Lightweight Render Example. Heavily inspired by Eduardo Lima's gpu-playground, this attempts to act as the smallest demo of offscreen rendering."
> +
> +HOMEPAGE = "https://github.com/StaticRocket/lightweight-offscreen"
> +
> +SRC_URI = "git://github.com/StaticRocket/lightweight-offscreen.git;protocol=https;branch=master"
> +SRCREV = "eac40e0073cb5f81688aee890e0a67f99678a290"
> +
> +LICENSE = "CC0-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "virtual/egl virtual/libgles2 mesa-pvr"

You shouldn't depend directly on "mesa-pvr", that is just one provider
of virtual/libgles2, which you already have as a dependency.

Andrew

> +
> +inherit pkgconfig meson

