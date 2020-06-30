Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ED21A529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 15:13:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UFBCHY041419;
	Tue, 30 Jun 2020 10:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593529872;
	bh=pNEWCJ6Jz0595P+RV0z0ind2d4v1M7Vep9oHFmMgrMI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HPyluar6MAp1d0E+NU1A0yZg8AirESORSKcy50yZRfX4QnRUVfWJDqaIhKbCiYPFR
	ilGqVig+j8LGCF/BKOIeRw8o36qW4acbq6qP77uhRNXFfZQmfOsueG4rEanpKZizDj
	AHpWvvzmlYwow87HQ5yHmA3HxG5l6UUBxaaixZFk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UFBCLL103371;
	Tue, 30 Jun 2020 10:11:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 10:11:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 10:11:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UFBBxP074433;
	Tue, 30 Jun 2020 10:11:11 -0500
Date: Tue, 30 Jun 2020 11:11:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200630151111.GG7211@beryl>
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl> <20200630020322.GD7211@beryl>
	<CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVswBOD7ks2yk2CeKiGLZxG9Bbu-paTi8RF+SdM4q2zMqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Jun 2020 15:13:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 30, 2020 at 02:12:30PM +0100, Paul Barker wrote:
> On Tue, 30 Jun 2020 at 03:03, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > > > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > > > >
> > > > > This change fixes the following error seen at parse time when the
> > > > > meta-arago-distro layer is present but sysvinit is not in
> > > > > DISTRO_FEATURES:
> > > > >
> > > > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > > > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > >
> > > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > > ---
> > > > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > index 2eb2d777..a6e21745 100644
> > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > > > @@ -1,3 +1,8 @@
> > > > > +python __anonymous() {
> > > > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > > > +}
> > > > > +
> > > > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > > > >
> > > > >  PR = "r0"
> > > > > --
> > > > > 2.26.2
> > > > >
> > > >
> > > > Ping.
> > >
> > > Thanks, I'll merge it shortly.
> >
> > Actually, should this simply use REQUIRED_DISTRO_FEATURES from
> > features_check.bbclass?
> 
> Actually, yes, that should work. We just need to set
> REQUIRED_DISTRO_FEATURES and inherit features_check before `require
> recipes-core/packagegroups/packagegroup-core-boot.bb` as that's where
> the error is raised.
> 
> In an ideal world a packagegroup recipe really should not be changing
> VIRTUAL-RUNTIME values, those should be set at the distro conf level
> or in a multiconfig. I assume there's a good reason for setting these
> in this recipe, maybe it just needs adding in a comment.

The distro sets them to systemd by default and most images are built with 
systemd. But we also need a tiny image with sysvinit built w/o overriding 
the defaults.

-- 
Denys

