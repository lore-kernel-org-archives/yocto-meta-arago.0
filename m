Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E5CD45208B
	for <meta-arago@arago-project.org>;
	Wed, 17 Feb 2016 22:28:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1HMS5HZ012257
	for <meta-arago@arago-project.org>; Wed, 17 Feb 2016 16:28:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1HMS5d2017461
	for <meta-arago@arago-project.org>; Wed, 17 Feb 2016 16:28:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Feb 2016 16:28:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1HMS4rc000505;
	Wed, 17 Feb 2016 16:28:04 -0600
Date: Wed, 17 Feb 2016 17:27:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160217222748.GH31480@edge>
References: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
	<56C21EA9.3090209@ti.com> <20160215190458.GG31480@edge>
	<56C237D5.9030907@ti.com> <20160215210210.GK31480@edge>
	<56C4F1AA.5060609@ti.com>
MIME-Version: 1.0
In-Reply-To: <56C4F1AA.5060609@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] arago.conf: Remove qtwayland from opencv PACKAGECONFIG for keystone
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
X-List-Received-Date: Wed, 17 Feb 2016 22:28:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, it would be rather expensive to rebuild opencv for each machine...
BTW, in this case having a .bbappend would be more preferable to change 
PACKAGECONFIG for keystone and set it as machine-speicfic.

-- 
Denys


On Wed, Feb 17, 2016 at 05:18:18PM -0500, Jacob Stiffler wrote:
> Should I mark opencv as machine-specific in arago.conf?
> 
> On 2/15/2016 4:02 PM, Denys Dmytriyenko wrote:
> >On Mon, Feb 15, 2016 at 03:40:53PM -0500, Jacob Stiffler wrote:
> >>
> >>On 2/15/2016 2:04 PM, Denys Dmytriyenko wrote:
> >>>On Mon, Feb 15, 2016 at 01:53:29PM -0500, Jacob Stiffler wrote:
> >>>>This may be more of an RFC as I have some concerns.
> >>>>
> >>>>I am concerned with this patch as it adds machine-specific
> >>>>configuration for opencv, but the recipe is not marked as
> >>>>machine-specific.
> >>>>
> >>>>Will this pose an issue?
> >>>Yeah, I just replied on this part.
> >>>
> >>>
> >>>>Now I understand that if opencv packaging is done well enough, that
> >>>>we should still be able to build the qtwayland parts of opencv, but
> >>>>do not install them in the keystone filesystem so that wayland is
> >>>>not brought in. However, wayland has a dependency on the ddk, which
> >>>>is not compatible with keystone machines. Thus the opencv build will
> >>>>be broken for keystone machines.
> >>>>
> >>>>Any suggestions?
> >>>Quick question - where did 3.1 recipe come from and what exactly qtwayland
> >>>dependency do?
> >>The 3.1 recipe was created by Hongmei and based on
> >>http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-support/opencv/opencv_2.4.bb?h=master.
> >Well, not exactly. The original 3.0 recipe that we added to meta-arago was
> >backported from meta-oe/master as is.
> >
> >Then, 3.1 update came along and this one is completely custom, as no other
> >layer has 3.1 and the dependency on qtwayland is also something that we added.
> >
> >
> >>We use the qtwayland component for the GUI in the video analytics demo.
> >Ok, by the looks of it, enabling WITH_QT option in opencv allows it to work
> >with QT and open windows in opencv-enabled apps...
> >
> >
> >>>>On 2/15/2016 1:43 PM, Jacob Stiffler wrote:
> >>>>>* keystone machines do not have a display, hence they do not support
> >>>>>   wayland
> >>>>>* opencv adds qtwayland support since wayland is in DISTRO_FEATURES
> >>>>>* Remove qtwayland from opencv PACKAGECONFIG for keystone machines
> >>>>>
> >>>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>>---
> >>>>>  meta-arago-distro/conf/distro/arago.conf | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>>diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> >>>>>index 325e112..38c7887 100644
> >>>>>--- a/meta-arago-distro/conf/distro/arago.conf
> >>>>>+++ b/meta-arago-distro/conf/distro/arago.conf
> >>>>>@@ -58,6 +58,9 @@ PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
> >>>>>  # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> >>>>>  PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
> >>>>>+# Remove qtwayland from openvcv PACKAGECONFIG for keystone
> >>>>>+PACKAGECONFIG_remove_pn-opencv_keystone = "qtwayland"
> >>>>>+
> >>>>>  # Enable UI and scripting for perf
> >>>>>  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
> >>>>_______________________________________________
> >>>>meta-arago mailing list
> >>>>meta-arago@arago-project.org
> >>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

