Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806BFC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:27:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.52182.1681151267107503322
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 11:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KgYM4Oie;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AIRkRj023705;
	Mon, 10 Apr 2023 13:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681151266;
	bh=DYqqvUVzZEq/mLFH78jaThf6ksG8GHe9nTN1xC9UyWM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=KgYM4Oie8iI0DgABPGaJULD3bQpcvVdbIt9/eBMHRnGEKZY8gh6JdD90SM5pZnKhs
	 vpfsKFICjVDkNbfajt/UFERLb8sWrO/rFHDJhXbjQSoEQ0oXET4qQyt46/MXFEe3Tc
	 HG4gjocowbvj3d0mo61fTiXLnRpDoWpGF6EflzEs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AIRkQ2028845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 13:27:46 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 13:27:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 13:27:45 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AIRjUD021306;
	Mon, 10 Apr 2023 13:27:45 -0500
Message-ID: <19d0db8a-ba4b-c7fc-3677-0df1b978e946@ti.com>
Date: Mon, 10 Apr 2023 13:27:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] big-data-ipc-demo: Update to
 version without CMEM dependency
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230410182551.11926-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230410182551.11926-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 18:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14302

On 4/10/23 1:25 PM, Andrew Davis wrote:
> Latest version does not use CMEM, update this recipe accordingly.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

For the subject, looks like I have the wrong tag, this should be for meta-arago.

Andrew

>   .../big-data-ipc-demo/big-data-ipc-demo_git.bb            | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
> index 439fac14..e7bf1a1d 100644
> --- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
> +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
> @@ -3,8 +3,8 @@ LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
>   
>   SRC_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;protocol=git;branch=master"
> -SRCREV = "984edb3c69c8a1f51da02e0abcd2201319650894"
> -PV = "01.03.00.00"
> +SRCREV = "3dedbde2a539834ee8f4d0419888116ea80789d0"
> +PV = "01.03.00.01"
>   
>   S = "${WORKDIR}/git"
>   
> @@ -19,8 +19,8 @@ DEPENDS = "ti-ipc \
>              ti-xdctools-native \
>              ti-sysbios \
>              ti-ipc-rtos \
> -           cmem \
>              ti-cgt6x-native \
> +           virtual/kernel \
>   "
>   
>   PLATFORM = "UNKNOWN"
> @@ -33,7 +33,7 @@ EXTRA_OEMAKE = "\
>       XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>       BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
>       IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> -    LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +    LINUX_SYSROOT_DIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include" \
>       gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
>       ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>       ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \

