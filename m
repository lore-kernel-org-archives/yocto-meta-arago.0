Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6CD2E52A30
	for <meta-arago@arago-project.org>;
	Tue, 24 Feb 2015 20:53:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1OKr4o5004406
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 14:53:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OKr3GG023520
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 14:53:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Feb 2015 14:53:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OKr3YM022888;
	Tue, 24 Feb 2015 14:53:03 -0600
Date: Tue, 24 Feb 2015 15:53:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150224205302.GC4338@edge>
References: <1424472995-22977-1-git-send-email-fcooper@ti.com>
	<1424472995-22977-2-git-send-email-fcooper@ti.com>
	<20150223211729.GM31287@edge>
	<B64B75BC-B319-4E9C-B1CA-C9F3E4560F37@ti.com>
MIME-Version: 1.0
In-Reply-To: <B64B75BC-B319-4E9C-B1CA-C9F3E4560F37@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] packagegroup-arago-tisdk-*: Add back dual camera demo that supports Qt and 3.14
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
X-List-Received-Date: Tue, 24 Feb 2015 20:53:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

In general, it's not advised to pull in library dependencies explicitly, when 
they can be resolved implicitly. Even when installing a package that depends 
on a library not currently installed, it will be pulled in and installed 
automatically as a dependency by opkg.

An exception can be made when the library is expected to be used by a 3rd 
party application or demo that has no recipe and is not installed as an IPK 
binary package... So, I'm fine with this case, I guess.

-- 
Denys


On Mon, Feb 23, 2015 at 04:25:47PM -0500, Cooper Jr., Franklin wrote:
> Devices like am57 should include those packages even though they aren't 
> supported by the dual camera demo.
> 
> And for am437 it's just to insure those libraries r included incase the demo 
> is unused for what ever reason in the future.
> 
> 
> > On Feb 23, 2015, at 3:17 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> > 
> >> On Fri, Feb 20, 2015 at 04:56:33PM -0600, Franklin S. Cooper Jr wrote:
> >> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >> 
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../packagegroup-arago-tisdk-addons.bb             |    6 +++---
> >> ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    7 +++++--
> >> .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
> >> 3 files changed, 11 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> index 6d98ba6..c6b07a9 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> @@ -1,6 +1,6 @@
> >> DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> >> LICENSE = "MIT"
> >> -PR = "r19"
> >> +PR = "r20"
> >> 
> >> inherit packagegroup
> >> 
> >> @@ -39,8 +39,8 @@ UTILS_append_dra7xx = " canutils"
> >> UTILS_append_omap-a15 = " parted"
> >> 
> >> UTILS_append_ti33x = " switch-config"
> >> -UTILS_append_ti43x = " switch-config"
> >> -UTILS_append_omap-a15 = " switch-config"
> >> +UTILS_append_ti43x = " switch-config libdrm-omap"
> >> +UTILS_append_omap-a15 = " switch-config libdrm-omap"
> > 
> > Any particular reason to add libdrm dependency in this packagegroup? It should 
> > be taken care of by DEPENDS and RDEPENDS of the actual package - i.e. dual-cam
> > 
> > 
> >> RDEPENDS_${PN} = "\
> >>     ${UTILS} \
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> >> index 94fd786..8f7c4fe 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> >> @@ -1,6 +1,6 @@
> >> DESCRIPTION = "Task to add multimedia related sources into the SDK"
> >> LICENSE = "MIT"
> >> -PR = "r6"
> >> +PR = "r7"
> >> 
> >> inherit packagegroup
> >> 
> >> @@ -16,7 +16,10 @@ MULTIMEDIA_append_am3517-evm = " \
> >>     av-examples-src \
> >> "
> >> 
> >> -MULTIMEDIA_append_ti43x = ""
> >> +MULTIMEDIA_append_ti43x = " \
> >> +    dual-camera-demo-src \
> >> +    image-gallery-src \
> >> +"
> >> 
> >> #Demo doesn't work on 3.14
> >> # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >> index 81d5ee1..dd495f8 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >> @@ -1,6 +1,6 @@
> >> DESCRIPTION = "Task to add multimedia related packages"
> >> LICENSE = "MIT"
> >> -PR = "r10"
> >> +PR = "r11"
> >> 
> >> inherit packagegroup
> >> 
> >> @@ -17,10 +17,10 @@ MULTIMEDIA_append_ti33x = " \
> >> "
> >> 
> >> MULTIMEDIA_append_ti43x = " \
> >> +    dual-camera-demo \
> >> +    image-gallery \
> >>     amsdk-av-files \
> >> "
> >> -# demo doesn't work on 3.14
> >> -# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)}
> >> 
> >> MULTIMEDIA_append_omap-a15 = " \
> >>     amsdk-av-files \
> >> -- 
> >> 1.7.9.5
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

