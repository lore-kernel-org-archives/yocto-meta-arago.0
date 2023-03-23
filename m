Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01179C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 15:32:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.75743.1679585539783172511
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 08:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j2BYmkG8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NFWIrg040320;
	Thu, 23 Mar 2023 10:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679585538;
	bh=dhEiHsycbD5YR+s3abvdIJNYML5rtoI6rzitlgwBAbQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j2BYmkG89MGplfJAZjC99wvE0j9uTRUFAes7g46kbSNIj/xxMX4I0x2/TtmsEyQoN
	 tsj+PqyoTChAHdIdUD8aEXvc0wDlym8ioWXRCQCAC3zxzlHbwxBWfS5M6gjImfWNEi
	 19c2nmoXuIyPB7orU2Go1Qb+kNZWDT09srrxFV+o=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NFWILP041942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Mar 2023 10:32:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 10:32:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 10:32:17 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NFWHeC051160;
	Thu, 23 Mar 2023 10:32:17 -0500
Message-ID: <1cde312c-b03f-58b2-eee9-7c16c3c01184@ti.com>
Date: Thu, 23 Mar 2023 10:32:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe-layersetup][master][PATCH V2 0/2] Stop using git:// urls
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230323135026.1842186-1-nm@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230323135026.1842186-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Mar 2023 15:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14278

On 3/23/23 08:50, Nishanth Menon wrote:
> Hi,
> 
> We did this in meta-ti and meta-arago but didn't propagate back into
> oe-layersetup yet so I'll give it a go. git:// is no longer functional
> proxies over on latest git versions (example: poky crops container for
> ubuntu 22.04[1]), also git:// is highly susceptible to man-in-the-middle
> attacks[2]. Dump git:// in favor of https.
> 
> So, things are broken atm, and yes, https:// implies certificates being
> correct etc, but that is entirely the point.
> 
> [1] https://hub.docker.com/r/crops/poky/tags 22.04
> [2] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Changes since v1:
> * Update with a new patch to fixup the gitconfig
> * Update commit message in patch 2 to answer review comments of v1
> 
> V1: https://lore.kernel.org/yocto-meta-arago/20230309190858.395668-1-rs@ti.com/
> Nishanth Menon (1):
>    sample-files: gitconfig.sample: Stop using git:// urls
> 
> Randolph Sapp (1):
>    configs: Stop using git:// urls
> 
>   configs/arago-dunfell-config.txt        | 16 ++++++++--------
>   configs/arago-dunfell-next-config.txt   | 16 ++++++++--------
>   configs/arago-dunfell-wip-config.txt    | 16 ++++++++--------
>   configs/arago-kirkstone-config.txt      | 14 +++++++-------
>   configs/arago-kirkstone-next-config.txt | 14 +++++++-------
>   configs/arago-kirkstone-wip-config.txt  | 14 +++++++-------
>   configs/arago-master-config.txt         | 14 +++++++-------
>   configs/arago-master-wip-config.txt     | 14 +++++++-------
>   configs/distroless-dunfell-config.txt   |  8 ++++----
>   configs/distroless-kirkstone-config.txt |  8 ++++----
>   configs/distroless-master-config.txt    |  8 ++++----
>   configs/poky-dunfell-config.txt         |  8 ++++----
>   configs/poky-kirkstone-config.txt       | 12 ++++++------
>   configs/poky-master-config.txt          | 12 ++++++------
>   configs/poky-master-wip-config.txt      | 12 ++++++------
>   sample-files/gitconfig.sample           |  9 ++++++---
>   16 files changed, 99 insertions(+), 96 deletions(-)
> 

Well, you already know how I feel about this. I like it and feel that 
this is completely necessary now.

