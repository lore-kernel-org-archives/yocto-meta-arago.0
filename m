Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1640A52A1B
	for <meta-arago@arago-project.org>;
	Wed, 14 Oct 2015 17:38:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9EHc3OT020970
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 12:38:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EHc3Qq030144
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 12:38:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 14 Oct 2015 12:38:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EHc1EU013796;
	Wed, 14 Oct 2015 12:38:02 -0500
Date: Wed, 14 Oct 2015 13:37:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151014173744.GO28164@edge>
References: <1444397451-19915-1-git-send-email-j-stiffler@ti.com>
	<20151013171938.GH28164@edge> <561D4BE6.6010404@ti.com>
	<20151014172646.GM28164@edge> <561E914E.7050203@ti.com>
MIME-Version: 1.0
In-Reply-To: <561E914E.7050203@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston: Update weston.ini to show top panel
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
X-List-Received-Date: Wed, 14 Oct 2015 17:38:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 14, 2015 at 01:30:54PM -0400, Jacob Stiffler wrote:
> 
> 
> On 10/14/2015 1:26 PM, Denys Dmytriyenko wrote:
> >On Tue, Oct 13, 2015 at 02:22:30PM -0400, Jacob Stiffler wrote:
> >>
> >>On 10/13/2015 1:19 PM, Denys Dmytriyenko wrote:
> >>>On Fri, Oct 09, 2015 at 09:30:51AM -0400, Jacob Stiffler wrote:
> >>>>* This provides a clock along with a shortcut to the weston-terminal
> >>>What was the reason to disable it in the first place?
> >>I am not aware of the history, but I traced it back to the commit
> >>(a46a4617add52cc2c5dd0f605e5ab75bf23e211e), and it was always
> >>disabled.
> >No, it wasn't always disabled! It got disabled by the commit you specified.
> >
> >The commit log says:
> >
> >* Use ini file to disable unwanted features.
> 
> This appeared to be the initial commit for the ini.
> 
> >
> >Franklin submitted that change for AM-SDK OOBE, which is now Processor SDK
> >OOBE. Hence my question - is top panel wanted or unwanted? :)
> 
> I am not sure of the history for why it was disabled, but the top
> panel is desired so that there is a way to interact with the EVM
> (besides the serial/ssh) if matrix is terminated.

That was exactly my point back then, as I liked the feature myself and used it 
a lot for testing. But I was told OOBE trumps functionality (paraphrasing)...
Anyway, just wanted to know what the flip-flopping is about, never mind, I'll 
take it.


> >>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>---
> >>>>  meta-arago-distro/recipes-graphics/wayland/weston/weston.ini     | 2 +-
> >>>>  meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend | 2 +-
> >>>>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> >>>>index 8caa891..615a604 100644
> >>>>--- a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> >>>>+++ b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> >>>>@@ -1,7 +1,7 @@
> >>>>  [shell]
> >>>>  locking=false
> >>>>  animation=zoom
> >>>>-panel-location=none
> >>>>+panel-location=top
> >>>>  startup-animation=fade
> >>>>  [screensaver]
> >>>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> >>>>index af504b4..fb7cda0 100644
> >>>>--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> >>>>+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> >>>>@@ -2,7 +2,7 @@
> >>>>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
> >>>>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
> >>>>-PR_append = "-arago6"
> >>>>+PR_append = "-arago7"
> >>>>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>>>-- 
> >>>>1.9.1
> >>>>
> >>>>_______________________________________________
> >>>>meta-arago mailing list
> >>>>meta-arago@arago-project.org
> >>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

