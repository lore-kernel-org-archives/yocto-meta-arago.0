Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65054CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 19:18:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3384.1757359088573281930
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 12:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g81O5Bj6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588JI8dL118977
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 14:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757359088;
	bh=Kw98ZSYnzHAqPTPjLM0Gw1Mde0AoRbGrpSgHNA75zmM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g81O5Bj6fA/d7EOKFUzxC5Ir5p7lr2KCSVsGIzRDDjT+Bqqb/CCltADMwDzk0euQO
	 10FovuwyZs95SGGw8xN2C6PzFu48ELryc7oUaXoFkuAcGFCrxM9bIPKRPIyK2gcYeX
	 BqegKAhZb1zP/zGcPcknRhBRIkzl0yVdY93bZzaw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588JI8ZZ2613757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 14:18:08 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 14:18:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 14:18:07 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588JI7651098553;
	Mon, 8 Sep 2025 14:18:07 -0500
Message-ID: <978cc50a-c027-4d59-b7ec-44f184e20bc2@ti.com>
Date: Mon, 8 Sep 2025 14:18:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v3 0/3] opencl-clhpp: v2.0.16 ->
 v2024.05.08
To: PRC Automation <prc@list.ti.com>,
        Antonios Christidis
	<a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250908185600.152317-1-a-christidis@ti.com>
 <20250908190017.3536845-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250908190017.3536845-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 19:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16552



On 9/8/2025 2:00 PM, PRC Automation wrote:
> meta-arago / na / 20250908185600.152317-1-a-christidis
> 
> PRC Results: PASS
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [meta-arago][scarthgap][PATCH v3 1/3] opencl-headers: Use Cmake class
>      WARN: Commit message does not include file/recipe name: opencl-headers: Use Cmake class. (COMMIT-MESSAGE-2)
>          patch
> WARN - [meta-arago][scarthgap][PATCH v3 2/3] opencl-headers: Specify  correct PV
>      WARN: Commit message does not include file/recipe name: opencl-headers: Specify  correct PV. (COMMIT-MESSAGE-2)
>          patch

You can ignore this.  This is because the file being changed is named 
opencl_headers-ti.inc and not opencl-headers-ti.inc and so the code does 
not recognize the file name in the subject.  This commit is fine.


> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [meta-arago][scarthgap][PATCH v3 0/3] opencl-clhpp: v2.0.16 ->  v2024.05.08
> - Submitter: From: <a-christidis@ti.com>
> From: Antonios Christidis <a-christidis@ti.com>
> - Date: Date: Mon, 8 Sep 2025 13:55:57 -0500
> - Num Patches: 3
> - Mailing List (public inbox) Commit SHA: 53a355ebf952568b7940b59058edbf5fffb8e0f9
> 
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: scarthgap-next
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509080400
> - Commit SHA: 1517a1f7fcac22a35c21a424d96493172f8fd8b2
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>    check-yocto-repo: PASS
> =========================================================
> scarthgap
> =====================
> PASS
> 
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


