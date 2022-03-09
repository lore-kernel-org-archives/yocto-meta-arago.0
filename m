Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web11.1332.1646792846226701011
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=TGjer3f6;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198]) by mx-outbound11-206.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 09 Mar 2022 02:27:23 +0000
Received: by mail-pf1-f198.google.com with SMTP id d145-20020a621d97000000b004f7285f67e8so696679pfd.2
        for <meta-arago@lists.yoctoproject.org>; Tue, 08 Mar 2022 18:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BHRIjuRspZ+p4rbqDKadUKa6a8aNPBp6fx6bq+4zaaA=;
        b=TGjer3f6sIrVhY/j/yAJ1h/pXrh4lHTex9GioW1CDu+GhOXqLdtiXhpch4Lc+q6OIb
         oEFXc5GzoPf5qi/pPXT5bWf3MQhoOnL9CBgLqrdY4nJNCsrlEAedyhjRkvWzpBFGAngv
         ZyfuyKozcEEFWB0GW6gzhFvj0WQuoJ3RrMZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BHRIjuRspZ+p4rbqDKadUKa6a8aNPBp6fx6bq+4zaaA=;
        b=V8LBs6IRj9VQ7k9AV+I6Zi9qWEkS6gXbWdUDQ8KCdF6lRZhfJJSmBBCj1DQXObKt7O
         m8WpF05A6G89Cs4eW+Kb5dN/OsyAMA1JdURW1QV3eOyE3W73dRJSNxy4mtkW9cGabf8L
         77eln1uFcu6H5Gnit2NYRIe1fYpOI3pS3YEIA5tayZ9hIgLn202EusifsPsN2d+0aloL
         MEavjLZVJllx5o6f71PBz31+c4ysyRBVxEtZJ6h/dXXgW5rAV+4cHBLABKIUMsHk9b2n
         454mElslra4Gsd9x9fdp4x3NeCf9fqpfNBQOntVLUtbGZB9Tb6Hcffcn6nEHGFRHod7q
         CoVQ==
X-Gm-Message-State: AOAM5318sFb5a0zn70vqMmQnlTbqBIp+BSCCLtG0K6069+u3QInTaT99
	AuyErcku68nT370agpH8UWMHN0vaaFu/Eg2oAjXgBt6KoHiILP085L/tVGgaj0ZEq8XWK7WCYyu
	IslfI6pnx8H6fMa9/RM/g+8ISA3cswyxLVJBrOVl1JsaXqSZoYMdjSBflOtsIWv4DnSKw8iIOXs
	ANcpkNj+E=
X-Received: by 2002:a63:da0d:0:b0:364:b771:ff4 with SMTP id c13-20020a63da0d000000b00364b7710ff4mr16783942pgh.514.1646792842602;
        Tue, 08 Mar 2022 18:27:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ5frRr73qRm8ACnHl1oUJm02SSVx+mJ9JB37pZ8fjGbC2ikcseHlNRSYP+kBEBReeZCLQPTUMPF6lbeDiuc4=
X-Received: by 2002:a63:da0d:0:b0:364:b771:ff4 with SMTP id
 c13-20020a63da0d000000b00364b7710ff4mr16783927pgh.514.1646792842238; Tue, 08
 Mar 2022 18:27:22 -0800 (PST)
MIME-Version: 1.0
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
 <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
 <16BAA88B2E614BBE.14741@lists.yoctoproject.org> <20220216215304.GR26229@denix.org>
 <aad23319-72e2-85ae-0501-a1424dc625e8@ti.com> <CAHFpNO9Dptu=xxZRnDWRLE-L9oKw-22Yt_YVWRdVvpdg_1UPMQ@mail.gmail.com>
 <7250b6fb-ae55-3d16-1f2c-677ca464c502@ti.com>
In-Reply-To: <7250b6fb-ae55-3d16-1f2c-677ca464c502@ti.com>
From: "Priya N S" <priya.ns@mistralsolutions.com>
Date: Wed, 9 Mar 2022 07:57:05 +0530
Message-ID: <CAHFpNO-yHjcvb-bqzJww19p0-Xx1Jcat=e+L2G2_zzdZDbC-vQ@mail.gmail.com>
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: Ryan Eatmon <reatmon@ti.com>
Cc: detheridge@ti.com, Denys Dmytriyenko <denis@denix.org>, meta-arago@lists.yoctoproject.org, 
	Praneeth Bajjuri <praneeth@ti.com>, Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>
