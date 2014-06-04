Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 90AE552A1E
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 15:30:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54FUSBk010348
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:30:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FUSvZ025424
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 10:30:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Jun 2014 10:30:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54FUSC1002846;
	Wed, 4 Jun 2014 10:30:28 -0500
Date: Wed, 4 Jun 2014 11:30:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140604153028.GL21819@edge>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-5-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D08C1E8@DLEE11.ent.ti.com>
	<20140604152317.GJ21819@edge>
	<8F29D6B095ED194EA1980491A5E029710C6C3359@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6C3359@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 04 Jun 2014 15:30:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2014 at 11:28:03AM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, June 04, 2014 10:23 AM
> > To: Maupin, Chase
> > Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 05/11] matrix-gui: Add camera submenu
> > 
> > On Wed, Jun 04, 2014 at 02:32:37PM +0000, Maupin, Chase wrote:
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > > >Sent: Thursday, May 29, 2014 1:38 PM
> > > >To: meta-arago@arago-project.org
> > > >Cc: Cooper Jr., Franklin
> > > >Subject: [meta-arago] [PATCH 05/11] matrix-gui: Add camera submenu
> > > >
> > > >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > >---
> > > > .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> > > > .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    5 +++--
> > > > 2 files changed, 5 insertions(+), 4 deletions(-)
> > > >
> > > >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > > >apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > > >apps-git.inc
> > > >index fe4b3f0..c985859 100644
> > > >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> > > >git.inc
> > > >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> > > >git.inc
> > > >@@ -4,9 +4,9 @@ LICENSE_CHECKSUM =
> > > >"LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> > > > LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> > > >
> > > > SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> > > >apps.git;protocol=git;branch=${BRANCH}"
> > > >-SRCREV = "ea1592722e9b00a6324d031af1fa23a3683ff7a6"
> > > >+SRCREV = "6ba41c4070cbc723d758f5d493859ae6470cdceb"
> > > > BRANCH = "master"
> > > >-INC_PR = "r22"
> > > >+INC_PR = "r23"
> > > >
> > > > # Pull in the base package for installing matrix applications
> > > >require matrix-gui-apps.inc diff --git
> > > >a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > > >submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-
> > > >gui-submenus_2.0.bb
> > > >index d108500..d794277 100644
> > > >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > > >submenus_2.0.bb
> > > >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > > >submenus_2.0.bb
> > > >@@ -8,7 +8,7 @@ require matrix-gui-apps-git.inc  # reset the
> > > >LIC_FILES_CHKSUM setting from the matrix-gui-apps- git.inc file
> > > >LIC_FILES_CHKSUM =
> > > >"file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> > > >
> > > >-PR = "${INC_PR}.9"
> > > >+PR = "${INC_PR}.10"
> > >
> > > Just a nit, but if you bumped the INC_PR already then do you really
> > > need to bump this PR?  I don't think this is worth submitting a v2 for
> > though.
> > 
> > From my perspective - if you made any changes in the .inc file, you bump
> > INC_PR and then if you made any changes to the actual recipe, you bump it
> > own PR. That way you can track the history of changes in each file
> > separately...
> [Franklin] Your both right. I'll fix this.

Hmm. Wondering how can we both be right here... :) My point was that the patch 
is fine as is, not sure what you want to fix :)


> > > > # These packages make submenus in matrix and are not architecture
> > > >specific  inherit allarch @@ -27,7 +27,7 @@ do_install(){
> > > >     done
> > > > }
> > > >
> > > >-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
> > > >${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
> > > >${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
> > > >+PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
> > > >${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
> > > >${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera"
> > > >
> > > > # Make sure app images has been installed  RDEPENDS_${PN} +=
> > > >"matrix-gui-apps-images"
> > > >@@ -46,3 +46,4 @@ FILES_${PN}-settings =
> > > >"${MATRIX_APP_DIR}/settings_submenu/*"
> > > > FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb_submenu/*"
> > > > FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
> > > > FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
> > > >+FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
> > > >--
> > > >1.7.0.4
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

