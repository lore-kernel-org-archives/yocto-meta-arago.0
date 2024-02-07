Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1953CC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 22:11:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3395.1707343880364741598
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 14:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=UI8AvYWb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 417MBIIi088116;
	Wed, 7 Feb 2024 16:11:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707343878;
	bh=iSYAo6cZ8kN0vSvx9jb5ylo8padQc/E3qWz8+7n9MEg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UI8AvYWbqTmGQjuXuKyN7tD8ScFrtBYOzUHcJf9hB7PSCr+9OnGJPqU7xdu1V8bjS
	 OL7Rw/SmziK63uKnZcc6F2mNxXDwJGqQxnuUSbDMOzKglqGJkJIRpmhFxX4ofn1+nO
	 kao4ELdVK9zVPSd7hN8Ha5m4GdaSgR/WEmskrR5s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 417MBIRI011832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Feb 2024 16:11:18 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 16:11:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 16:11:18 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 417MBIpk031822;
	Wed, 7 Feb 2024 16:11:18 -0600
Message-ID: <d4d463ee-370c-41be-a64a-a422f9682c7f@ti.com>
Date: Wed, 7 Feb 2024 16:11:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules
 for persistent naming of the can devices
To: <jcormier@criticallink.com>, <a-limaye@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
References: <20240207192950.1761572-1-a-limaye@ti.com>
 <CADL8D3avAMzQLFsEQEmGgA71zuDCex7j8rcj2oTgwxbx7G+q6w@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADL8D3avAMzQLFsEQEmGgA71zuDCex7j8rcj2oTgwxbx7G+q6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 417MBIIi088116
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 22:11:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15129

On 2/7/24 2:37 PM, Jon Cormier via lists.yoctoproject.org wrote:
> On Wed, Feb 7, 2024 at 2:30=E2=80=AFPM Aniket Limaye via lists.yoctopro=
ject.org
> <a-limaye=3Dti.com@lists.yoctoproject.org> wrote:
>=20
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
>>      - Switch to udev rules instead of systemd network links, as per
>>        feedback from v1:
>> https://lists.yoctoproject.org/g/meta-arago/message/15104
>>      - Also, extend to Sitara devices as well
>> ---
>>   .../systemd/systemd/k3/37-can-am62.rules      |  4 ++
>>   .../systemd/systemd/k3/37-can-j7.rules        | 20 +++++++
>>   .../recipes-core/systemd/systemd_%.bbappend   | 58 +++++++++++++++++=
++
>>   3 files changed, 82 insertions(+)
>>   create mode 100644
>> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>>   create mode 100644
>> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>>
>> diff --git
>> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>> new file mode 100644
>> index 00000000..59dc8075
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.ru=
les
>> @@ -0,0 +1,4 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can", =
NAME=3D"mcu_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can", =
NAME=3D"mcu_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can",
>> NAME=3D"main_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can",
>> NAME=3D"main_mcan1"
>> diff --git
>> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>> new file mode 100644
>> index 00000000..f2804ecd
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rule=
s
>> @@ -0,0 +1,20 @@
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can",=
 NAME=3D"mcu_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can",=
 NAME=3D"mcu_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can", =
NAME=3D"main_mcan0"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can", =
NAME=3D"main_mcan1"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can", =
NAME=3D"main_mcan2"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can", =
NAME=3D"main_mcan3"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can", =
NAME=3D"main_mcan4"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can", =
NAME=3D"main_mcan5"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can", =
NAME=3D"main_mcan6"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can", =
NAME=3D"main_mcan7"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can", =
NAME=3D"main_mcan8"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can", =
NAME=3D"main_mcan9"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can",
>> NAME=3D"main_mcan10"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can",
>> NAME=3D"main_mcan11"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can",
>> NAME=3D"main_mcan12"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can",
>> NAME=3D"main_mcan13"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can",
>> NAME=3D"main_mcan14"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can",
>> NAME=3D"main_mcan15"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can",
>> NAME=3D"main_mcan16"
>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can",
>> NAME=3D"main_mcan17"
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> index f38606f2..248ad5e4 100644
>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>> @@ -14,6 +14,11 @@ SRC_URI:append =3D " \
>>       file://timesyncd.conf \
>>   "
>>
>> +SRC_URI:append:k3 =3D " \
>> +    file://37-can-j7.rules \
>> +    file://37-can-am62.rules \
>> +"
>>
> Butting in here but is there any reason not to just combine the two can
> rules files and install the same file (37-can-k3.rules) to all k3 devic=
es?
> It would make the bbappend file much shorter...
>=20

+1, that would also help in keeping this package from becoming
machine specific, this could be deployed unconditionally, shouldn't
hurt anything.

Andrew

>> +
>>   do_install:append() {
>>       install -d ${D}${sysconfdir}/udev/rules.d/
>>       install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/ru=
les.d/
>> @@ -43,3 +48,56 @@ do_install:append() {
>>       install -d ${D}${sysconfdir}/systemd/
>>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/syst=
emd/
>>   }
>> +
>> +do_install:append:j721e() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j7200() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j721s2() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j784s4() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am65xx() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62xx() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62pxx() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am62axx() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:am64xx() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +do_install:append:j722s() {
>> +    install -d ${D}/${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
>> ${D}${libdir}/udev/rules.d/37-can.rules
>> +}
>> +
>> +FILES:udev +=3D "${libdir}/udev/rules.d/37-can.rules"
>> +
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>>
>>
>=20

