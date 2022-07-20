Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE37C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 22:57:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3981.1658357855453364717
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 15:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Cr7zWnoO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KMvU6p039164;
	Wed, 20 Jul 2022 17:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658357850;
	bh=JT4/BN+tuzTS9DpYRgB09Q3gVDiWvHvV8Ubez5xOYcA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Cr7zWnoOwWfLJ9QATJzHIw0QAa2DEofdNLlSV7mzH7L3DeH7JP/buSTAb9xd6ciW1
	 iCEXVl7xNgmZjIvRa5jmuO7F9lhHMaucD9d+cDPcsw1YT3ESA27WI/JvqPbOlgh9KW
	 p/Ed0YGjvsPQvbs6AlyY+VVcsmEUVXyDoxakF0T0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KMvUEI029866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 17:57:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 17:57:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 17:57:30 -0500
Received: from [10.250.34.168] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KMvTqP046929;
	Wed, 20 Jul 2022 17:57:29 -0500
Message-ID: <8cb6094a-42ce-ddb0-87d7-4e1deb1c5687@ti.com>
Date: Wed, 20 Jul 2022 17:57:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-arago][dunfell][PATCH] all: Remove reference to
 arago-project.org
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220720203212.20717-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220720203212.20717-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Jul 2022 22:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13958

On 7/20/22 3:32 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> arago-project.org is being shut down in August.  This
> commit changes the last recipes that point to that
> old site to point to git.ti.com, or just rmeove the
> reference entirely.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/README                        |   2 +-
>   meta-arago-distro/classes/tisdk-bundle.bbclass  |   2 +-
>   meta-arago-distro/conf/distro/arago.conf        |   2 --
>   .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb          |   4 +++-
>   .../k2-initramfs-0.0.7.tar.gz                   | Bin 0 -> 49660 bytes

Shouldn't put binaries in git, bloats the repo forever.

Is there really no where else we can host this file?

Andrew

>   .../recipes-core/base-files/base-files/issue    |   2 +-
>   .../base-files/base-files/issue.net             |   2 +-
>   .../feed-config/arago-feed-config_1.0.bb        |   2 +-
>   .../oe-layersetup/oe-layersetup.bb              |   2 +-
>   .../ti-crypto-examples_git.bb                   |   4 ++--
>   .../ltp-ddt/ltp-ddt_20210524.bb                 |   2 +-
>   .../recipes-support/ipsecmgr/ipsecmgr.inc       |   2 +-
>   .../libnl-xfrm/libnl-xfrm_git.bb                |   2 +-
>   13 files changed, 14 insertions(+), 14 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7/k2-initramfs-0.0.7.tar.gz
> 

