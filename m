Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E69C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 17:24:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.24403.1712856274614861435
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 10:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=kNRzRyUd;
 spf=pass (domain: criticallink.com, ip: 209.85.167.51, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so117783e87.2
        for <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1712856272; x=1713461072; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=werCZrSalQAu6kzZcntwHWKcuH+IVV1II+reuza3Yko=;
        b=kNRzRyUdWjlel2iioTryOXMLlHw555RF/ACXCt3I/gQ3IBjtRCAoIt607d6uiQplOR
         xxJ2bApm1fKWfR9/j7/ZLfCQMLA+R2Ts0Y+xt1xIRFVW/24oB/jbrvbSnHOs5r+0oWDp
         gX0gqot0dzBb7QY1IwIlAMF0Vr3Nj9SikrMIjLP9cjNXYloRYcb/iXBOsGgBFKevab7f
         YJbcWNkzSsihBjqaHBGOmSK69m5BgctGfHZ3DfQSpF7y22kxWifbN5AAGmgrLHfHo/Nr
         SezqU6PSOAytql0WsOozInC+zmXWBHAr4J2QJ69plrUJkSeKrMyJIbzI6CLHT9FPrAbo
         XeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712856272; x=1713461072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=werCZrSalQAu6kzZcntwHWKcuH+IVV1II+reuza3Yko=;
        b=R9mmAvm/dFdIzIekLKKG7f+OZs2yS1nCVblFH6QYtk4HrT8sSovYAf6TWCWa91xs9Z
         FFyv1aqKAbWIHMm7oCTFnt+oBHzQ4ZmCUUNMmil7LqVm+Dy2bRYtQ7AB49Lvd7hwcAks
         ZsNkRY1RX2bpyBBB2BT0GxGCiC+hDi/ZVSe39VJhXuGLaOyKptxxA6BKoLqBhc36kVGT
         NDG5BGFu2UFGe1BvfQGTmlTUDT5ELTEexeFzDEQD0igal6x2Lyz6xZCsr4jECfWYY8Fw
         pXEVkmIoNHJE8BCfAXPPWxcS3gh6HlHy/Z2DHGtqZ5cXHxh6TQ2PbZdtIEYMKR6KXWED
         jCQA==
X-Gm-Message-State: AOJu0Yy3srF0ZJq9rbhVqotjAh+m2pzbS2o91LhrsRCjybaMGaCv/Jjv
	wRkoaZTss+rE6a7JQpaOpkneVgANwPS/rmpPujYZI3zaU1GeR2gRKACEa4rCKyCgY9bjaeNlXBx
	8UD5zQs7gdS+vI8K/NvKqUH5te9aPfBB3A170
X-Google-Smtp-Source: AGHT+IF05HjtbIwKK+XlbbM0VfvhzGrvrvvnz22yzvXuBp3oCe0ld4Av2xe0fZn7ma46qSoTQ3bZPRi56b+Oif4opME=
X-Received: by 2002:a2e:be04:0:b0:2d8:da4c:5909 with SMTP id
 z4-20020a2ebe04000000b002d8da4c5909mr194976ljq.51.1712856272055; Thu, 11 Apr
 2024 10:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
 <D0GW4PNGMLA4.2YG6A94CS57S9@ti.com> <CADL8D3YUu8-U=HW=U2JOLiJ0BkPoJ=Jsnf4QZEuexZWAH3F8ww@mail.gmail.com>
 <7606feb5-3b6d-4f50-a341-3599cd4f4b69@ti.com>
In-Reply-To: <7606feb5-3b6d-4f50-a341-3599cd4f4b69@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 11 Apr 2024 13:24:18 -0400
Message-ID: <CADL8D3acHCpU+9+hGu+c8qf=3T=QPJ1PmNK9rpsapHV3CFtjoA@mail.gmail.com>
Subject: Re: [meta-arago] RFC: Should sync-clock.services use --utc
To: Randolph Sapp <rs@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>, reatmon@ti.com, 
	afd@ti.com, Andrew Meek <Andrew.Meek@tcs-nz.co.nz>
Content-Type: multipart/alternative; boundary="000000000000a5cd410615d56dcc"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 17:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15268

--000000000000a5cd410615d56dcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, the code your pointing to should be old enough to be included in the
am57x busybox and systemd versions. However, the file doesn't exist and
isn't being created when I run the hwclock command.

On Thu, Apr 11, 2024 at 12:50=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> Yeah, the first time `hwclock --systohc` is run on the system the
> /etc/adjtime file should be created to track the hwclock drift and
> configuration. You may have to run this manually.
>
> On 4/11/24 10:48, Jon Cormier wrote:
> > Hmm, I was testing this on the AM57x and that filesystem doesn't have a
> > /etc/adjtime file.  Is this a new file? Or is there a recipe I am
> missing?
> >
> > My understanding of your email is that with /etc/adjtime in place, then
> > the sync-clocks script is no longer needed?
> >
> > If I disable it on my AM57x, the system time doesn't get set on boot
> > unless NFS is available.
> >
> > On Wed, Apr 10, 2024 at 9:09=E2=80=AFPM Randolph Sapp <rs@ti.com
> > <mailto:rs@ti.com>> wrote:
> >
> >     On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via
> >     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
> >      > I'd like to propose the following change, to resolve what appear=
s
> >     to be a
> >      > difference between how timedatectl is reading the rtc and
> >      > sync-clocks.service is reading it.
> >      >
> >      > recipes-core/systemd/systemd/sync-clocks.service:
> >      > -ExecStart=3D/sbin/hwclock --systohc
> >      > +ExecStart=3D/sbin/hwclock --utc --systohc
> >      >
> >      > busybox hwclock by default assumes RTC is in local timezone but
> >     can be told
> >      > to treat rtc time as UTC by adding --utc.
> >      > timedatectl by default assumes the RTC time is in UTC, "RTC in
> >     local TZ:
> >      > no".
> >      >
> >      > Note testing needs to be done with network disconnected otherwis=
e
> >     ntp takes
> >      > over.
> >      >
> >      > When system TZ is UTC,  local, universal, and rtc time match.
> >      >
> >      > root@mitysom-am57x:~# timedatectl
> >      >                Local time: Wed 2024-04-10 20:55:35 UTC
> >      >            Universal time: Wed 2024-04-10 20:55:35 UTC
> >      >                  RTC time: Wed 2024-04-10 20:55:36
> >      >                 Time zone: n/a (UTC, +0000)
> >      > System clock synchronized: yes
> >      >               NTP service: active
> >      >           RTC in local TZ: no
> >      > root@mitysom-am57x:~# hwclock -r
> >      > Wed Apr 10 20:55:368 2024  0.000000 seconds
> >      >
> >      > When system TZ is changed to EST, universal and rtc still match,
> >     this makes
> >      > sense.
> >      >
> >      > root@mitysom-am57x:~# timedatectl set-timezone America/New_York
> >      > root@mitysom-am57x:~# timedatectl
> >      >                Local time: Wed 2024-04-10 17:12:06 EDT
> >      >            Universal time: Wed 2024-04-10 21:12:06 UTC
> >      >                  RTC time: Wed 2024-04-10 21:12:01
> >      >                 Time zone: America/New_York (EDT, -0400)
> >      > System clock synchronized: yes
> >      >               NTP service: active
> >      >           RTC in local TZ: no
> >      > root@mitysom-am57x:~# hwclock -r
> >      > Wed Apr 10 21:12:02 2024  0.000000 seconds
> >      >
> >      > However, after a reboot, RTC time now matches the Local time
> >     instead.  If
> >      > you plug in networking and NTP takes over, RTC time will jump
> >     back to UTC.
> >      >
> >      > root@mitysom-am57x:~# timedatectl
> >      >                Local time: Wed 2024-04-10 17:13:33 EDT
> >      >            Universal time: Wed 2024-04-10 21:13:33 UTC
> >      >                  RTC time: Wed 2024-04-10 17:13:33
> >      >                 Time zone: America/New_York (EDT, -0400)
> >      > System clock synchronized: no
> >      >               NTP service: active
> >      >           RTC in local TZ: no
> >      > root@mitysom-am57x:~# hwclock -r
> >      > Wed Apr 10 17:13:35 2024  0.000000 seconds
> >      >
> >      > With the above-proposed change, this RTC time changing to local
> >     time no
> >      > longer happens.
> >
> >     Thanks for bringing this up. I was curious why the system time kept
> >     jumping
> >     around but I never thought we would have done something like this..=
.
> >
> >     The system time is set with the hwclock and the contents of
> >     /etc/adjtime, which
> >     is created by the first `hwclock --systohc` run on the system. Both
> >     systemd and
> >     busybox respect that, assuming they haven't been configured
> >     specifically to
> >     ignore that [1] [2] [3].
> >
> >     So the addition of the UTC flag should be unnecessary. The two
> >     should read
> >     /etc/adjtime and adjust accordingly.
> >
> >     [1] https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478
> >     <https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478>
> >     [2] https://git.busybox.net/busybox/tree/libbb/rtc.c#n10
> >     <https://git.busybox.net/busybox/tree/libbb/rtc.c#n10>
> >     [3]
> >
> https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f052d7bb=
b0b7dfe/src/shared/clock-util.c#L54
> <
> https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f052d7bb=
b0b7dfe/src/shared/clock-util.c#L54
> >
> >
> >     That being said, having a systemd service trigger systohc on every
> >     boot is not
> >     only redundant, but it ensures that the hwclock is always jumping
> >     past the last
> >     value, even if it was actually correct. It's almost certainly worse
> >     that having
> >     an old date and waiting for ntp to catch us up, as it cause system
> >     logs to jump
> >     backwards in time. I would like to propose we remove this service
> >     altogether.
> >
> >     Also a fun bit of info:
> >      > Since systemd version 216, when the RTC is configured to the
> >     local time (rather
> >      > than UTC) systemd will never synchronize back to it
> >
> >     - Randolph
> >
> >
> >
> > --
> > Jonathan Cormier
> > Software Engineer
> >
> > Voice: 315.425.4045 x222
> >
> >
> >
> > http://www.CriticalLink.com <http://www.criticallink.com/>
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> >
> > <https://www.linkedin.com/company/critical-link-llc>
> > <https://twitter.com/Critical_Link>
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

--000000000000a5cd410615d56dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm, the code your pointing to should be old enough to be =
included in the am57x busybox and systemd versions. However, the file doesn=
&#39;t exist and isn&#39;t being created when I run the hwclock command.<br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Apr 11, 2024 at 12:50=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mail=
to:rs@ti.com">rs@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Yeah, the first time `hwclock --systohc` is run on t=
he system the <br>
/etc/adjtime file should be created to track the hwclock drift and <br>
configuration. You may have to run this manually.<br>
<br>
On 4/11/24 10:48, Jon Cormier wrote:<br>
&gt; Hmm, I was testing this on the AM57x and that filesystem doesn&#39;t h=
ave a <br>
&gt; /etc/adjtime file.=C2=A0 Is this a new file? Or is there a recipe I am=
 missing?<br>
&gt; <br>
&gt; My understanding of your email is that with /etc/adjtime in place, the=
n <br>
&gt; the sync-clocks script is no longer needed?<br>
&gt; <br>
&gt; If I disable it on my AM57x, the system time doesn&#39;t get set on bo=
ot <br>
&gt; unless NFS is available.<br>
&gt; <br>
&gt; On Wed, Apr 10, 2024 at 9:09=E2=80=AFPM Randolph Sapp &lt;<a href=3D"m=
ailto:rs@ti.com" target=3D"_blank">rs@ti.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:rs@ti.com" target=3D"_blank">rs@ti.com</a=
>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.yoctoproject.org" rel=3D"no=
referrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;<a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">http://lists=
.yoctoproject.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;d like to propose the following change,=
 to resolve what appears<br>
&gt;=C2=A0 =C2=A0 =C2=A0to be a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; difference between how timedatectl is reading=
 the rtc and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; sync-clocks.service is reading it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; recipes-core/systemd/systemd/sync-clocks.serv=
ice:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -ExecStart=3D/sbin/hwclock --systohc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ExecStart=3D/sbin/hwclock --utc --systohc<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; busybox hwclock by default assumes RTC is in =
local timezone but<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be told<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to treat rtc time as UTC by adding --utc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; timedatectl by default assumes the RTC time i=
s in UTC, &quot;RTC in<br>
&gt;=C2=A0 =C2=A0 =C2=A0local TZ:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; no&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Note testing needs to be done with network di=
sconnected otherwise<br>
&gt;=C2=A0 =C2=A0 =C2=A0ntp takes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; over.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; When system TZ is UTC,=C2=A0 local, universal=
, and rtc time match.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Local time: Wed 2024-04-10 20:55:35 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Univ=
ersal time: Wed 2024-04-10 20:55:35 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RTC time: Wed 2024-04-10 20:55:36<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Time zone: n/a (UTC, +0000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; System clock synchronized: yes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NTP service: active<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC i=
n local TZ: no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# hwclock -r<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Wed Apr 10 20:55:368 2024=C2=A0 0.000000 seco=
nds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; When system TZ is changed to EST, universal a=
nd rtc still match,<br>
&gt;=C2=A0 =C2=A0 =C2=A0this makes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; sense.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# timedatectl set-timezon=
e America/New_York<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Local time: Wed 2024-04-10 17:12:06 EDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Univ=
ersal time: Wed 2024-04-10 21:12:06 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RTC time: Wed 2024-04-10 21:12:01<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Time zone: America/New_York (EDT, -0400)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; System clock synchronized: yes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NTP service: active<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC i=
n local TZ: no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# hwclock -r<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Wed Apr 10 21:12:02 2024=C2=A0 0.000000 secon=
ds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; However, after a reboot, RTC time now matches=
 the Local time<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead.=C2=A0 If<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; you plug in networking and NTP takes over, RT=
C time will jump<br>
&gt;=C2=A0 =C2=A0 =C2=A0back to UTC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# timedatectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Local time: Wed 2024-04-10 17:13:33 EDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Univ=
ersal time: Wed 2024-04-10 21:13:33 UTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RTC time: Wed 2024-04-10 17:13:33<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Time zone: America/New_York (EDT, -0400)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; System clock synchronized: no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NTP service: active<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC i=
n local TZ: no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@mitysom-am57x:~# hwclock -r<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Wed Apr 10 17:13:35 2024=C2=A0 0.000000 secon=
ds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; With the above-proposed change, this RTC time=
 changing to local<br>
&gt;=C2=A0 =C2=A0 =C2=A0time no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; longer happens.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for bringing this up. I was curious why the =
system time kept<br>
&gt;=C2=A0 =C2=A0 =C2=A0jumping<br>
&gt;=C2=A0 =C2=A0 =C2=A0around but I never thought we would have done somet=
hing like this...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The system time is set with the hwclock and the con=
tents of<br>
&gt;=C2=A0 =C2=A0 =C2=A0/etc/adjtime, which<br>
&gt;=C2=A0 =C2=A0 =C2=A0is created by the first `hwclock --systohc` run on =
the system. Both<br>
&gt;=C2=A0 =C2=A0 =C2=A0systemd and<br>
&gt;=C2=A0 =C2=A0 =C2=A0busybox respect that, assuming they haven&#39;t bee=
n configured<br>
&gt;=C2=A0 =C2=A0 =C2=A0specifically to<br>
&gt;=C2=A0 =C2=A0 =C2=A0ignore that [1] [2] [3].<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So the addition of the UTC flag should be unnecessa=
ry. The two<br>
&gt;=C2=A0 =C2=A0 =C2=A0should read<br>
&gt;=C2=A0 =C2=A0 =C2=A0/etc/adjtime and adjust accordingly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[1] <a href=3D"https://git.busybox.net/busybox/tree=
/util-linux/hwclock.c#n478" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.busybox.net/busybox/tree/util-linux/hwclock.c#n478</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.busybox.net/busybox/tree=
/util-linux/hwclock.c#n478" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.busybox.net/busybox/tree/util-linux/hwclock.c#n478</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[2] <a href=3D"https://git.busybox.net/busybox/tree=
/libbb/rtc.c#n10" rel=3D"noreferrer" target=3D"_blank">https://git.busybox.=
net/busybox/tree/libbb/rtc.c#n10</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.busybox.net/busybox/tree=
/libbb/rtc.c#n10" rel=3D"noreferrer" target=3D"_blank">https://git.busybox.=
net/busybox/tree/libbb/rtc.c#n10</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[3]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/systemd/systemd/blob/=
d0ea8009434935758c8e96038f052d7bbb0b7dfe/src/shared/clock-util.c#L54" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/systemd/systemd/blob/d=
0ea8009434935758c8e96038f052d7bbb0b7dfe/src/shared/clock-util.c#L54</a> &lt=
;<a href=3D"https://github.com/systemd/systemd/blob/d0ea8009434935758c8e960=
38f052d7bbb0b7dfe/src/shared/clock-util.c#L54" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f=
052d7bbb0b7dfe/src/shared/clock-util.c#L54</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That being said, having a systemd service trigger s=
ystohc on every<br>
&gt;=C2=A0 =C2=A0 =C2=A0boot is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0only redundant, but it ensures that the hwclock is =
always jumping<br>
&gt;=C2=A0 =C2=A0 =C2=A0past the last<br>
&gt;=C2=A0 =C2=A0 =C2=A0value, even if it was actually correct. It&#39;s al=
most certainly worse<br>
&gt;=C2=A0 =C2=A0 =C2=A0that having<br>
&gt;=C2=A0 =C2=A0 =C2=A0an old date and waiting for ntp to catch us up, as =
it cause system<br>
&gt;=C2=A0 =C2=A0 =C2=A0logs to jump<br>
&gt;=C2=A0 =C2=A0 =C2=A0backwards in time. I would like to propose we remov=
e this service<br>
&gt;=C2=A0 =C2=A0 =C2=A0altogether.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also a fun bit of info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Since systemd version 216, when the RTC is co=
nfigured to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0local time (rather<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; than UTC) systemd will never synchronize back=
 to it<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- Randolph<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Jonathan Cormier<br>
&gt; Software Engineer<br>
&gt; <br>
&gt; Voice: 315.425.4045=C2=A0x222<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=3D"_=
blank">http://www.CriticalLink.com</a> &lt;<a href=3D"http://www.criticalli=
nk.com/" rel=3D"noreferrer" target=3D"_blank">http://www.criticallink.com/<=
/a>&gt;<br>
&gt; 6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211<br>
&gt; <br>
&gt; &lt;<a href=3D"https://www.linkedin.com/company/critical-link-llc" rel=
=3D"noreferrer" target=3D"_blank">https://www.linkedin.com/company/critical=
-link-llc</a>&gt; <br>
&gt; &lt;<a href=3D"https://twitter.com/Critical_Link" rel=3D"noreferrer" t=
arget=3D"_blank">https://twitter.com/Critical_Link</a>&gt;<br>
<br>
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

--000000000000a5cd410615d56dcc--

