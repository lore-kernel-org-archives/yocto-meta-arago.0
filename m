Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id AD364529FC
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:06:05 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
	[209.85.210.199]) by
	mx-outbound14-245.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:06:09 +0000
Received: by mail-pf1-f199.google.com with SMTP id
	s14-20020a056a00194eb02903245e1dd027so985391pfk.20
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=prBAyS7ALP977qgn1Uu85BXEbMqxbNLrZOizqdp/89A=;
	b=kXrgeMCXtnv+Isy6ql26JxmevSdHfYGLJV0RxROW2dsYS7NgVpNGBDWb0jTD5IZiXS
	xEOmw7w6L1b6Rj26V0doL17eCTgF3bOt3PDskSxTPjQAQEz6MLuBeG0jMkGoPGTLK08r
	0Cv9iBd+aYu/LraLWuzx3/Dv/u/46lnNXP65c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=prBAyS7ALP977qgn1Uu85BXEbMqxbNLrZOizqdp/89A=;
	b=Wvyk1Fp1oLyDbGUjyRLOLGIkdMakXypTxMWPVNYW1p+n7Rfw/33ekKPRBoVJhKeFsK
	0cSa8C3a7Cw9AIIsOUdRrnMnRs04e6esXQzMqQ6hvOvbX7dRGB6xBD3aFoA+qwj9wURS
	mDm1LxmIFs1Ngm2buk0k7kBKVFd4AW9M5gPVcr2X31BauKEjaD7Zo7bvv1hp1g/vgz1v
	GzW/YBsu0kIhq398KpYrdEJD+dbjUuXhN4tzxw8uDI2lX5yhOxc972glSezoO0LQGGjI
	cDnBbbLlxhxE8APeDbfY+c6NX3vTYFmiX0uFaCis2LrKWBBKPYMzGvl+7cER8Gf9xxfo
	G3eQ==
X-Gm-Message-State: AOAM5305FeeHUTq4R2UJvZskbEAIR9iVnj2hpRIzXN1swE10ouKJtsa9
	8a2MW8XqZP9ek+gqlgNUjjBrunXm3hPF03SF3KqhiuGf7fH5fZvX2SWwNE2IOAgP0zuDjVq9e++
	PqSDP7uGWrw0yWjXDgGMtcHCzgsrPUJJxWp1yC4gKhBnQMA8atD0il4y+Xs9nVQqihmsGOG0Mzu
	kB
X-Received: by 2002:a63:5450:: with SMTP id e16mr24473714pgm.50.1625645167738; 
	Wed, 07 Jul 2021 01:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7UocW7pFlZoL8+FgQbDI4VwBRJa1QfH+EAJN1FGMzFck27aUrVkw6TKbNnya/e9LiENNYhf2dD29S1ZKlfxY=
X-Received: by 2002:a63:5450:: with SMTP id e16mr24473688pgm.50.1625645167449; 
	Wed, 07 Jul 2021 01:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
	<20210622134500.87848-3-priya.ns@mistralsolutions.com>
	<20210623031902.ngujfnp4iqwv2iz3@turkey>
In-Reply-To: <20210623031902.ngujfnp4iqwv2iz3@turkey>
From: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
Date: Wed, 7 Jul 2021 08:05:51 +0530
Message-ID: <CAHFpNO_ZMFcizpUspf+PbR3Bg0q34XEtfe8RmPPRdmm=qSygyg@mail.gmail.com>
To: Nishanth Menon <nm@ti.com>
X-BESS-ID: 1625645168-303829-21306-12913-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.210.199
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan21-204.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.01 DATE_IN_PAST_03_06 HEADER: Date: is 3 to 6 hours before Received:
	date 1.08 DATE_IN_PAST_03_06_2   META:  
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=1.09 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, DATE_IN_PAST_03_06,
	DATE_IN_PAST_03_06_2, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V2 2/3] create-sdcard: Fix wrong rootfs tarball selection
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jul 2021 08:06:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 8:49 AM Nishanth Menon <nm@ti.com> wrote:
>
> On 19:14-20210622, Priya N S wrote:
> > From: Priya N S <priya.ns@ti.com>
> >
> > From: Priya N S <priya.ns@ti.com>
> >
> > * Validate user input of rootfs tarball selection.
> > * This will not allow the user to proceed with wrong rootfs
> >   tarball selection.
> >
> > Signed-off-by: Priya N S <priya.ns@ti.com>
> > Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> > ---
> >  create-sdcard.sh | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/create-sdcard.sh b/create-sdcard.sh
> > index 264095a..8f99687 100644
> > --- a/create-sdcard.sh
> > +++ b/create-sdcard.sh
> > @@ -767,9 +767,19 @@ cat << EOM
> >
> >  EOM
> >               ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "        " , $1'}
>
> Do you want to move this inside the while loop?
Moved inside the while loop in the V3 patch.

>
> > -             echo ""
> > -             read -p "Enter Number of rootfs Tarball: " TARNUMBER
> > -             echo " "
> > +             COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
> > +             ENTERCORRECTLY="0"
> > +             while [ $ENTERCORRECTLY -ne 1 ]
> > +             do
> > +                     read -p "Enter Number of rootfs Tarball: " TARNUMBER
> > +                     echo " "
>
> just echo?
>
> > +                     if [ -z "${TARNUMBER//[0-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
>
> if COUNT=2 is '0' a valid entry? While the above might be a smart code,
> I wonder if we could simplify for readability?
>
>
> > +                             ENTERCORRECTLY=1
> 'break' should simplify this loop?
> > +                     else
> > +                             echo "Invalid selection!"
> Could we articulate this to be "Invalid selection: '$TARNUMBER'. Please use values from 1 to $COUNT"
> > +                     fi
> > +                     echo ""
> "" is redundant.
>
> I don't think the following is proper - does'nt handle 0 case, but..
> maybe?
The '0' input error is handled and updated in the V3 patch along with
the other review comments.

