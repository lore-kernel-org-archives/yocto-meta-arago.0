Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B7EC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:19:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.8844.1742393956270615342
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 07:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dAfDipY/;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JEJFia334369
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 09:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742393955;
	bh=+3mtCD25WIu2D7T947ciLmmPqX/0e/T++rFKkviOsF4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dAfDipY/rxeCZPgIqPaMhIzDEzRkOx6yexQ1vH83tUcul9zU1F0e8KeuDYzb/K9zd
	 GK+6m3LpmuZYTpoU2W0/gmnTxThctwLY5FFYECqy5l+UHkF/ISGTUi+Vb5okgFM49v
	 f64wiEh8rX5BMd61fwWwReLhxfZOwS00PZP3Rpzk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JEJFT0099207
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 09:19:15 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 09:19:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 09:19:15 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JEJF0o019883;
	Wed, 19 Mar 2025 09:19:15 -0500
Message-ID: <6bffdb51-01f2-4cbc-a6ab-b55e81a3c71e@ti.com>
Date: Wed, 19 Mar 2025 09:19:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] ti-gc320-tests: Update
 SRCREV for recipe
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250318024235.3581162-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250318024235.3581162-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 14:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16089



On 3/17/2025 9:42 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Include a new SRCREV for the recipe to build from. This is not a new version of
> the tests repo, instead the new commit sha includes cross compilation errors
> fixes.

Agreed.  This is the better way of doing this.


> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> index f9b9685f..02605d98 100644
> --- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a0018554
>   
>   DEPENDS = "ti-gc320-libs"
>   
> -BRANCH = "ti-${PV}"
> +BRANCH = "ti-${PV}-scarthgap"

Why did we create a scarthgap branch?  The issues being addressed are 
far more broad and not specific to scarthgap?


>   SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
>   file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
>   "

This will not apply to master as my previous patch that addressed some 
of the compile issues was already accepted and promoted to master, and 
your patch is missing the removal of that patch.  I never applied my 
patch to scarthgap.

This needs to be split into two patches, one for scarthgap and one for 
master.

> -SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
> +SRCREV = "3c334f2004c718c9bb4321213c362e65c491efe6"
>   PR = "r2"
>   
>   S = "${WORKDIR}/git"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

