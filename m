Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B87B552970
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2019 12:37:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RCadJh004492
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 07:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569587799;
	bh=PYNZmKmZ6lAMJRHHXmfZwhpRpTaT0A+RAjteFcGYNtM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=VrFVrkF7PnMoCTXvqGNobKavn25EjSYeaZHnfF5jajytsy9xbkLt3ccPpw6PaZuI6
	eClMoaHuiK8hxcRoVe5KnDTYvWptDMwlDp/WQaFGPtfXWA1h1zMNkdn9sfUy3psKIt
	VQoKF7yKHrCDy9hV+awA3inPYqL0TPNp5VZneNYU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RCadRj117038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 07:36:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 07:36:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 07:36:39 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RCacgp076724;
	Fri, 27 Sep 2019 07:36:38 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <1569577478-68202-1-git-send-email-nikhil.nd@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d9caa716-c26f-3fee-028c-2b25f56ede4d@ti.com>
Date: Fri, 27 Sep 2019 08:36:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569577478-68202-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master PATCH v1] tisdk-readme: Add separate README for k3 platforms
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 12:37:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/27/2019 5:44 AM, Nikhil Devshatwar wrote:
> For machines with k3 platforms, install the README_k3 as README
> It describes all the new files needed for booting k3 devices.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |  8 +++++--
>   .../tisdk-readme/tisdk-readme/README_k3            | 26 ++++++++++++++++++++++
>   2 files changed, 32 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3


If you add this file to 
"meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README", 
you will not need the other changes to the recipe.


> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> index 6fdcaff..18f8c04 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> @@ -4,19 +4,23 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>   
>   SRC_URI = "\
>       file://README \
> +    file://README_k3 \
>   "
>   
> -PR = "r0"
> +PR = "r1"
>   PV = "1.0"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   S = "${WORKDIR}"
>   
> +README_FILE = "README"
> +README_FILE_k3 = "README_k3"
> +
>   do_install () {
>       install -d ${D}/board-support/prebuilt-images
>   
> -    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
> +    install -m 0644 ${S}/${README_FILE} ${D}/board-support/prebuilt-images/README
>   }
>   
>   FILES_${PN} += "board-support/*"
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3 b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
> new file mode 100644
> index 0000000..0eb6dd3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
> @@ -0,0 +1,26 @@
> +The files contained in this directory represent the images that were built
> +as part of the original SDK build and packaging process.  They are meant
> +to serve as a restore and starting point for your development.  In order
> +to use these images with an SD card they should be placed in the appropriate
> +locations.
> +
> +By default these locations are:
> +
> ++-------------+-----------------------------------------+
> +|    File     |                Location                 |
> ++-------------+-----------------------------------------+
> +| tiboot3.bin | boot partition                          |
> +| tispl.bin   | boot partition                          |
> +| u-boot.img  | boot partition                          |
> +| sysfw.itb   | boot partition                          |
> +| uEnv.txt    | boot partition                          |
> ++-------------+-----------------------------------------+
> +| Image       | /boot directory of the rootfs partition |
> +| *.dtb       | /boot directory of the rootfs partition |
> +| *.dtbo      | /boot directory of the rootfs partition |
> ++-------------+-----------------------------------------+
> +
> +By default the boot loaders are read from the first FAT partition, which is
> +usually called the "boot" partition.  Then the bootloader will look for the
> +Image and .dtb .dtbo files in the /boot directory of the ext4 partition, which is
> +usually called the "rootfs" partition.

