Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.7707.1637054620576296917
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=JrXWmI8U;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound43-177.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 16 Nov 2021 09:23:37 +0000
Received: by mail-pl1-f199.google.com with SMTP id l14-20020a170903120e00b00143cc292bc3so1253226plh.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 16 Nov 2021 01:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aKKb9nZN40078lksolyOUv2hNfu2Bs61dNs85O5us8U=;
        b=JrXWmI8UzG9f9LLHYQkiqMqKdjoogCHs7PnZ3d/MWah8ruAmKhLf4lvMGdc7Lb/2Rr
         QEDWtpPFMILuj9XImjXFuf5o0W/lJVd8LuRExV2BobxsrtJyeE7ZXN0u46vylqVcLYrB
         6hq5hEiZGfmTLGBVzW1uoKZRWp3qN8YhEET/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aKKb9nZN40078lksolyOUv2hNfu2Bs61dNs85O5us8U=;
        b=m7vDsopEannj1N4+tty9+Sr4I22sPixfg/LUj66NiXRPsOTtA0O9ltf1NEW+x+sqXX
         e04I37moWVr/M8hXpQCuZowB9g8zLHJKXJJd3AZUXmGrW8nJKonsBDy3hG5v/tmjYMul
         8XQ6XwS/iQNWB7Ac67Afm3watf7VOzDI4qIwdBfOH8ieHkf7FXY29eCZgIWoRpp96hRy
         DVPgWGWJJlEce7VrBKh796cXWrHNW9Jm9nXoubEnKbCDX/rSpookpMHSwHWVMqYRJ9Ma
         tHTEVA56gFU+wZWiIVJA8GDn3tMl1SxPaP467ZkPVLSHfBjWYs/G0xC0yVSMI+4j8i2g
         GQ/Q==
X-Gm-Message-State: AOAM532pTm4rbXloUMqA++ZAaOS/9fOoArBwVA/JmVCIebyZ1CV0bZm6
	bIjhwRw8p8GEFcM+ouSwFQMBLVAHlpsZo9EaJD3YQK40GS3isy7Yck+MNesT3ZfO9MoDkMJgyo0
	7u4YIn5mhpsDzXKQwz+F74eW/p27B+YdzboH9GamdxWPfw7M74FuWAACK+iFJhvt0zZstwL1Gch
	hIRlhVCdM=
X-Received: by 2002:a63:7e01:: with SMTP id z1mr3821741pgc.238.1637054616110;
        Tue, 16 Nov 2021 01:23:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT7fKM3xGhkFWV6va0SapYH2TO7B6xP7QxO0xrw9luuoR9DfnHeCeNKGPV/APXa6F65cLzqoRZ0FPVwBeNKdo=
X-Received: by 2002:a63:7e01:: with SMTP id z1mr3821713pgc.238.1637054615716;
 Tue, 16 Nov 2021 01:23:35 -0800 (PST)
MIME-Version: 1.0
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
In-Reply-To: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
From: "Priya N S" <priya.ns@mistralsolutions.com>
Date: Tue, 16 Nov 2021 14:53:19 +0530
Message-ID: <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: meta-arago@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>, Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>, 
	Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
X-BESS-ID: 1637054617-311185-5494-513-1
X-BESS-VER: 2019.1_20211115.2046
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235891 [from 
	cloudscan10-225.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

On Tue, Oct 26, 2021 at 7:12 PM Priya N S via lists.yoctoproject.org
<priya.ns=3Dmistralsolutions.com@lists.yoctoproject.org> wrote:
>
> Hi All,
> This series of patches fix the Matrix GUI Issue,
>
Did you get a chance to review this patch series?


Warm Regards,
Vigna Raja Priya N S


> Issue:
> After the target board is booted, by default the Matrix GUI Demo is
> not getting displayed on the display device connected to the target
> board.
> The root cause of the Matrix GUI demo issue is that there are two
> Weston system services running in the filesystem. Below are the two
> services,
> 1. Weston systemd service
> 2. Weston initscript service
> The Matrix GUI demo runs on top of the Weston service. Since there
> are two Weston services running, it causes the Matrix GUI demo to not
> work properly.
>
> Fix:
> Both Weston services (systemd and initscript) which has the same command
> and does the same job. So, remove the weston systemd services from the
> filesystem. This fix displays the Matrix GUI in the connected display
> device.
>
> Priya N S (2):
>   wayland: weston: Disable weston systemd service
>   weston-init: Update initscript for weston-calibration
>
>  .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
>  meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> --
> 2.19.1.windows.1
>
>
>
>=20
>
>
