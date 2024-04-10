Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8786ECD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 21:59:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.3054.1712786388570230518
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 14:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=PPGEpjDj;
 spf=pass (domain: criticallink.com, ip: 209.85.167.45, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516db2214e6so6369261e87.1
        for <meta-arago@lists.yoctoproject.org>; Wed, 10 Apr 2024 14:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1712786385; x=1713391185; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h2JXQkjqsIiK1P2RF/GM5eHWpmphKpl0F5EfvCDt3MM=;
        b=PPGEpjDjkcyco4tORemmBsQMSV4FtgD+lPc8KP3veDqxQvIzJPt1fzH00j8EzylWMQ
         O0tJnIqN+CWz4Jr3/zl+ZkHng/9rxuuvkGMPEX+HEKskznUyDQoc8YupvOSMq0iG36Ge
         H97CWbXKUNGpErmhN2MWAyB/6tjKYrVso7xMFWzZ188X/X9EnHMNgmynXZFVTL7AbAdj
         tP3EIKBs9tCbfziED6wDmU9TSep0TlXV2KB2kWAj8V9K/bhJPKQY0ob4HntPViCjpdsf
         MrwqzZEPLbmWq0m50vDDh6VhR40KMrm+E5YFli8/zqWnlkMD/NZeEIKpDWK/G4C8GD5i
         qijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786385; x=1713391185;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2JXQkjqsIiK1P2RF/GM5eHWpmphKpl0F5EfvCDt3MM=;
        b=T2GuUzGLSYTMHozNH5qrZbjype+mL8HX5g0FU0t5wVUrPYLqWqqYTBDzx5sW5uzh5h
         w2nw4DnNUso1kuzOhXBHLrW3sxHXKdKkAO2ecuLBirWebzX4odRtRxRJHh86PYFj05vT
         2LvRBbi/9cKfgTX13aCzaiZYcOAtUIgXFUxFx/SZ2me5ZLgZ+nQ+Z6Tzkwiy9TsE0skv
         KqDp67RSRNfyhDxa6iVhPYRWO9BmazAiQzqTrSJwRuOyBB3MSgL4MjlmRIKDXx62Yood
         2zouTyp7NLyWEbfXETCf+pTXQg4k45XvPEk4yocNOVYNmzHSpixjLSmYo1EMYXr31oof
         Cv1g==
X-Gm-Message-State: AOJu0YymoEdwm/imr5pH6frhf1i9YMev9MHqG4/4ac2aiCyqOs95nphT
	Y9Hqabw3MDu0JMvt4lYq70jwcxSnCKublM7t1g0Ece+IYGBB4qLlJbyDjLHpHC58COWClSlgFLL
	sUnmoYwuU6RmRRIMO5gU9CIbi4uEqmv9x1mbg+FfVQqxv68GfJA==
X-Google-Smtp-Source: AGHT+IEVnwJ6ffuC+X3S0OG07AfrJBh6bxV+BAID0I6wb8/ZI5BV5BGCq/5JSdEpIkodbxVdJdTQYD4plNRgVhMPt+Q=
X-Received: by 2002:ac2:5a4e:0:b0:515:a733:2e21 with SMTP id
 r14-20020ac25a4e000000b00515a7332e21mr2324695lfn.44.1712786385398; Wed, 10
 Apr 2024 14:59:45 -0700 (PDT)
MIME-Version: 1.0
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 10 Apr 2024 17:59:34 -0400
Message-ID: <CADL8D3bTQb3SgdE4Ku9pAgyKDMs2jVsBN2=U7SD92VhCCK6ifw@mail.gmail.com>
Subject: RFC: Should sync-clock.services use --utc
To: meta-arago@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Cc: Andrew Meek <Andrew.Meek@tcs-nz.co.nz>
Content-Type: multipart/alternative; boundary="0000000000001422480615c528e5"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 10 Apr 2024 21:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15263

--0000000000001422480615c528e5
Content-Type: text/plain; charset="UTF-8"

I'd like to propose the following change, to resolve what appears to be a
difference between how timedatectl is reading the rtc and
sync-clocks.service is reading it.

recipes-core/systemd/systemd/sync-clocks.service:
-ExecStart=/sbin/hwclock --systohc
+ExecStart=/sbin/hwclock --utc --systohc

busybox hwclock by default assumes RTC is in local timezone but can be told
to treat rtc time as UTC by adding --utc.
timedatectl by default assumes the RTC time is in UTC, "RTC in local TZ:
no".

Note testing needs to be done with network disconnected otherwise ntp takes
over.

When system TZ is UTC,  local, universal, and rtc time match.

root@mitysom-am57x:~# timedatectl
               Local time: Wed 2024-04-10 20:55:35 UTC
           Universal time: Wed 2024-04-10 20:55:35 UTC
                 RTC time: Wed 2024-04-10 20:55:36
                Time zone: n/a (UTC, +0000)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
root@mitysom-am57x:~# hwclock -r
Wed Apr 10 20:55:368 2024  0.000000 seconds

When system TZ is changed to EST, universal and rtc still match, this makes
sense.

root@mitysom-am57x:~# timedatectl set-timezone America/New_York
root@mitysom-am57x:~# timedatectl
               Local time: Wed 2024-04-10 17:12:06 EDT
           Universal time: Wed 2024-04-10 21:12:06 UTC
                 RTC time: Wed 2024-04-10 21:12:01
                Time zone: America/New_York (EDT, -0400)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
root@mitysom-am57x:~# hwclock -r
Wed Apr 10 21:12:02 2024  0.000000 seconds

However, after a reboot, RTC time now matches the Local time instead.  If
you plug in networking and NTP takes over, RTC time will jump back to UTC.

root@mitysom-am57x:~# timedatectl
               Local time: Wed 2024-04-10 17:13:33 EDT
           Universal time: Wed 2024-04-10 21:13:33 UTC
                 RTC time: Wed 2024-04-10 17:13:33
                Time zone: America/New_York (EDT, -0400)
System clock synchronized: no
              NTP service: active
          RTC in local TZ: no
root@mitysom-am57x:~# hwclock -r
Wed Apr 10 17:13:35 2024  0.000000 seconds

With the above-proposed change, this RTC time changing to local time no
longer happens.


-- 
Jonathan Cormier
Software Engineer

--0000000000001422480615c528e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d like to propose the following change, to reso=
lve what appears to be a difference between how timedatectl is reading the =
rtc and sync-clocks.service is reading it.<br></div><div><br></div><div>rec=
ipes-core/systemd/systemd/sync-clocks.service:</div><div>-ExecStart=3D/sbin=
/hwclock --systohc</div><div>+ExecStart=3D/sbin/hwclock --utc --systohc</di=
v><br>busybox hwclock by default assumes RTC is in local timezone but can b=
e told to treat rtc time as UTC by adding --utc.<br>timedatectl by default =
assumes the RTC time is in UTC, &quot;RTC in local TZ: no&quot;.<br><br>Not=
e testing needs to be done with network disconnected otherwise ntp takes ov=
er.<br><br>When system TZ is UTC, =C2=A0local, universal, and rtc time matc=
h.<br><br><div style=3D"margin-left:40px">root@mitysom-am57x:~# timedatectl=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Local time: Wed =
2024-04-10 20:55:35 UTC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Univers=
al time: Wed 2024-04-10 20:55:35 UTC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0RTC time: Wed 2024-04-10 20:55:36<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time zone: n/a (UTC, +0000)<b=
r>System clock synchronized: yes<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NTP service: active<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RTC in=
 local TZ: no<br>root@mitysom-am57x:~# hwclock -r<br>Wed Apr 10 20:55:368 2=
024 =C2=A00.000000 seconds<br></div><div><br></div><div>When system TZ is c=
hanged to EST, universal and rtc still match, this makes sense.<br></div><d=
iv><br></div><div style=3D"margin-left:40px">root@mitysom-am57x:~# timedate=
ctl set-timezone America/New_York<br>root@mitysom-am57x:~# timedatectl<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Local time: Wed 2024=
-04-10 17:12:06 EDT<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Universal t=
ime: Wed 2024-04-10 21:12:06 UTC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0RTC time: Wed 2024-04-10 21:12:01<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time zone: America/New_York (EDT,=
 -0400)<br>System clock synchronized: yes<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NTP service: active<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RTC in local TZ: no<br>root@mitysom-am57x:~# hwclock -r<br>Wed Apr 10 2=
1:12:02 2024 =C2=A00.000000 seconds</div><div><br></div><div>However, after=
 a reboot, RTC time now matches the Local time instead.=C2=A0 If you plug i=
n networking and NTP takes over, RTC time will jump back to UTC.<br></div><=
div><br></div><div style=3D"margin-left:40px">root@mitysom-am57x:~# timedat=
ectl <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Local time:=
 Wed 2024-04-10 17:13:33 EDT<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Un=
iversal time: Wed 2024-04-10 21:13:33 UTC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RTC time: Wed 2024-04-10 17:13:33<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time zone: America/New=
_York (EDT, -0400)<br>System clock synchronized: no<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NTP service: active<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 RTC in local TZ: no<br>root@mitysom-am57x:~# hwclock -r<br>We=
d Apr 10=C2=A017:13:35 2024 =C2=A00.000000 seconds</div><div><br></div><div=
>With the above-proposed change, this RTC time changing to local time no lo=
nger happens.<br></div><div><br></div><div><br></div>-- <br>Jonathan Cormie=
r<br>Software Engineer</div>

--0000000000001422480615c528e5--

