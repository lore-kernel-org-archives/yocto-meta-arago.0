Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9E717529D3
	for <meta-arago@arago-project.org>;
	Tue, 12 Sep 2017 02:21:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8C2Lk0g024310
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505182906;
	bh=8KMkvFwmvQsEdg+Qppd/hdSfXO7MTWsV9xTLTJNG9xc=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=ZoJziN0hDuzKSze6a67cuJtUke2Q2PLSKsnnuR/x+joxl1Dh8LkIX2YWFSYojfxXw
	0ZSNpwfq9Ux09AIaBl7tJG0eULB7cKKRkdXIphyF9LdY2751mJOcAxZdVzet/aozuF
	CqPD9F+2vQjeZs8lOvb/+nzFd/4eq5uEcK4myyGI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2Lfo4018240
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:21:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 11 Sep 2017 21:21:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 11 Sep 2017 21:21:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2Lf0B010567
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:21:41 -0500
Date: Mon, 11 Sep 2017 22:21:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20170912022136.GR8304@edge>
References: <1504652992-35063-1-git-send-email-denys@ti.com>
	<1504652992-35063-4-git-send-email-denys@ti.com>
	<20170905231927.GI8304@edge>
MIME-Version: 1.0
In-Reply-To: <20170905231927.GI8304@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [morty/master][PATCH 4/4] packagegroup-*-qte*: remove QtWebKit dependency
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
X-List-Received-Date: Tue, 12 Sep 2017 02:21:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping. If there are no objections, I'll merge this patch on Tuesday.


On Tue, Sep 05, 2017 at 07:19:27PM -0400, Denys Dmytriyenko wrote:
> Eric, Jake, et al,
> 
> I'll take the first 3 patches in this series into morty-next for testing to 
> get into rc2, but I'll leave out this #4 for now - waiting for your comments. 
> Thanks.
> 
> -- 
> Denys
> 
> 
> On Tue, Sep 05, 2017 at 07:09:52PM -0400, Denys Dmytriyenko wrote:
> > Replaced with either QtWebEngine or full Chromium on A15 platforms.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-qte.bb             | 5 +----
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb       | 4 +---
> >  .../packagegroups/packagegroup-arago-qte-toolchain-target.bb         | 5 +----
> >  3 files changed, 3 insertions(+), 11 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > index f6788f3..fb38ab8 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to add Qt embedded related packages"
> >  LICENSE = "MIT"
> > -PR = "r12"
> > +PR = "r13"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -36,9 +36,6 @@ QT5_ESSENTIALS = "\
> >      qtmultimedia-qmlplugins \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
> >      qt3d-qmlplugins \
> > -    qtwebkit-qmlplugins \
> > -    qtquick1-plugins \
> > -    qtquick1-qmlplugins \
> >      qtquickcontrols-qmlplugins \
> >      qtquickcontrols2-qmlplugins \
> >      qtgraphicaleffects-qmlplugins \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > index 30bac7b..f6f7468 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to add Qt embedded related packages"
> >  LICENSE = "MIT"
> > -PR = "r16"
> > +PR = "r17"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -20,14 +20,12 @@ QT5_DEMOS = "\
> >      qtdeclarative-tools \
> >      qtlocation-examples \
> >      qtmultimedia-examples \
> > -    qtquick1-examples \
> >      qtscript-examples \
> >      qtsvg-examples \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
> >      qtwebbrowser \
> >      qtwebbrowser-examples \
> >      qtwebengine-examples \
> > -    qtwebkit-examples-examples \
> >  "
> >  
> >  QT_DEMOS = "\
> > diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > index 73bae9d..88c5c6b 100644
> > --- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Target packages for Qt Embedded SDK"
> >  LICENSE = "MIT"
> >  
> > -PR = "r11"
> > +PR = "r12"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -47,7 +47,6 @@ QT5_DEV = " \
> >          qtbase-mkspecs \
> >          qtdeclarative-mkspecs \
> >          qtscript-mkspecs \
> > -        qtwebkit-mkspecs \
> >          qt3d-mkspecs \
> >          qtlocation-mkspecs \
> >          qtsensors-mkspecs \
> > @@ -57,13 +56,11 @@ QT5_DEV = " \
> >          qtbase-staticdev \
> >          qtdeclarative-dev \
> >          qtscript-dev \
> > -        qtwebkit-dev \
> >          qt3d-dev \
> >          qtlocation-dev \
> >          qtsensors-dev \
> >          qtsvg-dev \
> >          qtxmlpatterns-dev \
> > -        qtquick1-dev \
> >          qtwebengine-mkspecs \
> >          qtwebengine-dev \
> >  "
> > -- 
> > 2.7.4
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

