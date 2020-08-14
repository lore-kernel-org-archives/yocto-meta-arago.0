Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 38FCA52986
	for <meta-arago@arago-project.org>;
	Fri, 14 Aug 2020 22:32:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07EMU1Bn065062;
	Fri, 14 Aug 2020 17:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597444201;
	bh=XFkz8STwEmKdcgoXUZwoE7XGIumHWgGQYFszPERujBI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y6KRK9DeD++Bvwip/tnZi1RWaNVs95T0+MYXanHnaSOrDSWdfcwDfj6NA5i/Tkw3l
	wUw9QrnpZ2t62A3cB3l09nRPQ9eACprCp9gvkNdjNouQm5o9nAmYOAK1LlsTKkBzUE
	uN2aILdwzZr7YXcfg9ZY3lbT7dAuDWZs3J6soBb0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07EMU1LC064758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2020 17:30:01 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 14 Aug 2020 17:30:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 14 Aug 2020 17:30:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07EMU0tU105350;
	Fri, 14 Aug 2020 17:30:00 -0500
Date: Fri, 14 Aug 2020 18:30:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200814223000.GP13081@beryl>
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl> <20200630020322.GD7211@beryl>
	<CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
	<20200630151111.GG7211@beryl>
	<CAM9ZRVsb5yr0EqFTdgij2r8vZyRX6hxktevbGRh-0s=NgYcCfg@mail.gmail.com>
	<20200630155049.GI7211@beryl>
MIME-Version: 1.0
In-Reply-To: <20200630155049.GI7211@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Fri, 14 Aug 2020 22:32:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 30, 2020 at 11:50:49AM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 30, 2020 at 04:35:21PM +0100, Paul Barker wrote:
> > On Tue, 30 Jun 2020 at 16:11, Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Tue, Jun 30, 2020 at 02:12:30PM +0100, Paul Barker wrote:
> > > > On Tue, 30 Jun 2020 at 03:03, Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> > > > > > On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > > > > > > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > > >
> > > > > > > > This change fixes the following error seen at parse time when the
> > > > > > > > meta-arago-distro layer is present but sysvinit is not in
> > > > > > > > DISTRO_FEATURES:
> > > > > > > >
> > > > > > > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > > > > > > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > >
> > > > > > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > > > > > ---
> > > > > > > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > index 2eb2d777..a6e21745 100644
> > > > > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > > > > @@ -1,3 +1,8 @@
> > > > > > > > +python __anonymous() {
> > > > > > > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > > > > > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > > > > > > >
> > > > > > > >  PR = "r0"
> > > > > > > > --
> > > > > > > > 2.26.2
> > > > > > > >
> > > > > > >
> > > > > > > Ping.
> > > > > >
> > > > > > Thanks, I'll merge it shortly.
> > > > >
> > > > > Actually, should this simply use REQUIRED_DISTRO_FEATURES from
> > > > > features_check.bbclass?
> > > >
> > > > Actually, yes, that should work. We just need to set
> > > > REQUIRED_DISTRO_FEATURES and inherit features_check before `require
> > > > recipes-core/packagegroups/packagegroup-core-boot.bb` as that's where
> > > > the error is raised.
> > > >
> > > > In an ideal world a packagegroup recipe really should not be changing
> > > > VIRTUAL-RUNTIME values, those should be set at the distro conf level
> > > > or in a multiconfig. I assume there's a good reason for setting these
> > > > in this recipe, maybe it just needs adding in a comment.
> > >
> > > The distro sets them to systemd by default and most images are built with
> > > systemd. But we also need a tiny image with sysvinit built w/o overriding
> > > the defaults.
> > 
> > That sounds like it should be done by an `arago-tiny` distro rather
> > than by image/packagegroup recipes. When building this image you've
> > still got systemd in DISTRO_FEATURES and so some applications may be
> > built in a way that requires systemd.
> 
> A new distro is not going to work in this case - tiny image is needed along 
> the side of other systemd images and may be packaged and used inside as 
> initramfs and demo rootfs for Jailhouse or other hypervisors.

Paul,

Any updates on this? Do you still need it?
Do you have a patch with REQUIRED_DISTRO_FEATURES as discussed above?

-- 
Denys

