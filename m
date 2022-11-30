Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C707AC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:17:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26933.1669846618062288085
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t3H2XGeI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMGuGS081315;
	Wed, 30 Nov 2022 16:16:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669846617;
	bh=D9uGpqdG+yxWYOFRp6UfMLurtXqCGqVm3gKe/ZqgIyw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=t3H2XGeIzYvI4XNAF0j1jnMlxRUS2ffOKe+rHmjlA3QBG5UEc7zw/j0gK90VKAsGX
	 t37LKlpk470aRplC02xAQdq4+MV0/E+jvLl++y9wvM1ORVW8aN9fDdIns+LNO/tS6q
	 YIbFnrngcae17ajuhiqHvVNCTspGJUWMinfexUSQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUMGuoh004831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 16:16:56 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 16:16:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 16:16:56 -0600
Received: from [10.250.33.225] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMGuWx001620;
	Wed, 30 Nov 2022 16:16:56 -0600
Message-ID: <987fc536-61ba-4b0f-94b8-6347820f3afd@ti.com>
Date: Wed, 30 Nov 2022 16:16:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [meta-arago][master][PATCH 2/2] qtwayland: Bump version to
 v5.15.7-lts-lgpl
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <172C7C7C2E3058BB.1705@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <172C7C7C2E3058BB.1705@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14122


This was not meant to be a two part patch.. ignore this one...


On 11/30/2022 16:13, Ryan Eatmon via lists.yoctoproject.org wrote:
> There is a build error with the v5.15.4-lts-lgpl version and
> xkbcommon. The bug was fixed in the next LTS, so go ahead and
> move to the latest version available.
> 
> This haas been sent to meta-qt5 as a pull request.  When they
> move to a version that does not have this build issue we will
> revert this change.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> index 23a2f907..f6d6ceec 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> @@ -5,3 +5,6 @@ SRC_URI += " \
>       file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
>       file://0001-examples-fix-wayland-texture-sharing-custom-composit.patch \
>   "
> +
> +SRCREV = "533fff12f7c4beb177b56b766c71b1c7384e6229"
> +

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

