Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D10C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 20:46:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.915.1707338766287403011
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LxQKV6+R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 417Kk5hu068033
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 14:46:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707338765;
	bh=sIFVRWtaGodSifw6iX+QWBhZGSjtkV3lV0gIwjHS7Zw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LxQKV6+RCPZlq4nZQ9NbeAE35QsfXi2mo5HUZtn4b+FAGtTSvwPZPZgobWBPRND/j
	 A/IZR5xlnbsO0nrrO7SiMc4SWmeLTWZC+DachUBjoWpSjc9fwQ0mwotoT8OM/7L2Z0
	 KRYxGfTVpiSdAyQzCmXYQ0p8KZ0D67Kohsz00uPo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 417Kk5vT058020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 14:46:05 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 14:46:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 14:46:05 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 417Kk46t101833;
	Wed, 7 Feb 2024 14:46:05 -0600
Message-ID: <719610e1-6c99-4a48-952c-a9d57e586064@ti.com>
Date: Wed, 7 Feb 2024 14:46:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules
 for persistent naming of the can devices
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Bhavya Kapoor <b-kapoor@ti.com>
References: <20240207192950.1761572-1-a-limaye@ti.com>
 <17B1AF4EB3B08B09.829@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17B1AF4EB3B08B09.829@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 417Kk5hu068033
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 20:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15128



On 2/7/2024 2:41 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/7/2024 1:29 PM, Aniket Limaye wrote:
>> When multiple CAN's are present, then names that are getting assigned
>> change after every boot even after providing alias in the device
>> tree.
>> So add udev rules to specify the interface name to use for
>> each mcan device, to make it persistent across reboots.
>>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>> v3: Fix typos in the filename being installed in v2
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Switch to udev rules instead of systemd net=
work links, as per
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feedback from v1:=20
>> https://lists.yoctoproject.org/g/meta-arago/message/15104
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Also, extend to Sitara devices as well
>> ---
>> =C2=A0 .../systemd/systemd/k3/37-can-am62.rules=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++
>> =C2=A0 .../systemd/systemd/k3/37-can-j7.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 20 +++++++
>> =C2=A0 .../recipes-core/systemd/systemd_%.bbappend=C2=A0=C2=A0 | 58 ++=
+++++++++++++++++
>> =C2=A0 3 files changed, 82 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>> new file mode 100644
>> index 00000000..59dc8075
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.ru=
les
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
>> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules=20
>> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>> new file mode 100644
>> index 00000000..f2804ecd
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rule=
s
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
>=20
> On the surface, I like this patch better because it only contains=20
> plaintext files and not binary ones... =3D)
>=20
>=20
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend=
=20
>> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> index f38606f2..248ad5e4 100644
>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> @@ -14,6 +14,11 @@ SRC_URI:append =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://timesyncd.conf \
>> =C2=A0 "
>> +SRC_URI:append:k3 =3D " \
>> +=C2=A0=C2=A0=C2=A0 file://37-can-j7.rules \
>> +=C2=A0=C2=A0=C2=A0 file://37-can-am62.rules \
>> +"
>=20
> Is this patch for all k3 devices?=C2=A0 Or the big list of platforms be=
low?=20
> It *seems* like you are breaking them up differently for Sitara vs=20
> Jacinto devices...
>=20
>=20
> Would a cleaner approach be to define two new variables and use them in=
=20
> all of the places?
>=20


Oops...  I hit send too fast...  Updated code:

CAN_RULES_SRC =3D ""
CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
CAN_RULES_TGT =3D "udev/rules.d/37-can.rules"

SRC_URI:append:k3 =3D "file://${CAN_RULES_SRC}"

do_install:append:k3() {
  =C2=A0 install -d ${D}/${libdir}/udev/rules.d
  =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES} ${D}${libdir}/${CAN_RULE=
S_TGT}
}

FILES:udev +=3D "${libdir}/${CAN_RULES_TGT}"


Make sure you double check my quick hackery and not take it as is....


>=20
>=20
>> =C2=A0 do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/udev/rules=
.d/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/local.rules=20
>> ${D}${sysconfdir}/udev/rules.d/
>> @@ -43,3 +48,56 @@ do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/systemd/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/timesyncd.co=
nf=20
>> ${D}${sysconfdir}/systemd/
>> =C2=A0 }
>> +
>> +do_install:append:j721e() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j7200() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j721s2() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j784s4() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am65xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62pxx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62axx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am64xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j722s() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${libdir}/udev/rules.d
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules=20
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +FILES:udev +=3D "${libdir}/udev/rules.d/37-can.rules"
>> +
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

