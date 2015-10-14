Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 378BD52A1B
	for <meta-arago@arago-project.org>;
	Wed, 14 Oct 2015 17:30:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9EHUpmS029555
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 12:30:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EHUpK2010687
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 12:30:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 14 Oct 2015 12:30:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EHUoYV020739;
	Wed, 14 Oct 2015 12:30:51 -0500
Date: Wed, 14 Oct 2015 13:30:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151014173035.GN28164@edge>
References: <1444398420-20954-1-git-send-email-j-stiffler@ti.com>
	<20151013172150.GI28164@edge> <561D4C13.80700@ti.com>
MIME-Version: 1.0
In-Reply-To: <561D4C13.80700@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] unshallow-repositories: Fix for 64-bit nativesdk
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
X-List-Received-Date: Wed, 14 Oct 2015 17:30:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2015 at 02:23:15PM -0400, Jacob Stiffler wrote:
> 
> 
> On 10/13/2015 1:21 PM, Denys Dmytriyenko wrote:
> >On Fri, Oct 09, 2015 at 09:47:00AM -0400, Jacob Stiffler wrote:
> >>* Use SDKMACHINE to obtain the location of the nativesdk git
> >>   executable.
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  .../unshallow-repositories/unshallow-repositories.sh                 | 2 +-
> >>  .../unshallow-repositories/unshallow-repositories_1.0.bb             | 5 ++++-
> >>  2 files changed, 5 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> >>index f20a9b5..61bdb88 100755
> >>--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> >>+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> >>@@ -35,7 +35,7 @@
> >>  install_dir="__SDK_INSTALL_DIR__"
> >>  # Find git binary within the host native bin directory
> >>-sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"
> >.../linux-devkit/sysroots/*86*-linux/usr/bin/git ?
> 
> That should work too. If that method is preferred, I'll send out a v2.

It's not that it's preferred, but that is what tisdk-image.bbclass uses now. 
Either way is fine - your way is more robust, but is limited to a specific 
devkit sysroot. If that's fine with you, I can push it as is.


> >>+sdk_git_bin="$install_dir/linux-devkit/sysroots/__SDKMACHINE__*/usr/bin/git"
> >>  sdk_git_bin=`which $sdk_git_bin`
> >>  if [ "$sdk_git_bin" = "" ]
> >>diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> >>index f1ea414..12fd4f2 100644
> >>--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> >>+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> >>@@ -4,12 +4,15 @@ LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;m
> >>  SRC_URI = "file://unshallow-repositories.sh"
> >>-PR = "r0"
> >>+PR = "r1"
> >>  do_install () {
> >>      install -d ${D}/
> >>      install -d ${D}/bin
> >>      install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
> >>+
> >>+    sed -i -e "s|__SDKMACHINE__|${SDKMACHINE}|g" \
> >>+        ${D}/bin/unshallow-repositories.sh
> >>  }
> >>  FILES_${PN} = "/*"
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

