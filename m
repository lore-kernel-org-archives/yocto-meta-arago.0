Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B31CD3447
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:05:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2025.1695107136237999566
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 00:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HXqJUQD0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38J75Z1i081348
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 02:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695107135;
	bh=tiwMlUctaaJpUotUOaK17t7Xqnz2pBArRHPlQYoAUK8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=HXqJUQD0GUl7HbjL0PjhJFvoQT9+PAjPnzbtq2Z9p+IOJyX8k73y8/8wDr3P7IrI2
	 mA7ZfzyIgdtw4Tym2u4m9mOkCvmODkBcrr98Eyb5gnCRobZ6fpnGwXroMuGoAjs31u
	 lP88AppTvVvER6HEXgV8RQZ75MZKVtLDZSbbVz0A=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38J75Zwp058439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 02:05:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Sep 2023 02:05:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Sep 2023 02:05:34 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38J75X1p110642
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 02:05:34 -0500
Message-ID: <1d836af9-f884-0bf4-a612-20b8f439eb04@ti.com>
Date: Tue, 19 Sep 2023 12:35:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXTERNAL] [meta-arago] [master][PATCH 2/2] omapdrmtest:
 explicitly specify branch in SRC_URI
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
References: <20230914205942.2817800-1-denis@denix.org>
 <20230914205942.2817800-2-denis@denix.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230914205942.2817800-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 07:05:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14903


On 15/09/23 02:29, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Fixes:
>
> | WARNING: omapdrmtest_1.0.0.bb: URL: git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=https does not set any branch parameter. The future default branch used by tools and repositories is uncertain and we will therefore soon require this is set in all git urls.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index 20b9bf0d..fb6e7a6a 100644
> --- a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -15,7 +15,7 @@ SRCREV = "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
>   EXTRA_OEMAKE = "CC="${CC}""
>   TARGET_CC_ARCH += "${LDFLAGS}"
>   
> -SRC_URI = "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=https \
> +SRC_URI = "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=https;branch=master \
>           file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
>   "
>   

