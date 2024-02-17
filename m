Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58764C48BC3
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 13:30:48 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.9686.1708176640138497265
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 17 Feb 2024 05:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=dspGl8dO;
 spf=pass (domain: criticallink.com, ip: 209.85.208.177, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d204e102a9so37112041fa.0
        for <meta-arago@lists.yoctoproject.org>; Sat, 17 Feb 2024 05:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1708176638; x=1708781438; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BiB+L3Lk92lb1XygSXYyWveQZo2RQ+6S5xZC1OQ+dCM=;
        b=dspGl8dOO/PpMwIQUUrIFElX0bhLIYS6x6rxiZnq/T6h2Y0SWoycMJC38MfQaAbDYU
         kqFiOSI17jG04y5WNigYVD75qvqFRNQS4oyYVLuEVtzf7DiACDE59JOx0MQg+8NmNKF/
         fPR62FHQCQQ30n9yKWnUI211fmUdTCrMOnvJ26jJQKfTaiX1VcpRT87V5F32kKkTB/55
         j8TaYwGuHn1EpmGhNc1K4T34s9IbTFnrcQETqaWrs4hapYsZY+LQYSUovQ3A3jvY1/A3
         huqIRb6fpNstuH1xpxV46ftLPP7XdMQLA9VdN2lPx78l02BkCP9oLBp0h4foKtGf9qom
         pnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708176638; x=1708781438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiB+L3Lk92lb1XygSXYyWveQZo2RQ+6S5xZC1OQ+dCM=;
        b=nok28SazyQThFqzEoBSUeHYsx5wRsaZts7etdDJ6CVQFBqr6zDFoQD/zz+ck+nXAoR
         P4KRKGfxZqowp3Gd/AqqhxuoInaWnqX/jxXn4Rfu6q1xPBkd5+x5z38fClo8xeg4e7uz
         WP7WTwRoCJfZgymMyuanxVtJP+lmkxmYJKCIF8PqAdECm45W7im5Zv/K81/HUWEVAgB4
         rvBrna/mXfj8epjEsmnehjf5dSyWJN7XnTncV9v63z9DVRu0/E+lQ/vwU+FhEc7RYC+T
         pex+RBvpxk+HhvPpko2f2b/6Oy3BQ/PVLE8otCZsSMKwn5MM9vrUauTkKpdTPqKTrFhe
         vZew==
X-Forwarded-Encrypted: i=1; AJvYcCU0JNO8MKrU6O+jKgzIp5OgY2qJnNygdgPmSUjaQee4hW1aJOsjbDmmNLac/aLsJVDaHbsEKB629BpzpW8n153YGAPE/h4LiSZ6DSZzkQlE9i8=
X-Gm-Message-State: AOJu0YzhTwBFLYin78jcoB1vcsgOKYzdHZGrA25GiFJg1cNkOoCjxQel
	3JJ+WfV7aSbjvgI8ScU9pnymqEMgu5ezM7rNR2xJE8sYkw+3iDeL+/wx4ywUSMXwRpaKaSyzmn1
	oTVHnoaPrHFLaUPCZcdrDbyIfmSvzyV5RGarP
X-Google-Smtp-Source: AGHT+IFNydTURBv+PoTNfVdPvL6Wwb7i3eEpyEiecco5dNZsqLB/pCa8BKSosMmpSPZ1OigsBwH2J2Izgrq9xuDI+L8=
X-Received: by 2002:a2e:a686:0:b0:2cd:706a:8ec8 with SMTP id
 q6-20020a2ea686000000b002cd706a8ec8mr4880658lje.10.1708176637991; Sat, 17 Feb
 2024 05:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20240208183717.1983040-1-a-limaye@ti.com> <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
 <20240213174003.GL15614@denix.org> <c02302e6-7667-45e3-ac33-8fe195d110dc@ti.com>
In-Reply-To: <c02302e6-7667-45e3-ac33-8fe195d110dc@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Sat, 17 Feb 2024 08:30:27 -0500
Message-ID: <CADL8D3b7qckP9OBQaWNJ2W=PvzpsfbCJwFGdB19xSMZEN8YAMg@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
To: Aniket Limaye <a-limaye@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Davis <afd@ti.com>, meta-arago@lists.yoctoproject.org, 
	Ryan Eatmon <reatmon@ti.com>, Bhavya Kapoor <b-kapoor@ti.com>
Content-Type: multipart/alternative; boundary="000000000000b8b585061193ddd6"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 17 Feb 2024 13:30:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15202

--000000000000b8b585061193ddd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the current issue is that we are bbappend-ing a systemd recipe now
to install the udev rules. Perhaps there is a udev recipe that should be
bbappended instead?

On Fri, Feb 16, 2024, 3:14=E2=80=AFAM Aniket Limaye via lists.yoctoproject.=
org
<a-limaye=3Dti.com@lists.yoctoproject.org> wrote:

> I assume the question being how do we plan to handle images where
> sysvinit is used instead of systemd?
>
> I do not have a lot of experience with sysvinit vs systemd or udev rules
> for that matter. Do you have any suggestions to make these naming
> conventions apply to both?
>
> Regards,
> Aniket
>
>
> On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:
> > BTW, what about sysvinit support?
> >
> >
> > On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via
> lists.yoctoproject.org wrote:
> >> On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org wrote:
> >>> When multiple CAN's are present, then names that are getting assigned
> >>> change after every boot even after providing alias in the device
> >>> tree.
> >>> So add udev rules to specify the interface name to use for
> >>> each mcan device, to make it persistent across reboots.
> >>>
> >>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> >>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >>> ---
> >>> v4:
> >>>      - Reformat patch to avoid repeated code for k3 devices
> >>>      - Add udev rules for dra7xx and ti33x too, as suggested
> >>>      - Still keeping separate files per platform to avoid potential
> >>>        confusion created by merging all the rules into one file
> >> You can keep the rules in separate files, but you need to install
> >> them all unconditionally for all machines. Otherwise this package
> >> becomes machine specific, which we should avoid.
> >>
> >> Andrew
> >>
> >>> v3: Fix typos in the filename being installed in v2
> >>> v2:
> >>>      - Switch to udev rules instead of systemd network links, as per
> >>>        feedback from v1:
> https://lists.yoctoproject.org/g/meta-arago/message/15104
> >>>      - Also, extend to Sitara devices as well
> >>> ---
> >>>   .../systemd/systemd/37-can-am62.rules         |  4 ++
> >>>   .../systemd/systemd/37-can-dra7.rules         |  2 +
> >>>   .../systemd/systemd/37-can-j7.rules           | 20 ++++++++++
> >>>   .../systemd/systemd/37-can-ti33x.rules        |  2 +
> >>>   .../recipes-core/systemd/systemd_%.bbappend   | 37
> +++++++++++++++++++
> >>>   5 files changed, 65 insertions(+)
> >>>   create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> >>>   create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> >>>   create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> >>>   create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> >>>
> >>> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> >>> new file mode 100644
> >>> index 00000000..59dc8075
> >>> --- /dev/null
> >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rule=
s
> >>> @@ -0,0 +1,4 @@
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can",
> NAME=3D"mcu_mcan0"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can",
> NAME=3D"mcu_mcan1"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can"=
,
> NAME=3D"main_mcan0"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can"=
,
> NAME=3D"main_mcan1"
> >>> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> >>> new file mode 100644
> >>> index 00000000..3b14150d
> >>> --- /dev/null
> >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rule=
s
> >>> @@ -0,0 +1,2 @@
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can"=
,
> NAME=3D"main_dcan1"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can"=
,
> NAME=3D"main_dcan2"
> >>> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> >>> new file mode 100644
> >>> index 00000000..f2804ecd
> >>> --- /dev/null
> >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> >>> @@ -0,0 +1,20 @@
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can"=
,
> NAME=3D"mcu_mcan0"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can"=
,
> NAME=3D"mcu_mcan1"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can",
> NAME=3D"main_mcan0"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can",
> NAME=3D"main_mcan1"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can",
> NAME=3D"main_mcan2"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can",
> NAME=3D"main_mcan3"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can",
> NAME=3D"main_mcan4"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can",
> NAME=3D"main_mcan5"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can",
> NAME=3D"main_mcan6"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can",
> NAME=3D"main_mcan7"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can",
> NAME=3D"main_mcan8"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can",
> NAME=3D"main_mcan9"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can",
> NAME=3D"main_mcan10"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can",
> NAME=3D"main_mcan11"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can",
> NAME=3D"main_mcan12"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can",
> NAME=3D"main_mcan13"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can",
> NAME=3D"main_mcan14"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can",
> NAME=3D"main_mcan15"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can",
> NAME=3D"main_mcan16"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can",
> NAME=3D"main_mcan17"
> >>> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> >>> new file mode 100644
> >>> index 00000000..62d650fe
> >>> --- /dev/null
> >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rul=
es
> >>> @@ -0,0 +1,2 @@
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can"=
,
> NAME=3D"main_dcan0"
> >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can"=
,
> NAME=3D"main_dcan1"
> >>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappen=
d
> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >>> index f38606f2..f9919708 100644
> >>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> >>> @@ -2,6 +2,21 @@ PR:append =3D ".arago7"
> >>>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> >>> +CAN_RULES_SRC =3D ""
> >>> +CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
> >>> +CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
> >>> +CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
> >>> +CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
> >>> +CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
> >>> +CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
> >>> +CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
> >>> +CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
> >>> +CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
> >>> +CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
> >>> +CAN_RULES_SRC:dra7xx =3D "37-can-dra7.rules"
> >>> +CAN_RULES_SRC:ti33x =3D "37-can-ti33x.rules"
> >>> +CAN_RULES_TGT =3D "${libdir}/udev/rules.d/37-can.rules"
> >>> +
> >>>   SRC_URI:append =3D " \
> >>>       file://local.rules \
> >>>       file://usb1-rules.sh \
> >>> @@ -14,6 +29,10 @@ SRC_URI:append =3D " \
> >>>       file://timesyncd.conf \
> >>>   "
> >>> +SRC_URI:append:k3 =3D " file://${CAN_RULES_SRC}"
> >>> +SRC_URI:append:dra7xx =3D " file://${CAN_RULES_SRC}"
> >>> +SRC_URI:append:ti33x =3D " file://${CAN_RULES_SRC}"
> >>> +
> >>>   do_install:append() {
> >>>       install -d ${D}${sysconfdir}/udev/rules.d/
> >>>       install -m 0644 ${WORKDIR}/local.rules
> ${D}${sysconfdir}/udev/rules.d/
> >>> @@ -43,3 +62,21 @@ do_install:append() {
> >>>       install -d ${D}${sysconfdir}/systemd/
> >>>       install -m 0644 ${WORKDIR}/timesyncd.conf
> ${D}${sysconfdir}/systemd/
> >>>   }
> >>> +
> >>> +do_install:append:k3() {
> >>> +    install -d ${D}${libdir}/udev/rules.d
> >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> >>> +}
> >>> +
> >>> +do_install:append:dra7xx() {
> >>> +    install -d ${D}${libdir}/udev/rules.d
> >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> >>> +}
> >>> +
> >>> +do_install:append:ti33x() {
> >>> +    install -d ${D}${libdir}/udev/rules.d
> >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TGT}
> >>> +}
> >>> +
> >>> +FILES:udev +=3D "${CAN_RULES_TGT}"
> >>> +
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15201):
> https://lists.yoctoproject.org/g/meta-arago/message/15201
> Mute This Topic: https://lists.yoctoproject.org/mt/104244496/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--000000000000b8b585061193ddd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think the current issue is that we are bbappend-ing a s=
ystemd recipe now to install the udev rules. Perhaps there is a udev recipe=
 that should be bbappended instead?</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 16, 2024, 3:14=E2=80=AFAM An=
