Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B603C529BD
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:43:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23FhIfs023186;
	Tue, 3 Mar 2015 09:43:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FhH0t025044;
	Tue, 3 Mar 2015 09:43:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 09:43:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FhHnM006782;
	Tue, 3 Mar 2015 09:43:17 -0600
Date: Tue, 3 Mar 2015 10:43:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150303154316.GS6052@edge>
References: <1425370754-22484-1-git-send-email-denis@denix.org>
	<1425370754-22484-2-git-send-email-denis@denix.org>
	<E5C7A8C9-4F73-48AD-8918-20A21CCC71AE@ti.com>
MIME-Version: 1.0
In-Reply-To: <E5C7A8C9-4F73-48AD-8918-20A21CCC71AE@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] packagegroup-*-qte: update to include remaining qt5 modules and dependencies
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
X-List-Received-Date: Tue, 03 Mar 2015 15:43:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 03, 2015 at 03:07:53PM +0000, Cooper Jr., Franklin wrote:
> Are there any dev packages for these packages that you added that should 
> also be added to Linux-devkit?

No new modules were added, just extra plugins and examples. All the 
corresponding -dev are already listed.


> > On Mar 3, 2015, at 2:19 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > .../recipes-core/packagegroups/packagegroup-arago-qte.bb     | 11 ++++++++---
> > .../packagegroups/packagegroup-arago-tisdk-qte.bb            | 12 +++++++-----
> > 2 files changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > index 48fdb01..9618de5 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > @@ -1,6 +1,6 @@
> > DESCRIPTION = "Task to add Qt embedded related packages"
> > LICENSE = "MIT"
> > -PR = "r7"
> > +PR = "r8"
> > 
> > inherit packagegroup
> > 
> > @@ -29,11 +29,16 @@ QT4_ESSENTIALS = "\
> > QT5_ESSENTIALS = "\
> >     qtbase-plugins \
> >     qtdeclarative-plugins \
> > +    qtdeclarative-qmlplugins \
> >     qtlocation-plugins \
> > +    qtlocation-qmlplugins \
> >     qtmultimedia-plugins \
> > +    qtmultimedia-qmlplugins \
> >     qtwayland-plugins \
> > -    qt3d \
> > -    qtquick1 \
> > +    qt3d-qmlplugins \
> > +    qtwebkit-qmlplugins \
> > +    qtquick1-plugins \
> > +    qtquick1-qmlplugins \
> > "
> > 
> > RDEPENDS_${PN} = "\
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > index a95a9cd..495247e 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > @@ -1,6 +1,6 @@
> > DESCRIPTION = "Task to add Qt embedded related packages"
> > LICENSE = "MIT"
> > -PR = "r9"
> > +PR = "r10"
> > 
> > inherit packagegroup
> > 
> > @@ -14,12 +14,14 @@ QT4_DEMOS = "\
> > "
> > 
> > QT5_DEMOS = "\
> > -    qtwayland-examples \
> > -    qtwebkit-examples-examples \
> > +    qt3d-examples \
> > +    qtbase-examples \
> >     qtdeclarative-examples \
> > +    qtlocation-examples \
> >     qtmultimedia-examples \
> > -    qtbase-examples \
> > -    qt3d-examples \
> > +    qtscript-examples \
> > +    qtwayland-examples \
> > +    qtwebkit-examples-examples \
> >     qtquick1-examples \
> > "
> > 
> > -- 
> > 2.2.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

