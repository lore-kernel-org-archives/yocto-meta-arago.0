Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id BCA49529E5
	for <meta-arago@arago-project.org>;
	Fri, 27 Aug 2021 10:54:46 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
	[209.85.216.69]) by mx-outbound9-92.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Aug 2021 10:55:11 +0000
Received: by mail-pj1-f69.google.com with SMTP id
	nn5-20020a17090b38c500b00179d350674aso350302pjb.5
	for <meta-arago@arago-project.org>;
	Fri, 27 Aug 2021 03:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ffa3dfPreMyTzJIYJZL2DKVB8dZN3XQsZaiZaofOYrA=;
	b=evVcLy4spLymX8niIVBhchdw+tEYbRGSTDgHCQz2jMIFLKWl3PqjL7cpEfPHoqrLhu
	I+k0GVWOTnwwh+WuKWagzU9JqXsvHJCVNNjhFmCePyYAAB5bRWzSy4tDs7rr1zsKlQnY
	aaoMmKM1YNuzjXkXXuLrUp0Pw7oHPHCYWKmQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ffa3dfPreMyTzJIYJZL2DKVB8dZN3XQsZaiZaofOYrA=;
	b=um7pkL0usMDBP/D/MSPkyr4q/9RpT4yRjdd9OcXKoIYOBd0zDbT//GwJnGoYXELNXl
	Qok9wyi9DziGb4gZPTrDGK1Pbi3t4u+BKu8xLCbCq7aavp1lV4GOfvfZktlJCb6g/7hD
	FvXebjBu9kqkPfoG8X95ZcXfZjR/IWWN7cv9xKzcOGNdXI+A2UYL/k9uuhPIX0ZUTOL9
	1AvMLEvlsiv8pNJzpRd8yLPophs4bGtZ4yARC+hhBUOx9v4nRFitlxpURsi7azc1MPqe
	ZiQ/5rRIEXZrKLPXmQxZmEe2ElbHe+M4TiO7YuS96VQOAOscsgJ/ipbm9PFxWo3CtDfJ
	z5lg==
X-Gm-Message-State: AOAM530yovvlM+K25i3T3s2fqR7rohiV469kCvYv8O/8p9CRrJKiiOGT
	ehDPR0eUIcbljqrNp7tJGagTuoYrCTv/hD36ZY8z/cdWyQLh6gJDXEnJ5KtV1FL4qztlqzoZy8Q
	nDMI7eI1Wx3esVirrfbK/7vFihZ3bd+h8YQDFpSwRQKyr1NZALJ/tvgFEsGwEi7uYDRlF9Zs4OW
	Tl
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
	e26-20020aa798da0000b02903e08b98df83mr8522539pfm.63.1630061709841;
	Fri, 27 Aug 2021 03:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ZXm9NDmvhbg2PBeQeDM17X/Zlt30bmxxCJ19nqBO4xrqsvsTd2ko6kZ5Iw18u/tyifzwJmCmWYNAPd4m/58=
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
	e26-20020aa798da0000b02903e08b98df83mr8522500pfm.63.1630061709159;
	Fri, 27 Aug 2021 03:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210826103155.72744-1-priya.ns@ti.com>
	<286a52f6-7554-c817-903e-cb412e427567@ti.com>
In-Reply-To: <286a52f6-7554-c817-903e-cb412e427567@ti.com>
From: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
Date: Fri, 27 Aug 2021 16:24:53 +0530
Message-ID: <CAHFpNO838+BTYFQgAcR-RjDL+GPCTR7DDgZ81jZCESnBGdJJmQ@mail.gmail.com>
To: Praneeth Bajjuri <praneeth@ti.com>
X-BESS-ID: 1630061710-302396-1337-26750-1
X-BESS-VER: 2019.1_20210826.1922
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234132 [from 
	cloudscan23-185.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "N S,
	Priya" <priya.ns@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v3] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Fri, 27 Aug 2021 10:54:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 1:42 AM Praneeth Bajjuri <praneeth@ti.com> wrote:
>
>
>
> On 8/26/21 5:31 AM, Priya N S wrote:
> > Signed-off-by: Priya N S <priya.ns@ti.com>
> > ---
> >
> > Hi All,
> >
> > This patch adds the processor-sdk-07.03.00.005-config for the AM335x
> > and AM437x 07.03 release.
> >
> > Changes made in the V3 patch:
> > * This corresponds to the 07.03 release for the am335x-evm and
> >    am437x-evm platforms.
> > * The meta-linaro meta-layer is removed because the meta-optee needed
> >    for the build is moved to meta-arm from the dunfell.
>
> any version change log should be below
> ---
>
> please correct the commit message about "Changes made in the V3 patch:"
>
>
> >
> >   .../processor-sdk-07.03.00.005-config.txt          | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >   create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> >
> > diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> > new file mode 100644
> > index 0000000..548e759
> > --- /dev/null
> > +++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> > @@ -0,0 +1,14 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> > +
> > +bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
> > +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
>
> this doesnt seems to be latest commit from
> https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/log/?h=dunfell
> it looks atleast 27 patches behind. Please provide the reason for this
> difference.
The release config file added in this patch is for the AM335x and
AM437x GP EVM 07.03.00.005 release that has
already happened on 24th May 2021 and 02nd July 2021. The config file
was missed to add in the oe-layersetup
repository after the release.
The 27 patches mentioned were added after the release of AM335x and
AM437x GP EVM. So, this is the reason
for seeing the differences in the commit Ids.

>
> Can you also start using tags for meta-processor-sdk.
>
Since 07.03 release has already happened, we will consider using the
tags in meta-processor-sdk for the
upcoming releases.
Please suggest.

> > +meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
> > +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> > +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
> > +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> > +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
> > +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> > +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
> > +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> >