iket Limaye via <a href=3D"http://lists.yoctoproject.org">lists.yoctoprojec=
t.org</a> &lt;a-limaye=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org">t=
i.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">I assume the question being how do we plan to handle images where =
<br>
sysvinit is used instead of systemd?<br>
<br>
I do not have a lot of experience with sysvinit vs systemd or udev rules <b=
r>
for that matter. Do you have any suggestions to make these naming <br>
conventions apply to both?<br>
<br>
Regards,<br>
Aniket<br>
<br>
<br>
On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:<br>
&gt; BTW, what about sysvinit support?<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt;&gt; On 2/8/24 12:37 PM, Aniket Limaye via <a href=3D"http://lists.yoct=
oproject.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.yoctopr=
oject.org</a> wrote:<br>
&gt;&gt;&gt; When multiple CAN&#39;s are present, then names that are getti=
ng assigned<br>
&gt;&gt;&gt; change after every boot even after providing alias in the devi=
ce<br>
&gt;&gt;&gt; tree.<br>
&gt;&gt;&gt; So add udev rules to specify the interface name to use for<br>
&gt;&gt;&gt; each mcan device, to make it persistent across reboots.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bhavya Kapoor &lt;<a href=3D"mailto:b-kapoor@ti=
.com" target=3D"_blank" rel=3D"noreferrer">b-kapoor@ti.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Aniket Limaye &lt;<a href=3D"mailto:a-limaye@ti=
.com" target=3D"_blank" rel=3D"noreferrer">a-limaye@ti.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v4:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Reformat patch to avoid repeated code fo=
r k3 devices<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Add udev rules for dra7xx and ti33x too,=
 as suggested<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Still keeping separate files per platfor=
