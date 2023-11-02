Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13B1C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 06:57:15 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.25481.1698908235098943124
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 23:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=JNPQ06i6;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197]) by mx-outbound43-81.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 02 Nov 2023 06:57:12 +0000
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cdce61c6cso5317521cf.3
        for <meta-arago@lists.yoctoproject.org>; Wed, 01 Nov 2023 23:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1698908231; x=1699513031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seYYo0oU/5CZl5MdDQEVa16minQLxlxjmYAqS9d3qc8=;
        b=JNPQ06i6ZQI2hg8+t8UkcW2mEWSvAa/C7kqIJTeYsBmVSFM8GoqBPHtHmrGCP2Ki5H
         mT+RXv+QnkBV75kmbyuOGuQK6w5cUD6YvjYHro7sqCZsjMkhOv/Y2Jj+RlZVPBeojOar
         LYhZpR0H8D2kLS7t4L4uXmZ/iYBFFkepr93pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698908231; x=1699513031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seYYo0oU/5CZl5MdDQEVa16minQLxlxjmYAqS9d3qc8=;
        b=gLNM4ib716UWZ6bjUDsstygXHqcrnF47BbpZxEvOUd/3+NFBik4qu4E4qd8qwhgPlS
         8HnH2U8/4/b8gh0nGY7eAhoufX4hWAlLyJQpeJDFxtlBDRwcIerjNatrpswVtnOMR/z2
         zg7fqJtlir6FqkJukF+d7a7ReBFzfoymD7Fc1O/JkXMbjJlOitViXz4N3BoB/by4kN4S
         xjIJ1gbaswMJpQx6hZDR1ThRcLETHnvrFmDFtY43bAjswHtpQZuKhfXAf20oY+lWCkh6
         eib+SP3ORfmjtlsIJZM/ecpUdRjf/ZQ5mrhWUzNhWHxzXlnMmtkZ50MGUo7vgCBhsfnF
         QdjQ==
X-Gm-Message-State: AOJu0Yz5bVk6WJavQXCPXFZtmdFnes1slbuftCckC8/uiSnmC1q1c5Ha
	qBqTKKnuB+1NmYJvZOicJmWI7yplVlGVRMwgtwoPBoR27U493IntPLLDugZBj+QNmFX46G1dZZo
	67NCldAFnyhEOB01FS1k3339aQFkWC90LojXSbXH6UpMrIMzeFmcw2Mkj0hUZWXXNRrAasMnV7A
	WWQvGeyHgvq8IUzAUmfg==
X-Received: by 2002:a05:622a:34a:b0:412:22cf:83fa with SMTP id r10-20020a05622a034a00b0041222cf83famr21383144qtw.28.1698908231574;
        Wed, 01 Nov 2023 23:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVhkpd7uryLnEhsxumhWSie/IVUVxM0VtCt4+mE2iPQ8/2PMwDW2GBa9zAa8OBF+9kqpklEbd3PBSIq18ug6g=
X-Received: by 2002:a05:622a:34a:b0:412:22cf:83fa with SMTP id
 r10-20020a05622a034a00b0041222cf83famr21383130qtw.28.1698908231167; Wed, 01
 Nov 2023 23:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231101092855.101794-1-sabiya.d@ti.com> <20231101092855.101794-2-sabiya.d@ti.com>
 <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
In-Reply-To: <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
From: Dasnavis Sabiya <sabiya.d@mistralsolutions.com>
Date: Thu, 2 Nov 2023 12:26:55 +0530
Message-ID: <CAAyKsAYjtj8MR1HE=VJ40v36LjHywvSaE0qSR4t16r2BFBaWwA@mail.gmail.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-initramfs:
 Add e2fsprogs-mke2fs and dosfstools
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Dasnavis Sabiya <sabiya.d@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1698908232-311089-15688-42011-1
X-BESS-VER: 2019.1_20231024.1900
X-BESS-Apparent-Source-IP: 209.85.160.197
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkZGxpZAVgZQMDXRMDXVwNjcNN
	HCMsXCzMIi0TLJ3CDZJM3IwhIoY6ZUGwsAw4Zm/0EAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.251853 [from 
	cloudscan17-251.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Nov 2023 06:57:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14987

Hi Ryan,

On Wed, Nov 1, 2023 at 7:08=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 11/1/2023 4:28 AM, sabiya.d@mistralsolutions.com wrote:
> > From: Dasnavis Sabiya <sabiya.d@ti.com>
> >
> > Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat
>
>
> Right now the only image that is using this package group is the tiny
> image.  And part of the goal of the tiny image is to remain as small as
> possible.
>
> The intent of the tiny image is to support the initial wakeup efforts.
> During this time the various hardware settings are not fully known and
> so external memory and other things do not work.  The initramfs is meant
> to provide the bare minimal OS needed to fit into the on-chip SRAM to
> figure out those settings.  Once those settings are figured out, we
> never go back to the tiny image.
>
> So what is the need for the mkfs tools in the tiny image?  Why not use a
> bigger image that has these tools in it?
>
There is a customer requirement to provide production programming
solution to use arago-tiny-image to partition and program
the boot media like eMMC. We need these utilities to format the eMMC.
Please refer https://jira.itg.ti.com/browse/LCPD-34783
>
>
> > Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> > ---
> >   .../packagegroups/packagegroup-arago-initramfs.bb        | 9 ++++++++=
+
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-initramfs.bb
> > index 380cc0e3..10412784 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-i=
nitramfs.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-i=
nitramfs.bb
> > @@ -1,4 +1,13 @@
> >
> >   require recipes-core/packagegroups/packagegroup-core-boot.bb
> >
> > +ARAGO_FSTOOLS =3D "\
> > +    e2fsprogs-mke2fs \
> > +    dosfstools \
> > +    "
> > +
> >   RDEPENDS:${PN}:remove =3D "grub-efi kernel"
> > +
> > +RDEPENDS:${PN}:append =3D "\
> > +    ${ARAGO_FSTOOLS} \
> > +    "
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

Regards,
Dasnavis Sabiya

