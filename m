Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2361.1643826777928661121
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lHfrOPDJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IWtDf091946;
	Wed, 2 Feb 2022 12:32:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826775;
	bh=6/XQj/7pGk7VEURARkJGFxCNiDjN24OIv5PuAzrMxkw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=lHfrOPDJNRWp/Phg4lfr7x2Aipbner9DxJJSP8/w320DvHbHQdFpJQBfj9E4U+Ltr
	 2rP5EuCm7fryi4L/mxSNbv6c6NO+Kisp0p6G5G1DshQcyBkqEwkjXGlzZBfGC9nBmq
	 LIdEwc02+sSdcIcLt8RKFZA4Qxudw5hVM7q+QprE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IWtWu001440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:32:55 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:32:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:32:55 -0600
Received: from [10.249.37.55] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IWtIM121581;
	Wed, 2 Feb 2022 12:32:55 -0600
Message-ID: <5c041db0-1b8e-7048-6e3b-b8b040f21ee2@ti.com>
Date: Wed, 2 Feb 2022 12:32:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [EXTERNAL] [meta-arago] [meta-ti][dunfell][PATCH v2 00/12] Adding support for j721s2
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <16D00B6558BF5602.20712@lists.yoctoproject.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <16D00B6558BF5602.20712@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Ignore this patch.  I sent this to the wrong list.


On 2/2/2022 12:26, Ryan Eatmon via lists.yoctoproject.org wrote:
> *** BLURB HERE ***
> 
> Hari Nagalla (1):
>    recipes-ti/ti-rtos-bin: Fix unavailable binary path
> 
> Nishanth Menon (8):
>    machine: Add j721s2 evm configuration
>    optee-os: Add support for alternate console
>    trusted-firmware-a: Add support for alternate console
>    recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
>    ti-rtos-bin: Add j721s2
>    recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
>    recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
>    recipes-bsp: Add cnm-wave-fw firmware recipe
> 
> Praneeth Bajjuri (2):
>    ti-linux-fw: Bump up TIFS and DM to v2022.01
>    Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot
>      images"
> 
> Ryan Eatmon (1):
>    cnm-wave-fw: Fix name of firmware for j721s2
> 
>   conf/machine/j721s2-evm-k3r5.conf             | 11 ++++
>   conf/machine/j721s2-evm.conf                  | 22 +++++++
>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    | 42 ++++++++++++
>   .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  4 +-
>   recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  4 +-
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  9 +--
>   ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 28 ++++++--
>   .../trusted-firmware-a_%.bbappend             |  2 +
>   recipes-bsp/u-boot/u-boot-ti.inc              |  6 ++
>   recipes-kernel/linux/kernel-rdepends.inc      |  3 +
>   recipes-security/optee/optee-os_%.bbappend    |  2 +
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 59 ++++++++++++++++-
>   13 files changed, 175 insertions(+), 81 deletions(-)
>   create mode 100644 conf/machine/j721s2-evm-k3r5.conf
>   create mode 100644 conf/machine/j721s2-evm.conf
>   create mode 100644 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>   delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
> 

-- 
Ryan Eatmon
reatmon@ti.com
