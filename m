Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5AAC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 20:37:41 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.688.1707338254194242355
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 12:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=KxVP0NiB;
 spf=pass (domain: criticallink.com, ip: 209.85.167.52, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511538be947so1239042e87.3
        for <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 12:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1707338252; x=1707943052; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WtJyQvsvtOlp07dme4rxyp+3KP6X7W/by3DUzHTeD+U=;
        b=KxVP0NiBY7aTP3W/5+OVnUCdXIqZXpRO/3/g8UAGEErImqD0D5DS7tt7StxycZudHL
         QyyNNxo/iGtPClznLXlvtHxiNexQJLduk3tlmhHU2g49VEryfyc0ywJRu3yv2hkA+0PE
         ypxniRtJsEqFczwf9WSRursrvKPEV1KjUtAP1mHDzloOfLIeP62D/RI1iQQze1dK61Gf
         BDZf2cgey6btjlyD42CCBLpuIlt6ULpJ+U4HJGe1Qnolpn8Jzz8mVYHPtfDjqOOglDFc
         ypnG9EJFALJhituY598GLdlrsS0XVrV+Pj3SUQnu016rhcyVREJEX7fcakOncKrunn5v
         csaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707338252; x=1707943052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtJyQvsvtOlp07dme4rxyp+3KP6X7W/by3DUzHTeD+U=;
        b=PkicYcacaGFF21Hg2jitezS+DFztG58bH10/tcSVHux+BlJLugUaoo9M16Zgg0Kd8n
         Fys0q8GViXsG+mzJm3CJlflqf8qAgoGuk590JMGz2GuzsnhPeUMm3i5eHyz55cgb5o2K
         0hpLIurIicgk4rh0USy0L1uS/iiQ8Dcg/hmCAriH6hpS0Y014K7srvRF9LYdOXHz+j2x
         UxL5VtAOR1N5A1r7Cw5OAgtSm/q1CD5eYdFzjIWXWSRtuoTuPMp81BWHzXAB+ZiV35JN
         sCPz69twJYDCb2HuyL8ZhABpBgERwKKHDdO3snUP+AqeWzr5LtSgr38EP5LDXUy08icq
         1YMA==
X-Gm-Message-State: AOJu0YymEa/6suRbRLXTRiVHX5O90Vyx/g63nx9TGZtvF+ZtrQJj1XWD
	hDh08nADzmz6sABbkfRL4g2B7m/nlwcnjQ8hIVboT/jArI47O1tz1S73z/f05IN/lyk7krc+wgA
	qqqkmw2KGhWu8VJzw7fTvOaf+g8hNW46Kg1/K
X-Google-Smtp-Source: AGHT+IGanq0VjrdIClr+zMwlhnBtMLuoc0R1gY9NIbSdDOqIV7s16V6hN7L5R5N+GEQ+16IIBbVQc97gRpLtA1W/wnw=
X-Received: by 2002:a05:6512:eaa:b0:511:6241:d43a with SMTP id
 bi42-20020a0565120eaa00b005116241d43amr3595425lfb.10.1707338251943; Wed, 07
 Feb 2024 12:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20240207192950.1761572-1-a-limaye@ti.com>
In-Reply-To: <20240207192950.1761572-1-a-limaye@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 7 Feb 2024 15:37:20 -0500
Message-ID: <CADL8D3avAMzQLFsEQEmGgA71zuDCex7j8rcj2oTgwxbx7G+q6w@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules
 for persistent naming of the can devices
To: a-limaye@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, 
	Bhavya Kapoor <b-kapoor@ti.com>
Content-Type: multipart/alternative; boundary="00000000000004d7950610d0aa84"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 20:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15126

--00000000000004d7950610d0aa84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:30=E2=80=AFPM Aniket Limaye via lists.yoctoproject=
.org
<a-limaye=3Dti.com@lists.yoctoproject.org> wrote:

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
>     - Switch to udev rules instead of systemd network links, as per
>       feedback from v1:
> https://lists.yoctoproject.org/g/meta-arago/message/15104
>     - Also, extend to Sitara devices as well
> ---
>  .../systemd/systemd/k3/37-can-am62.rules      |  4 ++
>  .../systemd/systemd/k3/37-can-j7.rules        | 20 +++++++
>  .../recipes-core/systemd/systemd_%.bbappend   | 58 +++++++++++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
>  create mode 100644
> meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
>
> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can", NAM=
E=3D"mcu_mcan0"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can", NAM=
E=3D"mcu_mcan1"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can",
> NAME=3D"main_mcan0"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can",
> NAME=3D"main_mcan1"
> diff --git
> a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
> @@ -0,0 +1,20 @@
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can", NA=
ME=3D"mcu_mcan0"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can", NA=
ME=3D"mcu_mcan1"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can", NAM=
E=3D"main_mcan0"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can", NAM=
E=3D"main_mcan1"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can", NAM=
E=3D"main_mcan2"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can", NAM=
E=3D"main_mcan3"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can", NAM=
E=3D"main_mcan4"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can", NAM=
E=3D"main_mcan5"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can", NAM=
E=3D"main_mcan6"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can", NAM=
E=3D"main_mcan7"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can", NAM=
E=3D"main_mcan8"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can", NAM=
E=3D"main_mcan9"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can",
> NAME=3D"main_mcan10"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can",
> NAME=3D"main_mcan11"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can",
> NAME=3D"main_mcan12"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can",
> NAME=3D"main_mcan13"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can",
> NAME=3D"main_mcan14"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can",
> NAME=3D"main_mcan15"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can",
> NAME=3D"main_mcan16"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can",
> NAME=3D"main_mcan17"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index f38606f2..248ad5e4 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -14,6 +14,11 @@ SRC_URI:append =3D " \
>      file://timesyncd.conf \
>  "
>
> +SRC_URI:append:k3 =3D " \
> +    file://37-can-j7.rules \
> +    file://37-can-am62.rules \
> +"
>
Butting in here but is there any reason not to just combine the two can
rules files and install the same file (37-can-k3.rules) to all k3 devices?
It would make the bbappend file much shorter...

> +
>  do_install:append() {
>      install -d ${D}${sysconfdir}/udev/rules.d/
>      install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.=
d/
> @@ -43,3 +48,56 @@ do_install:append() {
>      install -d ${D}${sysconfdir}/systemd/
>      install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>  }
> +
> +do_install:append:j721e() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j7200() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j721s2() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j784s4() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am65xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62pxx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am62axx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:am64xx() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +do_install:append:j722s() {
> +    install -d ${D}/${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules
> ${D}${libdir}/udev/rules.d/37-can.rules
> +}
> +
> +FILES:udev +=3D "${libdir}/udev/rules.d/37-can.rules"
> +
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15125):
> https://lists.yoctoproject.org/g/meta-arago/message/15125
> Mute This Topic: https://lists.yoctoproject.org/mt/104225388/7902621
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

--00000000000004d7950610d0aa84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 7, 2024 at 2:30=E2=80=AFP=
M Aniket Limaye via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;a-limaye=3D<a href=3D"mailto:ti.com@lists.yoctoproject.or=
g">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">When multiple CAN&#39;s are present, then =
names that are getting assigned<br>
change after every boot even after providing alias in the device<br>
tree.<br>
So add udev rules to specify the interface name to use for<br>
each mcan device, to make it persistent across reboots.<br>
<br>
Signed-off-by: Bhavya Kapoor &lt;<a href=3D"mailto:b-kapoor@ti.com" target=
=3D"_blank">b-kapoor@ti.com</a>&gt;<br>
Signed-off-by: Aniket Limaye &lt;<a href=3D"mailto:a-limaye@ti.com" target=
=3D"_blank">a-limaye@ti.com</a>&gt;<br>
---<br>
v3: Fix typos in the filename being installed in v2<br>
v2:<br>
=C2=A0 =C2=A0 - Switch to udev rules instead of systemd network links, as p=
er<br>
=C2=A0 =C2=A0 =C2=A0 feedback from v1: <a href=3D"https://lists.yoctoprojec=
t.org/g/meta-arago/message/15104" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.yoctoproject.org/g/meta-arago/message/15104</a><br>
=C2=A0 =C2=A0 - Also, extend to Sitara devices as well<br>
---<br>
=C2=A0.../systemd/systemd/k3/37-can-am62.rules=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 ++<br>
=C2=A0.../systemd/systemd/k3/37-can-j7.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
0 +++++++<br>
=C2=A0.../recipes-core/systemd/systemd_%.bbappend=C2=A0 =C2=A0| 58 ++++++++=
+++++++++++<br>
=C2=A03 files changed, 82 insertions(+)<br>
=C2=A0create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/=
37-can-am62.rules<br>
=C2=A0create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/=
37-can-j7.rules<br>
<br>
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.=
rules b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules=
<br>
new file mode 100644<br>
index 00000000..59dc8075<br>
--- /dev/null<br>
+++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules<b=
r>
@@ -0,0 +1,4 @@<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;4e08000.can&quot;, NAME=3D&quot;mcu_mcan0&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;4e18000.can&quot;, NAME=3D&quot;mcu_mcan1&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;20701000.can&quot;, NAME=3D&quot;main_mcan0&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;20711000.can&quot;, NAME=3D&quot;main_mcan1&quot;<br>
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.ru=
les b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules<br>
new file mode 100644<br>
index 00000000..f2804ecd<br>
--- /dev/null<br>
+++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules<br>
@@ -0,0 +1,20 @@<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;40528000.can&quot;, NAME=3D&quot;mcu_mcan0&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;40568000.can&quot;, NAME=3D&quot;mcu_mcan1&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2701000.can&quot;, NAME=3D&quot;main_mcan0&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2711000.can&quot;, NAME=3D&quot;main_mcan1&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2721000.can&quot;, NAME=3D&quot;main_mcan2&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2731000.can&quot;, NAME=3D&quot;main_mcan3&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2741000.can&quot;, NAME=3D&quot;main_mcan4&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2751000.can&quot;, NAME=3D&quot;main_mcan5&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2761000.can&quot;, NAME=3D&quot;main_mcan6&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2771000.can&quot;, NAME=3D&quot;main_mcan7&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2781000.can&quot;, NAME=3D&quot;main_mcan8&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2791000.can&quot;, NAME=3D&quot;main_mcan9&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;27a1000.can&quot;, NAME=3D&quot;main_mcan10&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;27b1000.can&quot;, NAME=3D&quot;main_mcan11&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;27c1000.can&quot;, NAME=3D&quot;main_mcan12&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;27d1000.can&quot;, NAME=3D&quot;main_mcan13&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2681000.can&quot;, NAME=3D&quot;main_mcan14&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;2691000.can&quot;, NAME=3D&quot;main_mcan15&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;26a1000.can&quot;, NAME=3D&quot;main_mcan16&quot;<br>
+SUBSYSTEM=3D=3D&quot;net&quot;, ACTION=3D=3D&quot;add&quot;, KERNELS=3D=3D=
&quot;26b1000.can&quot;, NAME=3D&quot;main_mcan17&quot;<br>
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/me=
ta-arago-distro/recipes-core/systemd/systemd_%.bbappend<br>
index f38606f2..248ad5e4 100644<br>
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend<br>
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend<br>
@@ -14,6 +14,11 @@ SRC_URI:append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://timesyncd.conf \<br>
=C2=A0&quot;<br>
<br>
+SRC_URI:append:k3 =3D &quot; \<br>
+=C2=A0 =C2=A0 file://37-can-j7.rules \<br>
+=C2=A0 =C2=A0 file://37-can-am62.rules \<br>
+&quot;<br></blockquote><div>Butting in here but is there any reason not to=
 just combine the two can=20
rules files and install the same file (37-can-k3.rules) to all k3 devices?=
=C2=A0 It would make=20
the bbappend file much shorter... <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/udev/rules.d/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir=
}/udev/rules.d/<br>
@@ -43,3 +48,56 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/systemd/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconf=
dir}/systemd/<br>
=C2=A0}<br>
+<br>
+do_install:append:j721e() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/ude=
v/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:j7200() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/ude=
v/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:j721s2() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/ude=
v/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:j784s4() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/ude=
v/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:am65xx() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/ude=
v/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:am62xx() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/u=
dev/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:am62pxx() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/u=
dev/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:am62axx() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/u=
dev/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:am64xx() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/u=
dev/rules.d/37-can.rules<br>
+}<br>
+<br>
+do_install:append:j722s() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${libdir}/udev/rules.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/u=
dev/rules.d/37-can.rules<br>
+}<br>
+<br>
+FILES:udev +=3D &quot;${libdir}/udev/rules.d/37-can.rules&quot;<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15125): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15125" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/15125</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104225388/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104225388/7902621</a><br>
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
/div></div></div></div></div></div>

--00000000000004d7950610d0aa84--

