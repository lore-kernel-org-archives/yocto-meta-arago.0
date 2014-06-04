Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 391F552A1E
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 15:27:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54FRtI2025305
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:27:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FRtC7022905
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:27:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Jun 2014 10:27:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FRtOs000389;
	Wed, 4 Jun 2014 10:27:55 -0500
Date: Wed, 4 Jun 2014 11:27:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140604152754.GK21819@edge>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-6-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D08C25A@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D08C25A@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 06/11] image-gallery: Add image gallery application
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
X-List-Received-Date: Wed, 04 Jun 2014 15:27:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2014 at 02:38:23PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Thursday, May 29, 2014 1:38 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 06/11] image-gallery: Add image
> >gallery application
> >
> >* Add new Qt application to the SDK which displays pictures taken
> >by the camera
> >  demo.
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../recipes-qt/qt-apps/image-gallery_git.bb        |   33
> >++++++++++++++++++++
> > 1 files changed, 33 insertions(+), 0 deletions(-)
> > create mode 100644 meta-arago-extras/recipes-qt/qt-apps/image-
> >gallery_git.bb
> >
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-
> >gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-
> >gallery_git.bb
> >new file mode 100644
> >index 0000000..3040415
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> >@@ -0,0 +1,33 @@
> >+DESCRIPTION = "Image Gallery"
> >+HOMEPAGE = "https://gitorious.org/image-gallery"
> >+SECTION = "multimedia"
> >+LICENSE = "BSD"
> >+LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=9c57cc1cdee589f97cbba69e95a89a15"
> >+
> >+require recipes-core/matrix/matrix-gui-paths.inc
> >+
> >+PR = "r0"
> 
> Not needed

Why? Even though it's default, it helps remember to bump it next time :)


> >+BRANCH = "master"
> >+SRCREV = "8901d7c598b277e4e26a5abbcb859e7ceebd340a"
> >+
> >+SRC_URI = "git://gitorious.org/image-gallery/image-
> >gallery.git;protocol=git;branch=${BRANCH}"
> >+
> >+S = "${WORKDIR}/git/"
> >+
> >+BUILDDIR ?= "."
> 
> I'm not entirely sure what this is for.  When should this be set 
> differently?  And would it be better to use a variable like ${S} rather than 
> "."

I have seen this variable in qt-tstat recipe and had to remove it. There is no 
need for it and moreover, there's already ${B} defined and used for build dir.
See my recent patch re-submission for qt-tstat.


> >+inherit qt-provider
> >+
> >+do_install() {
> >+	install -d ${D}/usr/bin
> 
> Use ${bindir}

+1


> >+	install -m 0755 ${BUILDDIR}/image-gallery
> >${D}/usr/bin/image-gallery
> 
> Use ${bindir}

+1


> >+	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
> >+	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-
> >gallery
> >+}
> >+
> >+PACKAGES += "matrix-gui-apps-image-gallery"
> >+
> >+RDEPENDS_matrix-gui-apps-image-gallery  = "matrix-gui-apps-images
> >matrix-gui-submenus-camera ${PN}"
> >+
> >+FILES_matrix-gui-apps-image-gallery += "${MATRIX_APP_DIR}/*"
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

