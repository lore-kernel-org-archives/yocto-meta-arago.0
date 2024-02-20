Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76764C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:19:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.23364.1708460377969125430
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 12:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=fnbcWiUF;
 spf=pass (domain: criticallink.com, ip: 209.85.167.42, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50eac018059so8806206e87.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 20 Feb 2024 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1708460376; x=1709065176; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=skxBistVV6Pdfj7EV5zWXdR0f1AKnuRiKY0KMK7iKXI=;
        b=fnbcWiUFG4JjyvfBw5h8tX3nVSkE3tlnrFpGMcDIjTXp4VVwdSNUXxPbGLlOf5DUy6
         bxZO048A/oThnkAfsHxOcCp1CiFHaTizEBvZvIj8JyibTSAwpSMjEQV8sB4QAR3wn9bE
         5uhGO6gCnsqzRN9dzSPej9OZLMO7AYoXbfpBu0R4Fg3KKr7ZP7v3Mbu3UpLFxcozZXj5
         q/UUB7XWUW1Rb5k0ouqqRFjuPwTdnA97IQc4Qgr/rO8vj3+Y6XgTZSdi9rMrYjk9my6H
         vSb09pV7npbhVm55/KOFwDLVjxXcPIlm2LjxYOx3pPnTeFbLgL7czfKw+3fScRD9HFGg
         VfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708460376; x=1709065176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skxBistVV6Pdfj7EV5zWXdR0f1AKnuRiKY0KMK7iKXI=;
        b=OV2nBWTxd6/CwekpeprlxyKmiUtKaD5tdjfwE7dIaJkpiK5u7T22ugdakVm2aHgj+s
         vxa2tNi6Kl1w0lG+fBiNhwaFZChqYu57w96rkeU4O1A2OVEbOjxXKGXdG/Tm8zTp7RFR
         4t/et9RXlJae0wvvpv1biUQqvJ1+COxUYOEGIdXKDqDRJ48fw/LwUUIxjIVTaHa+Blt9
         Cl2g7t0RvbbFF8RmAJk5T3SVb5Cs+reNadzLZ8GMMSD9Yunmpk00ZOiQxWZa1UyAPxoy
         pyQThrIAxw65C4eiwxvvPnfjwW8ZdIDDmuhZ8y1D57OSVBKqZ1MoooZa/x9a8oon20wA
         zc7g==
X-Forwarded-Encrypted: i=1; AJvYcCWc1YIogs5qzYG65I8IL2Sizdl30xflSVtQU+U8c0nLvUDvG2R+nS5YuTgrYrHy2u23zdcfW7Uqq7qZL2YfV7A3lnrygO/ajtoxnQDrRCNQQRg=
X-Gm-Message-State: AOJu0Yw8knw0BqHqYilG6z2OVnUQUPqNt/r3HJ5B5/IG74aX14FFV2zq
	YU6RagKgvWU97+QX9erQJuRvAkxDLTYf9gJGf38hxb9TuuBh+hV+GTpfILSev5c3Wcm7VIqSEGB
	ngF4W0fgtLYe1iroIFrAbpXepAuAFKXoCjE8x
X-Google-Smtp-Source: AGHT+IE5eh7y8P8nutrIeFVqrCYHtd3Z5+R1KPGvbihGQE3SESz2fDUBdM3XwchS0M49vFrJduGfvfJTHXJP9UN8YEo=
X-Received: by 2002:ac2:4e06:0:b0:512:b369:15cf with SMTP id
 e6-20020ac24e06000000b00512b36915cfmr5383965lfr.17.1708460375858; Tue, 20 Feb
 2024 12:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20240208183717.1983040-1-a-limaye@ti.com> <761e694d-8439-4e5b-9706-01da9580e409@ti.com>
 <20240213174003.GL15614@denix.org> <c02302e6-7667-45e3-ac33-8fe195d110dc@ti.com>
 <17B4A99ACD42F65A.28679@lists.yoctoproject.org>
In-Reply-To: <17B4A99ACD42F65A.28679@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 20 Feb 2024 15:19:24 -0500
Message-ID: <CADL8D3ajFe9DoNL0zriBVkOCAVLLh6GDmDevBNf2wPpCydMDOw@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone/master][PATCH v4] systemd: Add udev rules
 for persistent naming of the can devices
To: jcormier@criticallink.com
Cc: Aniket Limaye <a-limaye@ti.com>, Denys Dmytriyenko <denis@denix.org>, Davis <afd@ti.com>, 
	meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>, 
	Bhavya Kapoor <b-kapoor@ti.com>
