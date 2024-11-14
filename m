Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85256D6A22F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 20:47:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.4689.1731617262176257889
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 12:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JcQmo/w4;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEKlfEA3052776
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:47:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731617261;
	bh=KG5Ud3jEt59IfDPvUl+aDx1PzqJbLUSz/6NLLnUPs4s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JcQmo/w4XpRidDb0PKgH8+qidRUj34hlsa8WNmiQxbWfbAIj/aWeXA5+FaFEwTnON
	 hUMfedVGhdkAijlJQuO5vZB8YH7QMF0zbzPqa741boFAWCaxA6RB7ipGInf8CDY7eJ
	 uTGwG1qNjStIP6WnEYMu0GP+IAkZYX+QhwFL7e8Q=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEKlfmo027140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:47:41 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Nov 2024 14:47:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Nov 2024 14:47:41 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AEKlf7Q050048;
	Thu, 14 Nov 2024 14:47:41 -0600
Message-ID: <f2e4c2dc-1425-400c-b809-039f3110cbaa@ti.com>
Date: Thu, 14 Nov 2024 14:47:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][master][PATCH v1 1/1] oe-layersetup: Bringing
 meta-selinux into Yocto builds
To: Aashvij Shenai <a-shenai@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <c-shilwant@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
References: <20241114054100.2945239-1-a-shenai@ti.com>
 <20241114054100.2945239-2-a-shenai@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241114054100.2945239-2-a-shenai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 20:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15611


NAK.

There is a new system for maintaining the configs in oe-layersetup.  You 
can view the README for more info.

Basically, you need to modify the XML source files, then run make to 
generate all of the various configs.  We do not edit the configs 
directly anymore.

Also, if you are going to add something like then, then you need to make 
sure you are including ALL of the configs that we do, otherwise I have 
go through and copy these changes to the other configs as well.

You are missing:
arago-scarthgap-chromium-config

and the master configs:
arago-master-chromium-config
arago-master-config
arago-master-next-config
arago-master-wip-config


On 11/13/2024 11:41 PM, Aashvij Shenai wrote:
> This patch downloads the meta-selinux layer for the scarthgap branch
> 
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>   configs/arago-scarthgap-config.txt      | 1 +
>   configs/arago-scarthgap-next-config.txt | 1 +
>   configs/arago-scarthgap-wip-config.txt  | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
> index f95056d..1fd092b 100644
> --- a/configs/arago-scarthgap-config.txt
> +++ b/configs/arago-scarthgap-config.txt
> @@ -2,6 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
> index cd69c01..dbdec3a 100644
> --- a/configs/arago-scarthgap-next-config.txt
> +++ b/configs/arago-scarthgap-next-config.txt
> @@ -10,6 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that rec
>   MOTD: NOTE:
>   
>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
> index 2dd8209..b93f76f 100644
> --- a/configs/arago-scarthgap-wip-config.txt
> +++ b/configs/arago-scarthgap-wip-config.txt
> @@ -2,6 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
>   meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

