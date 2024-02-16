Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DABC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 08:14:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14467.1708071283218999700
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Feb 2024 00:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E2epMfVI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G8EehL034459;
	Fri, 16 Feb 2024 02:14:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708071280;
	bh=NFMfPtAbojTklvXGWcRkXn2TN1r78CKZ1TJJA+Oyjm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E2epMfVIMrlYTDvOvY6CM8Wn8XI/5plz+InfFWEfeu7RvypzFJclshgtDY/WwjLSj
	 Moqkb8JfXdAlHtjYhD90RPe70L+YDMlsKto08wNFailH5z66m1XU6QgSNQW0G0JlFL
	 6EsfHEP+I6uYIq4rytv1ugMYtJAi7u0xsCP5ge8Q=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G8EeS1058439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 02:14:40 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 02:14:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 02:14:40 -0600
Received: from [172.24.17.33] (lt5cd112gt3k.dhcp.ti.com [172.24.17.33])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G8EbTo064927;
	Fri, 16 Feb 2024 02:14:38 -0600
Message-ID: <c02302e6-7667-45e3-ac33-8fe195d110dc@ti.com>
Date: Fri, 16 Feb 2024 13:44:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
References: <20240208183717.1983040-1-a-limaye@ti.com>
 <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
 <20240213174003.GL15614@denix.org>
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20240213174003.GL15614@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Feb 2024 08:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15201

I assume the question being how do we plan to handle images where 
sysvinit is used instead of systemd?

I do not have a lot of experience with sysvinit vs systemd or udev rules 
for that matter. Do you have any suggestions to make these naming 
conventions apply to both?

Regards,
Aniket


On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:
> BTW, what about sysvinit support?
>
>
> On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org wrote:
>>> When multiple CAN's are present, then names that are getting assigned
>>> change after every boot even after providing alias in the device
>>> tree.
>>> So add udev rules to specify the interface name to use for
>>> each mcan device, to make it persistent across reboots.
>>>
>>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>> ---
>>> v4:
>>>      - Reformat patch to avoid repeated code for k3 devices
>>>      - Add udev rules for dra7xx and ti33x too, as suggested
>>>      - Still keeping separate files per platform to avoid potential
>>>        confusion created by merging all the rules into one file
>> You can keep the rules in separate files, but you need to install
>> them all unconditionally for all machines. Otherwise this package
>> becomes machine specific, which we should avoid.
>>
>> Andrew
>>
>>> v3: Fix typos in the filename being installed in v2
>>> v2:
>>>      - Switch to udev rules instead of systemd network links, as per
>>>        feedback from v1: https://lists.yoctoproject.org/g/meta-arago/message/15104
>>>      - Also, extend to Sitara devices as well
>>> ---
>>>   .../systemd/systemd/37-can-am62.rules         |  4 ++
>>>   .../systemd/systemd/37-can-dra7.rules         |  2 +
>>>   .../systemd/systemd/37-can-j7.rules           | 20 ++++++++++
>>>   .../systemd/systemd/37-can-ti33x.rules        |  2 +
>>>   .../recipes-core/systemd/systemd_%.bbappend   | 37 +++++++++++++++++++
>>>   5 files changed, 65 insertions(+)
>>>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>>>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>>>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>>>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>>>
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>>> new file mode 100644
>>> index 00000000..59dc8075
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>>> @@ -0,0 +1,4 @@
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>>> new file mode 100644
>>> index 00000000..3b14150d
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>>> @@ -0,0 +1,2 @@
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>>> new file mode 100644
>>> index 00000000..f2804ecd
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>>> @@ -0,0 +1,20 @@
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40528000.can", NAME="mcu_mcan0"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40568000.can", NAME="mcu_mcan1"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2701000.can", NAME="main_mcan0"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2711000.can", NAME="main_mcan1"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2721000.can", NAME="main_mcan2"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2731000.can", NAME="main_mcan3"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2741000.can", NAME="main_mcan4"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2751000.can", NAME="main_mcan5"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2761000.can", NAME="main_mcan6"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2771000.can", NAME="main_mcan7"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2781000.can", NAME="main_mcan8"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2791000.can", NAME="main_mcan9"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27a1000.can", NAME="main_mcan10"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27b1000.can", NAME="main_mcan11"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27c1000.can", NAME="main_mcan12"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27d1000.can", NAME="main_mcan13"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2681000.can", NAME="main_mcan14"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2691000.can", NAME="main_mcan15"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26a1000.can", NAME="main_mcan16"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26b1000.can", NAME="main_mcan17"
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>>> new file mode 100644
>>> index 00000000..62d650fe
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>>> @@ -0,0 +1,2 @@
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
>>> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>> index f38606f2..f9919708 100644
>>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>> @@ -2,6 +2,21 @@ PR:append = ".arago7"
>>>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>> +CAN_RULES_SRC = ""
>>> +CAN_RULES_SRC:j721e = "37-can-j7.rules"
>>> +CAN_RULES_SRC:j7200 = "37-can-j7.rules"
>>> +CAN_RULES_SRC:j721s2 = "37-can-j7.rules"
>>> +CAN_RULES_SRC:j784s4 = "37-can-j7.rules"
>>> +CAN_RULES_SRC:am65xx = "37-can-j7.rules"
>>> +CAN_RULES_SRC:am62xx = "37-can-am62.rules"
>>> +CAN_RULES_SRC:am62pxx = "37-can-am62.rules"
>>> +CAN_RULES_SRC:am62axx = "37-can-am62.rules"
>>> +CAN_RULES_SRC:am64xx = "37-can-am62.rules"
>>> +CAN_RULES_SRC:j722s = "37-can-am62.rules"
>>> +CAN_RULES_SRC:dra7xx = "37-can-dra7.rules"
>>> +CAN_RULES_SRC:ti33x = "37-can-ti33x.rules"
>>> +CAN_RULES_TGT = "${libdir}/udev/rules.d/37-can.rules"
>>> +
>>>   SRC_URI:append = " \
>>>       file://local.rules \
>>>       file://usb1-rules.sh \
>>> @@ -14,6 +29,10 @@ SRC_URI:append = " \
>>>       file://timesyncd.conf \
>>>   "
>>> +SRC_URI:append:k3 = " file://${CAN_RULES_SRC}"
>>> +SRC_URI:append:dra7xx = " file://${CAN_RULES_SRC}"
>>> +SRC_URI:append:ti33x = " file://${CAN_RULES_SRC}"
>>> +
>>>   do_install:append() {
>>>       install -d ${D}${sysconfdir}/udev/rules.d/
>>>       install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
>>> @@ -43,3 +62,21 @@ do_install:append() {
>>>       install -d ${D}${sysconfdir}/systemd/
>>>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>>>   }
>>> +
>>> +do_install:append:k3() {
>>> +    install -d ${D}${libdir}/udev/rules.d
>>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
>>> +}
>>> +
>>> +do_install:append:dra7xx() {
>>> +    install -d ${D}${libdir}/udev/rules.d
>>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
>>> +}
>>> +
>>> +do_install:append:ti33x() {
>>> +    install -d ${D}${libdir}/udev/rules.d
>>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
>>> +}
>>> +
>>> +FILES:udev += "${CAN_RULES_TGT}"
>>> +

