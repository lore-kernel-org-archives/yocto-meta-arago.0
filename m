Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D73D552974
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:51:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OEp001012013;
	Thu, 24 Apr 2014 09:51:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEp0I0003352;
	Thu, 24 Apr 2014 09:51:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 09:50:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEoxhZ018910;
	Thu, 24 Apr 2014 09:50:59 -0500
Date: Thu, 24 Apr 2014 10:50:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140424145059.GH18053@edge>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-3-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB1F10@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB1F10@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/8] qtbase: move setting PACKAGECONFIG flags	to arago.conf
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
X-List-Received-Date: Thu, 24 Apr 2014 14:51:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 24, 2014 at 12:33:21PM +0000, Maupin, Chase wrote:
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 8:51 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 3/8] qtbase: move setting
> >PACKAGECONFIG flags to arago.conf
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/conf/distro/arago.conf               | 5 +++++
> > meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend | 4 +---
> > 2 files changed, 6 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> >arago-distro/conf/distro/arago.conf
> >index 1c8c572..7bd1de2 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -26,6 +26,11 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2
> >irda largefile pcmcia usbgadget usbh
> > DISTRO_FEATURES += "opengl"
> > PACKAGECONFIG_pn-weston = "kms fbdev"
> >
> >+# Configure Qt5 flags (GLES is disabled for now)
> >+#PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
> >+PACKAGECONFIG_GL_pn-qtbase = "linuxfb"
> >+PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
> >+
> 
> Can you explain this a bit more?  What is the advantage of moving it to the 
> config vs in the recipe?

Most of PACKAGECONFIG flags are set automatically based on DISTRO_FEATURES, 
but not all of them. The remainder can still be thought as distro-specific.
The big thing is to set those up centrally w/o creating unnecessary bbappends. 
Of course, in this case we still need bbappend for qtbase for patches, but I 
just wanted to start consolidating different PACKAGEGROUPS in one place, like 
I did with Weston above...


> > # ARM9 is not supported by the Linaro toolchain so default back
> >to the Arago
> > # toolchain for ARM9 based SOCs.
> > TC_SANE_DEFAULT :=
> >"${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}
> >"
> >diff --git a/meta-arago-distro/recipes-
> >qt/qt5/qtbase_5.2.0.bbappend b/meta-arago-distro/recipes-
> >qt/qt5/qtbase_5.2.0.bbappend
> >index d35a948..2c0a52d 100644
> >--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> >+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> >@@ -1,10 +1,8 @@
> > FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >
> >-PACKAGECONFIG_GL = "icu linuxfb"
> >-
> > SRC_URI += " \
> > 	file://0001-qeglfswindow.cpp.patch \
> > 	file://0002-qeglfswindow.cpp.patch \
> > "
> >
> >-PR_append = "-arago0"
> >+PR_append = "-arago1"
> >--
> >1.9.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

