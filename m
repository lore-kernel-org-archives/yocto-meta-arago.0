Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BD984529D6
	for <meta-arago@arago-project.org>;
	Fri,  3 Nov 2017 18:25:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA3IP2oI024377;
	Fri, 3 Nov 2017 13:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509733502;
	bh=aPV4Kdxr0m6sAeA4rAjRw4TEGiUYYE9Sm7UzIsqG9n8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bvXKQMVijz/HwrRBxjfsvUlo/aFg87zMtD05M/GYB67e96rmY2JtD0ZpLNt8reMgH
	aXbyuDyq+JEDwDuJtnP+QT6I1OGQ/xC4yhNveJkaw++Un7EZnamIbJWCHDcex+G6K8
	nLKlciZyMz+l6iPLbu3Df6OGr53qskj2ShZ/4eQA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA3IP2bN026106;
	Fri, 3 Nov 2017 13:25:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 3 Nov 2017 13:25:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 3 Nov 2017 13:25:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA3IP1t9025016;
	Fri, 3 Nov 2017 13:25:01 -0500
Date: Fri, 3 Nov 2017 14:24:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20171103182445.GQ12918@edge>
References: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
	<CAFeBWL4qYcEreMk48swwrkEuc9pOhfQZDetqp3QzbKd_T1gGYQ@mail.gmail.com>
	<CAFeBWL74qVQmQ9oOqPvzLxnbBdx_Eb+esJPwHBg3NLtYyZd2RQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL74qVQmQ9oOqPvzLxnbBdx_Eb+esJPwHBg3NLtYyZd2RQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: Building Xwayland
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
X-List-Received-Date: Fri, 03 Nov 2017 18:25:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

You may want to check this discussion on mesa, libgbm and weston that we've 
had some time back, as it seems still relevant to your case:

http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120526.html

-- 
Denys


On Fri, Nov 03, 2017 at 02:51:20PM +0000, Adam Lee wrote:
> Ok with a bit of dance with mesa / mesa-gl, I got xclock to run on Xwayland.
> Demo apps such as kmscube still runs fine. Weston comes up too.
> 
> I removed virtual/libgles1 virtual/libgles2 virtual/egl and virtual/libgl
> from mesa's PROVIDES list. These components are provided by ti-sgx-ddk-um
> already.
> I likewise removed libgbm and libgbm-dev from mesa-gl. Package libgbm
> provides these.
> 
> 
> Adam
> 
> On Thu, Nov 2, 2017 at 11:15 AM Adam Lee <adam.yh.lee@gmail.com> wrote:
> 
> > Perhaps this is the crux of my original question:
> >
> > build@6e35408e8fa5:~/tisdk/build$ bitbake mesa
> > NOTE: Started PRServer with DBfile:
> > /home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46116,
> > PID: 16487
> > Parsing recipes: 100%
> > |########################################################################################################################|
> > Time: 0:00:18
> > Parsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286 targets,
> > 275 skipped, 0 masked, 0 errors.
> > WARNING: No recipes available for:
> >
> > /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbappend
> > *ERROR: Nothing PROVIDES 'mesa'*
> > *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> > ti-sgx-ddk-um, not mesa*
> > *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> > ti-sgx-ddk-um, not mesa*
> >
> > Is it possible to separate mesa into separate components (libgles1,
> > libgles2 etc)?
> > I wrote mesa_%.bbappend with "PROVIDES_remove" for libgles1 and libgles2,
> > but seems to have no effect.
> >
> >
> > On Thu, Nov 2, 2017 at 9:49 AM Adam Lee <adam.yh.lee@gmail.com> wrote:
> >
> >> Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?
> >>
> >> There is no "official" support for X11 in the TI SDK. Only Wayland is
> >> present. I am hoping to run my X11 applications with Xwayland. I have
> >> included x11 and wayland in DISTRO_FEATURES, but weston-xwayland /
> >> xserver-xorg are refusing to build.
> >>
> >> OE/meta has core-image-weston [0] which should build Xwayland as well but
> >> it also fails at weston-xwayland / xserver-xorg.
> >>
> >> I notice there is an experimental branch [1] but it removes Wayland
> >> altogether and appears to be very experimental, so that is a no-go for me.
> >>
> >> [0]
> >> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?h=master
> >> [1]
> >> http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=shortlog;h=refs/heads/morty-x11-experimental
> >>
> >>

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