Content-Type: multipart/alternative; boundary="000000000000d0f3820611d5ed1c"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Feb 2024 20:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15204

--000000000000d0f3820611d5ed1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is probably a better recipe to bbappend,
sources/oe-core/meta/recipes-core/udev/udev-extraconf_1.1.bb

On Sat, Feb 17, 2024 at 8:30=E2=80=AFAM Jon Cormier via lists.yoctoproject.=
org
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:

> I think the current issue is that we are bbappend-ing a systemd recipe no=
w
> to install the udev rules. Perhaps there is a udev recipe that should be
> bbappended instead?
>
> On Fri, Feb 16, 2024, 3:14=E2=80=AFAM Aniket Limaye via lists.yoctoprojec=
t.org
> <a-limaye=3Dti.com@lists.yoctoproject.org> wrote:
>
> > I assume the question being how do we plan to handle images where
> > sysvinit is used instead of systemd?
> >
> > I do not have a lot of experience with sysvinit vs systemd or udev rule=
s
> > for that matter. Do you have any suggestions to make these naming
> > conventions apply to both?
> >
> > Regards,
> > Aniket
> >
> >
> > On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:
> > > BTW, what about sysvinit support?
> > >
> > >
> > > On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via
> > lists.yoctoproject.org wrote:
> > >> On 2/8/24 12:37 PM, Aniket Limaye via lists.yoctoproject.org wrote:
> > >>> When multiple CAN's are present, then names that are getting assign=
ed
> > >>> change after every boot even after providing alias in the device
> > >>> tree.
> > >>> So add udev rules to specify the interface name to use for
> > >>> each mcan device, to make it persistent across reboots.
> > >>>
> > >>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> > >>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > >>> ---
> > >>> v4:
> > >>>      - Reformat patch to avoid repeated code for k3 devices
> > >>>      - Add udev rules for dra7xx and ti33x too, as suggested
> > >>>      - Still keeping separate files per platform to avoid potential
> > >>>        confusion created by merging all the rules into one file
> > >> You can keep the rules in separate files, but you need to install
> > >> them all unconditionally for all machines. Otherwise this package
> > >> becomes machine specific, which we should avoid.
> > >>
> > >> Andrew
> > >>
> > >>> v3: Fix typos in the filename being installed in v2
> > >>> v2:
> > >>>      - Switch to udev rules instead of systemd network links, as pe=
r
> > >>>        feedback from v1:
> > https://lists.yoctoproject.org/g/meta-arago/message/15104
> > >>>      - Also, extend to Sitara devices as well
> > >>> ---
> > >>>   .../systemd/systemd/37-can-am62.rules         |  4 ++
> > >>>   .../systemd/systemd/37-can-dra7.rules         |  2 +
> > >>>   .../systemd/systemd/37-can-j7.rules           | 20 ++++++++++
> > >>>   .../systemd/systemd/37-can-ti33x.rules        |  2 +
> > >>>   .../recipes-core/systemd/systemd_%.bbappend   | 37
> > +++++++++++++++++++
> > >>>   5 files changed, 65 insertions(+)
> > >>>   create mode 100644
> > meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> > >>>   create mode 100644
> > meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> > >>>   create mode 100644
> > meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> > >>>   create mode 100644
> > meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> > >>>
> > >>> diff --git
> > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> > >>> new file mode 100644
> > >>> index 00000000..59dc8075
> > >>> --- /dev/null
> > >>> +++
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> > >>> @@ -0,0 +1,4 @@
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can=
",
> > NAME=3D"mcu_mcan0"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can=
",
> > NAME=3D"mcu_mcan1"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.ca=
n",
> > NAME=3D"main_mcan0"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.ca=
n",
> > NAME=3D"main_mcan1"
> > >>> diff --git
> > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> > >>> new file mode 100644
> > >>> index 00000000..3b14150d
> > >>> --- /dev/null
> > >>> +++
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> > >>> @@ -0,0 +1,2 @@
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.ca=
n",
> > NAME=3D"main_dcan1"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.ca=
n",
> > NAME=3D"main_dcan2"
> > >>> diff --git
> > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> > >>> new file mode 100644
> > >>> index 00000000..f2804ecd
> > >>> --- /dev/null
> > >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rule=
s
> > >>> @@ -0,0 +1,20 @@
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.ca=
n",
> > NAME=3D"mcu_mcan0"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.ca=
n",
> > NAME=3D"mcu_mcan1"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can=
",
> > NAME=3D"main_mcan0"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can=
",
> > NAME=3D"main_mcan1"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can=
",
> > NAME=3D"main_mcan2"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can=
",
> > NAME=3D"main_mcan3"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can=
",
> > NAME=3D"main_mcan4"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can=
",
> > NAME=3D"main_mcan5"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can=
",
> > NAME=3D"main_mcan6"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can=
",
> > NAME=3D"main_mcan7"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can=
",
> > NAME=3D"main_mcan8"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can=
",
> > NAME=3D"main_mcan9"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can=
",
> > NAME=3D"main_mcan10"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can=
",
> > NAME=3D"main_mcan11"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can=
",
> > NAME=3D"main_mcan12"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can=
",
> > NAME=3D"main_mcan13"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can=
",
> > NAME=3D"main_mcan14"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can=
",
> > NAME=3D"main_mcan15"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can=
",
> > NAME=3D"main_mcan16"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can=
",
> > NAME=3D"main_mcan17"
> > >>> diff --git
> > a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> > b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> > >>> new file mode 100644
> > >>> index 00000000..62d650fe
> > >>> --- /dev/null
> > >>> +++
> b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> > >>> @@ -0,0 +1,2 @@
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.ca=
n",
> > NAME=3D"main_dcan0"
> > >>> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.ca=
n",
> > NAME=3D"main_dcan1"
> > >>> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > >>> index f38606f2..f9919708 100644
> > >>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > >>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > >>> @@ -2,6 +2,21 @@ PR:append =3D ".arago7"
> > >>>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> > >>> +CAN_RULES_SRC =3D ""
> > >>> +CAN_RULES_SRC:j721e =3D "37-can-j7.rules"
> > >>> +CAN_RULES_SRC:j7200 =3D "37-can-j7.rules"
> > >>> +CAN_RULES_SRC:j721s2 =3D "37-can-j7.rules"
> > >>> +CAN_RULES_SRC:j784s4 =3D "37-can-j7.rules"
> > >>> +CAN_RULES_SRC:am65xx =3D "37-can-j7.rules"
> > >>> +CAN_RULES_SRC:am62xx =3D "37-can-am62.rules"
> > >>> +CAN_RULES_SRC:am62pxx =3D "37-can-am62.rules"
> > >>> +CAN_RULES_SRC:am62axx =3D "37-can-am62.rules"
> > >>> +CAN_RULES_SRC:am64xx =3D "37-can-am62.rules"
> > >>> +CAN_RULES_SRC:j722s =3D "37-can-am62.rules"
> > >>> +CAN_RULES_SRC:dra7xx =3D "37-can-dra7.rules"
> > >>> +CAN_RULES_SRC:ti33x =3D "37-can-ti33x.rules"
> > >>> +CAN_RULES_TGT =3D "${libdir}/udev/rules.d/37-can.rules"
> > >>> +
> > >>>   SRC_URI:append =3D " \
> > >>>       file://local.rules \
> > >>>       file://usb1-rules.sh \
> > >>> @@ -14,6 +29,10 @@ SRC_URI:append =3D " \
> > >>>       file://timesyncd.conf \
> > >>>   "
> > >>> +SRC_URI:append:k3 =3D " file://${CAN_RULES_SRC}"
> > >>> +SRC_URI:append:dra7xx =3D " file://${CAN_RULES_SRC}"
> > >>> +SRC_URI:append:ti33x =3D " file://${CAN_RULES_SRC}"
> > >>> +
> > >>>   do_install:append() {
> > >>>       install -d ${D}${sysconfdir}/udev/rules.d/
> > >>>       install -m 0644 ${WORKDIR}/local.rules
> > ${D}${sysconfdir}/udev/rules.d/
> > >>> @@ -43,3 +62,21 @@ do_install:append() {
> > >>>       install -d ${D}${sysconfdir}/systemd/
> > >>>       install -m 0644 ${WORKDIR}/timesyncd.conf
> > ${D}${sysconfdir}/systemd/
> > >>>   }
> > >>> +
> > >>> +do_install:append:k3() {
> > >>> +    install -d ${D}${libdir}/udev/rules.d
> > >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TG=
T}
> > >>> +}
> > >>> +
> > >>> +do_install:append:dra7xx() {
> > >>> +    install -d ${D}${libdir}/udev/rules.d
> > >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TG=
T}
> > >>> +}
> > >>> +
> > >>> +do_install:append:ti33x() {
> > >>> +    install -d ${D}${libdir}/udev/rules.d
> > >>> +    install -m 0644 ${WORKDIR}/${CAN_RULES_SRC} ${D}${CAN_RULES_TG=
T}
> > >>> +}
> > >>> +
> > >>> +FILES:udev +=3D "${CAN_RULES_TGT}"
> > >>> +
> >
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15202):
> https://lists.yoctoproject.org/g/meta-arago/message/15202
> Mute This Topic: https://lists.yoctoproject.org/mt/104244496/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000d0f3820611d5ed1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is probably a better recipe to bbappend, sources/oe-c=
ore/meta/recipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb">udev-ex=
traconf_1.1.bb</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, Feb 17, 2024 at 8:30=E2=80=AFAM Jon Cormier via <=
a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;jco=
rmier=3D<a href=3D"mailto:criticallink.com@lists.yoctoproject.org">critical=
link.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I think the current issue is that we are b=
bappend-ing a systemd recipe now<br>
to install the udev rules. Perhaps there is a udev recipe that should be<br=
>
bbappended instead?<br>
<br>
On Fri, Feb 16, 2024, 3:14=E2=80=AFAM Aniket Limaye via <a href=3D"http://l=
ists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproj=
ect.org</a><br>
&lt;a-limaye=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org" target=3D"_=
blank">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br>
<br>
&gt; I assume the question being how do we plan to handle images where<br>
&gt; sysvinit is used instead of systemd?<br>
&gt;<br>
&gt; I do not have a lot of experience with sysvinit vs systemd or udev rul=
es<br>
&gt; for that matter. Do you have any suggestions to make these naming<br>
&gt; conventions apply to both?<br>
&gt;<br>
&gt; Regards,<br>
&gt; Aniket<br>
&gt;<br>
&gt;<br>
&gt; On 2/13/2024 11:10 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt; BTW, what about sysvinit support?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Feb 08, 2024 at 01:28:47PM -0600, Andrew Davis via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt;&gt; On 2/8/24 12:37 PM, Aniket Limaye via <a href=3D"http://lists=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.=
org</a> wrote:<br>
&gt; &gt;&gt;&gt; When multiple CAN&#39;s are present, then names that are =
getting assigned<br>
&gt; &gt;&gt;&gt; change after every boot even after providing alias in the=
 device<br>
