Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web09.1317.1646792583261318186
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=MdgP/gBb;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound44-0.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 09 Mar 2022 02:23:00 +0000
Received: by mail-pj1-f70.google.com with SMTP id l14-20020a17090a660e00b001bf496be6d0so662553pjj.7
        for <meta-arago@lists.yoctoproject.org>; Tue, 08 Mar 2022 18:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UhknkRq6ksfElVYEOztQ/PUhi2DfLA3rhMG5eopLZnI=;
        b=MdgP/gBbsYkzi07nGA6h1AfUVP68UrxgupgNogGadMXDNgVoq4vhMUFzzgqVXjswQ0
         tptBTEj0QsXOYnx2mmFrDyYj/rLim5xaZiA6ZzU3RGVrcp/pjbAALpk196VQyACvtdxN
         eVY45z/6GycySxDhoO6wyiC3Dgk1GslzDjqXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UhknkRq6ksfElVYEOztQ/PUhi2DfLA3rhMG5eopLZnI=;
        b=ZstDpHzAgcQOed9WtBsn1X+7WLlJ1VWjKbMP7eJWVRghwcOqmgjlmZR5fCfQ74J0RX
         xTGdwHhKlHfn5hRUxbfDKX4a/p/iMDVS03bTV4PcsB3Q29jZkNcmNckLWVAvOlClKtWw
         bxELlOmL1unwaMmBV+ESnD43cZsy2xuy/K9qT5wiB9LRxFagfKzoOOIOUAre0VDjFV7Y
         aoa7ntxTPyF67ZNaR8AdkQRfh1w6AN1ZdKxQkAk4D91gnSz671B7wdtFzcAfAus2i68r
         LlS+bZxEtvTivN+Hyc899RD0onvFcL2wFd23pPmN9J2NFpQSHX0T5iKWkEh2yvr/pcOh
         Aomg==
X-Gm-Message-State: AOAM531gXiWT2Febc/amSX5vfnCVnmqXGdcfRsjQh5qgPaBPpDZhrKbt
	xV0Vg5WD0v7jzyGzc4BvvRlN3D4GU4/hqk4UU0jMmmNNx8bKWTC63/9k3yIhl3dKNdmpiss0zoQ
	ukhw8WYE5jGB8jdcGnXnfMQCdtGJUz7hBVFJvbopciSvO6h9wGHTm7fmSvIdvQaTEDD6dpSGLk5
	1C08bDyvk=
X-Received: by 2002:a05:6a00:194c:b0:4f7:29e7:f3e9 with SMTP id s12-20020a056a00194c00b004f729e7f3e9mr7296245pfk.74.1646792579058;
        Tue, 08 Mar 2022 18:22:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkjRI/p1hB8RKZ9JCNRhdIVXeZXQWzaEY1sL45jgxI4oXC2G63YxqEFtv2QoUUQ7gaFn0L0v/gYWy409WAXgU=
X-Received: by 2002:a05:6a00:194c:b0:4f7:29e7:f3e9 with SMTP id
 s12-20020a056a00194c00b004f729e7f3e9mr7296225pfk.74.1646792578685; Tue, 08
 Mar 2022 18:22:58 -0800 (PST)
MIME-Version: 1.0
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
 <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
 <16BAA88B2E614BBE.14741@lists.yoctoproject.org> <20220216215304.GR26229@denix.org>
 <aad23319-72e2-85ae-0501-a1424dc625e8@ti.com>
In-Reply-To: <aad23319-72e2-85ae-0501-a1424dc625e8@ti.com>
From: "Priya N S" <priya.ns@mistralsolutions.com>
Date: Wed, 9 Mar 2022 07:52:42 +0530
Message-ID: <CAHFpNO9Dptu=xxZRnDWRLE-L9oKw-22Yt_YVWRdVvpdg_1UPMQ@mail.gmail.com>
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: detheridge@ti.com
Cc: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org, 
	Praneeth Bajjuri <praneeth@ti.com>, Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>
