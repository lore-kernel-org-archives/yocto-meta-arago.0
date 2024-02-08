Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B133C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:28:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4907.1707420528544512514
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 11:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gMu1Tt/J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418JSl20048145
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 13:28:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707420527;
	bh=T1sFEkoiHQrx2aGj7mYDNv3qFO4UwrOp0b3VQuBzKD8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gMu1Tt/JXxYEnajVudaEYq5zj5857zLsYksEQYGENXjP/VdRtMNZrFi71A83KwEGO
	 oesJiYT3oLZcGyoogD4rac7dFFbJTShmiyOLDDRtKjJvNJZR9RZ+Mw/KfNI/0IMe+M
	 yJiI8602L6GiG4P3aYfaswlxhe40dyCPhUdJjf4E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418JSlYE084702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 13:28:47 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 13:28:47 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 13:28:47 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418JSlE4041216;
	Thu, 8 Feb 2024 13:28:47 -0600
Message-ID: <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
Date: Thu, 8 Feb 2024 13:28:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
Content-Language: en-US
To: <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Bhavya Kapoor <b-kapoor@ti.com>
References: <20240208183717.1983040-1-a-limaye@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240208183717.1983040-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 19:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15139

On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org wrote:
> When multiple CAN's are present, then names that are getting assigned
> change after every boot even after providing alias in the device
> tree.
> So add udev rules to specify the interface name to use for
> each mcan device, to make it persistent across reboots.
> 
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> v4:
>      - Reformat patch to avoid repeated code for k3 devices
>      - Add udev rules for dra7xx and ti33x too, as suggested
>      - Still keeping separate files per platform to avoid potential
>        confusion created by merging all the rules into one file

You can keep the rules in separate files, but you need to install
them all unconditionally for all machines. Otherwise this package
becomes machine specific, which we should avoid.

Andrew

> v3: Fix typos in the filename being installed in v2
> v2:
>      - Switch to udev rules instead of systemd network links, as per
>        feedback from v1: https://lists.yoctoproject.org/g/meta-arago/message/15104
>      - Also, extend to Sitara devices as well
> ---
>   .../systemd/systemd/37-can-am62.rules         |  4 ++
>   .../systemd/systemd/37-can-dra7.rules         |  2 +
>   .../systemd/systemd/37-can-j7.rules           | 20 ++++++++++
>   .../systemd/systemd/37-can-ti33x.rules        |  2 +
>   .../recipes-core/systemd/systemd_%.bbappend   | 37 +++++++++++++++++++
>   5 files changed, 65 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> 
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> new file mode 100644
> index 00000000..3b14150d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> @@ -0,0 +1,20 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40528000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40568000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2711000.can", NAME="main_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2721000.can", NAME="main_mcan2"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2731000.can", NAME="main_mcan3"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2741000.can", NAME="main_mcan4"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2751000.can", NAME="main_mcan5"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2761000.can", NAME="main_mcan6"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2771000.can", NAME="main_mcan7"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2781000.can", NAME="main_mcan8"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2791000.can", NAME="main_mcan9"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27a1000.can", NAME="main_mcan10"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27b1000.can", NAME="main_mcan11"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27c1000.can", NAME="main_mcan12"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27d1000.can", NAME="main_mcan13"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2681000.can", NAME="main_mcan14"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2691000.can", NAME="main_mcan15"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26a1000.can", NAME="main_mcan16"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26b1000.can", NAME="main_mcan17"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> new file mode 100644
> index 00000000..62d650fe
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index f38606f2..f9919708 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -2,6 +2,21 @@ PR:append = ".arago7"
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> +CAN_RULES_SRC = ""
> +CAN_RULES_SRC:j721e = "37-can-j7.rules"
> +CAN_RULES_SRC:j7200 = "37-can-j7.rules"
> +CAN_RULES_SRC:j721s2 = "37-can-j7.rules"
> +CAN_RULES_SRC:j784s4 = "37-can-j7.rules"
> +CAN_RULES_SRC:am65xx = "37-can-j7.rules"
> +CAN_RULES_SRC:am62xx = "37-can-am62.rules"
> +CAN_RULES_SRC:am62pxx = "37-can-am62.rules"
> +CAN_RULES_SRC:am62axx = "37-can-am62.rules"
> +CAN_RULES_SRC:am64xx = "37-can-am62.rules"
> +CAN_RULES_SRC:j722s = "37-can-am62.rules"
> +CAN_RULES_SRC:dra7xx = "37-can-dra7.rules"
> +CAN_RULES_SRC:ti33x = "37-can-ti33x.rules"
> +CAN_RULES_TGT = "${libdir}/udev/rules.d/37-can.rules"
> +
>   SRC_URI:append = " \
>       file://local.rules \
>       file://usb1-rules.sh \
> @@ -14,6 +29,10 @@ SRC_URI:append = " \
>       file://timesyncd.conf \
>   "
>   
> +SRC_URI:append:k3 = " file://${CAN_RULES_SRC}"
> +SRC_URI:append:dra7xx = " file://${CAN_RULES_SRC}"
> +SRC_URI:append:ti33x = " file://${CAN_RULES_SRC}"
> +
>   do_install:append() {
>       install -d ${D}${sysconfdir}/udev/rules.d/
>       install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
> @@ -43,3 +62,21 @@ do_install:append() {
>       install -d ${D}${sysconfdir}/systemd/
>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>   }
> +
> +do_install:append:k3() {
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> +}
> +
> +do_install:append:dra7xx() {
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> +}
> +
> +do_install:append:ti33x() {
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> +}
> +
> +FILES:udev += "${CAN_RULES_TGT}"
> +

