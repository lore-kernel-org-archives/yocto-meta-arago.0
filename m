Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71143CD1297
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 01:09:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6865.1712797774817380948
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 18:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QsItepJ8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43B19Ekw074134;
	Wed, 10 Apr 2024 20:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712797754;
	bh=wyfmadQe8Jx4O4xA8AFHDsPwmrfc47z/KmRJ5XHFWi0=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=QsItepJ8dsLYxfgoOjMhUWHZrJVrkQ0coOL9HpHlgJtGJZMIEV6oaGjX3hGmqiAFq
	 B8s7Ai1MMZKRZfgAkDzO0EIChPSV2vOW/nSMPxXIPdxo7lVkg7QNNPFhhO/MOmvwsM
	 uujTIOzehLMYMZEnsUsIz5JxKFqzd4d7HZ62TrB0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43B19EU6009380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Apr 2024 20:09:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 20:09:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 20:09:14 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43B19EWR120204;
	Wed, 10 Apr 2024 20:09:14 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Apr 2024 20:09:14 -0500
Message-ID: <D0GW4PNGMLA4.2YG6A94CS57S9@ti.com>
CC: Andrew Meek <Andrew.Meek@tcs-nz.co.nz>
Subject: Re: [meta-arago] RFC: Should sync-clock.services use --utc
From: Randolph Sapp <rs@ti.com>
To: <jcormier@criticallink.com>, <meta-arago@lists.yoctoproject.org>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>, <reatmon@ti.com>,
        <afd@ti.com>
X-Mailer: aerc 0.17.0
References: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
In-Reply-To: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 01:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15264

On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via lists.yoctoproject.org =
wrote:
> I'd like to propose the following change, to resolve what appears to be a
> difference between how timedatectl is reading the rtc and
> sync-clocks.service is reading it.
>
> recipes-core/systemd/systemd/sync-clocks.service:
> -ExecStart=3D/sbin/hwclock --systohc
> +ExecStart=3D/sbin/hwclock --utc --systohc
>
> busybox hwclock by default assumes RTC is in local timezone but can be to=
ld
> to treat rtc time as UTC by adding --utc.
> timedatectl by default assumes the RTC time is in UTC, "RTC in local TZ:
> no".
>
> Note testing needs to be done with network disconnected otherwise ntp tak=
es
> over.
>
> When system TZ is UTC,  local, universal, and rtc time match.
>
> root@mitysom-am57x:~# timedatectl
>                Local time: Wed 2024-04-10 20:55:35 UTC
>            Universal time: Wed 2024-04-10 20:55:35 UTC
>                  RTC time: Wed 2024-04-10 20:55:36
>                 Time zone: n/a (UTC, +0000)
> System clock synchronized: yes
>               NTP service: active
>           RTC in local TZ: no
> root@mitysom-am57x:~# hwclock -r
> Wed Apr 10 20:55:368 2024  0.000000 seconds
>
> When system TZ is changed to EST, universal and rtc still match, this mak=
es
> sense.
>
> root@mitysom-am57x:~# timedatectl set-timezone America/New_York
> root@mitysom-am57x:~# timedatectl
>                Local time: Wed 2024-04-10 17:12:06 EDT
>            Universal time: Wed 2024-04-10 21:12:06 UTC
>                  RTC time: Wed 2024-04-10 21:12:01
>                 Time zone: America/New_York (EDT, -0400)
> System clock synchronized: yes
>               NTP service: active
>           RTC in local TZ: no
> root@mitysom-am57x:~# hwclock -r
> Wed Apr 10 21:12:02 2024  0.000000 seconds
>
> However, after a reboot, RTC time now matches the Local time instead.  If
> you plug in networking and NTP takes over, RTC time will jump back to UTC=
.
>
> root@mitysom-am57x:~# timedatectl
>                Local time: Wed 2024-04-10 17:13:33 EDT
>            Universal time: Wed 2024-04-10 21:13:33 UTC
>                  RTC time: Wed 2024-04-10 17:13:33
>                 Time zone: America/New_York (EDT, -0400)
> System clock synchronized: no
>               NTP service: active
>           RTC in local TZ: no
> root@mitysom-am57x:~# hwclock -r
> Wed Apr 10 17:13:35 2024  0.000000 seconds
>
> With the above-proposed change, this RTC time changing to local time no
> longer happens.

Thanks for bringing this up. I was curious why the system time kept jumping
around but I never thought we would have done something like this...

The system time is set with the hwclock and the contents of /etc/adjtime, w=
hich
is created by the first `hwclock --systohc` run on the system. Both systemd=
 and
busybox respect that, assuming they haven't been configured specifically to
ignore that [1] [2] [3].

So the addition of the UTC flag should be unnecessary. The two should read
/etc/adjtime and adjust accordingly.

[1] https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478
[2] https://git.busybox.net/busybox/tree/libbb/rtc.c#n10
[3] https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f052d7=
bbb0b7dfe/src/shared/clock-util.c#L54

That being said, having a systemd service trigger systohc on every boot is =
not
only redundant, but it ensures that the hwclock is always jumping past the =
last
value, even if it was actually correct. It's almost certainly worse that ha=
ving
an old date and waiting for ntp to catch us up, as it cause system logs to =
jump
backwards in time. I would like to propose we remove this service altogethe=
r.

Also a fun bit of info:
> Since systemd version 216, when the RTC is configured to the local time (=
rather
> than UTC) systemd will never synchronize back to it

- Randolph

