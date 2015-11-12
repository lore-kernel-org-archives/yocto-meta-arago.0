Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 770E052A3A
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 16:45:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tACGjEIh003137;
	Thu, 12 Nov 2015 10:45:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tACGjEwS008772;
	Thu, 12 Nov 2015 10:45:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Nov 2015 10:45:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tACGjE68015114;
	Thu, 12 Nov 2015 10:45:14 -0600
Date: Thu, 12 Nov 2015 11:44:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151112164458.GQ3272@edge>
References: <1447293885-4222-1-git-send-email-denis@denix.org>
	<5644AA40.5030507@ti.com>
MIME-Version: 1.0
In-Reply-To: <5644AA40.5030507@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] nativesdk-qtbase: drop locally applied patch that was upstreamed
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
X-List-Received-Date: Thu, 12 Nov 2015 16:45:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yeah, I meant to un-pin meta-qt5 some time ago right after 2015.01. Any 
particular reason you want it pinned now?


On Thu, Nov 12, 2015 at 10:03:28AM -0500, Jacob Stiffler wrote:
> In our configs, we have the meta-qt5 layer frozen at
> 97ce05c0b2a81f05388d7f727741529fb9177775.
> 
> How will we get this upstream patch?
> 
> Thanks,
> Jake
> 
> On 11/11/2015 9:04 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  ...xpand-path-increase-change-to-2-more-path.patch | 28 ----------------------
> >  .../recipes-qt/qt5/nativesdk-qtbase_%.bbappend     |  5 ----
> >  2 files changed, 33 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
> >  delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
> >deleted file mode 100644
> >index fc54c64..0000000
> >--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
> >+++ /dev/null
> >@@ -1,28 +0,0 @@
> >-From cfa358e04b9e7c66d59db3000b2a2ab2ebf543c8 Mon Sep 17 00:00:00 2001
> >-From: Denys Dmytriyenko <denys@ti.com>
> >-Date: Tue, 25 Aug 2015 11:26:48 -0400
> >-Subject: [PATCH] configure: expand path increase change to 2 more paths
> >-
> >-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >----
> >- configure | 4 ++--
> >- 1 file changed, 2 insertions(+), 2 deletions(-)
> >-
> >-diff --git a/configure b/configure
> >-index bea14af..fe18487 100755
> >---- a/configure
> >-+++ b/configure
> >-@@ -3853,8 +3853,8 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
> >- /* Installation Info */
> >- static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
> >- #ifdef QT_BUILD_QMAKE
> >--static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
> >--static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
> >-+static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
> >-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
> >- #endif
> >-
> >- static const short qt_configure_str_offsets[] = {
> >---
> >-2.2.0
> >-
> >diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
> >deleted file mode 100644
> >index 39f739a..0000000
> >--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
> >+++ /dev/null
> >@@ -1,5 +0,0 @@
> >-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >-
> >-SRC_URI += "file://0001-configure-expand-path-increase-change-to-2-more-path.patch"
> >-
> >-PR_append = "-arago0"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

