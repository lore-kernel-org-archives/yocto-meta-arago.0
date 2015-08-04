Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A088C52A30
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 18:46:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74IkDrx012315
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 13:46:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74IkDaa005709
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 13:46:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 13:46:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74IkDBw013956;
	Tue, 4 Aug 2015 13:46:13 -0500
Date: Tue, 4 Aug 2015 14:45:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150804184557.GS1040@edge>
References: <1438709221-14674-1-git-send-email-j-stiffler@ti.com>
	<1438709221-14674-2-git-send-email-j-stiffler@ti.com>
	<20150804174526.GR1040@edge> <55C10347.7090808@ti.com>
MIME-Version: 1.0
In-Reply-To: <55C10347.7090808@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] packagegroup-arago-tisdk-matrix: Add accelerated MM demos
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
X-List-Received-Date: Tue, 04 Aug 2015 18:46:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 04, 2015 at 02:24:07PM -0400, Jacob Stiffler wrote:
> 
> 
> On 8/4/2015 1:45 PM, Denys Dmytriyenko wrote:
> >On Tue, Aug 04, 2015 at 01:27:01PM -0400, Jacob Stiffler wrote:
> >>* Add if "mmip" is a feature
> >>* Remove old mpeg4 demos
> >What's wrong with the old mpeg4 demos? Can those be used when mmip is not set?
> >Are those HW accelerated?
> 
> I suppose there's nothing wrong with them. Should I add them if mmip
> is not a feature? Or keep them whether or not mmip is a feature?

So, if I understand correctly, you are replacing old non-accelerated demos 
with the HW accelerated ones. If they can co-exist, lets keep them all, unless 
you have any OOB objections. Thanks.


> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> >>index 6c4b817..277fca9 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> >>@@ -1,6 +1,6 @@
> >>  DESCRIPTION = "Task to include Matrix v2"
> >>  LICENSE = "MIT"
> >>-PR = "r40"
> >>+PR = "r41"
> >>  inherit packagegroup
> >>@@ -89,9 +89,9 @@ MATRIX_APPS_append_ti43x = "        \
> >>  MATRIX_APPS_append_omap-a15 = "     \
> >>      matrix-multimedia-demo-aac      \
> >>-    matrix-multimedia-demo-h264dec  \
> >>-    matrix-multimedia-demo-mpeg4aacdec \
> >>-    matrix-multimedia-demo-mpeg4dec \
> >>+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
> >>+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
> >>+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
> >>      matrix-gui-generic-pm           \
> >>      matrix-gui-clocks               \
> >>      matrix-gui-pm-demos-governor    \
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

