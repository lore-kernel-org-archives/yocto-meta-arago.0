Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by arago-project.org (Postfix) with ESMTPS id 14337529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 13:15:17 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id t18so5536956otq.5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dVSEccUzw9lkYz7smmR0MMD+OEPRajkgals9Iq17+54=;
	b=KHs5dsQpYsHgSz1pGV85Lvxh44CzpbERkbeaPrjNs/ow0+2PfvPlYZedRGdybOVU7y
	XNiZN9KvQ4dcTn2leEh5bTx/VRY67T7zcfnPZjR4i9Bpfuv4jnWFYRFI3pcSK3rFWSqO
	8x+jbLTiw2QOUoZVU+SSTy2WvgXf2DhrVtGWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dVSEccUzw9lkYz7smmR0MMD+OEPRajkgals9Iq17+54=;
	b=bc8OcHCbPMFTlltzHcIaec2aUKY6WhEgBeyCdWVpeRzpekdV+BA5QCccBnJ1inRMT5
	Ob5tnyy8alODKlkcr7rlshSvkUqQRNe7IlLMcV3i4ocxXLKS5MupOzn9Q9phTHN6jIvv
	nBNej5co24PmEgmHwdpvfez4POTmXET0D4AFslmbIZ/Vtshi51edPU7Cm45TU87D6lFM
	qQgDLjqRxzpAsXIg4zlAR4C5T2BUnwlrPBbukRIiynHeQwPuTHulf/HdE9SOu6DXbpgd
	uObikKN6rO5qS4EhVjKiH704KwYyz7S18xuUAjZXuke8Lm/eNJhuXFMVI1Ww48wTCMbe
	fI5A==
X-Gm-Message-State: AOAM532f7REvNdLqhwCvaequTFjJ+MN4Fo7EZ1d8N5mHlGmJ2rn3/E89
	Vi6oRxwlAIUCY4dv+sPZJ0BIIXjZcZbWvaLaCbkjVn55CUo=
X-Google-Smtp-Source: ABdhPJwARTPYSEW4AZCQOicEujy0YRsr62tjH9dAUcMNwRyByIC6IUKDIRST6FEG6e12+7vJHsJ2Pe+RS+7ZkylXAuI=
X-Received: by 2002:a9d:674a:: with SMTP id w10mr15360903otm.305.1593522759209;
	Tue, 30 Jun 2020 06:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl> <20200630020322.GD7211@beryl>
In-Reply-To: <20200630020322.GD7211@beryl>
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 30 Jun 2020 14:12:30 +0100
Message-ID: <CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Jun 2020 13:15:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2020 at 03:03, Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > This change fixes the following error seen at parse time when the
> > > > meta-arago-distro layer is present but sysvinit is not in
> > > > DISTRO_FEATURES:
> > > >
> > > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > >
> > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > index 2eb2d777..a6e21745 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > @@ -1,3 +1,8 @@
> > > > +python __anonymous() {
> > > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > > +}
> > > > +
> > > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > > >
> > > >  PR = "r0"
> > > > --
> > > > 2.26.2
> > > >
> > >
> > > Ping.
> >
> > Thanks, I'll merge it shortly.
>
> Actually, should this simply use REQUIRED_DISTRO_FEATURES from
> features_check.bbclass?

Actually, yes, that should work. We just need to set
REQUIRED_DISTRO_FEATURES and inherit features_check before `require
recipes-core/packagegroups/packagegroup-core-boot.bb` as that's where
the error is raised.

In an ideal world a packagegroup recipe really should not be changing
VIRTUAL-RUNTIME values, those should be set at the distro conf level
or in a multiconfig. I assume there's a good reason for setting these
in this recipe, maybe it just needs adding in a comment.

Thanks,

-- 
Paul Barker
Konsulko Group