m to avoid potential<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 confusion created by merging all th=
e rules into one file<br>
&gt;&gt; You can keep the rules in separate files, but you need to install<=
br>
&gt;&gt; them all unconditionally for all machines. Otherwise this package<=
br>
&gt;&gt; becomes machine specific, which we should avoid.<br>
&gt;&gt;<br>
&gt;&gt; Andrew<br>
&gt;&gt;<br>
&gt;&gt;&gt; v3: Fix typos in the filename being installed in v2<br>
&gt;&gt;&gt; v2:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Switch to udev rules instead of systemd =
network links, as per<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 feedback from v1: <a href=3D"https:=
//lists.yoctoproject.org/g/meta-arago/message/15104" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-arago/messa=
ge/15104</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Also, extend to Sitara devices as well<b=
r>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-am62.rules=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-dra7.rules=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-j7.rules=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-ti33x.rules=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0.../recipes-core/systemd/systemd_%.bbappend=C2=A0 =
=C2=A0| 37 +++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A05 files changed, 65 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-arago-distro/recipes-core/=
systemd/systemd/37-can-am62.rules<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-arago-distro/recipes-core/=
systemd/systemd/37-can-dra7.rules<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-arago-distro/recipes-core/=
systemd/systemd/37-can-j7.rules<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-arago-distro/recipes-core/=
systemd/systemd/37-can-ti33x.rules<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37=
-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am6=
2.rules<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 00000000..59dc8075<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am=
62.rules<br>
&gt;&gt;&gt; @@ -0,0 +1,4 @@<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;4e08000.can&quot;, NAME=3D&quot;mcu_mcan0&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;4e18000.can&quot;, NAME=3D&quot;mcu_mcan1&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;20701000.can&quot;, NAME=3D&quot;main_mcan0&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;20711000.can&quot;, NAME=3D&quot;main_mcan1&quot;<br>
&gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37=
-can-dra7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra=
7.rules<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 00000000..3b14150d<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dr=
a7.rules<br>
&gt;&gt;&gt; @@ -0,0 +1,2 @@<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;4ae3c000.can&quot;, NAME=3D&quot;main_dcan1&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;48480000.can&quot;, NAME=3D&quot;main_dcan2&quot;<br>
&gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37=
-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.ru=
les<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 00000000..f2804ecd<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7=
.rules<br>
&gt;&gt;&gt; @@ -0,0 +1,20 @@<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;40528000.can&quot;, NAME=3D&quot;mcu_mcan0&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;40568000.can&quot;, NAME=3D&quot;mcu_mcan1&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2701000.can&quot;, NAME=3D&quot;main_mcan0&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2711000.can&quot;, NAME=3D&quot;main_mcan1&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2721000.can&quot;, NAME=3D&quot;main_mcan2&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2731000.can&quot;, NAME=3D&quot;main_mcan3&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2741000.can&quot;, NAME=3D&quot;main_mcan4&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2751000.can&quot;, NAME=3D&quot;main_mcan5&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2761000.can&quot;, NAME=3D&quot;main_mcan6&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2771000.can&quot;, NAME=3D&quot;main_mcan7&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2781000.can&quot;, NAME=3D&quot;main_mcan8&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2791000.can&quot;, NAME=3D&quot;main_mcan9&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;27a1000.can&quot;, NAME=3D&quot;main_mcan10&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;27b1000.can&quot;, NAME=3D&quot;main_mcan11&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;27c1000.can&quot;, NAME=3D&quot;main_mcan12&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;27d1000.can&quot;, NAME=3D&quot;main_mcan13&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2681000.can&quot;, NAME=3D&quot;main_mcan14&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;2691000.can&quot;, NAME=3D&quot;main_mcan15&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;26a1000.can&quot;, NAME=3D&quot;main_mcan16&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;26b1000.can&quot;, NAME=3D&quot;main_mcan17&quot;<br>
&gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37=
-can-ti33x.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti=
33x.rules<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 00000000..62d650fe<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti=
33x.rules<br>
&gt;&gt;&gt; @@ -0,0 +1,2 @@<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;481cc000.can&quot;, NAME=3D&quot;main_dcan0&quot;<br>
&gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, =
KERNELS=3D=3D&quot;481d0000.can&quot;, NAME=3D&quot;main_dcan1&quot;<br>
&gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.=
bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend<br>
&gt;&gt;&gt; index f38606f2..f9919708 100644<br>
&gt;&gt;&gt; --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappen=
d<br>
&gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappen=
d<br>
&gt;&gt;&gt; @@ -2,6 +2,21 @@ PR:append =3D &quot;.arago7&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN=
}:&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC =3D &quot;&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:j721e =3D &quot;37-can-j7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:j7200 =3D &quot;37-can-j7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:j721s2 =3D &quot;37-can-j7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:j784s4 =3D &quot;37-can-j7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:am65xx =3D &quot;37-can-j7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:am62xx =3D &quot;37-can-am62.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:am62pxx =3D &quot;37-can-am62.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:am62axx =3D &quot;37-can-am62.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:am64xx =3D &quot;37-can-am62.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:j722s =3D &quot;37-can-am62.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:dra7xx =3D &quot;37-can-dra7.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_SRC:ti33x =3D &quot;37-can-ti33x.rules&quot;<br>
&gt;&gt;&gt; +CAN_RULES_TGT =3D &quot;${libdir}/udev/rules.d/37-can.rules&q=
uot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0SRC_URI:append =3D &quot; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://local.rules \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://usb1-rules.sh \<br>
&gt;&gt;&gt; @@ -14,6 +29,10 @@ SRC_URI:append =3D &quot; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://timesyncd.conf \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt; +SRC_URI:append:k3 =3D &quot; file://${CAN_RULES_SRC}&quot;<br=
>
&gt;&gt;&gt; +SRC_URI:append:dra7xx =3D &quot; file://${CAN_RULES_SRC}&quot=
;<br>
&gt;&gt;&gt; +SRC_URI:append:ti33x =3D &quot; file://${CAN_RULES_SRC}&quot;=
<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0do_install:append() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/udev/ru=
les.d/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/local.rul=
es ${D}${sysconfdir}/udev/rules.d/<br>
&gt;&gt;&gt; @@ -43,3 +62,21 @@ do_install:append() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/systemd=
/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/timesyncd=
.conf ${D}${sysconfdir}/systemd/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_install:append:k3() {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D=
}${CAN_RULES_TGT}<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_install:append:dra7xx() {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D=
}${CAN_RULES_TGT}<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_install:append:ti33x() {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D=
}${CAN_RULES_TGT}<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +FILES:udev +=3D &quot;${CAN_RULES_TGT}&quot;<br>
&gt;&gt;&gt; +<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15201): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15201" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.yoctoproject.org/g/meta-arago/message/15201</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104244496/790=
2621" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/104244496/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank" rel=3D"noreferrer">meta-arago+owner@lists.yoctoproject.org=
</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/g/meta-arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" ta=
rget=3D"_blank" rel=3D"noreferrer">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div>

--000000000000b8b585061193ddd6--

