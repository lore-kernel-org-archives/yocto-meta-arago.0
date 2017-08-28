Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E45A152AB3
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 15:06:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SF6m0Q010631
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 10:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503932808;
	bh=7LT5DEhaLgjyA3QH9TgtdsTCAJNGbP5EsKIVEIXP8rs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=whRhZqwyKG7mwJ4dGbIa4ENg4T4JXz8UhDnNin3uoo+HmY0/ILaaFen4rAdumV3sV
	a7H9pY6Ps8V57/Bu7ef0OPxAK7cSxFNhc2uiTziK7GKs+qAz9MkfABueJmg/2zZdvA
	yNP59um8/mOVUMIJ2rRHbpUXi5vv1aJMSK4iZ/dk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SF6hQk017986
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 10:06:43 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 28 Aug 2017 10:06:43 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk] [PATCH]
	linux-ti-staging-4.9-patches: mt9t11 camera sensor support in default
	DTs
Thread-Index: AQHTG48/rMNz908vIEK0z95g/4Erb6KZ5Xhg
Date: Mon, 28 Aug 2017 15:06:42 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D71F47@DLEE08.ent.ti.com>
References: <1503096060-1126-1-git-send-email-h-gou@ti.com>
	<20170822214014.GR28233@edge>
In-Reply-To: <20170822214014.GR28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 28 Aug 2017 15:06:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

