Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA02C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 16:43:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.23233.1712853784278465410
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 09:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M966H8Lp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43BGh00A061349;
	Thu, 11 Apr 2024 11:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712853780;
	bh=gWA4oy8jqtL47X73NcTAarSfv1s3eKvbMRdFI8+6+xA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=M966H8LpRJ8QevbrSjdyvMHp2mfI4u47RLCDSNzHEQw3La+KwkkbPTg7Kwpz1gvEj
	 3KGQjLdzuHeHGS+2IY42djCs3GtuPMD/Zcqx1kWdqdOX4mXE8YrLL4hl3+vc0eO7FP
	 rXqoFqV4ovZiOvS2dnX3uziQyXlTd8B1vfSnGQDQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43BGh0rv015486
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Apr 2024 11:43:00 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Apr 2024 11:43:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Apr 2024 11:43:00 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43BGh0e2119348;
	Thu, 11 Apr 2024 11:43:00 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Apr 2024 11:43:00 -0500
Message-ID: <D0HFZNQKOL6M.3GAECA1WTAZM3@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <jcormier@criticallink.com>,
        <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko <denys@konsulko.com>, <reatmon@ti.com>, <afd@ti.com>
CC: Andrew Meek <Andrew.Meek@tcs-nz.co.nz>
Subject: Re: [meta-arago] RFC: Should sync-clock.services use --utc
X-Mailer: aerc 0.17.0
References: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com> <17C514807157F9C8.4467@lists.yoctoproject.org>
In-Reply-To: <17C514807157F9C8.4467@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 16:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15266

On Wed Apr 10, 2024 at 8:09 PM CDT, Randolph Sapp via lists.yoctoproject.or=
g wrote:
> On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via lists.yoctoproject.or=
g wrote:
> > I'd like to propose the following change, to resolve what appears to be=
 a
> > difference between how timedatectl is reading the rtc and
> > sync-clocks.service is reading it.
> >
> > recipes-core/systemd/systemd/sync-clocks.service:
> > -ExecStart=3D/sbin/hwclock --systohc
> > +ExecStart=3D/sbin/hwclock --utc --systohc
> >
> > busybox hwclock by default assumes RTC is in local timezone but can be =
told
> > to treat rtc time as UTC by adding --utc.
> > timedatectl by default assumes the RTC time is in UTC, "RTC in local TZ=
:
> > no".
> >
> > Note testing needs to be done with network disconnected otherwise ntp t=
akes
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
> > When system TZ is changed to EST, universal and rtc still match, this m=
akes
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
> > you plug in networking and NTP takes over, RTC time will jump back to U=
TC.
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
> The system time is set with the hwclock and the contents of /etc/adjtime,=
 which
> is created by the first `hwclock --systohc` run on the system. Both syste=
md and
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
> [3] https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f052=
d7bbb0b7dfe/src/shared/clock-util.c#L54
>
> That being said, having a systemd service trigger systohc on every boot i=
s not
> only redundant, but it ensures that the hwclock is always jumping past th=
e last
> value, even if it was actually correct. It's almost certainly worse that =
having
> an old date and waiting for ntp to catch us up, as it cause system logs t=
o jump
> backwards in time. I would like to propose we remove this service altoget=
her.
>
> Also a fun bit of info:
> > Since systemd version 216, when the RTC is configured to the local time=
 (rather
> > than UTC) systemd will never synchronize back to it
>
> - Randolph

Sorry, I'm going to blame sleep deprivation on this piece.

tldr: The sync-clocks service shouldn't be causing any issues. That being s=
aid,
it's redundant because of other time synchronization services now.

- Randolph

