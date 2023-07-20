Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCB1EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 07:54:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7989.1689839651678781472
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 00:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ltou/K9E;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36K7sA3O110661
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Jul 2023 02:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689839650;
	bh=W2Iz/ktjlHX6o62wfucMtzQ3iBVzfgn+cWXcoigt0XU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ltou/K9Ei53+C4XTcHC/5s19MqoLEIGl52gnrcdohTU5xRVo2KgzwNwen5O2PnrH5
	 ePp9jACtQHtj3RMDUueg9OLgXNG9UiP6zLte6YqzzAlze8aaHy3JoAwDJqVREaKeYB
	 v3iZYK1j9PnyFV8Tnu3jFqRpi8BAA4Hq//U6h4Qs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36K7sAEX041535
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Jul 2023 02:54:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jul 2023 02:54:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jul 2023 02:54:09 -0500
Received: from [172.24.227.112] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36K7s70G031272;
	Thu, 20 Jul 2023 02:54:08 -0500
Message-ID: <dcadd2e5-ae89-38c8-41c7-853d559a021e@ti.com>
Date: Thu, 20 Jul 2023 13:24:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [kirkstone PATCH] meta-arago-demos: matrix-gui-v2-apps: update to
 pick openssl_perf fixes
To: <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230714220652.19240-1-praneeth@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20230714220652.19240-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Jul 2023 07:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14806



On 15/07/23 03:36, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> update matrix-gui-v2-apps recipe SRCREV to pick
> * openssl_perf: update engine and remove des-cbc
> 
> This includes OPENSSL 3.0.9 engine name change necessary for crypto demo
> to be functional
> 
> This update also includes test suite removal of des-cbc as this
> algorithm is not supported.

Tested the patch on kirkstone-next for j784s4 platform.
OPENSSL tests are working as expected.

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>

> ---
>   meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
> index 94776f54..beaf4820 100644
> --- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
> +SRCREV = "011bc0ab43110eb2fca4dd6c58fc0433642da8d6"
>   BRANCH = "master"
> -INC_PR = "r76"
> +INC_PR = "r77"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc

