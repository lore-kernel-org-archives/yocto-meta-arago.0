Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1FCEC529A5
	for <meta-arago@arago-project.org>;
	Wed, 18 May 2016 16:43:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4IGhr3l018139;
	Wed, 18 May 2016 11:43:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4IGhr4E020295;
	Wed, 18 May 2016 11:43:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 18 May 2016 11:43:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4IGhr2m003670;
	Wed, 18 May 2016 11:43:53 -0500
Date: Wed, 18 May 2016 12:43:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Message-ID: <20160518164337.GB16188@edge>
References: <1463461288-32423-1-git-send-email-denis@denix.org>
	<1463461288-32423-2-git-send-email-denis@denix.org>
	<05CF4794C98B244ABDC620C10903762273299878@DBDE04.ent.ti.com>
	<20160518155905.GZ16188@edge>
	<05CF4794C98B244ABDC620C1090376227329A1B3@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <05CF4794C98B244ABDC620C1090376227329A1B3@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
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
X-List-Received-Date: Wed, 18 May 2016 16:43:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 18, 2016 at 12:19:05PM -0400, Balagopalakrishnan, Anand wrote:
> On the target filesystem, I see that weston.service is installed to 
> /lib/systemd/system. If you delete ${systemd_system_unitdir}, will those 
> files also be removed?

There are no other files in that directory coming from this package. So, this 
package doesn't need that directory, as it will be empty. The package is only 
responsible for the files and directories it provides, not for the entire 
rootfs.

-- 
Denys


> ________________________________________
> From: Dmytriyenko, Denys
> Sent: Wednesday, May 18, 2016 9:29 PM
> To: Balagopalakrishnan, Anand
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
> 
> On Wed, May 18, 2016 at 07:23:59AM +0000, Balagopalakrishnan, Anand wrote:
> > Instead of the following:
> > > +    rm -rf ${D}${systemd_system_unitdir}
> >
> > should you have this line:
> > rm -f ${D}${systemd_system_unitdir}/weston.service
> 
> Why?
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Tuesday, May 17, 2016 10:31 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Touchscreen calibration and other customizations are required from initscript
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend  | 5 ++++-  meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston | 2 +-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > index 78a839f..041e5ab 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > @@ -1,4 +1,4 @@
> > -PR_append = ".arago6"
> > +PR_append = ".arago7"
> >
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >
> > @@ -9,4 +9,7 @@ SRC_URI_append = " \
> >  do_install_append() {
> >      install -d ${D}${bindir}
> >      install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
> > +    rm -rf ${D}${systemd_system_unitdir}
> >  }
> > +
> > +SYSTEMD_SERVICE_${PN} = ""
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> > index 6ef574a..aed5d5f 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> > @@ -1,4 +1,4 @@
> > -#!/bin/bash
> > +#!/bin/sh
> >
> >  clear
> >  cat << EOF
> > --
> > 2.2.0
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

