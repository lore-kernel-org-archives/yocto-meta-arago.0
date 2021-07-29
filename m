Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 0760B52A71
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:44:44 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
	[209.85.216.70]) by
	mx-outbound11-201.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:44:56 +0000
Received: by mail-pj1-f70.google.com with SMTP id
	f1-20020a17090a8e81b029017720af1cf6so6326085pjo.9
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5b5N1X94MDvFpFwPiwzzTewL66uNujfb+Ty2YYF8KRc=;
	b=hOALD20pH4fM8iOVZ8/3KBv1LN01Q59bYwfbnxOpvj/6l6goIoPR4KKoN9hYLu4w7+
	SX50Vdz6Yx0LXoVIv1g9lng6k+UN898cYXEwqtLn31MBrTxobisPrRwP+trF6ntFJS8D
	+Fp/3ccy9CcMFrdZzOpdwwsEAeGGT5Gn8t4ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5b5N1X94MDvFpFwPiwzzTewL66uNujfb+Ty2YYF8KRc=;
	b=mmm9UJt9uDNSCdsAPY5NsOO4dFlZ8SmKvM2wQqKMCLCWUTYJVwF8DT0srIGOJMCC/6
	X64vofAtLrqBmhRMqKZW+hl4tqLb+GP7B3FJQ1p0JNH7dh5kYxq6x62/bIlsJQH0coZn
	KUrcrim5sixIcyq9Zu/JN5X2uwTabgkwWs9EOlEvksNYvbP8LPCT748/6UKmWoPH/RxR
	Jh9jDLp8zLcnSjYcqNaHSHGMmRWteRr66N1rdQ8fZQg5Qt7zY1ksBMmH9dupjWUO0KYh
	1lIxcbzul9IF/A+pUiLVeJ8oNojw9qCMzWwKjsWPVTKPXDB38rWBXn0+bpUsfQQqS+Q7
	UpNQ==
X-Gm-Message-State: AOAM530sv6rDRZVtCRB92UMu0FKwkEvu3Zho0bIa8yLEm+vUfybzrFOv
	Ha5gLLbYkDhDBiKQbkxrrxPuApKkDW+DnC/Q32YMQAX1q5L2mPVbZpFkJlx88WU+3pnINK4UF4X
	ipdwz3h2n7uISboWwPhrIVp+tbiGyHjkWPMdnlQcmTlwo+u1QDJcwQlaO662yGRb0d2NZ+xopz9
	Qh
X-Received: by 2002:a05:6a00:1713:b029:332:7eca:41a1 with SMTP id
	h19-20020a056a001713b02903327eca41a1mr5025308pfc.26.1627562694371;
	Thu, 29 Jul 2021 05:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2StJr+G8XYrjjgoU2VgHtBTqpLiF/+Hpg3p6u42/+lDiwBzwlsTCgfJzpFlyveLFXZzvWERfCo1UusSyLYkU=
X-Received: by 2002:a05:6a00:1713:b029:332:7eca:41a1 with SMTP id
	h19-20020a056a001713b02903327eca41a1mr5025265pfc.26.1627562693901;
	Thu, 29 Jul 2021 05:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210707031414.46720-1-priya.ns@ti.com>
	<20210707031414.46720-4-priya.ns@ti.com>
	<20210707150846.xbig63m3xffymcnq@overcast>
In-Reply-To: <20210707150846.xbig63m3xffymcnq@overcast>
From: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
Date: Thu, 29 Jul 2021 18:14:31 +0530
Message-ID: <CAHFpNO-PRq4d_=THaTJ9Dz0ZoRB6naR6_y5dwNStj1-nJvvZ3g@mail.gmail.com>
To: Nishanth Menon <nm@ti.com>
X-BESS-ID: 1627562695-303017-5530-72205-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan9-243.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V3 3/3] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Thu, 29 Jul 2021 12:44:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 8:38 PM Nishanth Menon <nm@ti.com> wrote:
>
> On 08:44-20210707, Priya N S wrote:
> > From: Priya N S <priya.ns@ti.com>
> >
> > * Cylinder size of sdcard is manufacturer dependent. To standardize
> >   sdcard partitioning remove the use of cylinder (cyl) unit.
> > * While at it shift to using fdisk for the partitioning the sdcard.
> >   fdisk is already used in the script and this reduces the dependencies
> >   of this script on available installed applications.
> > * This fixes cases where already partitioned cards were being detected
> >   as not partitioned because of size check elsewhere in the script
> >   failing.
> >
> > Signed-off-by: Priya N S <priya.ns@ti.com>
> > Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> > ---
> >  create-sdcard.sh | 50 +++++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 41 insertions(+), 9 deletions(-)
> >
> > diff --git a/create-sdcard.sh b/create-sdcard.sh
> > index d052312..546588b 100644
> > --- a/create-sdcard.sh
> > +++ b/create-sdcard.sh
> > @@ -501,11 +501,29 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
> >
> >  echo DISK SIZE - $SIZE bytes
> >
> > -parted -s $DRIVE mklabel msdos
> > -parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> > -parted -s $DRIVE set 1 boot on
> > -parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
> > -parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
> > +cat << END | fdisk $DRIVE
> > +n
> > +p
> > +1
> > +
> > ++75M
>
> https://lists.yoctoproject.org/g/meta-ti/topic/83851299#13855
> Should we make boot partition 128MB as default to make sure it is in
> sync with wic image sizes?
The partition size increase to 128MB is updated in the V4 patch.
>
> > +n
> > +p
> > +2
> > +
> > ++2.4G
> > +n
> > +p
> > +3
> > +
> > +
> > +t
> > +1
> > +c
> > +a
> > +1
> > +w
> > +END
> >
> >
> >  cat << EOM
> > @@ -559,10 +577,24 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
> >
> >  echo DISK SIZE - $SIZE bytes
> >
> > -parted -s $DRIVE mklabel msdos
> > -parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> > -parted -s $DRIVE set 1 boot on
> > -parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
> > +cat << END | fdisk $DRIVE
> > +n
> > +p
> > +1
> > +
> > ++75M
> same ^^ ?
The partition size increase to 128MB is updated in the V4 patch.

