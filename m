Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40953EB64DC
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 23:43:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.28320.1688168591283492642
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 16:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CPJ7iUWn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35UNh7dL101944;
	Fri, 30 Jun 2023 18:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688168587;
	bh=2j6V/mCmA3LJQ5y+dWHPx0RLX39cOuJnidOCNzLKsUc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=CPJ7iUWnwBdLShHLjcI5eYiIAeFPiEoO6RyWFxdKV7H3Ezmnad/PCXS8LYpTrAJZr
	 lUGqnKVwADHMhXIvQ1UeuEUMX28FEo5h610JH2I1BiG8TadN9XBAqlZiWp9EpIhd5S
	 n7q8bhfcwu9GI0RO1Ls8nP0ZGwbJOQgHxelP7028=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35UNh7Aj024375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Jun 2023 18:43:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Jun 2023 18:43:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Jun 2023 18:43:06 -0500
Received: from [10.249.35.33] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35UNh6Yj005885;
	Fri, 30 Jun 2023 18:43:06 -0500
Message-ID: <f9e4e25f-2f61-a184-f701-78dc6784685e@ti.com>
Date: Fri, 30 Jun 2023 18:43:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master][PATCH] tisdk-bundle: Change name of image
 files when extracting rootfs files
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <176D8DC2DA8B7E25.17093@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <176D8DC2DA8B7E25.17093@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jun 2023 23:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14745


This patch needs another change to make it work 100%.  v2 incoming.


On 6/30/2023 4:41 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> There was a recent commit on oe-core master [1] that changes how the
> names of the images files are built up.  This recipe uses a number of
> variables to assembles the path to the images files so that it can
> extract part of the rootfs.  We need to update that path to match
> what upstream is now producing.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=26d97acc71379ab6702fa54a23b6542a3f51779c
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/classes/tisdk-bundle.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index dbdc9a5a..83938d52 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -756,9 +756,9 @@ tisdk_image_build () {
>       do
>           for type in ${TARGET_IMAGE_TYPES}
>           do
> -            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ]
> +            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.rootfs.${type} ]
>               then
> -                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
> +                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.rootfs.${type} ${IMAGE_ROOTFS}/filesystem/
>               fi
>           done
>       done

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

