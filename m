Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by arago-project.org (Postfix) with ESMTPS id 04C7752968
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 19:18:50 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u17so1186647oie.3
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O0ZuCIBwrYJD0AH2+usIeXu/1VsL+tBHqZkxz7g6Qhk=;
	b=J8gmVdhx69Gyzd4KUmVjKmQ5ikYULsBu17r60PxvZUaIXOvKiDijygPXWCuWGfIOzZ
	A/QXhvPV/XynX4eByX/OY/m/26jokGHVByLuaCCsV/1QYxI1uluQrGmzJMPY5DrKS55S
	1CObKmGJ+MEXHewHj9iax/4G2+YDcPBhbzNGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O0ZuCIBwrYJD0AH2+usIeXu/1VsL+tBHqZkxz7g6Qhk=;
	b=pSttjgfSqU1Y7nKMlAGdLYBqbHwN4Kf7gK8NtdeX44bH9TLlbwzgnQpLZo41EQMeeS
	7xIxE/rmSbZrkSFxQsprUInbpEYUK0bOkeh9ofdEsm/zQsy54tgosx10hCPO6KEoCOq/
	VnCIzJfHFfG9HUGs6ql1diLC6oZ53YmoKSEm4X1PdSjHwKAQGvY3r6lzuvy8HVoh398o
	Ac24I182SdrXr/flRc5q/Qv20q5F6nuxozvKWe9P6NdLJKMh7/5oalAnq5ssz3FvKX9d
	NcYH+dR23R5gzOYXIrQ8xZ02d3jNAK3DyRc14aeiqS045rRA3AWeBPF69W55/bWG4MZO
	J+MQ==
X-Gm-Message-State: AOAM53341+6OIixUK12Cfoo/hOXaKcFygv3F8MIj6wfvk0p7lf6PaUMM
	qwOJrhgp5kwBARopSB/xRMoTPFiK4rNWFhS1/cU3jw==
X-Google-Smtp-Source: ABdhPJyFR0KlZmcAtnN3GS8/eYPKXyuwlJzjGoMQSO1w/woYnVHMLBiz52XNkEhTRoZXxRYoSz4besxFnHVT5IDYGuE=
X-Received: by 2002:aca:560a:: with SMTP id k10mr617549oib.27.1603134946603;
	Mon, 19 Oct 2020 12:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl> <20200630020322.GD7211@beryl>
	<CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
	<20200630151111.GG7211@beryl>
	<CAM9ZRVsb5yr0EqFTdgij2r8vZyRX6hxktevbGRh-0s=NgYcCfg@mail.gmail.com>
	<20200630155049.GI7211@beryl> <20200814223000.GP13081@beryl>
In-Reply-To: <20200814223000.GP13081@beryl>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 19 Oct 2020 20:15:36 +0100
Message-ID: <CAM9ZRVuQq3cQV6RDsN42VzssVuukT3KHWM-LDVbK_3H3ywGXzA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Mon, 19 Oct 2020 19:18:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2020 at 23:30, Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Jun 30, 2020 at 11:50:49AM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 30, 2020 at 04:35:21PM +0100, Paul Barker wrote:
> > > On Tue, 30 Jun 2020 at 16:11, Denys Dmytriyenko <denys@ti.com> wrote:
> > > >
> > > > On Tue, Jun 30, 2020 at 02:12:30PM +0100, Paul Barker wrote:
> > > > > On Tue, 30 Jun 2020 at 03:03, Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> > > > > > > On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > > > > > > > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > > > >
> > > > > > > > > This change fixes the following error seen at parse time when the
> > > > > > > > > meta-arago-distro layer is present but sysvinit is not in
> > > > > > > > > DISTRO_FEATURES:
> > > > > > > > >
> > > > > > > > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > > > > > > > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > >
> > > > > > > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > > > > > > ---
> > > > > > > > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > > index 2eb2d777..a6e21745 100644
> > > > > > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > > @@ -1,3 +1,8 @@
> > > > > > > > > +python __anonymous() {
> > > > > > > > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > > > > > > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > > > > > > > >
> > > > > > > > >  PR = "r0"
> > > > > > > > > --
> > > > > > > > > 2.26.2
> > > > > > > > >
> > > > > > > >
> > > > > > > > Ping.
> > > > > > >
> > > > > > > Thanks, I'll merge it shortly.
> > > > > >
> > > > > > Actually, should this simply use REQUIRED_DISTRO_FEATURES from
> > > > > > features_check.bbclass?
> > > > >
> > > > > Actually, yes, that should work. We just need to set
> > > > > REQUIRED_DISTRO_FEATURES and inherit features_check before `require
> > > > > recipes-core/packagegroups/packagegroup-core-boot.bb` as that's where
> > > > > the error is raised.
> > > > >
> > > > > In an ideal world a packagegroup recipe really should not be changing
> > > > > VIRTUAL-RUNTIME values, those should be set at the distro conf level
> > > > > or in a multiconfig. I assume there's a good reason for setting these
> > > > > in this recipe, maybe it just needs adding in a comment.
> > > >
> > > > The distro sets them to systemd by default and most images are built with
> > > > systemd. But we also need a tiny image with sysvinit built w/o overriding
> > > > the defaults.
> > >
> > > That sounds like it should be done by an `arago-tiny` distro rather
> > > than by image/packagegroup recipes. When building this image you've
> > > still got systemd in DISTRO_FEATURES and so some applications may be
> > > built in a way that requires systemd.
> >
> > A new distro is not going to work in this case - tiny image is needed along
> > the side of other systemd images and may be packaged and used inside as
> > initramfs and demo rootfs for Jailhouse or other hypervisors.
>
> Paul,
>
> Any updates on this? Do you still need it?
> Do you have a patch with REQUIRED_DISTRO_FEATURES as discussed above?

Now I've resolved the issues with my other patch I'm confident this
change is good. I'll resubmit the patch using
REQUIRED_DISTRO_FEATURES.

Thanks,

-- 
Paul Barker
Konsulko Group