X-BESS-ID: 1646792579-311264-5567-40052-1
X-BESS-VER: 2019.1_20220304.0103
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.238443 [from 
	cloudscan19-20.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 3:46 AM Etheridge, Darren via
lists.yoctoproject.org <detheridge=3Dti.com@lists.yoctoproject.org>
wrote:
>
> Denys,
>
> On 2/16/2022 3:53 PM, Denys Dmytriyenko wrote:
> > Darren, Ryan,
> >
> > These 2 patch have never been applied to Dunfell!
> > https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoprojec=
t.org%2fg%2fmeta-arago%2ftopic%2f86602755%2313358&c=3DE,1,ZnF57xRV7nLnoZixs=
Gg41IEPFqZvJZTeN1xrW8i8RWH_R4ZjIMnYin7x5M558qiMtuJ9QLCRWFxUsNY95SN1DxcpHCUy=
ED4hzZyDmni1iE2ElPk,&typo=3D1
> > https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoprojec=
t.org%2fg%2fmeta-arago%2fmessage%2f13356&c=3DE,1,kDtAk75kjUMvvyf-C6PdVlPK5u=
PbqGihqWZmZHk-Yu7q3oDzY6r413wJY2X74ZgEIDL7e2o1hBx70haY6v1hzWHux3kvDz4SgNfEX=
r6kPYW16n_uGzi3Fs0,&typo=3D1
> > https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoprojec=
t.org%2fg%2fmeta-arago%2fmessage%2f13357&c=3DE,1,NbQLSL4ciRz_tQQ0mnbLemNd_x=
kGu-FDWY9waz_Swara7ndBoUNVeEAsTsltDefE6bhQOtCs9smxjy6uNYVH-UNx0rltoMFoafvMR=
As6TntGik1o0qQ,&typo=3D1
>
> Those will take care of what I am seeing.
>
> Thanks
>
Darren,
Can you please merge the above-mentioned 2 patches into meta-arago if
the patches are good for the merge?

Warm Regards,
Vigna Raja Priya N S
> >
> >
> > On Wed, Nov 24, 2021 at 09:18:42PM -0500, Denys Dmytriyenko wrote:
> >> On Tue, Nov 16, 2021 at 02:53:19PM +0530, Priya N S via https://linkpr=
otect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,VoXb=
rQWkvEHvM-WF4CvBKZeZVvW70zsWX7YzDGdG4aT2lesoEuMl1lcGaP5ot_Uo_aV3cNLpU33EJaL=
qDlZr1bgol0bSSG-Df9IAMUdro3LRZokpU3JMzw,,&typo=3D1 wrote:
> >>> Hi Denys,
> >>>
> >>> On Tue, Oct 26, 2021 at 7:12 PM Priya N S via https://linkprotect.cud=
asvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,bWq4pmqhaYMcC=
eae7wjDauguMWMqnXy6jmVcIHulaYSXFlwW-My_21WyvaCuFGmHJoaJnBOr6c2CpJ6OD8QckMZl=
5ZOnCGKxqk_DPKp1qHlqedOUk4BWIDG0cds,&typo=3D1
> >>> <priya.ns=3Dmistralsolutions.com@lists.yoctoproject.org> wrote:
> >>>>
> >>>> Hi All,
> >>>> This series of patches fix the Matrix GUI Issue,
> >>>>
> >>> Did you get a chance to review this patch series?
> >>
> >> Patches look reasonable to me. Thanks.
> >>
> >>
> >>> Warm Regards,
> >>> Vigna Raja Priya N S
> >>>
> >>>
> >>>> Issue:
> >>>> After the target board is booted, by default the Matrix GUI Demo is
> >>>> not getting displayed on the display device connected to the target
> >>>> board.
> >>>> The root cause of the Matrix GUI demo issue is that there are two
> >>>> Weston system services running in the filesystem. Below are the two
> >>>> services,
> >>>> 1. Weston systemd service
> >>>> 2. Weston initscript service
> >>>> The Matrix GUI demo runs on top of the Weston service. Since there
> >>>> are two Weston services running, it causes the Matrix GUI demo to no=
t
> >>>> work properly.
> >>>>
> >>>> Fix:
> >>>> Both Weston services (systemd and initscript) which has the same com=
mand
> >>>> and does the same job. So, remove the weston systemd services from t=
he
> >>>> filesystem. This fix displays the Matrix GUI in the connected displa=
y
> >>>> device.
> >>>>
> >>>> Priya N S (2):
> >>>>    wayland: weston: Disable weston systemd service
> >>>>    weston-init: Update initscript for weston-calibration
> >>>>
> >>>>   .../recipes-graphics/wayland/weston-init.bbappend            | 5 +=
+++-
> >>>>   meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +=
-
> >>>>   2 files changed, 5 insertions(+), 2 deletions(-)
> >>>>
> >>>> --
> >>>> 2.19.1.windows.1
> >
>
>
>=20
>
>
