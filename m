Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996ABC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:53:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.24354.1708462407671742616
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 12:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=vRGPnKpb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KKrMoY117098;
	Tue, 20 Feb 2024 14:53:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708462402;
	bh=Y1lMuJME1k7PNtjnfP0Qm+8SdcgDLHVI3hVx4q3mJ5g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vRGPnKpb46u94i3+5sUclGxlPJE1aT7ZV25J5/w7hrqIcB+TgivUDmA08HByIdbc0
	 ybUDHUvbwMvmgYNyHb/SAZHWuwwAONwTW7P65yjMw852FehYa9oAepVrkpmhvjp0JW
	 wJ4d6mViYk0R9AwqjSSaOY1My410jfh2PAp6DsWY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KKrMhD063642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Feb 2024 14:53:22 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 14:53:21 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 14:53:21 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KKrLxS054524;
	Tue, 20 Feb 2024 14:53:21 -0600
Message-ID: <c045325d-7a2c-4fee-83b9-0707301bc483@ti.com>
Date: Tue, 20 Feb 2024 14:53:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
Content-Language: en-US
To: Jon Cormier <jcormier@criticallink.com>
CC: Aniket Limaye <a-limaye@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
References: <20240208183717.1983040-1-a-limaye@ti.com>
 <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
 <20240213174003.GL15614@denix.org>
 <c02302e6-7667-45e3-ac33-8fe195d110dc@ti.com>
 <17B4A99ACD42F65A.28679@lists.yoctoproject.org>
 <CADL8D3ajFe9DoNL0zriBVkOCAVLLh6GDmDevBNf2wPpCydMDOw@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CADL8D3ajFe9DoNL0zriBVkOCAVLLh6GDmDevBNf2wPpCydMDOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41KKrMoY117098
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Feb 2024 20:53:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15205



On 2/20/2024 2:19 PM, Jon Cormier wrote:
> This is probably a better recipe to bbappend,=20
> sources/oe-core/meta/recipes-core/udev/udev-extraconf_1.1.bb=20
> <http://udev-extraconf_1.1.bb>

That's not a bad idea.

Aniket, can you take a look and see if moving these changes over to that=20
recipe allows us to support both systemd and sysvinint?  Bear in mind,=20
we have already accepted this patch series, so any changes would need to=20
be a new patch.



> On Sat, Feb 17, 2024 at 8:30=E2=80=AFAM Jon Cormier via lists.yoctoproj=
ect.org=20
> <http://lists.yoctoproject.org>=20
> <jcormier=3Dcriticallink.com@lists.yoctoproject.org=20
> <mailto:criticallink.com@lists.yoctoproject.org>> wrote:
>=20
>     I think the current issue is that we are bbappend-ing a systemd
>     recipe now
>     to install the udev rules. Perhaps there is a udev recipe that shou=
ld be
>     bbappended instead?
>=20
>     On Fri, Feb 16, 2024, 3:14=E2=80=AFAM Aniket Limaye via
>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>     <a-limaye=3Dti.com@lists.yoctoproject.org
>     <mailto:ti.com@lists.yoctoproject.org>> wrote:
>=20
>      > I assume the question being how do we plan to handle images wher=
e
>      > sysvinit is used instead of systemd?
>      >
>      > I do not have a lot of experience with sysvinit vs systemd or
>     udev rules
>      > for that matter. Do you have any suggestions to make these namin=
g
>      > conventions apply to both?
>      >
>      > Regards,
>      > Aniket
>      >
>      >
>      > On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:
>      > > BTW, what about sysvinit support?
>      > >
>      > >
>      > > On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via
>      > lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>      > >> On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org
>     <http://lists.yoctoproject.org> wrote:
>      > >>> When multiple CAN's are present, then names that are getting
>     assigned
>      > >>> change after every boot even after providing alias in the de=
vice
>      > >>> tree.
>      > >>> So add udev rules to specify the interface name to use for
>      > >>> each mcan device, to make it persistent across reboots.
>      > >>>
>      > >>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com
>     <mailto:b-kapoor@ti.com>>
>      > >>> Signed-off-by: Aniket Limaye <a-limaye@ti.com
>     <mailto:a-limaye@ti.com>>
>      > >>> ---
>      > >>> v4:
>      > >>>=C2=A0 =C2=A0 =C2=A0 - Reformat patch to avoid repeated code =
for k3 devices
>      > >>>=C2=A0 =C2=A0 =C2=A0 - Add udev rules for dra7xx and ti33x to=
o, as suggested
>      > >>>=C2=A0 =C2=A0 =C2=A0 - Still keeping separate files per platf=
orm to avoid
>     potential
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 confusion created by merging all =
the rules into one file
>      > >> You can keep the rules in separate files, but you need to ins=
tall
>      > >> them all unconditionally for all machines. Otherwise this pac=
kage
>      > >> becomes machine specific, which we should avoid.
>      > >>
>      > >> Andrew
>      > >>
>      > >>> v3: Fix typos in the filename being installed in v2
>      > >>> v2:
>      > >>>=C2=A0 =C2=A0 =C2=A0 - Switch to udev rules instead of system=
d network links,
>     as per
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 feedback from v1:
>      > https://lists.yoctoproject.org/g/meta-arago/message/15104
>     <https://lists.yoctoproject.org/g/meta-arago/message/15104>
>      > >>>=C2=A0 =C2=A0 =C2=A0 - Also, extend to Sitara devices as well
>      > >>> ---
>      > >>>=C2=A0 =C2=A0.../systemd/systemd/37-can-am62.rules=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++
>      > >>>=C2=A0 =C2=A0.../systemd/systemd/37-can-dra7.rules=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +
>      > >>>=C2=A0 =C2=A0.../systemd/systemd/37-can-j7.rules=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++
>      > >>>=C2=A0 =C2=A0.../systemd/systemd/37-can-ti33x.rules=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>      > >>>=C2=A0 =C2=A0.../recipes-core/systemd/systemd_%.bbappend=C2=A0=
 =C2=A0| 37
