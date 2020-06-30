Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3E808A8003
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 02:06:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05U23NQp111340;
	Mon, 29 Jun 2020 21:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593482603;
	bh=euK/yp1QsyvDLug7lNfu3KPVP4u3N7VnBjduCJ59uHg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q0om/o9uBV5MOeFWnid/3hmFvbVkz4DBXYJu+AnBRE9tpCBjzEZ9Ngvt1jCoxNcTF
	G2mCjfa4w7atZDAiLhbE1pD0o2AT6ycjPKOlg83B8No1C2vtwahK2McZcmBE4JKwfZ
	VzSX07RILfjOqYgAA2gCXxDQ5NyWg8+GwpY3d+VY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05U23Nwp110614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2020 21:03:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 29 Jun 2020 21:03:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 29 Jun 2020 21:03:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05U23Nch066938;
	Mon, 29 Jun 2020 21:03:23 -0500
Date: Mon, 29 Jun 2020 22:03:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200630020322.GD7211@beryl>
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
	<20200629224302.GC6525@beryl>
MIME-Version: 1.0
In-Reply-To: <20200629224302.GC6525@beryl>
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
X-List-Received-Date: Tue, 30 Jun 2020 02:06:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 29, 2020 at 06:43:02PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> > On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > This change fixes the following error seen at parse time when the
> > > meta-arago-distro layer is present but sysvinit is not in
> > > DISTRO_FEATURES:
> > >
> > >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> > >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > >
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > index 2eb2d777..a6e21745 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > > @@ -1,3 +1,8 @@
> > > +python __anonymous() {
> > > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > > +}
> > > +
> > >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> > >
> > >  PR = "r0"
> > > --
> > > 2.26.2
> > >
> > 
> > Ping.
> 
> Thanks, I'll merge it shortly.

Actually, should this simply use REQUIRED_DISTRO_FEATURES from 
features_check.bbclass?

-- 
Denys

