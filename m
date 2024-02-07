Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249CAC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 22:47:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.4444.1707346048261940883
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 14:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=V5cbd93s;
 spf=pass (domain: criticallink.com, ip: 209.85.167.48, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-511612e0c57so2087826e87.2
        for <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 14:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1707346046; x=1707950846; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u77NaTlvEBvuRQ9Eboc+E61A0ndi77A6xv7GO6WeAg=;
        b=V5cbd93s1gOV8oNPmjwV/l4ijDUSjRY4TVtO4Kerpg7dnovNs2VJnuR07sUwrJMz0p
         Me6Pk50HhABvhosIPTXp4rqudNZsiQJ65bnfNJCG38XSTWhBWSvlIVWvJvuGOmZ33PTq
         cFq2jAGgy28pRNV/pnNbH6iH6EmaFN3l6iD/5sHMjLWU4iwtqO6RwPw3kuZL6kvtbY4L
         Kk/USBMPTQpKAze1jD5QE3WXYSQbDAxCCUc496n4/pPnvPrrCmC7RcnKrdVKmnXCen52
         Nepxg8rwdOp4XvnHjFvCOq77MXsM/7URcYw6t7Qz188pWttIFKg9fjR2QZXeNZETbwVm
         7JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707346046; x=1707950846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u77NaTlvEBvuRQ9Eboc+E61A0ndi77A6xv7GO6WeAg=;
        b=VHHGQ5aLzqXuiecpidy4W0Q4BUTiexjIaZLtc5rZiFjnxxOrxwgN+Jv+kLKiSzhouP
         2RBCBLs948oOGlmm7G+IkkHZQv6BPl5nygQsBRpS8y1mLQmEyP/0Fs8FcBXjXklRjC6z
         JEL41EvvqNtYHNsxFeq/AcJdi4qVcQ+XSugh86ycIVuTtltr1JFqpVdjStxJRAEH2dq2
         li37xb43P+jJOlJiMgoBohANbk4LLsSQabu28NWp/2vHHMdHQ5SPL2G7P4VuBgpwBanF
         VGvSSFGc/R0uLaFxM3kx9ON9ogw55slJRvuhxqV9HPbeFig2paDWFIoGq42kWa40xKIc
         f97A==
X-Gm-Message-State: AOJu0Yz6qug14VgyQta/9zQABmiJWrclI6hpmOQlrAm601IVen1pvxAd
	Iu1YE534nObO572Jhj3n4SDFOVsT54uJrNuk9ew9tNGtMbemLRTR2TqifSJgDuLUNUOKkl4n7WR
	gJyNs/aha9IrTPj3lgiZ4vjT3FumT4O3kl81/
X-Google-Smtp-Source: AGHT+IEDh/E/Gnph4RL8rzLGaECCWc+krRkp6My9vM0yrs9y4Z8docCdECtVeI0mTtuF5S1w5OMGjS6vkdaMXTueuVg=
X-Received: by 2002:a05:6512:2246:b0:511:60ca:d4e3 with SMTP id
 i6-20020a056512224600b0051160cad4e3mr4396217lfu.4.1707346046211; Wed, 07 Feb
 2024 14:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20240207192950.1761572-1-a-limaye@ti.com> <17B1AF4EB3B08B09.829@lists.yoctoproject.org>
 <719610e1-6c99-4a48-952c-a9d57e586064@ti.com>
In-Reply-To: <719610e1-6c99-4a48-952c-a9d57e586064@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 7 Feb 2024 17:47:15 -0500
Message-ID: <CADL8D3ZW_+92pCb7roLYJau1Jq2tWVWqUeD7eO1EVKKuD6TwSw@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules
 for persistent naming of the can devices
To: reatmon@ti.com
Cc: Aniket Limaye <a-limaye@ti.com>, meta-arago@lists.yoctoproject.org, 
	Bhavya Kapoor <b-kapoor@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 22:47:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15130

I'd appreciate it if you would also add the dra7(am57x) and 335x platforms.

+++ 37-can-dra7.rules
SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can", NAME=
=3D"main_dcan1"
SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can", NAME=
=3D"main_dcan2"

+++ 37-can-ti33x.rules
SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can", NAME=
=3D"main_dcan0"
SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can", NAME=
=3D"main_dcan1"

+++ meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
CAN_RULES_SRC:dra7 =3D "37-can-dra7.rules"
CAN_RULES_SRC:ti33x =3D "37-can-ti33x.rules"


On Wed, Feb 7, 2024 at 3:46=E2=80=AFPM Ryan Eatmon via lists.yoctoproject.o=
rg
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
>
>
> On 2/7/2024 2:41 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> > On 2/7/2024 1:29 PM, Aniket Limaye wrote:
> >> When multiple CAN's are present, then names that are getting assigned
> >> change after every boot even after providing alias in the device
> >> tree.
> >> So add udev rules to specify the interface name to use for
> >> each mcan device, to make it persistent across reboots.
> >>
> >> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> >> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >> ---
> >> v3: Fix typos in the filename being installed in v2
> >> v2:
> >>      - Switch to udev rules instead of systemd network links, as per
> >>        feedback from v1:
> >> https://lists.yoctoproject.org/g/meta-arago/message/15104
> >>      - Also, extend to Sitara devices as well
> >> ---
> >>   .../systemd/systemd/k3/37-can-am62.rules      |  4 ++
> >>   .../systemd/systemd/k3/37-can-j7.rules        | 20 +++++++
> >>   .../recipes-core/systemd/systemd_%.bbappend   | 58 +++++++++++++++++=
++
> >>   3 files changed, 82 insertions(+)
> >>   create mode 100644
> >> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> >>   create mode 100644
> >> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> >>
> >> diff --git
> >> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> >> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> >> new file mode 100644
> >> index 00000000..59dc8075
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.ru=
les
> >> @@ -0,0 +1,4 @@
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can",
> >> NAME=3D"mcu_mcan0"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can",
> >> NAME=3D"mcu_mcan1"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can",
> >> NAME=3D"main_mcan0"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can",
> >> NAME=3D"main_mcan1"
> >> diff --git
> >> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> >> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> >> new file mode 100644
> >> index 00000000..f2804ecd
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rule=
s
> >> @@ -0,0 +1,20 @@
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can",
> >> NAME=3D"mcu_mcan0"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can",
> >> NAME=3D"mcu_mcan1"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can",
> >> NAME=3D"main_mcan0"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can",
> >> NAME=3D"main_mcan1"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can",
> >> NAME=3D"main_mcan2"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can",
> >> NAME=3D"main_mcan3"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can",
> >> NAME=3D"main_mcan4"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can",
> >> NAME=3D"main_mcan5"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can",
> >> NAME=3D"main_mcan6"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can",
> >> NAME=3D"main_mcan7"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can",
> >> NAME=3D"main_mcan8"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can",
> >> NAME=3D"main_mcan9"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can",
> >> NAME=3D"main_mcan10"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can",
> >> NAME=3D"main_mcan11"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can",
> >> NAME=3D"main_mcan12"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can",
> >> NAME=3D"main_mcan13"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can",
> >> NAME=3D"main_mcan14"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can",
> >> NAME=3D"main_mcan15"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can",
> >> NAME=3D"main_mcan16"
> >> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can",
> >> NAME=3D"main_mcan17"
> >
> > On the surface, I like this patch better because it only contains
> > plaintext files and not binary ones... =3D)
> >
> >
> >> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >> index f38606f2..248ad5e4 100644
> >> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >> @@ -14,6 +14,11 @@ SRC_URI:append =3D " \
> >>       file://timesyncd.conf \
> >>   "
> >> +SRC_URI:append:k3 =3D " \
> >> +    file://37-can-j7.rules \
> >> +    file://37-can-am62.rules \
> >> +"
> >
> > Is this patch for all k3 devices?  Or the big list of platforms below?
> > It *seems* like you are breaking them up differently for Sitara vs
> > Jacinto devices...
> >
> >
> > Would a cleaner approach be to define two new variables and use them in
> > all of the places?
> >
>
>
> Oops...  I hit send too fast...  Updated code:
>
> CAN_RULES_SRC =3D ""
> CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
> CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
> CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
> CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
> CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
> CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
> CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
> CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
> CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
> CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
> CAN_RULES_TGT =3D "udev/rules.d/37-can.rules"
>
> SRC_URI:append:k3 =3D "file://${CAN_RULES_SRC}"
>
> do_install:append:k3() {
>     install -d ${D}/${libdir}/udev/rules.d
>     install -m 0644 ${WORKDIR}/${CAN_RULES} ${D}${libdir}/${CAN_RULES_TGT=
}
> }
>
> FILES:udev +=3D "${libdir}/${CAN_RULES_TGT}"
>
>
> Make sure you double check my quick hackery and not take it as is....
>
>
> >
> >
> >>   do_install:append() {
> >>       install -d ${D}${sysconfdir}/udev/rules.d/
> >>       install -m 0644 ${WORKDIR}/local.rules
> >> ${D}${sysconfdir}/udev/rules.d/
> >> @@ -43,3 +48,56 @@ do_install:append() {
> >>       install -d ${D}${sysconfdir}/systemd/
> >>       install -m 0644 ${WORKDIR}/timesyncd.conf
> >> ${D}${sysconfdir}/systemd/
> >>   }
> >> +
> >> +do_install:append:j721e() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:j7200() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:j721s2() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:j784s4() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:am65xx() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:am62xx() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:am62pxx() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:am62axx() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:am64xx() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +do_install:append:j722s() {
> >> +    install -d ${D}/${libdir}/udev/rules.d
> >> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> >> ${D}${libdir}/udev/rules.d/37-can.rules
> >> +}
> >> +
> >> +FILES:udev +=3D "${libdir}/udev/rules.d/37-can.rules"
> >> +
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15128): https://lists.yoctoproject.org/g/meta-arago/m=
essage/15128
> Mute This Topic: https://lists.yoctoproject.org/mt/104225388/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormier@=
criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