>      > +++++++++++++++++++
>      > >>>=C2=A0 =C2=A05 files changed, 65 insertions(+)
>      > >>>=C2=A0 =C2=A0create mode 100644
>      > meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>      > >>>=C2=A0 =C2=A0create mode 100644
>      > meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>      > >>>=C2=A0 =C2=A0create mode 100644
>      > meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>      > >>>=C2=A0 =C2=A0create mode 100644
>      > meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rule=
s
>      > >>>
>      > >>> diff --git
>      > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rul=
es
>      > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rul=
es
>      > >>> new file mode 100644
>      > >>> index 00000000..59dc8075
>      > >>> --- /dev/null
>      > >>> +++
>     b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
>      > >>> @@ -0,0 +1,4 @@
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08=
000.can",
>      > NAME=3D"mcu_mcan0"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18=
000.can",
>      > NAME=3D"mcu_mcan1"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2070=
1000.can",
>      > NAME=3D"main_mcan0"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2071=
1000.can",
>      > NAME=3D"main_mcan1"
>      > >>> diff --git
>      > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rul=
es
>      > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rul=
es
>      > >>> new file mode 100644
>      > >>> index 00000000..3b14150d
>      > >>> --- /dev/null
>      > >>> +++
>     b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
>      > >>> @@ -0,0 +1,2 @@
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3=
c000.can",
>      > NAME=3D"main_dcan1"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4848=
0000.can",
>      > NAME=3D"main_dcan2"
>      > >>> diff --git
>      > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>      > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>      > >>> new file mode 100644
>      > >>> index 00000000..f2804ecd
>      > >>> --- /dev/null
>      > >>> +++
>     b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
>      > >>> @@ -0,0 +1,20 @@
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4052=
8000.can",
>      > NAME=3D"mcu_mcan0"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4056=
8000.can",
>      > NAME=3D"mcu_mcan1"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701=
000.can",
>      > NAME=3D"main_mcan0"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711=
000.can",
>      > NAME=3D"main_mcan1"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721=
000.can",
>      > NAME=3D"main_mcan2"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731=
000.can",
>      > NAME=3D"main_mcan3"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741=
000.can",
>      > NAME=3D"main_mcan4"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751=
000.can",
>      > NAME=3D"main_mcan5"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761=
000.can",
>      > NAME=3D"main_mcan6"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771=
000.can",
>      > NAME=3D"main_mcan7"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781=
000.can",
>      > NAME=3D"main_mcan8"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791=
000.can",
>      > NAME=3D"main_mcan9"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1=
000.can",
>      > NAME=3D"main_mcan10"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1=
000.can",
>      > NAME=3D"main_mcan11"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1=
000.can",
>      > NAME=3D"main_mcan12"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1=
000.can",
>      > NAME=3D"main_mcan13"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681=
000.can",
>      > NAME=3D"main_mcan14"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691=
000.can",
>      > NAME=3D"main_mcan15"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1=
000.can",
>      > NAME=3D"main_mcan16"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1=
000.can",
>      > NAME=3D"main_mcan17"
>      > >>> diff --git
>      > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.ru=
les
>      > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.ru=
les
>      > >>> new file mode 100644
>      > >>> index 00000000..62d650fe
>      > >>> --- /dev/null
>      > >>> +++
>     b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
>      > >>> @@ -0,0 +1,2 @@
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481c=
c000.can",
>      > NAME=3D"main_dcan0"
>      > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d=
0000.can",
>      > NAME=3D"main_dcan1"
>      > >>> diff --git
>     a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>      > b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>      > >>> index f38606f2..f9919708 100644
>      > >>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbapp=
end
>      > >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbapp=
end
>      > >>> @@ -2,6 +2,21 @@ PR:append =3D ".arago7"
>      > >>>=C2=A0 =C2=A0FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>      > >>> +CAN_RULES_SRC =3D ""
>      > >>> +CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
>      > >>> +CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
>      > >>> +CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
>      > >>> +CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
>      > >>> +CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
>      > >>> +CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
>      > >>> +CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
>      > >>> +CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
>      > >>> +CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
>      > >>> +CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
>      > >>> +CAN_RULES_SRC:dra7xx =3D "37-can-dra7.rules"
>      > >>> +CAN_RULES_SRC:ti33x =3D "37-can-ti33x.rules"
>      > >>> +CAN_RULES_TGT =3D "${libdir}/udev/rules.d/37-can.rules"
>      > >>> +
>      > >>>=C2=A0 =C2=A0SRC_URI:append =3D " \
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0file://local.rules \
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0file://usb1-rules.sh \
>      > >>> @@ -14,6 +29,10 @@ SRC_URI:append =3D " \
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0file://timesyncd.conf \
>      > >>>=C2=A0 =C2=A0"
>      > >>> +SRC_URI:append:k3 =3D " file://${CAN_RULES_SRC}"
>      > >>> +SRC_URI:append:dra7xx =3D " file://${CAN_RULES_SRC}"
>      > >>> +SRC_URI:append:ti33x =3D " file://${CAN_RULES_SRC}"
>      > >>> +
>      > >>>=C2=A0 =C2=A0do_install:append() {
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/udev/=
rules.d/
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/local.r=
ules
>      > ${D}${sysconfdir}/udev/rules.d/
>      > >>> @@ -43,3 +62,21 @@ do_install:append() {
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/syste=
md/
>      > >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/timesyn=
cd.conf
>      > ${D}${sysconfdir}/systemd/
>      > >>>=C2=A0 =C2=A0}
>      > >>> +
>      > >>> +do_install:append:k3() {
>      > >>> +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d
>      > >>> +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC}
>     ${D}${CAN_RULES_TGT}
>      > >>> +}
>      > >>> +
>      > >>> +do_install:append:dra7xx() {
>      > >>> +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d
>      > >>> +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC}
>     ${D}${CAN_RULES_TGT}
>      > >>> +}
>      > >>> +
>      > >>> +do_install:append:ti33x() {
>      > >>> +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d
>      > >>> +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC}
>     ${D}${CAN_RULES_TGT}
>      > >>> +}
>      > >>> +
>      > >>> +FILES:udev +=3D "${CAN_RULES_TGT}"
>      > >>> +
>      >
>      >
>      >
>      >
>      >
>      >
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#15202):
>     https://lists.yoctoproject.org/g/meta-arago/message/15202
>     <https://lists.yoctoproject.org/g/meta-arago/message/15202>
>     Mute This Topic: https://lists.yoctoproject.org/mt/104244496/790262=
1
>     <https://lists.yoctoproject.org/mt/104244496/7902621>
>     Group Owner: meta-arago+owner@lists.yoctoproject.org
>     <mailto:meta-arago%2Bowner@lists.yoctoproject.org>
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
>     <https://lists.yoctoproject.org/g/meta-arago/unsub>
>     [jcormier@criticallink.com <mailto:jcormier@criticallink.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
>=20
> --=20
> Jonathan Cormier
> Software Engineer
>=20
> Voice: 315.425.4045=C2=A0x222
>=20
>=20
>=20
> http://www.CriticalLink.com <http://www.criticallink.com/>
> 6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211
>=20
> <https://www.linkedin.com/company/critical-link-llc>=20
> <https://twitter.com/Critical_Link>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

