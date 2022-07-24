Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935E3C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 15:41:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.17727.1658677255580077386
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 24 Jul 2022 08:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WIUJA0Lb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26OFeq6t042850;
	Sun, 24 Jul 2022 10:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658677252;
	bh=CZft7o3QX2gHQZW9uQaqA6qUhgW7HQeJNLs3xbnj5WQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=WIUJA0LbR/mABmljKptCysKn4DbdKFbIN9e7nEZjGlQx7T6dEGm9YLpVhGGvtXupq
	 tCv/6tj8gTtY8U37OUElsjla0A7WL/DTj46Jf0jE1iljTJqO15NVsN1t2rlG9M0SmE
	 L75Wan2v8M492VSKzL7aubMZ/XDdP+bJXngq42PM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26OFeqiA007087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 24 Jul 2022 10:40:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 24
 Jul 2022 10:40:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sun, 24 Jul 2022 10:40:52 -0500
Received: from [10.250.34.242] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26OFeptr083623;
	Sun, 24 Jul 2022 10:40:51 -0500
Message-ID: <a57a187f-bd36-814b-ef74-ae5e1d3aca1e@ti.com>
Date: Sun, 24 Jul 2022 10:40:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][dunfell][PATCH v2] all: Remove reference to
 arago-project.org
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220721123539.24097-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220721123539.24097-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 24 Jul 2022 15:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13961

On 7/21/22 7:35 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> arago-project.org is being shut down in August.  This
> commit changes the last recipes that point to that
> old site to point to git.ti.com, or just rmeove the
> reference entirely.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Changed dir name for k2-fw-initrd files and removed uneeded line per
> feedback.
> 
>   meta-arago-distro/README                        |   2 +-
>   meta-arago-distro/classes/tisdk-bundle.bbclass  |   2 +-
>   meta-arago-distro/conf/distro/arago.conf        |   2 --
>   .../k2-fw-initrd/k2-initramfs-0.0.7.tar.gz      | Bin 0 -> 49660 bytes


Same comment as in v1:

Shouldn't put binaries in git, bloats the repo forever.

Can we host this file somewhere else, ti-linux-firmware seems
like the right spot given it's a bunch of firmwares.

Andrew


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
> 

