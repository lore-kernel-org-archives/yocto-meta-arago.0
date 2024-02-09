Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67336C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 05:16:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5274.1707455805401916883
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 21:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BGqvunVe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4195GiOk115926
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 23:16:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707455804;
	bh=kNpwqeFts0UvvMI9L1qUsLYcoKjuui9d4uxg58PIp8M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BGqvunVeFCHVzWLD54Q0Os+l97/nh79o/Hct7YxLKXn+mKIwjkSruq3J/TRroUZn4
	 Xf8o5jpywwbuRj8DUH8ELwYFlkN6ZTGhR3CJfjaiKujKGQBFirPD4D4cc00tu6aHdD
	 wDYtti9rhg+iOF9zmOwXZ8rGuXqadRF9/8vKIb6E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4195GiZC016631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 23:16:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 23:16:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 23:16:44 -0600
Received: from [172.24.17.33] (lt5cd112gt3k.dhcp.ti.com [172.24.17.33])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4195Ggck063819;
	Thu, 8 Feb 2024 23:16:42 -0600
Message-ID: <e0d5c0b1-b642-4598-9298-e11bf53b33aa@ti.com>
Date: Fri, 9 Feb 2024 10:46:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Bhavya Kapoor <b-kapoor@ti.com>
References: <20240208183717.1983040-1-a-limaye@ti.com>
 <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4195GiOk115926
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 05:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15144


On 2/9/2024 12:58 AM, Andrew Davis wrote:
> On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org wrote:
>> When multiple CAN's are present, then names that are getting assigned
>> change after every boot even after providing alias in the device
>> tree.
>> So add udev rules to specify the interface name to use for
>> each mcan device, to make it persistent across reboots.
>>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>> v4:
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Reformat patch to avoid repeated code for k=
3 devices
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Add udev rules for dra7xx and ti33x too, as=
 suggested
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Still keeping separate files per platform t=
o avoid potential
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 confusion created by merging all =
the rules into one file
>
> You can keep the rules in separate files, but you need to install
> them all unconditionally for all machines. Otherwise this package
> becomes machine specific, which we should avoid.
>
> Andrew

Ahhh I misunderstood earlier then.... Yeah that makes sense.
Sending a v5...

Aniket

>
>> v3: Fix typos in the filename being installed in v2
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Switch to udev rules instead of systemd net=
work links, as per
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feedback from v1:=20
>> https://lists.yoctoproject.org/g/meta-arago/message/15104
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Also, extend to Sitara devices as well
>> ---
>> =C2=A0 .../systemd/systemd/37-can-am62.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>> =C2=A0 .../systemd/systemd/37-can-dra7.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 .../systemd/systemd/37-can-j7.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++
>> =C2=A0 .../systemd/systemd/37-can-ti33x.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 .../recipes-core/systemd/systemd_%.bbappend=C2=A0=C2=A0 | 37 ++=
+++++++++++++++++
>> =C2=A0 5 files changed, 65 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>> new file mode 100644
>> index 00000000..59dc8075
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>> @@ -0,0 +1,4 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can",=20
>> NAME=3D"mcu_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can",=20
>> NAME=3D"mcu_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can",=
=20
>> NAME=3D"main_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can",=
=20
>> NAME=3D"main_mcan1"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>> new file mode 100644
>> index 00000000..3b14150d
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>> @@ -0,0 +1,2 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can",=
=20
>> NAME=3D"main_dcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can",=
=20
>> NAME=3D"main_dcan2"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>> new file mode 100644
>> index 00000000..f2804ecd
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>> @@ -0,0 +1,20 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can",=
=20
>> NAME=3D"mcu_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can",=
=20
>> NAME=3D"mcu_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can",=20
>> NAME=3D"main_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can",=20
>> NAME=3D"main_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can",=20
>> NAME=3D"main_mcan2"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can",=20
>> NAME=3D"main_mcan3"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can",=20
>> NAME=3D"main_mcan4"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can",=20
>> NAME=3D"main_mcan5"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can",=20
>> NAME=3D"main_mcan6"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can",=20
>> NAME=3D"main_mcan7"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can",=20
>> NAME=3D"main_mcan8"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can",=20
>> NAME=3D"main_mcan9"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can",=20
>> NAME=3D"main_mcan10"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can",=20
>> NAME=3D"main_mcan11"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can",=20
>> NAME=3D"main_mcan12"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can",=20
>> NAME=3D"main_mcan13"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can",=20
>> NAME=3D"main_mcan14"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can",=20
>> NAME=3D"main_mcan15"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can",=20
>> NAME=3D"main_mcan16"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can",=20
>> NAME=3D"main_mcan17"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>> new file mode 100644
>> index 00000000..62d650fe
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rule=
s
>> @@ -0,0 +1,2 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can",=
=20
>> NAME=3D"main_dcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can",=
=20
>> NAME=3D"main_dcan1"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend=20
>> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> index f38606f2..f9919708 100644
>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> @@ -2,6 +2,21 @@ PR:append =3D ".arago7"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> =C2=A0 +CAN_RULES_SRC =3D ""
>> +CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
>> +CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
>> +CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
>> +CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
>> +CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
>> +CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
>> +CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
>> +CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
>> +CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
>> +CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
>> +CAN_RULES_SRC:dra7xx =3D "37-can-dra7.rules"
>> +CAN_RULES_SRC:ti33x =3D "37-can-ti33x.rules"
>> +CAN_RULES_TGT =3D "${libdir}/udev/rules.d/37-can.rules"
>> +
>> =C2=A0 SRC_URI:append =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://local.rules \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://usb1-rules.sh \
>> @@ -14,6 +29,10 @@ SRC_URI:append =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://timesyncd.conf \
>> =C2=A0 "
>> =C2=A0 +SRC_URI:append:k3 =3D " file://${CAN_RULES_SRC}"
>> +SRC_URI:append:dra7xx =3D " file://${CAN_RULES_SRC}"
>> +SRC_URI:append:ti33x =3D " file://${CAN_RULES_SRC}"
>> +
>> =C2=A0 do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/udev/rules=
.d/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/local.rules=20
>> ${D}${sysconfdir}/udev/rules.d/
>> @@ -43,3 +62,21 @@ do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/systemd/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/timesyncd.co=
nf=20
>> ${D}${sysconfdir}/systemd/
>> =C2=A0 }
>> +
>> +do_install:append:k3() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${=
CAN_RULES_TGT}
>> +}
>> +
>> +do_install:append:dra7xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${=
CAN_RULES_TGT}
>> +}
>> +
>> +do_install:append:ti33x() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${=
CAN_RULES_TGT}
>> +}
>> +
>> +FILES:udev +=3D "${CAN_RULES_TGT}"
>> +