X-BESS-ID: 1646792843-303022-5379-40159-1
X-BESS-VER: 2019.1_20220304.0103
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.238443 [from 
	cloudscan19-20.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2022 at 7:54 AM Ryan Eatmon via lists.yoctoproject.org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
>
> Those patches were merged in a few RCs ago.
>
>
Thanks, Ryan for the information.

Warm Regards,
Vigna Raja Priya N S

> On 3/8/2022 20:22, Vigna Raja Priya N S wrote:
> > On Thu, Feb 17, 2022 at 3:46 AM Etheridge, Darren via
> > https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoprojec=
t.org&c=3DE,1,EJPYxN5U2w_yZC7VYq-7bbAPLGOhycxxOE6Sey2wu7I3Mzr_KbYWaDEABn98F=
5jI7Xh-hvQ_w2dJczwWAuIWRCZGp0S9a8CzBjDnpsB1nw3CqC5s&typo=3D1 <detheridge=3D=
ti.com@lists.yoctoproject.org>
> > wrote:
> >>
> >> Denys,
> >>
> >> On 2/16/2022 3:53 PM, Denys Dmytriyenko wrote:
> >>> Darren, Ryan,
> >>>
> >>> These 2 patch have never been applied to Dunfell!
> >>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproj=
ect.org%2fg%2fmeta-arago%2ftopic%2f86602755%2313358&c=3DE,1,ZnF57xRV7nLnoZi=
xsGg41IEPFqZvJZTeN1xrW8i8RWH_R4ZjIMnYin7x5M558qiMtuJ9QLCRWFxUsNY95SN1DxcpHC=
UyED4hzZyDmni1iE2ElPk,&typo=3D1
> >>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproj=
ect.org%2fg%2fmeta-arago%2fmessage%2f13356&c=3DE,1,kDtAk75kjUMvvyf-C6PdVlPK=
5uPbqGihqWZmZHk-Yu7q3oDzY6r413wJY2X74ZgEIDL7e2o1hBx70haY6v1hzWHux3kvDz4SgNf=
EXr6kPYW16n_uGzi3Fs0,&typo=3D1
> >>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproj=
ect.org%2fg%2fmeta-arago%2fmessage%2f13357&c=3DE,1,NbQLSL4ciRz_tQQ0mnbLemNd=
_xkGu-FDWY9waz_Swara7ndBoUNVeEAsTsltDefE6bhQOtCs9smxjy6uNYVH-UNx0rltoMFoafv=
MRAs6TntGik1o0qQ,&typo=3D1
> >>
> >> Those will take care of what I am seeing.
> >>
> >> Thanks
> >>
> > Darren,
> > Can you please merge the above-mentioned 2 patches into meta-arago if
> > the patches are good for the merge?
> >
> > Warm Regards,
> > Vigna Raja Priya N S
> >>>
> >>>
> >>> On Wed, Nov 24, 2021 at 09:18:42PM -0500, Denys Dmytriyenko wrote:
> >>>> On Tue, Nov 16, 2021 at 02:53:19PM +0530, Priya N S via https://link=
protect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,Vo=
XbrQWkvEHvM-WF4CvBKZeZVvW70zsWX7YzDGdG4aT2lesoEuMl1lcGaP5ot_Uo_aV3cNLpU33EJ=
aLqDlZr1bgol0bSSG-Df9IAMUdro3LRZokpU3JMzw,,&typo=3D1 wrote:
> >>>>> Hi Denys,
> >>>>>
> >>>>> On Tue, Oct 26, 2021 at 7:12 PM Priya N S via https://linkprotect.c=
udasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,bWq4pmqhaYM=
cCeae7wjDauguMWMqnXy6jmVcIHulaYSXFlwW-My_21WyvaCuFGmHJoaJnBOr6c2CpJ6OD8QckM=
Zl5ZOnCGKxqk_DPKp1qHlqedOUk4BWIDG0cds,&typo=3D1
> >>>>> <priya.ns=3Dmistralsolutions.com@lists.yoctoproject.org> wrote:
> >>>>>>
> >>>>>> Hi All,
> >>>>>> This series of patches fix the Matrix GUI Issue,
> >>>>>>
> >>>>> Did you get a chance to review this patch series?
> >>>>
> >>>> Patches look reasonable to me. Thanks.
> >>>>
> >>>>
> >>>>> Warm Regards,
> >>>>> Vigna Raja Priya N S
> >>>>>
> >>>>>
> >>>>>> Issue:
> >>>>>> After the target board is booted, by default the Matrix GUI Demo i=
s
> >>>>>> not getting displayed on the display device connected to the targe=
t
> >>>>>> board.
> >>>>>> The root cause of the Matrix GUI demo issue is that there are two
> >>>>>> Weston system services running in the filesystem. Below are the tw=
o
> >>>>>> services,
> >>>>>> 1. Weston systemd service
> >>>>>> 2. Weston initscript service
> >>>>>> The Matrix GUI demo runs on top of the Weston service. Since there
> >>>>>> are two Weston services running, it causes the Matrix GUI demo to =
not
> >>>>>> work properly.
> >>>>>>
> >>>>>> Fix:
> >>>>>> Both Weston services (systemd and initscript) which has the same c=
ommand
> >>>>>> and does the same job. So, remove the weston systemd services from=
 the
> >>>>>> filesystem. This fix displays the Matrix GUI in the connected disp=
lay
> >>>>>> device.
> >>>>>>
> >>>>>> Priya N S (2):
> >>>>>>     wayland: weston: Disable weston systemd service
> >>>>>>     weston-init: Update initscript for weston-calibration
> >>>>>>
> >>>>>>    .../recipes-graphics/wayland/weston-init.bbappend            | =
5 ++++-
> >>>>>>    meta-arago-distro/recipes-graphics/wayland/weston-init/init  | =
2 +-
> >>>>>>    2 files changed, 5 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> --
> >>>>>> 2.19.1.windows.1
> >>>
> >>
> >>
> >>
> >>
> >>
>
> --
> Ryan Eatmon
> reatmon@ti.com
>
>
>=20
>
>
