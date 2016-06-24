Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0ACFF52AC1
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 14:37:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5OEaaZV009263
	for <meta-arago@arago-project.org>; Fri, 24 Jun 2016 09:36:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OEbRvj014107
	for <meta-arago@arago-project.org>; Fri, 24 Jun 2016 09:37:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Jun 2016 09:37:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OEbRoN023905;
	Fri, 24 Jun 2016 09:37:27 -0500
Date: Fri, 24 Jun 2016 10:37:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160624143726.GR2177@edge>
References: <1465821936-2658-1-git-send-email-a0393906@ti.com>
	<1465821936-2658-3-git-send-email-a0393906@ti.com>
	<20160620211113.GG2177@edge> <57689528.6090705@ti.com>
MIME-Version: 1.0
In-Reply-To: <57689528.6090705@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Fri, 24 Jun 2016 14:37:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 21, 2016 at 06:45:20AM +0530, Karthik Ramanan wrote:
> Denys,
> 
> On 21-Jun-16 2:41 AM, Denys Dmytriyenko wrote:
> >On Mon, Jun 13, 2016 at 06:15:36PM +0530, Karthik Ramanan wrote:
> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  meta-arago-distro/conf/distro/include/arago-prefs.inc             | 8 ++++++++
> >>  .../recipes-core/packagegroups/packagegroup-arago-gst.bb          | 2 +-
> >>  2 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>index 14a7c8a..ce0814f 100644
> >>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>@@ -66,3 +66,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
> >>  PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
> >>  PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
> >>  PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
> >>+
> >>+PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
> >>+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
> >>+PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
> >>+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
> >>+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
> >>+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
> >Will this break am3 and am4 support by patch #1?
> I'm not really sure, perhaps we should add the machine specific
> PREFERRED_VERSION until the am3 and am4 support is worked out?

Most of those are not machine-specific packages, so it would be troublesome to 
have both 1.2.3 and 1.6.3 versions built for our platforms...


> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >>index d34051e..161430c 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >>@@ -27,7 +27,7 @@ GSTREAMER_DEPS_append_keystone = " \
> >>  GSTREAMER_ACCEL_MM = ""
> >>  GSTREAMER_ACCEL_MM_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
> >>-GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
> >>+#GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
> >Will this be added later or is it going away?
> We are still evaluating and also there is more recipe updates
> required for bug fixes on GST 1.6, so some more patches will come in
> for GStreamer and at which point we can decide on the vpe plugin.
> Let us keep it until that time.

This is Ok for now.


> >>  RDEPENDS_${PN} = "\
> >>      ${GSTREAMER_DEPS} \
> 

