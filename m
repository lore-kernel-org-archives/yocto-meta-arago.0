Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C935EC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:05:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.5251.1657199109847257914
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 06:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SYlt6wpj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267D56IZ002455;
	Thu, 7 Jul 2022 08:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657199106;
	bh=F259iabLnmKiwoiwzrGjheltff7cRo/5lE0kiLKqo/U=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=SYlt6wpj7uLHz6gtJVS2TmEJ4V7npa84Yu5EdlN/cA4/nhjo6/fSHppUlV/FrLf7j
	 8Og5aIoJ1e4AFYJYI4W3siH4OKoVKQ8aPTeb8ubh5FUz61AtYjNcmc0zJeGeSxzvZH
	 4So6ULyxCKRkBNe5OTcQ+9PBS1GStHj6Lzrpbm+M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267D56Rd003324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 08:05:06 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 08:05:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 08:05:05 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267D55eh078531;
	Thu, 7 Jul 2022 08:05:05 -0500
Message-ID: <e92a2e56-2b4d-d4f3-bed3-08a7cb954f15@ti.com>
Date: Thu, 7 Jul 2022 08:05:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago] [oe-layersetup][master][RFC] oe-layersetup: Add
 config option for dunfell/kirkstone
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <16FF8DBB7909D3F6.549@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <16FF8DBB7909D3F6.549@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Jul 2022 13:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13940

Andrew, Denys,

What are your thoughts on this approach to fixing the variable name 
change issue?



On 7/7/2022 8:03, Ryan Eatmon via lists.yoctoproject.org wrote:
> Part of the transition to kirkstone was to rename some variables
> to align with community standards.  Since oe-layersetup needs to
> work with both dunfell and kirkstone, we need a way to control
> which branch we are pointing to so that we can put the correct
> variables in the conf/setenv file.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   configs/arago-dunfell-config.txt        |  1 +
>   configs/arago-dunfell-next-config.txt   |  1 +
>   configs/arago-dunfell-wip-config.txt    |  1 +
>   configs/arago-kirkstone-config.txt      |  1 +
>   configs/arago-master-config.txt         |  1 +
>   configs/distroless-dunfell-config.txt   |  1 +
>   configs/distroless-kirkstone-config.txt |  1 +
>   configs/distroless-master-config.txt    |  1 +
>   configs/poky-dunfell-config.txt         |  1 +
>   configs/poky-kirkstone-config.txt       |  1 +
>   configs/poky-master-config.txt          |  1 +
>   oe-layertool-setup.sh                   | 29 +++++++++++++++++++++++--
>   12 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index 60cc72a..71aaa0b 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   # use below for OECORELAYERCONF to mark it compatible with dunfell
>   #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> +BITBAKE_BRANCH=dunfell
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index e2eb202..18984cd 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   # use below for OECORELAYERCONF to mark it compatible with dunfell
>   #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> +BITBAKE_BRANCH=dunfell
> diff --git a/configs/arago-dunfell-wip-config.txt b/configs/arago-dunfell-wip-config.txt
> index 60f9f0d..55a3b73 100644
> --- a/configs/arago-dunfell-wip-config.txt
> +++ b/configs/arago-dunfell-wip-config.txt
> @@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   # use below for OECORELAYERCONF to mark it compatible with dunfell
>   #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> +BITBAKE_BRANCH=dunfell
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> index 0f3c001..1666a18 100644
> --- a/configs/arago-kirkstone-config.txt
> +++ b/configs/arago-kirkstone-config.txt
> @@ -12,3 +12,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
>   oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_BRANCH=kirkstone
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index 532a145..986ca6e 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -12,3 +12,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_BRANCH=master
> diff --git a/configs/distroless-dunfell-config.txt b/configs/distroless-dunfell-config.txt
> index 0d2ab28..923858f 100644
> --- a/configs/distroless-dunfell-config.txt
> +++ b/configs/distroless-dunfell-config.txt
> @@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-a
>   oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local.conf.sample
> +BITBAKE_BRANCH=dunfell
> diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
> index 3b33992..288ab3b 100644
> --- a/configs/distroless-kirkstone-config.txt
> +++ b/configs/distroless-kirkstone-config.txt
> @@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
>   oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-v2.conf.sample
> +BITBAKE_BRANCH=kirkstone
> diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
> index 5c55459..a355d0d 100644
> --- a/configs/distroless-master-config.txt
> +++ b/configs/distroless-master-config.txt
> @@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-v2.conf.sample
> +BITBAKE_BRANCH=master
> diff --git a/configs/poky-dunfell-config.txt b/configs/poky-dunfell-config.txt
> index 6c768e7..60fa653 100644
> --- a/configs/poky-dunfell-config.txt
> +++ b/configs/poky-dunfell-config.txt
> @@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-a
>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-poky.conf.sample
> +BITBAKE_BRANCH=dunfell
> diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
> index 0e57c64..658e189 100644
> --- a/configs/poky-kirkstone-config.txt
> +++ b/configs/poky-kirkstone-config.txt
> @@ -8,3 +8,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
>   oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> +BITBAKE_BRANCH=kirkstone
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index a541501..fe6b731 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -8,3 +8,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> +BITBAKE_BRANCH=master
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index e05737b..50c6f1e 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   
>   # OE Build Enviroment Setup Script
>   #
> @@ -38,6 +38,7 @@ OECORELAYERCONF="" # sample configuration file used for bblayers.conf
>   OECORELAYERCONFPATH="" # stores the path of the OECORELAYERCONFPATH variable
>   OECORELOCALCONF="" # sample configuration file used for local.conf
>   OECORELOCALCONFPATH="" # stores the path of the OECORELOCALCONFPATH variable
> +BITBAKE_BRANCH="dunfell"
>   outputfile="" # file to save output to if -o is used
>   inputfile="" # file containing initial layers if -f is used
>   interactive="n" # flag for interactive mode.  Default is n
> @@ -158,6 +159,14 @@ parse_oecore_line() {
>       eval $var=$val
>   }
>   
> +# Input is a line of the form BITBAKE.*=value
> +parse_bitbake_line() {
> +    var=`echo $1 | cut -d= -f1`
> +    val=`echo $1 | cut -d= -f2`
> +    eval $var=$val
> +}
> +
> +
>   
>   # Input is a repository description line as detailed in the usage section
>   # There is a second optional input that can be passed to prefix the variable
> @@ -243,6 +252,15 @@ parse_input_file() {
>               continue
>           fi
>   
> +        # If the line starts with OECORE then parse the OECORE setting
> +        echo $line | grep -e "^BITBAKE.*=" > /dev/null
> +        if [ "$?" = "0" ]
> +        then
> +            parse_bitbake_line $line
> +            output="$output""$line\n"
> +            continue
> +        fi
> +
>           # Since the line is not a comment or an OECORE setting let's assume
>           # it is a repository information line and parse it
>           parse_repo_line $line
> @@ -853,8 +871,15 @@ unset BITBAKEDIR
>   unset SCRIPTS
>   export PATH
>   export BUILDDIR=${builddir}
> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>   EOM
> +
> +    if [ "$BITBAKE_BRANCH" == "dunfell" ]; then
> +        echo "export BB_ENV_EXTRAWHITE=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
> +    fi
> +
> +    if [[ "$BITBAKE_BRANCH" == "kirkstone" || "$BITBAKE_BRANCH" == "master" ]]; then
> +        echo "export BB_ENV_PASSTHROUGH_ADDITIONS=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
> +    fi
>   }
>   
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

