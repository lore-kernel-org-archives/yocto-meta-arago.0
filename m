Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3260FCD3445
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 06:58:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1961.1695106726828487200
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 23:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fdRd63z3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38J6wkMK046275
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 01:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695106726;
	bh=/wz9gBGWUYGRhPIXHNyHOKFDBKK99f62etRpSEj+Tbo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=fdRd63z35LTF+FN/3nEj7FUWa1G5I7gnkCVHMdrW4zD1261yWsq/xEZ9qUS1UrsND
	 p214hCH9m2KfJiYO4swJM4rgsPy/UEl9YoDtU2xQmTKRJdHL3fnWGuhEPLSStWh7CZ
	 IajKK9EiBpCchLfJCqKaEfYt0DOjer6tnK9TuLWU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38J6wkre054061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 01:58:46 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Sep 2023 01:58:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Sep 2023 01:58:45 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38J6wi9B023303
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 01:58:45 -0500
Message-ID: <67ba8701-3e61-6034-dbd3-2897fa018d9d@ti.com>
Date: Tue, 19 Sep 2023 12:28:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXTERNAL] [meta-arago] [master][PATCH 1/2] weston: update
 bbappend to match oe-core/master
To: <meta-arago@lists.yoctoproject.org>
References: <20230914205942.2817800-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230914205942.2817800-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Sep 2023 06:58:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14902


On 15/09/23 02:29, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> OE-Core has updated weston to version 12.0.2 recently.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   .../wayland/{weston_12.0.1.bbappend => weston_12.0.2.bbappend}    | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-arago-distro/recipes-graphics/wayland/{weston_12.0.1.bbappend => weston_12.0.2.bbappend} (100%)
>
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bbappend
> similarity index 100%
> rename from meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbappend
> rename to meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bbappend

