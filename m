Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1B9C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 16:50:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.23261.1712854222211874202
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 09:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ICzvFLkw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43BGoJZf036789;
	Thu, 11 Apr 2024 11:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712854219;
	bh=i8mGslLZml2rq0phgaU394KQOjGuA4mBu+F/EgGfyu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ICzvFLkwnZfKf72RsS7v64DiCMCqYMjjxecKRaJOh6EdjOl/C0gghFxldwUjWO5/f
	 po1yGLSyreOmD86mIg1VTDKLa/MaS/0vRgM79ZB1wnnDDRTNOt906nMKecsttBnkSE
	 yUuK60CwaEk91Z1aiUvkI2eMh9XMmr/Ojs6EbvHY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43BGoI2j021528
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Apr 2024 11:50:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Apr 2024 11:50:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Apr 2024 11:50:18 -0500
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43BGoIxI130693;
	Thu, 11 Apr 2024 11:50:18 -0500
Message-ID: <7606feb5-3b6d-4f50-a341-3599cd4f4b69@ti.com>
Date: Thu, 11 Apr 2024 11:50:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] RFC: Should sync-clock.services use --utc
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <reatmon@ti.com>,
        <afd@ti.com>, Andrew Meek
	<Andrew.Meek@tcs-nz.co.nz>
References: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
 <D0GW4PNGMLA4.2YG6A94CS57S9@ti.com>
 <CADL8D3YUu8-U=HW=U2JOLiJ0BkPoJ=Jsnf4QZEuexZWAH3F8ww@mail.gmail.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CADL8D3YUu8-U=HW=U2JOLiJ0BkPoJ=Jsnf4QZEuexZWAH3F8ww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43BGoJZf036789
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Apr 2024 16:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15267

Yeah, the first time `hwclock --systohc` is run on the system the=20
/etc/adjtime file should be created to track the hwclock drift and=20
configuration. You may have to run this manually.

On 4/11/24 10:48, Jon Cormier wrote:
> Hmm, I was testing this on the AM57x and that filesystem doesn't have a=
=20
> /etc/adjtime file.=C2=A0 Is this a new file? Or is there a recipe I am =
missing?
>=20
> My understanding of your email is that with /etc/adjtime in place, then=
=20
> the sync-clocks script is no longer needed?
>=20
> If I disable it on my AM57x, the system time doesn't get set on boot=20
> unless NFS is available.
>=20
> On Wed, Apr 10, 2024 at 9:09=E2=80=AFPM Randolph Sapp <rs@ti.com=20
> <mailto:rs@ti.com>> wrote:
>=20
>     On Wed Apr 10, 2024 at 4:59 PM CDT, Jon Cormier via
>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>      > I'd like to propose the following change, to resolve what appear=
s
>     to be a
>      > difference between how timedatectl is reading the rtc and
>      > sync-clocks.service is reading it.
>      >
>      > recipes-core/systemd/systemd/sync-clocks.service:
>      > -ExecStart=3D/sbin/hwclock --systohc
>      > +ExecStart=3D/sbin/hwclock --utc --systohc
>      >
>      > busybox hwclock by default assumes RTC is in local timezone but
>     can be told
>      > to treat rtc time as UTC by adding --utc.
>      > timedatectl by default assumes the RTC time is in UTC, "RTC in
>     local TZ:
>      > no".
>      >
>      > Note testing needs to be done with network disconnected otherwis=
e
>     ntp takes
>      > over.
>      >
>      > When system TZ is UTC,=C2=A0 local, universal, and rtc time matc=
h.
>      >
>      > root@mitysom-am57x:~# timedatectl
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local tim=
e: Wed 2024-04-10 20:55:35 UTC
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 202=
4-04-10 20:55:35 UTC
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RT=
C time: Wed 2024-04-10 20:55:36
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tim=
e zone: n/a (UTC, +0000)
>      > System clock synchronized: yes
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP servic=
e: active
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no
>      > root@mitysom-am57x:~# hwclock -r
>      > Wed Apr 10 20:55:368 2024=C2=A0 0.000000 seconds
>      >
>      > When system TZ is changed to EST, universal and rtc still match,
>     this makes
>      > sense.
>      >
>      > root@mitysom-am57x:~# timedatectl set-timezone America/New_York
>      > root@mitysom-am57x:~# timedatectl
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local tim=
e: Wed 2024-04-10 17:12:06 EDT
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 202=
4-04-10 21:12:06 UTC
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RT=
C time: Wed 2024-04-10 21:12:01
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tim=
e zone: America/New_York (EDT, -0400)
>      > System clock synchronized: yes
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP servic=
e: active
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no
>      > root@mitysom-am57x:~# hwclock -r
>      > Wed Apr 10 21:12:02 2024=C2=A0 0.000000 seconds
>      >
>      > However, after a reboot, RTC time now matches the Local time
>     instead.=C2=A0 If
>      > you plug in networking and NTP takes over, RTC time will jump
>     back to UTC.
>      >
>      > root@mitysom-am57x:~# timedatectl
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Local tim=
e: Wed 2024-04-10 17:13:33 EDT
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Universal time: Wed 202=
4-04-10 21:13:33 UTC
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RT=
C time: Wed 2024-04-10 17:13:33
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tim=
e zone: America/New_York (EDT, -0400)
>      > System clock synchronized: no
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NTP servic=
e: active
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC in local TZ: no
>      > root@mitysom-am57x:~# hwclock -r
>      > Wed Apr 10 17:13:35 2024=C2=A0 0.000000 seconds
>      >
>      > With the above-proposed change, this RTC time changing to local
>     time no
>      > longer happens.
>=20
>     Thanks for bringing this up. I was curious why the system time kept
>     jumping
>     around but I never thought we would have done something like this...
>=20
>     The system time is set with the hwclock and the contents of
>     /etc/adjtime, which
>     is created by the first `hwclock --systohc` run on the system. Both
>     systemd and
>     busybox respect that, assuming they haven't been configured
>     specifically to
>     ignore that [1] [2] [3].
>=20
>     So the addition of the UTC flag should be unnecessary. The two
>     should read
>     /etc/adjtime and adjust accordingly.
>=20
>     [1] https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478
>     <https://git.busybox.net/busybox/tree/util-linux/hwclock.c#n478>
>     [2] https://git.busybox.net/busybox/tree/libbb/rtc.c#n10
>     <https://git.busybox.net/busybox/tree/libbb/rtc.c#n10>
>     [3]
>     https://github.com/systemd/systemd/blob/d0ea8009434935758c8e96038f0=
52d7bbb0b7dfe/src/shared/clock-util.c#L54 <https://github.com/systemd/sys=
temd/blob/d0ea8009434935758c8e96038f052d7bbb0b7dfe/src/shared/clock-util.=
c#L54>
>=20
>     That being said, having a systemd service trigger systohc on every
>     boot is not
>     only redundant, but it ensures that the hwclock is always jumping
>     past the last
>     value, even if it was actually correct. It's almost certainly worse
>     that having
>     an old date and waiting for ntp to catch us up, as it cause system
>     logs to jump
>     backwards in time. I would like to propose we remove this service
>     altogether.
>=20
>     Also a fun bit of info:
>      > Since systemd version 216, when the RTC is configured to the
>     local time (rather
>      > than UTC) systemd will never synchronize back to it
>=20
>     - Randolph
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


