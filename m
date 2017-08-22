Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 81C4F529A4
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 21:40:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7MLeI4C002458
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 16:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503438018;
	bh=WkX39mdxX45KBNowIiZlW0RBWumNJc1wmRGdl244vCs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E6gQF6VQDMXPAGN7gvVEGFdgkCi+3Ysj/Fi9irRpe3ssy3ZKOSkdm+HSyNubPbzFk
	cfwjcVMBZeAKzx8SG/oukroDotN5eNvkNzuZalVhfO4tSLL5TKO0OYdBuCRhfsB9c3
	AvhEGqIoW9VQqEGm0Mc5VZA1kXIFW0G0XAu5I2FQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MLeHGG013419
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 16:40:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 22 Aug 2017 16:40:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 22 Aug 2017 16:40:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MLeHWX006346;
	Tue, 22 Aug 2017 16:40:18 -0500
Date: Tue, 22 Aug 2017 17:40:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170822214014.GR28233@edge>
References: <1503096060-1126-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1503096060-1126-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-processor-sdk] [PATCH] linux-ti-staging-4.9-patches: mt9t11 camera sensor support in default DTs
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
X-List-Received-Date: Tue, 22 Aug 2017 21:40:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this change being submitted to ti-linux-kernel for 2017.04?


On Fri, Aug 18, 2017 at 06:41:00PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../linux/linux-ti-staging-4.9-patches.inc         |   3 +-
>  ...7xx-allow-mt9t111-support-in-the-default-.patch | 230 +++++++++++++++++++++
>  2 files changed, 232 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> index 3a62067..9e1ec35 100644
> --- a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> +++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> @@ -1,4 +1,4 @@
> -PR_append = ".p11"
> +PR_append = ".p12"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"
>  
> @@ -55,4 +55,5 @@ TI_LINUX_KERNEL_PATCHES = " \
>      file://0048-hsr-prp-do-sanity-check-for-offload-before-creating-.patch \
>      file://0049-prueth-preparatory-patch-to-add-run-time-protocol-ch.patch \
>      file://0050-prueth-support-run-time-change-of-protocol-at-pru-Et.patch \
> +    file://0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch \
>  "
> diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch
> new file mode 100644
> index 0000000..cc2808f
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch
> @@ -0,0 +1,230 @@
> +From b4216aa074346d518b0b248a0fa4d4ed8471a2e1 Mon Sep 17 00:00:00 2001
> +From: Hongmei Gou <h-gou@ti.com>
> +Date: Fri, 18 Aug 2017 18:30:51 -0400
> +Subject: [PATCH] arm: dts: am57xx: allow mt9t111 support in the default dtbs
> +
> +Signed-off-by: Hongmei Gou <h-gou@ti.com>
> +---
> + arch/arm/boot/dts/am57xx-evm-base.dts              | 24 ++++++++++++
> + arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts       |  2 +-
> + arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts       |  2 +-
> + arch/arm/boot/dts/am57xx-evm-reva3-base.dts        | 45 ++++++++++++++++++++++
> + arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts |  2 +-
> + arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts |  2 +-
> + arch/arm/boot/dts/am57xx-evm-reva3.dts             | 40 ++-----------------
> + arch/arm/boot/dts/am57xx-evm.dts                   | 17 +-------
> + 8 files changed, 78 insertions(+), 56 deletions(-)
> + create mode 100644 arch/arm/boot/dts/am57xx-evm-base.dts
> + create mode 100644 arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> +
> +diff --git a/arch/arm/boot/dts/am57xx-evm-base.dts b/arch/arm/boot/dts/am57xx-evm-base.dts
> +new file mode 100644
> +index 0000000..746bcaf
> +--- /dev/null
> ++++ b/arch/arm/boot/dts/am57xx-evm-base.dts
> +@@ -0,0 +1,24 @@
> ++/*
> ++ * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License version 2 as
> ++ * published by the Free Software Foundation.
> ++ */
> ++
> ++#include "am57xx-beagle-x15.dts"
> ++#include "am57xx-evm-common.dtsi"
> ++#include "am57xx-commercial-grade.dtsi"
> ++
> ++/ {
> ++	model = "TI AM5728 EVM";
> ++};
> ++
> ++&mmc3 {
> ++	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
> ++	pinctrl-0 = <&mmc3_pins_default>;
> ++	pinctrl-1 = <&mmc3_pins_hs>;
> ++	pinctrl-2 = <&mmc3_pins_sdr12>;
> ++	pinctrl-3 = <&mmc3_pins_sdr25>;
> ++	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev11_conf>;
> ++};
> +diff --git a/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts b/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> +index 4c2f0fd..6d41c29 100644
> +--- a/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> +@@ -6,6 +6,6 @@
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-evm.dts"
> ++#include "am57xx-evm-base.dts"
> + #include "am57xx-evm-common-cam-mt9t111.dtsi"
> + 
> +diff --git a/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts b/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> +index 97ab69e..fef8646 100644
> +--- a/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> +@@ -6,6 +6,6 @@
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-evm.dts"
> ++#include "am57xx-evm-base.dts"
> + #include "am57xx-evm-common-cam-ov10635.dtsi"
> + 
> +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-base.dts b/arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> +new file mode 100644
> +index 0000000..ded3e66
> +--- /dev/null
> ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> +@@ -0,0 +1,45 @@
> ++/*
> ++ * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License version 2 as
> ++ * published by the Free Software Foundation.
> ++ */
> ++
> ++#include "am57xx-beagle-x15-revb1.dts"
> ++#include "am57xx-evm-common.dtsi"
> ++#include "am57xx-industrial-grade.dtsi"
> ++
> ++/ {
> ++	model = "TI AM572x EVM Rev A3";
> ++};
> ++
> ++&mmc1 {
> ++	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50", "sdr104";
> ++	pinctrl-0 = <&mmc1_pins_default>;
> ++	pinctrl-1 = <&mmc1_pins_hs>;
> ++	pinctrl-2 = <&mmc1_pins_sdr12>;
> ++	pinctrl-3 = <&mmc1_pins_sdr25>;
> ++	pinctrl-4 = <&mmc1_pins_sdr50>;
> ++	pinctrl-5 = <&mmc1_pins_ddr50 &mmc1_iodelay_ddr_rev20_conf>;
> ++	pinctrl-6 = <&mmc1_pins_sdr104 &mmc1_iodelay_sdr104_rev20_conf>;
> ++	vmmc-supply = <&vdd_3v3>;
> ++	vmmc_aux-supply = <&ldo1_reg>;
> ++};
> ++
> ++&mmc2 {
> ++	pinctrl-names = "default", "hs", "ddr_1_8v";
> ++	pinctrl-0 = <&mmc2_pins_default>;
> ++	pinctrl-1 = <&mmc2_pins_hs>;
> ++	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
> ++	/delete-property/ mmc-hs200-1_8v;
> ++};
> ++
> ++&mmc3 {
> ++	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
> ++	pinctrl-0 = <&mmc3_pins_default>;
> ++	pinctrl-1 = <&mmc3_pins_hs>;
> ++	pinctrl-2 = <&mmc3_pins_sdr12>;
> ++	pinctrl-3 = <&mmc3_pins_sdr25>;
> ++	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev20_conf>;
> ++};
> +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts b/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> +index eaef0e2..65df28b 100644
> +--- a/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> +@@ -6,6 +6,6 @@
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-evm-reva3.dts"
> ++#include "am57xx-evm-reva3-base.dts"
> + #include "am57xx-evm-common-cam-mt9t111.dtsi"
> + 
> +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts b/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> +index 40c6994..ff8770b 100644
> +--- a/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> +@@ -6,6 +6,6 @@
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-evm-reva3.dts"
> ++#include "am57xx-evm-reva3-base.dts"
> + #include "am57xx-evm-common-cam-ov10635.dtsi"
> + 
> +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3.dts b/arch/arm/boot/dts/am57xx-evm-reva3.dts
> +index ded3e66..65df28b 100644
> +--- a/arch/arm/boot/dts/am57xx-evm-reva3.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm-reva3.dts
> +@@ -1,45 +1,11 @@
> + /*
> +- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
> ++ * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2 as
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-beagle-x15-revb1.dts"
> +-#include "am57xx-evm-common.dtsi"
> +-#include "am57xx-industrial-grade.dtsi"
> ++#include "am57xx-evm-reva3-base.dts"
> ++#include "am57xx-evm-common-cam-mt9t111.dtsi"
> + 
> +-/ {
> +-	model = "TI AM572x EVM Rev A3";
> +-};
> +-
> +-&mmc1 {
> +-	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50", "sdr104";
> +-	pinctrl-0 = <&mmc1_pins_default>;
> +-	pinctrl-1 = <&mmc1_pins_hs>;
> +-	pinctrl-2 = <&mmc1_pins_sdr12>;
> +-	pinctrl-3 = <&mmc1_pins_sdr25>;
> +-	pinctrl-4 = <&mmc1_pins_sdr50>;
> +-	pinctrl-5 = <&mmc1_pins_ddr50 &mmc1_iodelay_ddr_rev20_conf>;
> +-	pinctrl-6 = <&mmc1_pins_sdr104 &mmc1_iodelay_sdr104_rev20_conf>;
> +-	vmmc-supply = <&vdd_3v3>;
> +-	vmmc_aux-supply = <&ldo1_reg>;
> +-};
> +-
> +-&mmc2 {
> +-	pinctrl-names = "default", "hs", "ddr_1_8v";
> +-	pinctrl-0 = <&mmc2_pins_default>;
> +-	pinctrl-1 = <&mmc2_pins_hs>;
> +-	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
> +-	/delete-property/ mmc-hs200-1_8v;
> +-};
> +-
> +-&mmc3 {
> +-	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
> +-	pinctrl-0 = <&mmc3_pins_default>;
> +-	pinctrl-1 = <&mmc3_pins_hs>;
> +-	pinctrl-2 = <&mmc3_pins_sdr12>;
> +-	pinctrl-3 = <&mmc3_pins_sdr25>;
> +-	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev20_conf>;
> +-};
> +diff --git a/arch/arm/boot/dts/am57xx-evm.dts b/arch/arm/boot/dts/am57xx-evm.dts
> +index 746bcaf..6d41c29 100644
> +--- a/arch/arm/boot/dts/am57xx-evm.dts
> ++++ b/arch/arm/boot/dts/am57xx-evm.dts
> +@@ -6,19 +6,6 @@
> +  * published by the Free Software Foundation.
> +  */
> + 
> +-#include "am57xx-beagle-x15.dts"
> +-#include "am57xx-evm-common.dtsi"
> +-#include "am57xx-commercial-grade.dtsi"
> ++#include "am57xx-evm-base.dts"
> ++#include "am57xx-evm-common-cam-mt9t111.dtsi"
> + 
> +-/ {
> +-	model = "TI AM5728 EVM";
> +-};
> +-
> +-&mmc3 {
> +-	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
> +-	pinctrl-0 = <&mmc3_pins_default>;
> +-	pinctrl-1 = <&mmc3_pins_hs>;
> +-	pinctrl-2 = <&mmc3_pins_sdr12>;
> +-	pinctrl-3 = <&mmc3_pins_sdr25>;
> +-	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev11_conf>;
> +-};
> +-- 
> +1.9.1
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

