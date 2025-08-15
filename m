Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B6DCA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:12:35 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.11466.1755263552870016916
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 06:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Osk+V8am;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FDCWUa2610431
	for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 08:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755263552;
	bh=V7VbBZJ0f+yW0BPZlKUYFTIRALqn9oOaIqKZeJhnBJM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Osk+V8am+5FUlzGNkege7eNVPcY9vXCwWAMDWs0VyQ0Z+onf/Td5uLN11LdgS9s2Y
	 5pV/TQjGIHzzfqeU/18Wwby7WzYPSm3+DcESytZsBFR3+Z8aEBk1KYNRZD6rIL+wZA
	 fqWgJUTVzhPhUybmwSO90gfIGIg/V0hEhAt+pPrU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FDCWX21921043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 08:12:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 08:12:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 08:12:31 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FDCV7c1031632;
	Fri, 15 Aug 2025 08:12:31 -0500
Message-ID: <0ad8bb2b-0eeb-4788-9bd4-9e04f8ee8e6c@ti.com>
Date: Fri, 15 Aug 2025 08:12:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][master][PATCH] configs/arago-scarthgap-*:
 Introduce meta-flutter config
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
References: <20250814221645.3854077-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250814221645.3854077-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 13:12:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16474


NAK.  You are missing several files that the makefile generated.  Please 
include them in the patch.


On 8/14/2025 5:16 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Introduce a meta-flutter config. This will enable flutter testing at the
> coresdk level.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   configs/arago-scarthgap-chromium-config.txt   |  1 +
>   configs/arago-scarthgap-config.txt            |  1 +
>   configs/arago-scarthgap-flutter-config.txt    | 20 +++++
>   configs/arago-scarthgap-next-config.txt       |  1 +
>   configs/arago-scarthgap-selinux-config.txt    |  1 +
>   configs/arago-scarthgap-wip-config.txt        |  1 +
>   .../arago-scarthgap-chromium-config.xml       |  6 ++
>   src/configs/arago-scarthgap-config.xml        |  6 ++
>   .../arago-scarthgap-flutter-config.xml        | 80 +++++++++++++++++++
>   src/configs/arago-scarthgap-next-config.xml   |  6 ++
>   .../arago-scarthgap-selinux-config.xml        |  6 ++
>   src/configs/arago-scarthgap-wip-config.xml    |  6 ++
>   12 files changed, 135 insertions(+)
>   create mode 100644 configs/arago-scarthgap-flutter-config.txt
>   create mode 100644 src/configs/arago-scarthgap-flutter-config.xml
> 
> diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
> index d95b9a3..f54363f 100644
> --- a/configs/arago-scarthgap-chromium-config.txt
> +++ b/configs/arago-scarthgap-chromium-config.txt
> @@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
>   oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
> index 7cdff80..8d8879d 100644
> --- a/configs/arago-scarthgap-config.txt
> +++ b/configs/arago-scarthgap-config.txt
> @@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
>   oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-scarthgap-flutter-config.txt b/configs/arago-scarthgap-flutter-config.txt
> new file mode 100644
> index 0000000..d7f7675
> --- /dev/null
> +++ b/configs/arago-scarthgap-flutter-config.txt
> @@ -0,0 +1,20 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
> +
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes
> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
> index d0fd785..84cd875 100644
> --- a/configs/arago-scarthgap-next-config.txt
> +++ b/configs/arago-scarthgap-next-config.txt
> @@ -20,6 +20,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
>   oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
> index 9c37fdc..f8e2ca2 100644
> --- a/configs/arago-scarthgap-selinux-config.txt
> +++ b/configs/arago-scarthgap-selinux-config.txt
> @@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
>   oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
> index a19645b..2e7bb67 100644
> --- a/configs/arago-scarthgap-wip-config.txt
> +++ b/configs/arago-scarthgap-wip-config.txt
> @@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
>   oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
> index 84f4a6a..5ed35b4 100644
> --- a/src/configs/arago-scarthgap-chromium-config.xml
> +++ b/src/configs/arago-scarthgap-chromium-config.xml
> @@ -59,6 +59,12 @@
>           <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
>               <layers/>
>           </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
>           <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta</layer>
> diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
> index 45e5946..d5c571e 100644
> --- a/src/configs/arago-scarthgap-config.xml
> +++ b/src/configs/arago-scarthgap-config.xml
> @@ -59,6 +59,12 @@
>           <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
>               <layers/>
>           </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
>           <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta</layer>
> diff --git a/src/configs/arago-scarthgap-flutter-config.xml b/src/configs/arago-scarthgap-flutter-config.xml
> new file mode 100644
> index 0000000..8686025
> --- /dev/null
> +++ b/src/configs/arago-scarthgap-flutter-config.xml
> @@ -0,0 +1,80 @@
> +<?xml version='1.0'?>
> +<config>
> +    <description>Arago reference distribution for scarthgap</description>
> +
> +    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
> +    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
> +    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
> +
> +    <repos>
> +        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers/>
> +        </repo>
> +        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
> +            <layers/>
> +        </repo>
> +        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
> +            <layers/>
> +        </repo>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-gnome</layer>
> +                <layer>meta-filesystems</layer>
> +                <layer>meta-multimedia</layer>
> +            </layers>
> +        </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
> +            <layers/>
> +        </repo>
> +        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
> +            <layers/>
> +        </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
> +        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <tools>
> +        <tool type='oe-layersetup'>
> +            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
> +        </tool>
> +    </tools>
> +</config>
> diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
> index 73fd7f7..d88cfe8 100644
> --- a/src/configs/arago-scarthgap-next-config.xml
> +++ b/src/configs/arago-scarthgap-next-config.xml
> @@ -60,6 +60,12 @@
>           <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
>               <layers/>
>           </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
>           <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta</layer>
> diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
> index eb3152a..1096683 100644
> --- a/src/configs/arago-scarthgap-selinux-config.xml
> +++ b/src/configs/arago-scarthgap-selinux-config.xml
> @@ -59,6 +59,12 @@
>           <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
>               <layers/>
>           </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
>           <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta</layer>
> diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
> index c26baf3..cdb4a29 100644
> --- a/src/configs/arago-scarthgap-wip-config.xml
> +++ b/src/configs/arago-scarthgap-wip-config.xml
> @@ -59,6 +59,12 @@
>           <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
>               <layers/>
>           </repo>
> +        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
>           <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta</layer>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

