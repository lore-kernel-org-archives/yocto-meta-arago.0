Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC49AC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 13:43:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12244.1685022200148946221
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 May 2023 06:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H6BEO3qn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PDhIYX092729
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 May 2023 08:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685022198;
	bh=WABvGeIDT5FIzpQlk996KeVR/0k7MhTMYJL5nUfxjy4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=H6BEO3qndTsUI/cS9cen2ZtZ2jlMHw4lqzdmillv32ytBGlujvTe8h4Dt8DPVUeWW
	 TFi1bnFboZQkBKqRxjOCFu8o9bky5oCpDPuwbFwtVkATIT29S2fOmMoVNCHobv5mOP
	 NU+x40U9NAJceCA+hJkk7KGOve+Kfk8NBRTE/z6A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PDhId1108482
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 May 2023 08:43:18 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 08:43:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 08:43:18 -0500
Received: from [172.24.145.134] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PDhH2a117495
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 May 2023 08:43:17 -0500
Message-ID: <2b914ae7-d50c-c24e-f0e8-eb25862bf960@ti.com>
Date: Thu, 25 May 2023 19:13:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] [meta-arago][kirkstone][PATCH] ti-tisdk-setup: Remove
 ti-tisdk-setup from meta-arago
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
References: <20230524100132.15149-1-c-shilwant@ti.com>
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20230524100132.15149-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 May 2023 13:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14474


On 24/05/23 15:31, Chirag Shilwant via lists.yoctoproject.org wrote:
> - meta-arago is everthing related to Arago filesystem and ti-tisdk-setup is
> used to package all the scripts inside the SDK installer. Hence, remove
> it from meta-arago and continue maintaining it in meta-processor-sdk for
> SDK deliverables.
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---

Acked-by: Aniket Limaye <a-limaye@ti.com>

>   ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  1 -
>   .../ti-tisdk-setup/ti-tisdk-setup.bb          | 59 -------------------
>   2 files changed, 60 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> index 1a43d0ef..684af088 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> @@ -12,7 +12,6 @@ EXTRA_FILES:omap-a15 = "tisdk-readme tisdk-uenv"
>   EXTRA_FILES:k3 = "tisdk-readme tisdk-uenv"
>   
>   RDEPENDS:${PN} = "\
> -    ti-tisdk-setup \
>       ${EXTRA_FILES} \
>       tisdk-install \
>   "
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> deleted file mode 100644
> index e000e8c7..00000000
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -DESCRIPTION = "Package containing scripts to setup the development host and target board"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
> -
> -PR = "r47"
> -
> -BRANCH ?= "master"
> -SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
> -SRC_URI = "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -SDCARD_SCRIPT = " create-sdcard.sh"
> -
> -SETUP_SCRIPTS = " common.sh \
> -                  setup-host-check.sh \
> -                  setup-minicom.sh \
> -                  setup-package-install.sh \
> -                  setup-targetfs-nfs.sh \
> -                  setup-tftp.sh \
> -                  add-to-group.sh \
> -                  create-ubifs.sh \
> -                  ${SDCARD_SCRIPT} \
> -"
> -
> -UBOOT_ENV:omapl138 = "setup-uboot-env-am18x.sh"
> -UBOOT_ENV:ti33x = "setup-uboot-env-am335x.sh"
> -UBOOT_ENV:ti43x = "setup-uboot-env-am43x.sh"
> -UBOOT_ENV:omap5-evm = "setup-uboot-env-omap5.sh"
> -UBOOT_ENV:am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
> -UBOOT_ENV:k3 = "setup-uboot-env-am65x.sh"
> -UBOOT_ENV = "setup-uboot-unknown.sh"
> -
> -do_install () {
> -    install -m 0755 ${S}/setup.sh ${D}/
> -
> -    install -d ${D}/bin
> -    for script in ${SETUP_SCRIPTS}
> -    do
> -        install -m 0755 ${S}/${script} ${D}/bin
> -    done
> -
> -    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
> -
> -    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
> -    then
> -        # UBIFS not supported
> -        rm "${D}/bin/create-ubifs.sh"
> -    else
> -        sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
> -               -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
> -                  "${D}/bin/create-ubifs.sh"
> -    fi
> -}
> -
> -FILES:${PN} += "setup.sh"
> -RDEPENDS:${PN} += "bash"

