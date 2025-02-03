Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD391C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:40:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.92259.1738600836349456120
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 08:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lE7O368u;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513GeXJU2227976
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 10:40:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738600833;
	bh=X6FT0mwZduiPUGXB/y9X1TzDk0rYY5yDjZFZrWUStR8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lE7O368uy67qdze98K+Eo4uu0petV89RFfqxSBDQKKnw3fQu2FF1hIaCD8peOW6d+
	 pzWUnL25Xl4tdhzOGcSbILD6ul14Wq/SYrUUpitiAb3j63BTlYCitqpWXk1q7iRRNG
	 vvT8xjioTcErUpZ6IQH5HjucLqLLWPmnEzXie7UU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513GeXGr053767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 10:40:33 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 10:40:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 10:40:32 -0600
Received: from [10.249.32.112] ([10.249.32.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513GeWHP076328;
	Mon, 3 Feb 2025 10:40:32 -0600
Message-ID: <cfc8bdf3-ca61-4872-ae56-4fc92bca4793@ti.com>
Date: Mon, 3 Feb 2025 10:40:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][master][PATCHv2]
 configs/arago-master-*-config: Remove meta-arago-demos
To: <rs@ti.com>, <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250124193647.1729123-1-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250124193647.1729123-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 16:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15792


I appreciate this patch, but this causes a chicken-and-egg problem.  I 
can't test the removal of meta-arago-demos on master-wip without having 
a patch that removes that layer on just wip.

So really, this patch should be broken up into three seperate patche 
series.  The first one removes it from wip so I can test it all.  The 
second then removes it from master-next so that the CICD builds can 
work, and the final removes it from master once CICD promotes the removal.

It's annoying I know.  And I'll handle doing the patches in the staged 
approach, just something to bear in mind for the future if we do this 
kind of thing again.


On 1/24/2025 1:36 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Remove the meta-arago-demos layer to help break the dependency on
> meta-qt5. This comes after a patch in meta-arago-distro that removed all
> of the packages from meta-arago-demos. These were the last of the
> "demos" in meta-arago and they were only being built for legacy devices.
> Demos should primarily be in layers above arago unless they are used for
> functionality testing.
> 
> These modifications are required as part of the effort to make arago
> less dependent on meta-qt5. Moving forward TI builds of arago will
> enable and test Qt6 by default, but unlike before this will not be done
> in a way that creates an explicit dependency. This should allow
> customers and layers that consume or extend arago to toggle Qt support
> more easily.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> v2: More verbose commit message following previous feedback
> 
>   .../templates/arago-master-chromium-config/bblayers.conf.sample | 1 -
>   conf/templates/arago-master-config/bblayers.conf.sample         | 1 -
>   conf/templates/arago-master-next-config/bblayers.conf.sample    | 1 -
>   conf/templates/arago-master-selinux-config/bblayers.conf.sample | 1 -
>   conf/templates/arago-master-wip-config/bblayers.conf.sample     | 1 -
>   configs/arago-master-chromium-config.txt                        | 2 +-
>   configs/arago-master-config.txt                                 | 2 +-
>   configs/arago-master-next-config.txt                            | 2 +-
>   configs/arago-master-selinux-config.txt                         | 2 +-
>   configs/arago-master-wip-config.txt                             | 2 +-
>   kas/arago-master-chromium-config.yml                            | 1 -
>   kas/arago-master-config.yml                                     | 1 -
>   kas/arago-master-next-config.yml                                | 1 -
>   kas/arago-master-selinux-config.yml                             | 1 -
>   kas/arago-master-wip-config.yml                                 | 1 -
>   src/configs/arago-master-chromium-config.xml                    | 1 -
>   src/configs/arago-master-config.xml                             | 1 -
>   src/configs/arago-master-next-config.xml                        | 1 -
>   src/configs/arago-master-selinux-config.xml                     | 1 -
>   src/configs/arago-master-wip-config.xml                         | 1 -
>   20 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/conf/templates/arago-master-chromium-config/bblayers.conf.sample b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
> index 3e5edee..29beb7d 100644
> --- a/conf/templates/arago-master-chromium-config/bblayers.conf.sample
> +++ b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
> @@ -11,7 +11,6 @@ BBFILES ?= ""
>   BBLAYERS ?= " \
>       ##OEROOT##/../meta-arago/meta-arago-distro
>       ##OEROOT##/../meta-arago/meta-arago-extras
> -    ##OEROOT##/../meta-arago/meta-arago-demos
>       ##OEROOT##/../meta-arago/meta-arago-test
>       ##OEROOT##/../meta-browser/meta-chromium
>       ##OEROOT##/../meta-qt5
> diff --git a/conf/templates/arago-master-config/bblayers.conf.sample b/conf/templates/arago-master-config/bblayers.conf.sample
> index adbccbd..f70b6af 100644
> --- a/conf/templates/arago-master-config/bblayers.conf.sample
> +++ b/conf/templates/arago-master-config/bblayers.conf.sample
> @@ -11,7 +11,6 @@ BBFILES ?= ""
>   BBLAYERS ?= " \
>       ##OEROOT##/../meta-arago/meta-arago-distro
>       ##OEROOT##/../meta-arago/meta-arago-extras
> -    ##OEROOT##/../meta-arago/meta-arago-demos
>       ##OEROOT##/../meta-arago/meta-arago-test
>       ##OEROOT##/../meta-qt5
>       ##OEROOT##/../meta-virtualization
> diff --git a/conf/templates/arago-master-next-config/bblayers.conf.sample b/conf/templates/arago-master-next-config/bblayers.conf.sample
> index adbccbd..f70b6af 100644
> --- a/conf/templates/arago-master-next-config/bblayers.conf.sample
> +++ b/conf/templates/arago-master-next-config/bblayers.conf.sample
> @@ -11,7 +11,6 @@ BBFILES ?= ""
>   BBLAYERS ?= " \
>       ##OEROOT##/../meta-arago/meta-arago-distro
>       ##OEROOT##/../meta-arago/meta-arago-extras
> -    ##OEROOT##/../meta-arago/meta-arago-demos
>       ##OEROOT##/../meta-arago/meta-arago-test
>       ##OEROOT##/../meta-qt5
>       ##OEROOT##/../meta-virtualization
> diff --git a/conf/templates/arago-master-selinux-config/bblayers.conf.sample b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
> index 51b8551..094ec81 100644
> --- a/conf/templates/arago-master-selinux-config/bblayers.conf.sample
> +++ b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
> @@ -11,7 +11,6 @@ BBFILES ?= ""
>   BBLAYERS ?= " \
>       ##OEROOT##/../meta-arago/meta-arago-distro
>       ##OEROOT##/../meta-arago/meta-arago-extras
> -    ##OEROOT##/../meta-arago/meta-arago-demos
>       ##OEROOT##/../meta-arago/meta-arago-test
>       ##OEROOT##/../meta-selinux
>       ##OEROOT##/../meta-qt5
> diff --git a/conf/templates/arago-master-wip-config/bblayers.conf.sample b/conf/templates/arago-master-wip-config/bblayers.conf.sample
> index adbccbd..f70b6af 100644
> --- a/conf/templates/arago-master-wip-config/bblayers.conf.sample
> +++ b/conf/templates/arago-master-wip-config/bblayers.conf.sample
> @@ -11,7 +11,6 @@ BBFILES ?= ""
>   BBLAYERS ?= " \
>       ##OEROOT##/../meta-arago/meta-arago-distro
>       ##OEROOT##/../meta-arago/meta-arago-extras
> -    ##OEROOT##/../meta-arago/meta-arago-demos
>       ##OEROOT##/../meta-arago/meta-arago-test
>       ##OEROOT##/../meta-qt5
>       ##OEROOT##/../meta-virtualization
> diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
> index f15ab67..df3f0ba 100644
> --- a/configs/arago-master-chromium-config.txt
> +++ b/configs/arago-master-chromium-config.txt
> @@ -2,7 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index 1cde5d9..7a1a481 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -2,7 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
> index 210bd68..0868327 100644
> --- a/configs/arago-master-next-config.txt
> +++ b/configs/arago-master-next-config.txt
> @@ -10,7 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that rec
>   MOTD: NOTE:
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
> index ed4ecdd..5cf0631 100644
> --- a/configs/arago-master-selinux-config.txt
> +++ b/configs/arago-master-selinux-config.txt
> @@ -2,7 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
>   meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
> index a85e1fb..eb9c49d 100644
> --- a/configs/arago-master-wip-config.txt
> +++ b/configs/arago-master-wip-config.txt
> @@ -2,7 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
> index bf8c5f3..837ef0e 100644
> --- a/kas/arago-master-chromium-config.yml
> +++ b/kas/arago-master-chromium-config.yml
> @@ -13,7 +13,6 @@ repos:
>       layers:
>         meta-arago-distro:
>         meta-arago-extras:
> -      meta-arago-demos:
>         meta-arago-test:
>   
>     meta-browser:
> diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
> index 6a21d96..5434891 100644
> --- a/kas/arago-master-config.yml
> +++ b/kas/arago-master-config.yml
> @@ -13,7 +13,6 @@ repos:
>       layers:
>         meta-arago-distro:
>         meta-arago-extras:
> -      meta-arago-demos:
>         meta-arago-test:
>   
>     meta-qt5:
> diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
> index 6514b9d..03dadec 100644
> --- a/kas/arago-master-next-config.yml
> +++ b/kas/arago-master-next-config.yml
> @@ -13,7 +13,6 @@ repos:
>       layers:
>         meta-arago-distro:
>         meta-arago-extras:
> -      meta-arago-demos:
>         meta-arago-test:
>   
>     meta-qt5:
> diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
> index 922ab89..46b32c7 100644
> --- a/kas/arago-master-selinux-config.yml
> +++ b/kas/arago-master-selinux-config.yml
> @@ -13,7 +13,6 @@ repos:
>       layers:
>         meta-arago-distro:
>         meta-arago-extras:
> -      meta-arago-demos:
>         meta-arago-test:
>   
>     meta-selinux:
> diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
> index 429bb06..f994926 100644
> --- a/kas/arago-master-wip-config.yml
> +++ b/kas/arago-master-wip-config.yml
> @@ -13,7 +13,6 @@ repos:
>       layers:
>         meta-arago-distro:
>         meta-arago-extras:
> -      meta-arago-demos:
>         meta-arago-test:
>   
>     meta-qt5:
> diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
> index 9abaf97..ec58ea9 100644
> --- a/src/configs/arago-master-chromium-config.xml
> +++ b/src/configs/arago-master-chromium-config.xml
> @@ -13,7 +13,6 @@
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> -                <layer>meta-arago-demos</layer>
>                   <layer>meta-arago-test</layer>
>               </layers>
>           </repo>
> diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
> index 8380a57..94f3ac1 100644
> --- a/src/configs/arago-master-config.xml
> +++ b/src/configs/arago-master-config.xml
> @@ -13,7 +13,6 @@
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> -                <layer>meta-arago-demos</layer>
>                   <layer>meta-arago-test</layer>
>               </layers>
>           </repo>
> diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
> index 0eee296..122258f 100644
> --- a/src/configs/arago-master-next-config.xml
> +++ b/src/configs/arago-master-next-config.xml
> @@ -14,7 +14,6 @@
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> -                <layer>meta-arago-demos</layer>
>                   <layer>meta-arago-test</layer>
>               </layers>
>           </repo>
> diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
> index 6ecea87..0c5019f 100644
> --- a/src/configs/arago-master-selinux-config.xml
> +++ b/src/configs/arago-master-selinux-config.xml
> @@ -13,7 +13,6 @@
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> -                <layer>meta-arago-demos</layer>
>                   <layer>meta-arago-test</layer>
>               </layers>
>           </repo>
> diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
> index 74718d5..ded9e5a 100644
> --- a/src/configs/arago-master-wip-config.xml
> +++ b/src/configs/arago-master-wip-config.xml
> @@ -13,7 +13,6 @@
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> -                <layer>meta-arago-demos</layer>
>                   <layer>meta-arago-test</layer>
>               </layers>
>           </repo>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

