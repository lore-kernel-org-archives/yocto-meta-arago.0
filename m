Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4AF0E529D9
	for <meta-arago@arago-project.org>;
	Tue, 24 Feb 2015 20:18:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1OKIvwC013583
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 14:18:57 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OKIuEA030366
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 14:18:56 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Feb 2015 14:18:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OKIu1D007398;
	Tue, 24 Feb 2015 14:18:56 -0600
Date: Tue, 24 Feb 2015 15:18:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150224201855.GA4338@edge>
References: <1424697513-22767-1-git-send-email-a0393906@ti.com>
	<20150223211901.GN31287@edge> <54EBF9A7.50706@ti.com>
MIME-Version: 1.0
In-Reply-To: <54EBF9A7.50706@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago 1/1] glsdk-example-apps: Update SRCREV for GLSDK 7.00 EA
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
X-List-Received-Date: Tue, 24 Feb 2015 20:18:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 24, 2015 at 09:40:15AM +0530, Karthik Ramanan wrote:
> On 24-Feb-15 2:49 AM, Denys Dmytriyenko wrote:
> >On Mon, Feb 23, 2015 at 06:48:33PM +0530, Karthik Ramanan wrote:
> >>  * Also update dependency to gstreamer 1.0
> >
> >This is all nice and all, but we should coordinate switching gstreamer version
> >across the board, or else we'll end up with both of them built into rootfs...
> 
> Denys,
> 
> GLSDK has already switched to GST 1.0.
> 
> I take your point, ideally this patch should have been part of the
> patch set that brings in GStreamer 1.0 and its adaptations. Am
> planning to push the patches for GStreamer 1.0 support next week.
> 
> My understanding was that this package/recipe was not being used by
> other SDK's and so it was fine to update this in the meta-arago.
> 
> If you think that it should wait, then I will abandon this for now.

Karthik,

On one hand I understand that this recipe is not used by any other SDK at the 
moment. On the other hand, I would prefer it to be part of the patchset you 
plan for next week to migrate to gstreamer 1.x. Thanks.

-- 
Denys



> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  .../glsdk-example-apps/glsdk-example-apps.bb       |    7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >>index a6b45b8..6598d7d 100644
> >>--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >>+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >>@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
> >>  LICENSE = "BSD"
> >>  LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
> >>
> >>-DEPENDS = "gstreamer libdrm ti-ipc"
> >>+DEPENDS = "gstreamer1.0 libdrm ti-ipc"
> >>
> >>  COMPATIBLE_MACHINE = "dra7xx-evm"
> >>
> >>@@ -12,6 +12,7 @@ S = "${WORKDIR}/git"
> >>  inherit autotools pkgconfig
> >>
> >>  SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
> >>-SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
> >>+SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
> >>+
> >>+PR = "r2"
> >>
> >>-PR = "r1"
> >>--
> >>1.7.9.5
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

