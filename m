Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93595C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 15:49:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.21709.1712850540997491087
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 08:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=P5MGXHTz;
 spf=pass (domain: criticallink.com, ip: 209.85.167.46, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d6898bebso7237735e87.3
        for <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1712850539; x=1713455339; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IctgvdVPXVFX3Yzo7eTK7z1Dg5PuT7pT8Y9k8qvxwKQ=;
        b=P5MGXHTz/TRjZlic6vsFLFJAa9ViLl6JvwEvQYg2RI2VfmhCKZ66swnc0WdrtVYXcW
         nImLaplJuWK/XhH3AFACIIjJKUwsDs7yWGuzjwXKY2ofKV2ANKDSdLfI+OmW5IdmYQke
         SvNieadHNQkpLXIeTZtXNI+mT07XTxWp3zXvd3RgYCYOSFf+n+Vtfz82TUMA+xqM37OR
         oJtb2n/HKBaQFHm906u2HXeWRzJ6YY0UvQSeBMY7pk9yCgjP4Q3BkMyCwY+ildmn1WOD
         UWxKxoWDt2FjfwJZZPRcEkQQLOC8ccNBloxghxc/Cer8qUAdJCc5jsELYRvgVMw8vA85
         ZhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712850539; x=1713455339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IctgvdVPXVFX3Yzo7eTK7z1Dg5PuT7pT8Y9k8qvxwKQ=;
        b=WxnOfeBSgQ5aUsJ7gNGnyvItBFVU2Yd2yC3gmvAguadLckflZQACAAJ9Tgcd/Cfqlx
         RigHguz1XX8ZhY1o+w0Vlw0yund2IZf+48A80msoTxmBHIjo7bmwqG26YJtepx61CZDs
         CmKzBNcqRPLFh13xn1Rx+4v/TMhyyjR6/x5lUAe4awB5iR3SS+rZe2EEp+p36oPFZLaF
         9rufaXHXGq4TE37yDeVIADXOKA0iiD1Taa4zLhedx2krnrtZd6nXAuMUjW04JmZeZHkP
         mP/WxPH0OJgd59D22sXrpBSD4zQ9Qa+aTv560TdJWNtmlqBQkXTCSieXB+9p86ZOoPxq
         8SUg==
X-Gm-Message-State: AOJu0Yw95ZlDt8CRcGqUGeXMxfSsO2DOXmYn4MmAbs5gVGjQ1TcnVC7F
	qfVjJFj4TvdKw7BIO02gKmNvW88d7byaQlPy70Z4ioBNIKUNpjBsclkh9hYHyZUrc4BhMWmHmaZ
	62NqqsWJbhHySZxV0jyqx7hQ4HSMViFoxKUOS
X-Google-Smtp-Source: AGHT+IGAwWO90dJ3XqGjF5wcu6Ut+LCemn97r0IK+rznj9xlVPDzeqd5DWhm0iEj3VB/m6JSb0KksnejZs+Red16uv8=
X-Received: by 2002:a19:e005:0:b0:516:d538:35a4 with SMTP id
 x5-20020a19e005000000b00516d53835a4mr86109lfg.7.1712850538778; Thu, 11 Apr
 2024 08:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
 <D0GW4PNGMLA4.2YG6A94CS57S9@ti.com>
In-Reply-To: <D0GW4PNGMLA4.2YG6A94CS57S9@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 11 Apr 2024 11:48:46 -0400
Message-ID: <CADL8D3YUu8-U=HW=U2JOLiJ0BkPoJ=Jsnf4QZEuexZWAH3F8ww@mail.gmail.com>
Subject: Re: [meta-arago] RFC: Should sync-clock.services use --utc
To: Randolph Sapp <rs@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>, reatmon@ti.com, 
	afd@ti.com, Andrew Meek <Andrew.Meek@tcs-nz.co.nz>
Content-Type: multipart/alternative; boundary="000000000000eaf69b0615d417df"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 15:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15265

--000000000000eaf69b0615d417df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, I was testing this on the AM57x and that filesystem doesn't have a
/etc/adjtime file.  Is this a new file? Or is there a recipe I am missing?

My understanding of your email is that with /etc/adjtime in place, then the
sync-clocks script is no longer needed?

If I disable it on my AM57x, the system time doesn't get set on boot unless
NFS is available.

On Wed, Apr 10, 2024 at 9:09=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via lists.yoctoproject.or=
g
> wrote:
> > I'd like to propose the following change, to resolve what appears to be=
 a
> > difference between how timedatectl is reading the rtc and
> > sync-clocks.service is reading it.
> >
> > recipes-core/systemd/systemd/sync-clocks.service:
> > -ExecStart=3D/sbin/hwclock --systohc
> > +ExecStart=3D/sbin/hwclock --utc --systohc
> >
> > busybox hwclock by default assumes RTC is in local timezone but can be
> told
> > to treat rtc time as UTC by adding --utc.
> > timedatectl by default assumes the RTC time is in UTC, "RTC in local TZ=
:
> > no".
> >
> > Note testing needs to be done with network disconnected otherwise ntp
> takes
> > over.
> >
> > When system TZ is UTC,  local, universal, and rtc time match.
> >
> > root@mitysom-am57x:~# timedatectl
> >                Local time: Wed 2024-04-10 20:55:35 UTC
> >            Universal time: Wed 2024-04-10 20:55:35 UTC
> >                  RTC time: Wed 2024-04-10 20:55:36
> >                 Time zone: n/a (UTC, +0000)
> > System clock synchronized: yes
> >               NTP service: active
> >           RTC in local TZ: no
> > root@mitysom-am57x:~# hwclock -r
> > Wed Apr 10 20:55:368 2024  0.000000 seconds
> >
> > When system TZ is changed to EST, universal and rtc still match, this
> makes
> > sense.
> >
> > root@mitysom-am57x:~# timedatectl set-timezone America/New_York
> > root@mitysom-am57x:~# timedatectl
> >                Local time: Wed 2024-04-10 17:12:06 EDT
> >            Universal time: Wed 2024-04-10 21:12:06 UTC
> >                  RTC time: Wed 2024-04-10 21:12:01
> >                 Time zone: America/New_York (EDT, -0400)
> > System clock synchronized: yes
> >               NTP service: active
> >           RTC in local TZ: no
> > root@mitysom-am57x:~# hwclock -r
> > Wed Apr 10 21:12:02 2024  0.000000 seconds
> >
> > However, after a reboot, RTC time now matches the Local time instead.  =
If
> > you plug in networking and NTP takes over, RTC time will jump back to
> UTC.
> >
> > root@mitysom-am57x:~# timedatectl
> >                Local time: Wed 2024-04-10 17:13:33 EDT
> >            Universal time: Wed 2024-04-10 21:13:33 UTC
> >                  RTC time: Wed 2024-04-10 17:13:33
> >                 Time zone: America/New_York (EDT, -0400)
> > System clock synchronized: no
> >               NTP service: active
> >           RTC in local TZ: no
> > root@mitysom-am57x:~# hwclock -r
> > Wed Apr 10 17:13:35 2024  0.000000 seconds
> >
> > With the above-proposed change, this RTC time changing to local time no
> > longer happens.
>
> Thanks for bringing this up. I was curious why the system time kept jumpi=
ng
> around but I never thought we would have done something like this...
>
> The system time is set with the hwclock and the contents of /etc/adjtime,
> which
> is created by the first `hwclock --systohc` run on the system. Both
> systemd and
> busybox respect that, assuming they haven't been configured specifically =
to
> ignore that [1] [2] [3].
>
> So the addition of the UTC flag should be unnecessary. The two should rea=
d
> /etc/adjtime and adjust accordingly.
>
> [1] https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478
> [2] https://git.busybox.net/busybox/tree/libbb/rtc.c#n10
> [3]
> https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f052d7bb=
b0b7dfe/src/shared/clock-util.c#L54
>
> That being said, having a systemd service trigger systohc on every boot i=
s
> not
> only redundant, but it ensures that the hwclock is always jumping past th=
e
> last
> value, even if it was actually correct. It's almost certainly worse that
> having
> an old date and waiting for ntp to catch us up, as it cause system logs t=
o
> jump
> backwards in time. I would like to propose we remove this service
> altogether.
>
> Also a fun bit of info:
> > Since systemd version 216, when the RTC is configured to the local time
> (rather
> > than UTC) systemd will never synchronize back to it
>
> - Randolph
>


--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000eaf69b0615d417df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hmm, I was testing this on the AM57x and that filesys=
tem doesn&#39;t have a /etc/adjtime file.=C2=A0 Is this a new file? Or is t=
here a recipe I am missing?</div><div><br></div><div>My understanding of yo=
ur email is that with /etc/adjtime in place, then the sync-clocks script is=
 no longer needed?</div><div><br></div><div>If I disable it on my AM57x, th=
e system time doesn&#39;t get set on boot unless NFS is available.<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Apr 10, 2024 at 9:09=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mailt=
o:rs@ti.com">rs@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via <=
a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.yoctoproject.org</a> wrote:<br>
&gt; I&#39;d like to propose the following change, to resolve what appears =
to be a<br>
&gt; difference between how timedatectl is reading the rtc and<br>
&gt; sync-clocks.service is reading it.<br>
&gt;<br>
&gt; recipes-core/systemd/systemd/sync-clocks.service:<br>
&gt; -ExecStart=3D/sbin/hwclock --systohc<br>
&gt; +ExecStart=3D/sbin/hwclock --utc --systohc<br>
&gt;<br>
&gt; busybox hwclock by default assumes RTC is in local timezone but can be=
 told<br>
&gt; to treat rtc time as UTC by adding --utc.<br>
&gt; timedatectl by default assumes the RTC time is in UTC, &quot;RTC in lo=
cal TZ:<br>
&gt; no&quot;.<br>
&gt;<br>
&gt; Note testing needs to be done with network disconnected otherwise ntp =
takes<br>
&gt; over.<br>
&gt;<br>
&gt; When system TZ is UTC,=C2=A0 local, universal, and rtc time match.<br>
&gt;<br>
&gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local time: Wed=
 2024-04-10 20:55:35 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 2024-04-1=
0 20:55:35 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RTC time=
: Wed 2024-04-10 20:55:36<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time zone=
: n/a (UTC, +0000)<br>
&gt; System clock synchronized: yes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP service: act=
ive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no<br>
&gt; root@mitysom-am57x:~# hwclock -r<br>
&gt; Wed Apr 10 20:55:368 2024=C2=A0 0.000000 seconds<br>
&gt;<br>
&gt; When system TZ is changed to EST, universal and rtc still match, this =
makes<br>
&gt; sense.<br>
&gt;<br>
&gt; root@mitysom-am57x:~# timedatectl set-timezone America/New_York<br>
&gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local time: Wed=
 2024-04-10 17:12:06 EDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 2024-04-1=
0 21:12:06 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RTC time=
: Wed 2024-04-10 21:12:01<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time zone=
: America/New_York (EDT, -0400)<br>
&gt; System clock synchronized: yes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP service: act=
ive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no<br>
&gt; root@mitysom-am57x:~# hwclock -r<br>
&gt; Wed Apr 10 21:12:02 2024=C2=A0 0.000000 seconds<br>
&gt;<br>
&gt; However, after a reboot, RTC time now matches the Local time instead.=
=C2=A0 If<br>
&gt; you plug in networking and NTP takes over, RTC time will jump back to =
UTC.<br>
&gt;<br>
&gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local time: Wed=
 2024-04-10 17:13:33 EDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 2024-04-1=
0 21:13:33 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RTC time=
: Wed 2024-04-10 17:13:33<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time zone=
: America/New_York (EDT, -0400)<br>
&gt; System clock synchronized: no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP service: act=
ive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no<br>
&gt; root@mitysom-am57x:~# hwclock -r<br>
&gt; Wed Apr 10 17:13:35 2024=C2=A0 0.000000 seconds<br>
&gt;<br>
&gt; With the above-proposed change, this RTC time changing to local time n=
o<br>
&gt; longer happens.<br>
<br>
Thanks for bringing this up. I was curious why the system time kept jumping=
<br>
around but I never thought we would have done something like this...<br>
<br>
The system time is set with the hwclock and the contents of /etc/adjtime, w=
hich<br>
is created by the first `hwclock --systohc` run on the system. Both systemd=
 and<br>
busybox respect that, assuming they haven&#39;t been configured specificall=
y to<br>
ignore that [1] [2] [3].<br>
<br>
So the addition of the UTC flag should be unnecessary. The two should read<=
br>
/etc/adjtime and adjust accordingly.<br>
<br>
[1] <a href=3D"https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n4=
78" rel=3D"noreferrer" target=3D"_blank">https://git.busybox.net/busybox/tr=
ee/util-linux/hwclock.c#n478</a><br>
[2] <a href=3D"https://git.busybox.net/busybox/tree/libbb/rtc.c#n10" rel=3D=
"noreferrer" target=3D"_blank">https://git.busybox.net/busybox/tree/libbb/r=
tc.c#n10</a><br>
[3] <a href=3D"https://github.com/systemd/systemd/blob/d0ea8009434935758c8e=
96038f052d7bbb0b7dfe/src/shared/clock-util.c#L54" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/blob/d0ea8009434935758c8e960=
38f052d7bbb0b7dfe/src/shared/clock-util.c#L54</a><br>
<br>
That being said, having a systemd service trigger systohc on every boot is =
not<br>
only redundant, but it ensures that the hwclock is always jumping past the =
last<br>
value, even if it was actually correct. It&#39;s almost certainly worse tha=
t having<br>
an old date and waiting for ntp to catch us up, as it cause system logs to =
jump<br>
backwards in time. I would like to propose we remove this service altogethe=
r.<br>
<br>
Also a fun bit of info:<br>
&gt; Since systemd version 216, when the RTC is configured to the local tim=
e (rather<br>
&gt; than UTC) systemd will never synchronize back to it<br>
<br>
- Randolph<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xk-E6kTWNd5AJHtEUAEcL6C7vYjIUe=
EExuTc6ecDmTEshpkG53r8T5L4geBRI1997uwEiKrqgnopA3"><br></font></div></div></=
div><div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http=
://www.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://=
www.CriticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0=
Syracuse, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font co=
lor=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com=
/company/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.goog=
le.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=
=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a =
href=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" =
src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6c=
U1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9=
jPQ"></a></font></font></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div>

--000000000000eaf69b0615d417df--

