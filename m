Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E9EC43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 16:08:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.29992.1658765330549320108
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 09:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yXRUR/3x;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PG8nPM068840;
	Mon, 25 Jul 2022 11:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658765329;
	bh=vjPMvjfrE9kn2yUM261jaN4XOMr3CgSa7o6/W7uygX4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=yXRUR/3xajJsN5ypcgJKAs758YupkpAxHZqEEbMCoAHI19lGt3v74wobxoach72TZ
	 JXv0zxx/sJP6OiJMHUE+gyroAO5HFcLbcEPn++sp49BjjW0S/G6c9amFpwzs84ezI/
	 K/dM5MMsY+RxHtw+eEQxdoYF/Q9FxPlxc4tI0eUs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PG8nqn071393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 11:08:49 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 11:08:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 11:08:48 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PG8mu9028673;
	Mon, 25 Jul 2022 11:08:48 -0500
Message-ID: <9bb2302e-54c5-60e9-c729-5586220dcb3a@ti.com>
Date: Mon, 25 Jul 2022 21:38:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][dunfell][PATCH v2] all: Remove reference to
 arago-project.org
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220721123539.24097-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220721123539.24097-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 25 Jul 2022 16:08:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13964



On 7/21/2022 6:05 PM, Ryan Eatmon wrote:
> arago-project.org is being shut down in August.  This
> commit changes the last recipes that point to that
> old site to point to git.ti.com, or just rmeove the
> reference entirely.
> 
> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
> ---
> v2: Changed dir name for k2-fw-initrd files and removed uneeded line per
> feedback.
> 
>   meta-arago-distro/README                        |   2 +-
>   meta-arago-distro/classes/tisdk-bundle.bbclass  |   2 +-
>   meta-arago-distro/conf/distro/arago.conf        |   2 --
>   .../k2-fw-initrd/k2-initramfs-0.0.7.tar.gz      | Bin 0 -> 49660 bytes

Why is this tarball present in the patch?


>   .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb          |   2 +-
>   .../recipes-core/base-files/base-files/issue    |   2 +-
>   .../base-files/base-files/issue.net             |   2 +-
>   .../feed-config/arago-feed-config_1.0.bb        |   2 +-
>   .../oe-layersetup/oe-layersetup.bb              |   2 +-
>   .../ti-crypto-examples_git.bb                   |   4 ++--
>   .../ltp-ddt/ltp-ddt_20210524.bb                 |   2 +-
>   .../recipes-support/ipsecmgr/ipsecmgr.inc       |   2 +-
>   .../libnl-xfrm/libnl-xfrm_git.bb                |   2 +-
>   13 files changed, 12 insertions(+), 14 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd/k2-initramfs-0.0.7.tar.gz

