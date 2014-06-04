Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B433C52A1E
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 15:23:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54FNICk022444
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:23:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FNIRj023936
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:23:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Jun 2014 10:23:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FNHVP014950;
	Wed, 4 Jun 2014 10:23:17 -0500
Date: Wed, 4 Jun 2014 11:23:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140604152317.GJ21819@edge>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-5-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D08C1E8@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D08C1E8@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 05/11] matrix-gui: Add camera submenu
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
X-List-Received-Date: Wed, 04 Jun 2014 15:23:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2014 at 02:32:37PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Thursday, May 29, 2014 1:38 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 05/11] matrix-gui: Add camera submenu
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> > .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    5 +++--
> > 2 files changed, 5 insertions(+), 4 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >apps-git.inc
> >index fe4b3f0..c985859 100644
> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> >git.inc
> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> >git.inc
> >@@ -4,9 +4,9 @@ LICENSE_CHECKSUM =
> >"LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> > LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> >
> > SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> >apps.git;protocol=git;branch=${BRANCH}"
> >-SRCREV = "ea1592722e9b00a6324d031af1fa23a3683ff7a6"
> >+SRCREV = "6ba41c4070cbc723d758f5d493859ae6470cdceb"
> > BRANCH = "master"
> >-INC_PR = "r22"
> >+INC_PR = "r23"
> >
> > # Pull in the base package for installing matrix applications
> > require matrix-gui-apps.inc
> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-
> >gui-submenus_2.0.bb
> >index d108500..d794277 100644
> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >submenus_2.0.bb
> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >submenus_2.0.bb
> >@@ -8,7 +8,7 @@ require matrix-gui-apps-git.inc
> > # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-
> >git.inc file
> > LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >
> >-PR = "${INC_PR}.9"
> >+PR = "${INC_PR}.10"
> 
> Just a nit, but if you bumped the INC_PR already then do you really need to 
> bump this PR?  I don't think this is worth submitting a v2 for though.

From my perspective - if you made any changes in the .inc file, you bump 
INC_PR and then if you made any changes to the actual recipe, you bump it own 
PR. That way you can track the history of changes in each file separately...


> > # These packages make submenus in matrix and are not architecture
> >specific
> > inherit allarch
> >@@ -27,7 +27,7 @@ do_install(){
> >     done
> > }
> >
> >-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
> >${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
> >${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
> >+PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
> >${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
> >${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera"
> >
> > # Make sure app images has been installed
> > RDEPENDS_${PN} += "matrix-gui-apps-images"
> >@@ -46,3 +46,4 @@ FILES_${PN}-settings =
> >"${MATRIX_APP_DIR}/settings_submenu/*"
> > FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb_submenu/*"
> > FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
> > FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
> >+FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
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

