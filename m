Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CA54C52A62
	for <meta-arago@arago-project.org>;
	Sat, 29 Aug 2015 00:32:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7T0WVU3023854
	for <meta-arago@arago-project.org>; Fri, 28 Aug 2015 19:32:31 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7T0WVxZ013223
	for <meta-arago@arago-project.org>; Fri, 28 Aug 2015 19:32:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 28 Aug 2015 19:32:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7T0WVDC032015;
	Fri, 28 Aug 2015 19:32:31 -0500
Date: Fri, 28 Aug 2015 20:32:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150829003215.GQ26662@edge>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
	<1440734514-16165-4-git-send-email-h-gou@ti.com>
	<20150829001928.GO26662@edge>
MIME-Version: 1.0
In-Reply-To: <20150829001928.GO26662@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/5] packagegroup-arago-tisdk-graphics*: use libgbm, SGX kernel module and user module, and img-pvr-sdk for AM3 and AM4
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
X-List-Received-Date: Sat, 29 Aug 2015 00:32:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 28, 2015 at 08:19:28PM -0400, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2015 at 12:01:52AM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-graphics-sdk-host.bb         |  7 +++----
> >  .../packagegroup-arago-tisdk-graphics-sdk-target.bb       | 13 ++++++++-----
> >  .../packagegroups/packagegroup-arago-tisdk-graphics.bb    | 15 ++++++++++++---
> >  3 files changed, 23 insertions(+), 12 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> > index a0cbc5c..b601495 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install graphics sources in SDK"
> >  LICENSE = "MIT"
> > -PR = "r2"
> > +PR = "r3"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -8,9 +8,8 @@ inherit packagegroup
> >  
> >  GRAPHICS_RDEPENDS = ""
> >  
> > -# SGX modules fail against 4.1
> > -#GRAPHICS_RDEPENDS_append_ti33x = " omap3-sgx-modules-src"
> > -#GRAPHICS_RDEPENDS_append_ti43x = " omap3-sgx-modules-src"
> > +GRAPHICS_RDEPENDS_append_ti33x = " omapdrm-pvr-src"
> > +GRAPHICS_RDEPENDS_append_ti43x = " omapdrm-pvr-src"
> >  
> >  RDEPENDS_${PN} = "\
> >      ${GRAPHICS_RDEPENDS} \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> > index d36da7e..2cb4ec2 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install graphics binaries on sdk target"
> >  LICENSE = "MIT"
> > -PR = "r5"
> > +PR = "r6"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -9,15 +9,18 @@ inherit packagegroup
> >  GRAPHICS_RDEPENDS = ""
> >  
> >  GRAPHICS_RDEPENDS_ti33x = "\
> > -    libgles-omap3-dev \
> > -"
> > +    libgbm-dev \
> > +    omap5-sgx-ddk-um-linux-dev \
> > +    "
> > +
> >  GRAPHICS_RDEPENDS_omap3 = "\
> >      libgles-omap3-dev \
> >  "
> >  
> >  GRAPHICS_RDEPENDS_ti43x = "\
> > -    libgles-omap3-dev \
> > -"
> > +    libgbm-dev \
> > +    omap5-sgx-ddk-um-linux-dev \
> > +    "
> >  
> >  GRAPHICS_RDEPENDS_omap-a15 = "\
> >      libgbm-dev \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> > index 8419cde..91bd548 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install graphics binaries"
> >  LICENSE = "MIT"
> > -PR = "r11"
> > +PR = "r12"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -23,12 +23,21 @@ GRAPHICS_SDK = "\
> >  "
> >  
> >  GRAPHICS_RDEPENDS = ""
> > +
> >  GRAPHICS_RDEPENDS_ti33x = "\
> > -    ${GRAPHICS_SDK} \
> > +    libgbm \
> > +    omap5-sgx-ddk-um-linux-dev \
> 
> Why -dev package listed here?
> 
> 
> > +    omap5-sgx-ddk-um-linux \
> > +    omapdrm-pvr \
> > +    img-pvr-sdk \

Moreover, img-pvr-sdk (3D demos) are already pulled by corresponding Matrix 
demos. Any specific reason for the redundancy?


> >  "
> >  
> >  GRAPHICS_RDEPENDS_ti43x = "\
> > -    ${GRAPHICS_SDK} \
> > +    libgbm \
> > +    omap5-sgx-ddk-um-linux-dev \
> 
> And here?
> 
> 
> > +    omap5-sgx-ddk-um-linux \
> > +    omapdrm-pvr \
> > +    img-pvr-sdk \
> >  "
> >  
> >  GRAPHICS_RDEPENDS_omap3 = "\
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

