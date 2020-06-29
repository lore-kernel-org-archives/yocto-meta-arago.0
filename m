Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C2F1752A49
	for <meta-arago@arago-project.org>;
	Mon, 29 Jun 2020 22:45:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05TMh3lh042194;
	Mon, 29 Jun 2020 17:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593470583;
	bh=Ufg0BScvVSyMGwG4Iz5eBzwxW3408G9vkFcft5NsQ+w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vCghTgCb4EbX6O2RNYsSGlGVhQFWgPWEvC66heWHmuFIG6lk1N+BnkF2mb8pfsXhk
	hxgQoIvkhpAH5kI2aZTYW9EGdZnblvs/1dyAth7xjFUAwOCI2BsEoYa789q+sql67h
	CX71/y1qCKOHS0JD7ASvMX0+KiW2kqNXK+UHXkJQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05TMh3WE083174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2020 17:43:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 29 Jun 2020 17:43:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 29 Jun 2020 17:43:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TMh2r6048794;
	Mon, 29 Jun 2020 17:43:02 -0500
Date: Mon, 29 Jun 2020 18:43:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200629224302.GC6525@beryl>
References: <20200609102808.16475-1-pbarker@konsulko.com>
	<CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Jun 2020 22:45:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 23, 2020 at 09:12:00AM +0100, Paul Barker wrote:
> On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > This change fixes the following error seen at parse time when the
> > meta-arago-distro layer is present but sysvinit is not in
> > DISTRO_FEATURES:
> >
> >     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
> >     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > index 2eb2d777..a6e21745 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> > @@ -1,3 +1,8 @@
> > +python __anonymous() {
> > +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> > +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> > +}
> > +
> >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> >
> >  PR = "r0"
> > --
> > 2.26.2
> >
> 
> Ping.

Thanks, I'll merge it shortly.

-- 
Denys

