Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by arago-project.org (Postfix) with ESMTPS id EB56E529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 15:38:07 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id x83so10264151oif.10
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TV17EIRjA/g3TLLY4OhA28qKVM6D2NpHJiOmHNXw3qg=;
	b=aRlMhO7LGoxW/2D7t0Nq0l8RNi6LPDExiDZpuieJWjdVaO6VOrXobm7zIJvCop5slk
	ep46f9PtolK17Jg0xqNhjpr6+7lH58jfomkPfMTqbAPfF6GRzddNiRqGZEpuoloInagy
	Py6/g0IRdL4AibGr5mJBEes6oQuMEmjWJpVek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TV17EIRjA/g3TLLY4OhA28qKVM6D2NpHJiOmHNXw3qg=;
	b=Su8LjN7w2lJ64CqGeI0zFEHzBjYb7cbtazxIbUB1gCQk/ABYi8CSaBszf/JuR13qUK
	s0iY/mQz9GgfUD5AUO32UI1AT072OP68DUVUsqJ5EXYOYQG5hGiwafm3+rsjbwOgh74t
	YaT7tfnI27zC50CJ0/2RE1osQn4DeekYoQWoJNUq3dE0nAY67ANWu6kF4yKfKg/9CXrp
	zIflgbvIDun5WSAr85hPkJ+CCzrCDfxEjs0n8jJx9fjSvuqrpH0Ugff2QGSRhYlplxkU
	NggiY2BwLVxqD44UP6eZvWZwITPWhVhYGrv8xkWEkyNFbmQpPB23DcgwZ9n+c2yQelqn
	wKrQ==
X-Gm-Message-State: AOAM533JyyJHQk8tXH6Y0YZ8SugkluhpLf6qNl1EzW+CCvoDTJJgdGcw
	2Ij722PAo8kUbwMJdlnbDZogNSKyo9cmnA6SDEsYgwmu
X-Google-Smtp-Source: ABdhPJxCG1vDSwZqaIGasK7sF9BmMPvHxctpAAyqnbfuKKdvdFAH5HOHoakBc+ZxXnvuPz6P4ZYsRvenTNiETSRKXJ0=
X-Received: by 2002:aca:3254:: with SMTP id y81mr15302263oiy.152.1593531330006;
	Tue, 30 Jun 2020 08:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl> <20200630020322.GD7211@beryl>
	<CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
	<20200630151111.GG7211@beryl>
In-Reply-To: <20200630151111.GG7211@beryl>
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 30 Jun 2020 16:35:21 +0100
Message-ID: <CAM9ZRVsb5yr0EqFTdgij2r8vZyRX6hxktevbGRh-0s=NgYcCfg@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Jun 2020 15:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2020 at 16:11, Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Jun 30, 2020 at 02:12:30PM +0100, Paul Barker wrote:
> > On Tue, 30 Jun 2020 at 03:03, Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > > > > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > >
> > > > > > This change fixes the following error seen at parse time when the
> > > > > > meta-arago-distro layer is present but sysvinit is not in
> > > > > > DISTRO_FEATURES:
> > > > > >
> > > > > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > > > > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > >
> > > > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > > > ---
> > > > > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > >
> > > > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > index 2eb2d777..a6e21745 100644
> > > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > @@ -1,3 +1,8 @@
> > > > > > +python __anonymous() {
> > > > > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > > > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > > > > +}
> > > > > > +
> > > > > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > > > > >
> > > > > >  PR = "r0"
> > > > > > --
> > > > > > 2.26.2
> > > > > >
> > > > >
> > > > > Ping.
> > > >
> > > > Thanks, I'll merge it shortly.
> > >
> > > Actually, should this simply use REQUIRED_DISTRO_FEATURES from
> > > features_check.bbclass?
> >
> > Actually, yes, that should work. We just need to set
> > REQUIRED_DISTRO_FEATURES and inherit features_check before `require
> > recipes-core/packagegroups/packagegroup-core-boot.bb` as that's where
> > the error is raised.
> >
> > In an ideal world a packagegroup recipe really should not be changing
> > VIRTUAL-RUNTIME values, those should be set at the distro conf level
> > or in a multiconfig. I assume there's a good reason for setting these
> > in this recipe, maybe it just needs adding in a comment.
>
> The distro sets them to systemd by default and most images are built with
> systemd. But we also need a tiny image with sysvinit built w/o overriding
> the defaults.

That sounds like it should be done by an `arago-tiny` distro rather
than by image/packagegroup recipes. When building this image you've
still got systemd in DISTRO_FEATURES and so some applications may be
built in a way that requires systemd.

-- 
Paul Barker
Konsulko Group

