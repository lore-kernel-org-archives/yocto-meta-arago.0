Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0EE5E529BC
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 22:20:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RMKK5Q013031
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 16:20:20 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RMKKWW003224
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 16:20:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 16:20:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RMKJe9020077;
	Mon, 27 Jan 2014 16:20:20 -0600
Date: Mon, 27 Jan 2014 17:20:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140127222019.GU6814@edge>
References: <1390587699-26905-1-git-send-email-fcooper@ti.com>
	<20140124212751.GT30525@edge>
MIME-Version: 1.0
In-Reply-To: <20140124212751.GT30525@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] dual-camera-demo: Dual Camera Demo App
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
X-List-Received-Date: Mon, 27 Jan 2014 22:20:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 24, 2014 at 04:27:51PM -0500, Denys Dmytriyenko wrote:
> On Fri, Jan 24, 2014 at 12:21:36PM -0600, Franklin S. Cooper Jr wrote:
> > * Add Qt dual camera demo application.
> > ---
> >  .../dual-camera-demo/dual-camera-demo_1.0.bb       |   32 ++++++++++++++++++++
> >  1 files changed, 32 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> > new file mode 100644
> > index 0000000..4d6d00c
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> > @@ -0,0 +1,32 @@
> > +DESCRIPTION = "Qt Dual Camera Demo"
> > +HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
> > +SECTION = "multimedia"
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://main.cpp;md5=424a1b7299bcd2c5fad3b05493dd8898"
> 
> Any code change to the main.cpp file will blow the license check - you may 
> want to limit it to the header with "beginline=;endline=" modifier...

BTW, according to the file, the license is GPLv2...


> > +require recipes-core/matrix/matrix-gui-paths.inc
> > +
> > +PR = "r0"
> > +
> > +BRANCH = "master"
> > +SRCREV = "af299a206482562ceae8aa690a8b6644a3e0a66e"
> > +
> > +SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit qt-provider
> > +
> > +# use the make targets already created in the Makefile.build files
> > +do_install() {
> > +    cd ${S} && make -f Makefile.build DESTDIR=${D} install_common
> > +}
> > +
> > +PACKAGES += "matrix-gui-apps-dual-camera"
> > +
> > +RDEPENDS_matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-multimedia ${PN}"
> > +
> > +# Add the matrix directory to the FILES
> > +FILES_${PN} = "/usr/bin/*"
> 
> Isn't this the default or is it getting overwritten some other place?
> 
> 
> > +FILES_matrix-gui-apps-dual-camera = "${MATRIX_APP_DIR}/*"
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

