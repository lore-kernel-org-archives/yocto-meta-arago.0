Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61482C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:03:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.5704.1659445372719261868
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 06:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d5nrCdbe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272D2nHS129661;
	Tue, 2 Aug 2022 08:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659445369;
	bh=vi0z8qisHmESKCtxQ2Ov0htyk6d9WYQCyyzvPYqhF4Q=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=d5nrCdbeUHM54Aza9Rsl8ILDHpzHqKghQcOVhGU8pH1MgiTE1HWak1SxPIdLU3y6f
	 D5whOIHDVZt1cfDxTHCGTKs9ok6yxHBbI5g+mVdRIpINPe+N3S7V+d98www96mgQ4E
	 Z2u+HWZ8olsm4f2m80/V6aoKOzqrATZePE3wOe+s=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272D2nS7030773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Aug 2022 08:02:49 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 08:02:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 08:02:49 -0500
Received: from [10.250.34.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272D2lbg023240;
	Tue, 2 Aug 2022 08:02:48 -0500
Message-ID: <651d556e-b1ac-0de9-415b-6667b4583415@ti.com>
Date: Tue, 2 Aug 2022 08:02:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][kirkstone/master][PATCH 1/3] ti-crypto-examples:
 Remove ti-crypto-examples
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220711164933.21445-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220711164933.21445-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Aug 2022 13:03:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13972

ping?

On 7/11/22 11:49 AM, Andrew Davis wrote:
> These examples have not been updated in a long time and are arguably not
> correct anymore. Remove this.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../conf/distro/include/arago-source-ipk.inc  |  3 --
>   .../packagegroup-arago-tisdk-crypto.bb        |  1 -
>   .../Makefile_ti-crypto-examples               | 24 ---------------
>   .../ti-tisdk-makefile_1.0.bb                  |  3 --
>   .../ti-crypto-examples_git.bb                 | 30 -------------------
>   5 files changed, 61 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>   delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index c03d5383..75355710 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -46,9 +46,6 @@ SRCIPK_INSTALL_DIR:pn-ti-tisdk-licenses ?= "docs/licenses"
>   CREATE_SRCIPK:pn-matrix-gui ?= "1"
>   SRCIPK_INSTALL_DIR:pn-matrix-gui ?= "example-applications/${PN}-${PV}"
>   
> -CREATE_SRCIPK:pn-ti-crypto-examples ?= "1"
> -SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?= "example-applications/${PN}-${PV}"
> -
>   CREATE_SRCIPK:pn-qml-carinfo ?= "1"
>   SRCIPK_INSTALL_DIR:pn-qml-carinfo ?= "example-applications/${PN}-${PV}"
>   
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> index f217f7d8..d2189a50 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> @@ -13,7 +13,6 @@ CRYPTO_SUPPORT = "\
>       openssl-engines \
>   "
>   
> -#ti-crypto-examples
>   CRYPTO_SUPPORT:append:ti33x = " cryptodev-module cryptodev-tests"
>   CRYPTO_SUPPORT:append:ti43x = " cryptodev-module cryptodev-tests"
>   CRYPTO_SUPPORT:append:dra7xx = " cryptodev-module cryptodev-tests"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> deleted file mode 100644
> index 6ad07e9a..00000000
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -# ti-crypto-examples build targets
> -ti-crypto-examples:
> -	@echo =================================
> -	@echo    Building TI Crypto Examples
> -	@echo =================================
> -	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make release
> -
> -ti-crypto-examples_clean:
> -	@echo =================================
> -	@echo    Cleaning TI Crypto Examples
> -	@echo =================================
> -	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make clean
> -
> -ti-crypto-examples_install:
> -	@echo ===================================================
> -	@echo   Installing TI Crypto Examples - Release version
> -	@echo ===================================================
> -	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install
> -
> -ti-crypto-examples_install_debug:
> -	@echo =================================================
> -	@echo   Installing TI Crypto Examples - Debug Version
> -	@echo =================================================
> -	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 85b99bf2..6737d7fd 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -18,7 +18,6 @@ SRC_URI = "\
>       file://Makefile_u-boot-legacy \
>       file://Makefile_matrix-gui \
>       file://Makefile_arm-benchmarks \
> -    file://Makefile_ti-crypto-examples \
>       file://Makefile_am-sysinfo \
>       file://Makefile_av-examples \
>       file://Makefile_u-boot-spl \
> @@ -76,7 +75,6 @@ MAKEFILES = ""
>   # Add device specific make targets
>   
>   MAKEFILES:append:ti33x = " u-boot-spl \
> -                           ti-crypto-examples \
>                              linux-dtbs \
>                              cryptodev \
>                              ti-sgx-ddk-km \
> @@ -86,7 +84,6 @@ MAKEFILES:append:ti33x = " u-boot-spl \
>                              pdm-anomaly-detection \
>   "
>   MAKEFILES:append:ti43x = " u-boot-spl \
> -                           ti-crypto-examples \
>                              linux-dtbs \
>                              cryptodev \
>                              dual-camera-demo \
> diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> deleted file mode 100644
> index 943a1b2b..00000000
> --- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION = "TI Cryptography Example Applications"
> -HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
> -SECTION = "console"
> -DEPENDS += "openssl"
> -
> -PR = "r7"
> -
> -BRANCH ?= "master"
> -SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
> -
> -SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -do_compile() {
> -    export CROSS_COMPILE=${TARGET_PREFIX}
> -    export CFLAGS='${TARGET_CC_ARCH}'
> -    # build the release version
> -    oe_runmake release
> -}
> -
> -do_install() {
> -    oe_runmake DESTDIR=${D} install
> -}
> -
> -python () {
> -    raise bb.parse.SkipRecipe("skipping ti-crypto-examples")
> -}

