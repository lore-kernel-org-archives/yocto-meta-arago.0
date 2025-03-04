Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C68C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 19:35:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31044.1741116921460689323
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 11:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ihc9V2Pg;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524JZKhb3210689
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 13:35:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741116920;
	bh=/0eWk21W4o88dSjP0lgvJrj4IvHqfafiAtFlNS/c80M=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ihc9V2Pg/QQgWF7aYBhcDm3a2er4yX6rTcqw9e9tEbKS7Ob9TnCrsytkqYDXO/5ig
	 +7ximu/yBM3CqFN8tpcCsgiD1vX7Qm0hWpQzCH/PlEo1iIvJCk7FZ3f4MrtABWcmFt
	 dwBdX3m02UqrQe+U2IEKNrzgXUxzG1s56l+s77ko=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524JZKC2006920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 13:35:20 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 13:35:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 13:35:20 -0600
Received: from [10.249.33.231] ([10.249.33.231])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524JZKxL035169;
	Tue, 4 Mar 2025 13:35:20 -0600
Message-ID: <a790bc63-0a40-44f6-94bf-da7f067ce52d@ti.com>
Date: Tue, 4 Mar 2025 13:35:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-test: Add runtime
 dependencies for pytesseract
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250304060645.217310-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250304060645.217310-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 19:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15937


The subject is not quite right.  It should be:

pytesseract: Add runtime dependencies

I don't care so much about knowing this patch was for meta-arago-test or 
whichever layer.  But the first part should always contain the recipe 
name being updated.

Please fix.


On 3/4/2025 12:06 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Pytesseract is a python wrapper for tesseract, so it should depend on it.
> The pytesseract script calls the python packaging module, so add it as
> well as a dependecy.
> 
> This is only for scarthgap branch, as the master recipe for this package
> is in meta-openembedded.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb  | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> index 91350cd5..0f505f63 100644
> --- a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> +++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> @@ -7,6 +7,8 @@ HOMEPAGE = "https://github.com/madmaze/pytesseract"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> +RDEPENDS:${PN}:append = "python3-packaging tesseract"
> +
>   SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
>   
>   PYPI_PACKAGE = "pytesseract"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

