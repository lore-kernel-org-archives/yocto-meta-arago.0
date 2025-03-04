Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58A4C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 22:24:48 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.35884.1741127084753384032
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 14:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PtFj/x9X;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524MOh3u3702085
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 16:24:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741127084;
	bh=9TpNYGzntDIMsascFHjOXmCm1sG69mQw0+BU8vY2WIo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PtFj/x9XxTGsnWsl/mw1LhonqhIPhCrQpWBmWpfWTFOTXXwldC/vAW47lTgaMn/Z6
	 5kc+Y5PA2PYab3HWI/yiFK6B+R9UJTitOxTHP5zV9Y7GJiirjo9PRvbK4GIcpqDgfA
	 HobAOui3maktIRX0ZYxUvmkvn7lq2gt2Ph2tL7pQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524MOhco043015
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 16:24:43 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 16:24:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 16:24:43 -0600
Received: from [10.249.33.231] ([10.249.33.231])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524MOhDW021323;
	Tue, 4 Mar 2025 16:24:43 -0600
Message-ID: <40ec00b0-abcd-489a-ad35-e17534a3a824@ti.com>
Date: Tue, 4 Mar 2025 16:24:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v2] pytesseract: Add runtime
 dependencies
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250304205358.268668-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250304205358.268668-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 22:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15942



On 3/4/2025 2:53 PM, a-christidis@ti.com wrote:
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
> 
> v2:
> - Updated subject to start off with recipe name that is changed
> 
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

As Denys pointed out on v1.  The append requires a " " at the beginning 
of the string.  += adds the space, but append is just a raw append.

RDEPENDS:${PN}:append = " python3-packaging tesseract"
                          ^


>   SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
>   
>   PYPI_PACKAGE = "pytesseract"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

