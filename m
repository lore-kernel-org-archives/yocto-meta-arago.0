Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 20E7952B6B
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 13:44:17 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
	[209.85.216.69]) by
	mx-outbound47-108.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Jun 2021 13:45:01 +0000
Received: by mail-pj1-f69.google.com with SMTP id
	bx13-20020a17090af48db029016fb6fa83beso1789506pjb.3
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KkqrqyXJeVJEWRDCFWcLDlEnaZAm86FrBvYaJZpVf1I=;
	b=FNzrK0EIydbJUQbYTl9qJOXhFlDiNRTQmFNYUfrLgOfYgfdeihX0Epx+53AQyiVTxA
	PZsomqd11fvJZP7twqhJLzsY3auw7MstcfQes2gQqcveKx5v6dR48y/2gonUh++hITF0
	NU0bonstIAGrZPLQ2zvfWxUulTFSMvZ5L5igk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KkqrqyXJeVJEWRDCFWcLDlEnaZAm86FrBvYaJZpVf1I=;
	b=UfJeAak+l86ezxQbjSEPFGDwRKVnALaAC6UHPaaUZ41/WLShNKP2THGvBTmmby6wBv
	YaZNxaS86XKXjm27RdHD34DCeZQgyM0eqmjB23yD0/nlSUpmhCyW8I7Pu2vw8keT7S/R
	6qYz1XrP81AsKP2zVIl1sOQjCx9ZcBXPo+chD2zsf+ekG285NSPFIl2/jWvao/hWRzFs
	PIAdGFEk7YkqCksIXGO9m+3FQSUDbFZQMj1H3b4QcxaEuz6Kei2jjNES4KyVwkTBlUMs
	gJ/EtNz3BMOmENtptfDAZzb2TdPm9/QU9UAJQegtK0Rw7C8RyxOkLviq2fr9cE3IevBX
	dnmA==
X-Gm-Message-State: AOAM532tU2woNwDbxVwXyfhfyQdzsLjW3F4r0zadSjvkUKdwOb5oWYBN
	VNXO+RDSQLDwOD4qR4aR19zUhtFQxf5xChLMOvVREyEeBKf0w2IsVbHmhrtSRFmldoMT/SfPw03
	finMq8cBWkg1h+y1szQOxyPruuzLykYOEK4EHaVSs0X22Nr+Wfv2dx08qLpkcNRY5FzEZQS5/01
	PK
X-Received: by 2002:a17:902:f243:b029:11e:3249:4a17 with SMTP id
	j3-20020a170902f243b029011e32494a17mr22737440plc.0.1624369500785;
	Tue, 22 Jun 2021 06:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL4KA0+vlXKeDrNPUoqbO5bsQzMheMXYePAdiYonLnUt3OBBCq6hokeKN2DVSCgGlS/IIWpBtcyRiXVdgIWsQ=
X-Received: by 2002:a17:902:f243:b029:11e:3249:4a17 with SMTP id
	j3-20020a170902f243b029011e32494a17mr22737416plc.0.1624369500348;
	Tue, 22 Jun 2021 06:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
	<20210607212139.2n6flly5ek3bb5nh@oyster>
In-Reply-To: <20210607212139.2n6flly5ek3bb5nh@oyster>
From: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
Date: Tue, 22 Jun 2021 19:14:44 +0530
Message-ID: <CAHFpNO9VDXyydFHqabUQUgCzRReHvE_PiYw+ot3eZ59p-iOajw@mail.gmail.com>
To: Nishanth Menon <nm@ti.com>
X-BESS-ID: 1624369501-312140-21985-119854-1
X-BESS-VER: 2019.1_20210618.2139
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233105 [from 
	cloudscan9-222.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Cc: meta-arago@arago-project.org, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [master PATCH 0/3] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Tue, 22 Jun 2021 13:44:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 2:52 AM Nishanth Menon <nm@ti.com> wrote:
>
> On 16:05-20210607, Priya N S wrote:
> > From: Priya N S <priya.ns@ti.com>
> >
> > Hi All,
> > Below are the patches to fix the issues observed in the create-sdcard
> > script.
>
> a) Do these apply to meta-arago?

These patches need to be applied to the tisdk-setup-scripts repo.
I will update the subject line of the patches with the repo name in V2.

> b) why not use the wic and bmap files instead?

SD create scripts are supported in the SDK 7.03 release. Need to align
if we need to remove the support for SD create scripts and migrate to
wic files completely in the future release.

>
> >
> > Issue:
> > 1. The create-sdcard script uses 'rootfs' as a regex keyword to find
> > and list the filesystem tarballs which are available in the SDK
> > package. As in the current SDK packages, the tarball names are in the
> > following format,
> > tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz
> > Which doesn't have the rootfs keyword. This fails to list the tarballs
> > available in the package and crashes the script execution.
> > 2. The create-sdcard script detects a partitioned SD card as not
> > partitioned because of the failure of the size check condition in the
> > script.
> >
> > Fix:
> > 1. The 'image' is used as the regex keyword to match the tarball names
> > in the SDK packages.
> > 2. The usage of the cylinder size unit for partitioning the SD card is
> > removed since the cylinder size is SD card manufacturer dependent.
> > The parted command is replaced with fdisk since fdisk is an available
> > installed utility.
> >
> > Priya N S (3):
> >   create-sdcard.sh: fix regex used for rootfs tarball
> >   create-sdcard: Fix wrong rootfs tarball selection
> >   create-sdcard.sh: Stop using cylinder as unit for partition size
> >
> >  create-sdcard.sh | 75 +++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 58 insertions(+), 17 deletions(-)
> >
> > --
> > 2.19.1.windows.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

