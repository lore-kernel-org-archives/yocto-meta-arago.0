Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C568C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:21:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.43732.1702491709160028799
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 10:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QentFvEr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BDILiJM014357;
	Wed, 13 Dec 2023 12:21:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702491704;
	bh=taaxf0rlvdrZMYEz8p9Vifn2vTzkQmpY8xh/TPIym+8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QentFvEr/+t7g3HoirK95jrNQJyW6lw3Omug5azmnFhb5OeS+pLouMuxhsDWIw0BU
	 zrx+5iFWTUvI+w7DCweMBeVeQDE7E36ixlkW08KQDcpEuqvoyKsZ1hJD5sk4EL6wZ3
	 uwvwoltVfuVa2h8d8jq78LgcGHQcLOC98FzRqh5g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BDILiR5002948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Dec 2023 12:21:44 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Dec 2023 12:21:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Dec 2023 12:21:43 -0600
Received: from [10.249.38.142] ([10.249.38.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BDILhIh116039;
	Wed, 13 Dec 2023 12:21:43 -0600
Message-ID: <a05f8c12-db80-4a1d-96d7-d01ae1c97db1@ti.com>
Date: Wed, 13 Dec 2023 12:21:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [kirkstone][PATCH] README: update with
 kirkstone-specific info
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231213175849.523803-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231213175849.523803-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 18:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15060


Note to self... remember to do this for scarthgap...  remember to do 
this for scarthgap... remember to do this for scarthgap...

On 12/13/2023 11:58 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> All READMEs were still mentioning master and old release version, update that.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-demos/README  | 14 +++++++-------
>   meta-arago-distro/README | 16 ++++++++--------
>   meta-arago-extras/README | 14 +++++++-------
>   meta-arago-test/README   | 12 ++++++------
>   4 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/meta-arago-demos/README b/meta-arago-demos/README
> index bb586c14..2649a90e 100644
> --- a/meta-arago-demos/README
> +++ b/meta-arago-demos/README
> @@ -1,30 +1,30 @@
>   meta-arago-demos provides demo applications to showcase in TI SDK products
>   
> -This layer works with the latest Yocto Project release (currently 2.2+) and tracks
> -the stable/maintenance branches (currently "master") of the corresponding layers:
> +This layer works with the latest Yocto Project release (currently 4.0) and tracks
> +the stable/maintenance branches (currently "kirkstone") of the corresponding layers:
>   
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta
>   
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>   
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>   
>   URI: https://github.com/meta-qt5/meta-qt5
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   
>   Send pull requests to meta-arago@lists.yoctoproject.org
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> index 49e9d9e1..063e0a78 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -1,34 +1,34 @@
>   meta-arago-distro provides Arago distribution configuration for TI SDK products
>   
> -This layer works with the latest Yocto Project release (currently 2.2+) and tracks
> -the stable/maintenance branches (currently "master") of the corresponding layers:
> +This layer works with the latest Yocto Project release (currently 4.0) and tracks
> +the stable/maintenance branches (currently "kirkstone") of the corresponding layers:
>   
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta
>   
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>   
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>   
>   URI: https://github.com/meta-qt5/meta-qt5
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   
>   URI: git://git.yoctoproject.org/meta-arago
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-arago-extras
>   
> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
> index 5b6e8a15..bf6beb36 100644
> --- a/meta-arago-extras/README
> +++ b/meta-arago-extras/README
> @@ -1,30 +1,30 @@
>   meta-arago-extras provides additional TI SDK applications that are distro-agnostic
>   
> -This layer works with the latest Yocto Project release (currently 2.2+) and tracks
> -the stable/maintenance branches (currently "master") of the corresponding layers:
> +This layer works with the latest Yocto Project release (currently 4.0) and tracks
> +the stable/maintenance branches (currently "kirkstone") of the corresponding layers:
>   
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta
>   
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>   
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>   
>   URI: https://github.com/meta-qt5/meta-qt5
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   
>   Send pull requests to meta-arago@lists.yoctoproject.org
> diff --git a/meta-arago-test/README b/meta-arago-test/README
> index 8f1f9993..a05cadc0 100644
> --- a/meta-arago-test/README
> +++ b/meta-arago-test/README
> @@ -1,25 +1,25 @@
>   meta-arago-test provides an additional packagegroup ti-test and some of the recipes that go into that group
>   
> -This layer works with the latest Yocto Project release (currently 2.2+) and tracks
> -the stable/maintenance branches (currently "master") of the corresponding layers:
> +This layer works with the latest Yocto Project release (currently 4.0) and tracks
> +the stable/maintenance branches (currently "kirkstone") of the corresponding layers:
>   
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta
>   
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>   
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: kirkstone
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

