Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3851C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 20:41:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.717.1707338485889110981
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 12:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qKU+KC0c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 417KfO3G124835
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 14:41:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707338484;
	bh=rwGp/GQFWjNeM7DBnfyGc6xavr73rxH0RRlXVUvSnOc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qKU+KC0cesVV0or/tF4og3XxDp/OZjHA+3NsBH6DHrm4ZBP8zI5BNt9UyaSvlKVfL
	 8gnpO6cmDCFFgI539bNF/fF68qtLmKFdGpx7eHPXWfLgz68T/m14manZgtr3BXGKUO
	 oDn/QSim/e3yxxzmuxJ6SJXXtmxUO6XzoBS/jv5E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 417KfO5i053114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 14:41:24 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 14:41:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 14:41:24 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 417KfO6l095234;
	Wed, 7 Feb 2024 14:41:24 -0600
Message-ID: <f8c71e3a-7909-40a5-9135-7b9dcf119f3e@ti.com>
Date: Wed, 7 Feb 2024 14:41:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules
 for persistent naming of the can devices
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Bhavya Kapoor <b-kapoor@ti.com>
References: <20240207192950.1761572-1-a-limaye@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240207192950.1761572-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 20:41:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15127



On 2/7/2024 1:29 PM, Aniket Limaye wrote:
> When multiple CAN's are present, then names that are getting assigned
> change after every boot even after providing alias in the device
> tree.
> So add udev rules to specify the interface name to use for
> each mcan device, to make it persistent across reboots.
> 
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> v3: Fix typos in the filename being installed in v2
> v2:
>      - Switch to udev rules instead of systemd network links, as per
>        feedback from v1: https://lists.yoctoproject.org/g/meta-arago/message/15104
>      - Also, extend to Sitara devices as well
> ---
>   .../systemd/systemd/k3/37-can-am62.rules      |  4 ++
>   .../systemd/systemd/k3/37-can-j7.rules        | 20 +++++++
>   .../recipes-core/systemd/systemd_%.bbappend   | 58 +++++++++++++++++++
>   3 files changed, 82 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> 
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
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

On the surface, I like this patch better because it only contains 
plaintext files and not binary ones... =)


> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index f38606f2..248ad5e4 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -14,6 +14,11 @@ SRC_URI:append = " \
>       file://timesyncd.conf \
>   "
>   
> +SRC_URI:append:k3 = " \
> +    file://37-can-j7.rules \
> +    file://37-can-am62.rules \
> +"

Is this patch for all k3 devices?  Or the big list of platforms below? 
It *seems* like you are breaking them up differently for Sitara vs 
Jacinto devices...


Would a cleaner approach be to define two new variables and use them in 
all of the places?



CAN_RULES_SRC = ""
CAN_RULES_SRC:j721e = "37-can-j7.rules"
CAN_RULES_SRC:j721e = "37-can-j7.rules"
CAN_RULES_SRC:j721e = "37-can-j7.rules"
<snip>

CAN_RULES_TGT = "udev/rules.d/37-can.rules"

SRC_URI:append = "file://${CAN_RULES}"

do_install:append:k3() {
   install -d ${D}/${libdir}/udev/rules.d
   install -m 0644 ${WORKDIR}/${CAN_RULES} ${D}${libdir}/${CAN_RULES_TGT}
}

FILES:udev += "${libdir}/${CAN_RULES_TGT}"




>   do_install:append() {
>       install -d ${D}${sysconfdir}/udev/rules.d/
>       install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
> @@ -43,3 +48,56 @@ do_install:append() {
>       install -d ${D}${sysconfdir}/systemd/
>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>   }
> +
> +do_install:append:j721e() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j7200() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j721s2() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j784s4() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am65xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62pxx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62axx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am64xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j722s() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +FILES:udev += "${libdir}/udev/rules.d/37-can.rules"
> +

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

