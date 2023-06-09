Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDFDC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 13:31:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13484.1686317476686380874
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 06:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YvLrPjvg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359DVDOv002476;
	Fri, 9 Jun 2023 08:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686317473;
	bh=5tVEYJhCc+0clZRbbJkzTKlomTYVSoaeUQCfFgk/CW4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YvLrPjvgxpEKSsSKayK3OTc6ryK/f4/NZ7DeyuOoh+9I9sJkadEPDbmrQ6D5UOip+
	 LG4QZvNGsnPK/iWXsGCPJndU+t/mg/ZzKzi0fht4cjplfLlV/DLpEhqCzuTDdM73zA
	 REsrJORQFAoWHErvpXXlUIeVctTxhpmUZXSBzksQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359DVDIv109755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 08:31:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 08:31:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 08:31:12 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359DVCUb025628;
	Fri, 9 Jun 2023 08:31:12 -0500
Message-ID: <5f2acd49-c6aa-17c2-dccb-5de66dc29458@ti.com>
Date: Fri, 9 Jun 2023 08:31:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-distro: recipes-kernel:
 Remove docker configs
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230609052346.414726-1-c-shilwant@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230609052346.414726-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 13:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14572



On 6/9/2023 12:23 AM, Chirag Shilwant wrote:
> The necessary configs required for running docker containers have been enabled in ti-linux-6.1


Generally speaking I support this patch, but from a practical point of 
view we still have the 5.10 kernel in kirkstone/master.  And applying 
this patch as is will break docker support in those kernels.

We need to modify this patch to rename the bbappend files to just apply 
to the 5.10 kernels instead of % (all) kernels.


> Ref - https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/patch/?id=ca7f239d0814e6a49804b76c0984d6ca5eea0924
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../recipes-kernel/linux/docker.inc           |  4 ----
>   .../recipes-kernel/linux/files/docker.cfg     | 20 -------------------
>   .../linux/linux-ti-staging-rt_%.bbappend      |  2 --
>   .../linux/linux-ti-staging-systest_%.bbappend |  2 --
>   .../linux/linux-ti-staging_%.bbappend         |  2 --
>   5 files changed, 30 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
>   delete mode 100644 meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
> deleted file mode 100644
> index e926b219..00000000
> --- a/meta-arago-distro/recipes-kernel/linux/docker.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> -
> -SRC_URI += "file://docker.cfg"
> -KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
> diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> deleted file mode 100644
> index 9ac604b8..00000000
> --- a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -CONFIG_VETH=m
> -CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> -CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> -CONFIG_NETFILTER_XT_MATCH_IPVS=m
> -CONFIG_NET_CLS_CGROUP=m
> -CONFIG_IP_VS=m
> -CONFIG_IP_VS_RR=m
> -CONFIG_VXLAN=m
> -CONFIG_IPVLAN=m
> -CONFIG_MACVLAN=m
> -CONFIG_DUMMY=m
> -CONFIG_NF_NAT_FTP=m
> -CONFIG_NF_CONNTRACK_FTP=m
> -CONFIG_NF_NAT_TFTP=m
> -CONFIG_NF_CONNTRACK_TFTP=m
> -CONFIG_AUFS_FS=m
> -CONFIG_BTRFS_FS=m
> -CONFIG_BLK_DEV_DM=m
> -CONFIG_DM_THIN_PROVISIONING=m
> -CONFIG_OVERLAY_FS=m
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> index df55594e..06f33291 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago1"
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> -require docker.inc
> -
>   ALLOW_EMPTY:kernel-devicetree = "1"
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> index df55594e..06f33291 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago1"
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> -require docker.inc
> -
>   ALLOW_EMPTY:kernel-devicetree = "1"
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> index 031a8b05..9d9a3593 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago5"
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> -require docker.inc
> -
>   ALLOW_EMPTY:kernel-devicetree = "1"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