We are carrying this patch in meta-processor-sdk as a workaround and not pl=
anning to submit it for 2017.04. The default camera sensor for AM5 will cha=
nge after 2017.05. Meanwhile, we will look into the option of using DT over=
lay as suggested by Nishanth. More details can be found from https://jira.i=
tg.ti.com/browse/LCPD-10207.
=20
Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 22, 2017 5:40 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-processor-sdk] [PATCH] linux-ti-staging-4=
.9-
> patches: mt9t11 camera sensor support in default DTs
>=20
> Is this change being submitted to ti-linux-kernel for 2017.04?
>=20
>=20
> On Fri, Aug 18, 2017 at 06:41:00PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../linux/linux-ti-staging-4.9-patches.inc         |   3 +-
> >  ...7xx-allow-mt9t111-support-in-the-default-.patch | 230
> > +++++++++++++++++++++
> >  2 files changed, 232 insertions(+), 1 deletion(-)  create mode 100644
> > recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57xx-
> > allow-mt9t111-support-in-the-default-.patch
> >
> > diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> > b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> > index 3a62067..9e1ec35 100644
> > --- a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> > +++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
> > @@ -1,4 +1,4 @@
> > -PR_append =3D ".p11"
> > +PR_append =3D ".p12"
> >
> >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-ti-staging-4.9-patches:=
"
> >
> > @@ -55,4 +55,5 @@ TI_LINUX_KERNEL_PATCHES =3D " \
> >      file://0048-hsr-prp-do-sanity-check-for-offload-before-creating-.p=
atch \
> >      file://0049-prueth-preparatory-patch-to-add-run-time-protocol-
> ch.patch \
> >
> > file://0050-prueth-support-run-time-change-of-protocol-at-pru-Et.patch
> > \
> > +
> > + file://0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.pat
> > + ch \
> >  "
> > diff --git
> > a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57x
> > x-allow-mt9t111-support-in-the-default-.patch
> > b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-am57x
> > x-allow-mt9t111-support-in-the-default-.patch
> > new file mode 100644
> > index 0000000..cc2808f
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0051-arm-dts-a
> > +++ m57xx-allow-mt9t111-support-in-the-default-.patch
> > @@ -0,0 +1,230 @@
> > +From b4216aa074346d518b0b248a0fa4d4ed8471a2e1 Mon Sep 17 00:00:00
> > +2001
> > +From: Hongmei Gou <h-gou@ti.com>
> > +Date: Fri, 18 Aug 2017 18:30:51 -0400
> > +Subject: [PATCH] arm: dts: am57xx: allow mt9t111 support in the
> > +default dtbs
> > +
> > +Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > +---
> > + arch/arm/boot/dts/am57xx-evm-base.dts              | 24 ++++++++++++
> > + arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts       |  2 +-
> > + arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts       |  2 +-
> > + arch/arm/boot/dts/am57xx-evm-reva3-base.dts        | 45
> ++++++++++++++++++++++
> > + arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts |  2 +-
> > +arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts |  2 +-
> > + arch/arm/boot/dts/am57xx-evm-reva3.dts             | 40 ++-----------=
------
> > + arch/arm/boot/dts/am57xx-evm.dts                   | 17 +-------
> > + 8 files changed, 78 insertions(+), 56 deletions(-)  create mode
> > +100644 arch/arm/boot/dts/am57xx-evm-base.dts
> > + create mode 100644 arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> > +
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-base.dts
> > +b/arch/arm/boot/dts/am57xx-evm-base.dts
> > +new file mode 100644
> > +index 0000000..746bcaf
> > +--- /dev/null
> > ++++ b/arch/arm/boot/dts/am57xx-evm-base.dts
> > +@@ -0,0 +1,24 @@
> > ++/*
> > ++ * Copyright (C) 2015-2016 Texas Instruments Incorporated -
> > ++http://www.ti.com/
> > ++ *
> > ++ * This program is free software; you can redistribute it and/or
> > ++modify
> > ++ * it under the terms of the GNU General Public License version 2 as
> > ++ * published by the Free Software Foundation.
> > ++ */
> > ++
> > ++#include "am57xx-beagle-x15.dts"
> > ++#include "am57xx-evm-common.dtsi"
> > ++#include "am57xx-commercial-grade.dtsi"
> > ++
> > ++/ {
> > ++	model =3D "TI AM5728 EVM";
> > ++};
> > ++
> > ++&mmc3 {
> > ++	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50";
> > ++	pinctrl-0 =3D <&mmc3_pins_default>;
> > ++	pinctrl-1 =3D <&mmc3_pins_hs>;
> > ++	pinctrl-2 =3D <&mmc3_pins_sdr12>;
> > ++	pinctrl-3 =3D <&mmc3_pins_sdr25>;
> > ++	pinctrl-4 =3D <&mmc3_pins_sdr50
> &mmc3_iodelay_manual1_rev11_conf>;
> > ++};
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> > +b/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> > +index 4c2f0fd..6d41c29 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm-cam-mt9t111.dts
> > +@@ -6,6 +6,6 @@
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-evm.dts"
> > ++#include "am57xx-evm-base.dts"
> > + #include "am57xx-evm-common-cam-mt9t111.dtsi"
> > +
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> > +b/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> > +index 97ab69e..fef8646 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm-cam-ov10635.dts
> > +@@ -6,6 +6,6 @@
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-evm.dts"
> > ++#include "am57xx-evm-base.dts"
> > + #include "am57xx-evm-common-cam-ov10635.dtsi"
> > +
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> > +b/arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> > +new file mode 100644
> > +index 0000000..ded3e66
> > +--- /dev/null
> > ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-base.dts
> > +@@ -0,0 +1,45 @@
> > ++/*
> > ++ * Copyright (C) 2016 Texas Instruments Incorporated -
> > ++http://www.ti.com/
> > ++ *
> > ++ * This program is free software; you can redistribute it and/or
> > ++modify
> > ++ * it under the terms of the GNU General Public License version 2 as
> > ++ * published by the Free Software Foundation.
> > ++ */
> > ++
> > ++#include "am57xx-beagle-x15-revb1.dts"
> > ++#include "am57xx-evm-common.dtsi"
> > ++#include "am57xx-industrial-grade.dtsi"
> > ++
> > ++/ {
> > ++	model =3D "TI AM572x EVM Rev A3";
> > ++};
> > ++
> > ++&mmc1 {
> > ++	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50=
",
> "sdr104";
> > ++	pinctrl-0 =3D <&mmc1_pins_default>;
> > ++	pinctrl-1 =3D <&mmc1_pins_hs>;
> > ++	pinctrl-2 =3D <&mmc1_pins_sdr12>;
> > ++	pinctrl-3 =3D <&mmc1_pins_sdr25>;
> > ++	pinctrl-4 =3D <&mmc1_pins_sdr50>;
> > ++	pinctrl-5 =3D <&mmc1_pins_ddr50 &mmc1_iodelay_ddr_rev20_conf>;
> > ++	pinctrl-6 =3D <&mmc1_pins_sdr104
> &mmc1_iodelay_sdr104_rev20_conf>;
> > ++	vmmc-supply =3D <&vdd_3v3>;
> > ++	vmmc_aux-supply =3D <&ldo1_reg>;
> > ++};
> > ++
> > ++&mmc2 {
> > ++	pinctrl-names =3D "default", "hs", "ddr_1_8v";
> > ++	pinctrl-0 =3D <&mmc2_pins_default>;
> > ++	pinctrl-1 =3D <&mmc2_pins_hs>;
> > ++	pinctrl-2 =3D <&mmc2_pins_ddr_rev20>;
> > ++	/delete-property/ mmc-hs200-1_8v;
> > ++};
> > ++
> > ++&mmc3 {
> > ++	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50";
> > ++	pinctrl-0 =3D <&mmc3_pins_default>;
> > ++	pinctrl-1 =3D <&mmc3_pins_hs>;
> > ++	pinctrl-2 =3D <&mmc3_pins_sdr12>;
> > ++	pinctrl-3 =3D <&mmc3_pins_sdr25>;
> > ++	pinctrl-4 =3D <&mmc3_pins_sdr50
> &mmc3_iodelay_manual1_rev20_conf>;
> > ++};
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> > +b/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> > +index eaef0e2..65df28b 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-cam-mt9t111.dts
> > +@@ -6,6 +6,6 @@
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-evm-reva3.dts"
> > ++#include "am57xx-evm-reva3-base.dts"
> > + #include "am57xx-evm-common-cam-mt9t111.dtsi"
> > +
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> > +b/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> > +index 40c6994..ff8770b 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm-reva3-cam-ov10635.dts
> > +@@ -6,6 +6,6 @@
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-evm-reva3.dts"
> > ++#include "am57xx-evm-reva3-base.dts"
> > + #include "am57xx-evm-common-cam-ov10635.dtsi"
> > +
> > +diff --git a/arch/arm/boot/dts/am57xx-evm-reva3.dts
> > +b/arch/arm/boot/dts/am57xx-evm-reva3.dts
> > +index ded3e66..65df28b 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm-reva3.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm-reva3.dts
> > +@@ -1,45 +1,11 @@
> > + /*
> > +- * Copyright (C) 2016 Texas Instruments Incorporated -
> > +http://www.ti.com/
> > ++ * Copyright (C) 2015-2016 Texas Instruments Incorporated -
> > ++ http://www.ti.com/
> > +  *
> > +  * This program is free software; you can redistribute it and/or
> > + modify
> > +  * it under the terms of the GNU General Public License version 2 as
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-beagle-x15-revb1.dts"
> > +-#include "am57xx-evm-common.dtsi"
> > +-#include "am57xx-industrial-grade.dtsi"
> > ++#include "am57xx-evm-reva3-base.dts"
> > ++#include "am57xx-evm-common-cam-mt9t111.dtsi"
> > +
> > +-/ {
> > +-	model =3D "TI AM572x EVM Rev A3";
> > +-};
> > +-
> > +-&mmc1 {
> > +-	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50=
",
> "sdr104";
> > +-	pinctrl-0 =3D <&mmc1_pins_default>;
> > +-	pinctrl-1 =3D <&mmc1_pins_hs>;
> > +-	pinctrl-2 =3D <&mmc1_pins_sdr12>;
> > +-	pinctrl-3 =3D <&mmc1_pins_sdr25>;
> > +-	pinctrl-4 =3D <&mmc1_pins_sdr50>;
> > +-	pinctrl-5 =3D <&mmc1_pins_ddr50 &mmc1_iodelay_ddr_rev20_conf>;
> > +-	pinctrl-6 =3D <&mmc1_pins_sdr104
> &mmc1_iodelay_sdr104_rev20_conf>;
> > +-	vmmc-supply =3D <&vdd_3v3>;
> > +-	vmmc_aux-supply =3D <&ldo1_reg>;
> > +-};
> > +-
> > +-&mmc2 {
> > +-	pinctrl-names =3D "default", "hs", "ddr_1_8v";
> > +-	pinctrl-0 =3D <&mmc2_pins_default>;
> > +-	pinctrl-1 =3D <&mmc2_pins_hs>;
> > +-	pinctrl-2 =3D <&mmc2_pins_ddr_rev20>;
> > +-	/delete-property/ mmc-hs200-1_8v;
> > +-};
> > +-
> > +-&mmc3 {
> > +-	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50";
> > +-	pinctrl-0 =3D <&mmc3_pins_default>;
> > +-	pinctrl-1 =3D <&mmc3_pins_hs>;
> > +-	pinctrl-2 =3D <&mmc3_pins_sdr12>;
> > +-	pinctrl-3 =3D <&mmc3_pins_sdr25>;
> > +-	pinctrl-4 =3D <&mmc3_pins_sdr50
> &mmc3_iodelay_manual1_rev20_conf>;
> > +-};
> > +diff --git a/arch/arm/boot/dts/am57xx-evm.dts
> > +b/arch/arm/boot/dts/am57xx-evm.dts
> > +index 746bcaf..6d41c29 100644
> > +--- a/arch/arm/boot/dts/am57xx-evm.dts
> > ++++ b/arch/arm/boot/dts/am57xx-evm.dts
> > +@@ -6,19 +6,6 @@
> > +  * published by the Free Software Foundation.
> > +  */
> > +
> > +-#include "am57xx-beagle-x15.dts"
> > +-#include "am57xx-evm-common.dtsi"
> > +-#include "am57xx-commercial-grade.dtsi"
> > ++#include "am57xx-evm-base.dts"
> > ++#include "am57xx-evm-common-cam-mt9t111.dtsi"
> > +
> > +-/ {
> > +-	model =3D "TI AM5728 EVM";
> > +-};
> > +-
> > +-&mmc3 {
> > +-	pinctrl-names =3D "default", "hs", "sdr12", "sdr25", "sdr50";
> > +-	pinctrl-0 =3D <&mmc3_pins_default>;
> > +-	pinctrl-1 =3D <&mmc3_pins_hs>;
> > +-	pinctrl-2 =3D <&mmc3_pins_sdr12>;
> > +-	pinctrl-3 =3D <&mmc3_pins_sdr25>;
> > +-	pinctrl-4 =3D <&mmc3_pins_sdr50
> &mmc3_iodelay_manual1_rev11_conf>;
> > +-};
> > +--
> > +1.9.1
> > +
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

