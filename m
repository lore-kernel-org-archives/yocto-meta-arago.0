Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3515CC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 21:51:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1590.1652997115301696406
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 May 2022 14:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QJ3T2AoP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24JLpsB6091168;
	Thu, 19 May 2022 16:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652997114;
	bh=FwaziLZhJ06vNTtdg4TaQecLE1vyss5qICo65z0iWTI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QJ3T2AoPwSLpYqtB0a+UZbzheXVwQCSV4DTlMWMdQMTn9BUMKG8T3KrKebuOh+ehD
	 aIHmyZJek7XZL6Vnebpf19nP+u/riwkE3ALP5uPwz76/7bzC+p9i6+qhOc9J/MLGyA
	 G4ATXc1G2mAMX5TGyfZ6fN/SZTEepo4Aa2cZHGgI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24JLpswd011859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 May 2022 16:51:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 19
 May 2022 16:51:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 19 May 2022 16:51:53 -0500
Received: from [128.247.81.219] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24JLprHX024376;
	Thu, 19 May 2022 16:51:53 -0500
Message-ID: <b9253231-379f-da3b-48dc-384e011da9cf@ti.com>
Date: Thu, 19 May 2022 16:51:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-arago][master/dunfell][PATCH] matrix-gui: Disable
 auto-startup for am62xx-evm
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220519214808.1853-1-reatmon@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20220519214808.1853-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 May 2022 21:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13871

Ryan,

On 5/19/2022 4:48 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> There are some issues related to auto-starting the matrix-gui on
> am62xx-evm.  It can still be run manually if desired.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index e67decd6..4cbd7174 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -5,10 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>   
>   SECTION = "multimedia"
>   
> -PR = "r37"
> +PR = "r38"
>   
>   SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
>   
> +SYSTEMD_AUTO_ENABLE_am62xx-evm = "disable"
> +

I like this method much better than the earlier patch, and it works 
great. Matrix doesn't autostart on boot, but it can still be manually 
started with /etc/init.d/matrix-gui-2.0 start.

Tested-by: Darren Etheridge <detheridge@ti.com>


>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit systemd
> 

