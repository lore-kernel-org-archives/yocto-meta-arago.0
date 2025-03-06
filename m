Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E69C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 13:32:53 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.13193.1741267964146935464
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 05:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K5QUHMg7;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526DWhJM3659143
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 07:32:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741267963;
	bh=e7spDLLnTwtoZThEATS0A9NG/rrPVLyOc0XbaSOYLeA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=K5QUHMg7lAJVOCceUYsLI48L+qjx7sCV1krRn9iwItPw7ayJNzj9NA0gy7siosuc7
	 aVIUHorzMrTGgnIjL9OO7VspomTFaC6tg0Nk5viIBJ5I+WxdzXFxWgbFUhZ5xkKfol
	 hX7Jd9N8wMqJ7Cl2rbV3QTXGlhz8UZdzxckS/w4E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526DWhEW020571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 07:32:43 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 07:32:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 07:32:43 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526DWgiA083911;
	Thu, 6 Mar 2025 07:32:42 -0600
Message-ID: <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
Date: Thu, 6 Mar 2025 07:32:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250306000441.408976-1-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250306000441.408976-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 13:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15950

On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Include the package ti-gc320-libs-dev as a runtime dependency.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> 
> v2:
> - Added dev-deps on INSANE_SKIP
> 
>   .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                 | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> index f9b9685f..14278d76 100644
> --- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> @@ -4,6 +4,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
>   
>   DEPENDS = "ti-gc320-libs"
> +RDEPENDS:${PN}:append = " ti-gc320-libs-dev"

This should be detected and set for you based on DEPENDS. You don't
need any change here.

Andrew

>   
>   BRANCH = "ti-${PV}"
>   
> @@ -32,5 +33,5 @@ do_install() {
>   	done
>   }
>   
> -INSANE_SKIP:${PN} += "ldflags already-stripped libdir"
> +INSANE_SKIP:${PN} += "ldflags already-stripped libdir dev-deps"
>   INSANE_SKIP:${PN}-dbg += "libdir"