&gt; &gt;&gt;&gt; tree.<br>
&gt; &gt;&gt;&gt; So add udev rules to specify the interface name to use fo=
r<br>
&gt; &gt;&gt;&gt; each mcan device, to make it persistent across reboots.<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Bhavya Kapoor &lt;<a href=3D"mailto:b-kapo=
or@ti.com" target=3D"_blank">b-kapoor@ti.com</a>&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Aniket Limaye &lt;<a href=3D"mailto:a-lima=
ye@ti.com" target=3D"_blank">a-limaye@ti.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt; v4:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Reformat patch to avoid repeated co=
de for k3 devices<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Add udev rules for dra7xx and ti33x=
 too, as suggested<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Still keeping separate files per pl=
atform to avoid potential<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 confusion created by merging a=
ll the rules into one file<br>
&gt; &gt;&gt; You can keep the rules in separate files, but you need to ins=
tall<br>
&gt; &gt;&gt; them all unconditionally for all machines. Otherwise this pac=
kage<br>
&gt; &gt;&gt; becomes machine specific, which we should avoid.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Andrew<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; v3: Fix typos in the filename being installed in v2<br>
&gt; &gt;&gt;&gt; v2:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Switch to udev rules instead of sys=
temd network links, as per<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 feedback from v1:<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/meta-arago/message/15104" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/message/15104</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Also, extend to Sitara devices as w=
ell<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-am62.rules=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-dra7.rules=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-j7.rules=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../systemd/systemd/37-can-ti33x.rules=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../recipes-core/systemd/systemd_%.bbappend=
=C2=A0 =C2=A0| 37<br>
&gt; +++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A05 files changed, 65 insertions(+)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules<br>
&gt; b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules<br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 00000000..59dc8075<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-c=
an-am62.rules<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,4 @@<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;4e08000.can&quot;,<br>
&gt; NAME=3D&quot;mcu_mcan0&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;4e18000.can&quot;,<br>
&gt; NAME=3D&quot;mcu_mcan1&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;20701000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan0&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;20711000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan1&quot;<br>
&gt; &gt;&gt;&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules<br>
&gt; b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules<br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 00000000..3b14150d<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-c=
an-dra7.rules<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,2 @@<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;4ae3c000.can&quot;,<br>
&gt; NAME=3D&quot;main_dcan1&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;48480000.can&quot;,<br>
&gt; NAME=3D&quot;main_dcan2&quot;<br>
&gt; &gt;&gt;&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules<br>
&gt; b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules<br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 00000000..f2804ecd<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-c=
an-j7.rules<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,20 @@<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;40528000.can&quot;,<br>
&gt; NAME=3D&quot;mcu_mcan0&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;40568000.can&quot;,<br>
&gt; NAME=3D&quot;mcu_mcan1&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2701000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan0&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2711000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan1&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2721000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan2&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2731000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan3&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2741000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan4&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2751000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan5&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2761000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan6&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2771000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan7&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2781000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan8&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2791000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan9&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;27a1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan10&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;27b1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan11&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;27c1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan12&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;27d1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan13&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2681000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan14&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;2691000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan15&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;26a1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan16&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;26b1000.can&quot;,<br>
&gt; NAME=3D&quot;main_mcan17&quot;<br>
&gt; &gt;&gt;&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules<br=
>
&gt; b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules<br=
>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 00000000..62d650fe<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd/37-c=
an-ti33x.rules<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,2 @@<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;481cc000.can&quot;,<br>
&gt; NAME=3D&quot;main_dcan0&quot;<br>
&gt; &gt;&gt;&gt; +SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&qu=
ot;, KERNELS=3D=3D&quot;481d0000.can&quot;,<br>
&gt; NAME=3D&quot;main_dcan1&quot;<br>
&gt; &gt;&gt;&gt; diff --git a/meta-arago-distro/recipes-core/systemd/syste=
md_%.bbappend<br>
&gt; b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend<br>
&gt; &gt;&gt;&gt; index f38606f2..f9919708 100644<br>
&gt; &gt;&gt;&gt; --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bb=
append<br>
&gt; &gt;&gt;&gt; +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bb=
append<br>
&gt; &gt;&gt;&gt; @@ -2,6 +2,21 @@ PR:append =3D &quot;.arago7&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}=
/${PN}:&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC =3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:j721e =3D &quot;37-can-j7.rules&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:j7200 =3D &quot;37-can-j7.rules&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:j721s2 =3D &quot;37-can-j7.rules&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:j784s4 =3D &quot;37-can-j7.rules&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:am65xx =3D &quot;37-can-j7.rules&quot;<br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:am62xx =3D &quot;37-can-am62.rules&quot;<b=
r>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:am62pxx =3D &quot;37-can-am62.rules&quot;<=
br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:am62axx =3D &quot;37-can-am62.rules&quot;<=
br>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:am64xx =3D &quot;37-can-am62.rules&quot;<b=
r>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:j722s =3D &quot;37-can-am62.rules&quot;<br=
>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:dra7xx =3D &quot;37-can-dra7.rules&quot;<b=
r>
&gt; &gt;&gt;&gt; +CAN_RULES_SRC:ti33x =3D &quot;37-can-ti33x.rules&quot;<b=
r>
&gt; &gt;&gt;&gt; +CAN_RULES_TGT =3D &quot;${libdir}/udev/rules.d/37-can.ru=
les&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0SRC_URI:append =3D &quot; \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://local.rules \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://usb1-rules.sh \<br>
&gt; &gt;&gt;&gt; @@ -14,6 +29,10 @@ SRC_URI:append =3D &quot; \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://timesyncd.conf \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;&gt;&gt; +SRC_URI:append:k3 =3D &quot; file://${CAN_RULES_SRC}&quo=
t;<br>
&gt; &gt;&gt;&gt; +SRC_URI:append:dra7xx =3D &quot; file://${CAN_RULES_SRC}=
&quot;<br>
&gt; &gt;&gt;&gt; +SRC_URI:append:ti33x =3D &quot; file://${CAN_RULES_SRC}&=
quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0do_install:append() {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/ud=
ev/rules.d/<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/loca=
l.rules<br>
&gt; ${D}${sysconfdir}/udev/rules.d/<br>
&gt; &gt;&gt;&gt; @@ -43,3 +62,21 @@ do_install:append() {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/sy=
stemd/<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/time=
syncd.conf<br>
&gt; ${D}${sysconfdir}/systemd/<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +do_install:append:k3() {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC=
} ${D}${CAN_RULES_TGT}<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +do_install:append:dra7xx() {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC=
} ${D}${CAN_RULES_TGT}<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +do_install:append:ti33x() {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/udev/rules.d<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/${CAN_RULES_SRC=
} ${D}${CAN_RULES_TGT}<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +FILES:udev +=3D &quot;${CAN_RULES_TGT}&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15202): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15202" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/15202</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104244496/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104244496/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB=
6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></font></div></div></div><=
div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http://ww=
w.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://www.C=
riticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0Syrac=
use, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font color=
=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com/co=
mpany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D=
0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></font></font></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>

--000000000000d0f3820611d5ed1c--

