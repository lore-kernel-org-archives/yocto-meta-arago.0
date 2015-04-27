Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1CEAE52099
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 19:07:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RJ7olj026181;
	Mon, 27 Apr 2015 14:07:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJ7mh4008954;
	Mon, 27 Apr 2015 14:07:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 14:07:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJ7mq7009158;
	Mon, 27 Apr 2015 14:07:48 -0500
Date: Mon, 27 Apr 2015 15:07:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150427190747.GJ29290@edge>
References: <1430157196-11756-1-git-send-email-denis@denix.org>
	<553E84F4.5080403@ti.com>
MIME-Version: 1.0
In-Reply-To: <553E84F4.5080403@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer, conf: add GST_PROVIDER to switch between 0.10 and 1.x gstreamer
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
X-List-Received-Date: Mon, 27 Apr 2015 19:07:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

You are correct - missed SRCREV for some reason...


On Mon, Apr 27, 2015 at 02:50:28PM -0400, Jacob Stiffler wrote:
> Most of this looks good to me.
> 
> However, in the previous patch to update glsdk-example-apps, there
> was a SRCREV bump which is missing here. Is the newer SRCREV
> required for gstreamer1.0? And would it be compatible with gstreamer
> 0.10?
> 
> Thanks,
> Jake
> 
> On 4/27/2015 1:53 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  meta-arago-distro/conf/distro/arago.conf           |  9 +++++---
> >  .../conf/distro/include/arago-prefs.inc            |  8 ++++---
> >  .../packagegroup-arago-gst-sdk-target.bb           | 16 ++++++++++++--
> >  .../packagegroups/packagegroup-arago-gst.bb        | 25 ++++++++++++++++------
> >  .../glsdk-example-apps/glsdk-example-apps.bb       |  4 ++--
> >  5 files changed, 46 insertions(+), 16 deletions(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> >index 450ffe7..5debe0b 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -24,6 +24,9 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
> >  # Set additional distro features
> >  DISTRO_FEATURES += "pam ${@base_contains('MACHINE_FEATURES', 'screen', 'wayland', '', d)}"
> >+# Set preferred gstreamer version (0.10 vs 1.0)
> >+GST_PROVIDER ?= "1.0"
> >+
> >  # Set preferred Qt version
> >  QT_PROVIDER ?= "qt5"
> >@@ -35,8 +38,8 @@ PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
> >  PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
> >  PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
> >-# Configure gstreamer-0.10.x as a dependency instead of gstreamer-1.x
> >-PACKAGECONFIG_pn-qtwebkit = "gstreamer010 qtlocation qtmultimedia qtsensors"
> >+# Configure gstreamer dependency based on GST_PROVIDER
> >+PACKAGECONFIG_pn-qtwebkit = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer010', 'gstreamer', d)} qtlocation qtmultimedia qtsensors"
> >  # Enable UI and scripting for perf
> >  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
> >@@ -86,4 +89,4 @@ ENTERPRISE_DISTRO = "1"
> >  # disable by default the codecs in libav that causes issues with shipping an
> >  # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
> >  # disable troublesome software.
> >-LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
> >+LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav"
> >diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >index 4f2c854..9f12562 100644
> >--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >@@ -113,9 +113,11 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
> >  PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
> >  PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
> >-PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
> >-PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
> >-PREFERRED_PROVIDER_gstreamer-dbg = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dbg', 'gstreamer-dbg', d)}"
> >+GST_MM_ACCEL = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
> >+PREFERRED_PROVIDER_gstreamer = "${@base_conditional('GST_PROVIDER', '0.10', "${GST_MM_ACCEL}", 'gstreamer', d)}"
> >+PREFERRED_PROVIDER_gstreamer-dev = "${@base_conditional('GST_PROVIDER', '0.10', "${GST_MM_ACCEL}-dev", 'gstreamer-dev', d)}"
> >+PREFERRED_PROVIDER_gstreamer-dbg = "${@base_conditional('GST_PROVIDER', '0.10', "${GST_MM_ACCEL}-dbg", 'gstreamer-dbg', d)}"
> >+
> >  PREFERRED_PROVIDER_gst-plugins-bad = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel', 'gst-plugins-bad', d)}"
> >  PREFERRED_PROVIDER_gst-plugins-bad-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-dev', 'gst-plugins-bad-dev', d)}"
> >  PREFERRED_PROVIDER_gst-plugins-bad-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-meta', 'gst-plugins-bad-meta', d)}"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> >index 7897b8a..37e63a3 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> >@@ -1,13 +1,25 @@
> >  DESCRIPTION = "Task to build and install header and libs in sdk"
> >  LICENSE = "MIT"
> >-PR = "r7"
> >+PR = "r8"
> >  inherit packagegroup
> >-RDEPENDS_${PN} = "\
> >+GST_010_DEPS = " \
> >      gstreamer-dev \
> >      gst-plugins-base-dev \
> >      gst-plugins-good-dev \
> >      gst-plugins-bad-dev \
> >      gst-ffmpeg-dev \
> >  "
> >+
> >+GST_1X_DEPS = " \
> >+    gstreamer1.0-dev \
> >+    gstreamer1.0-plugins-base-dev \
> >+    gstreamer1.0-plugins-good-dev \
> >+    gstreamer1.0-plugins-bad-dev \
> >+    gstreamer1.0-libav-dev \
> >+"
> >+
> >+RDEPENDS_${PN} = " \
> >+    ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
> >+"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >index d88e4c8..b449dfe 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> >@@ -1,12 +1,12 @@
> >  DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
> >  LICENSE = "MIT"
> >-PR = "r11"
> >+PR = "r12"
> >  inherit packagegroup
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-GSTREAMER = " \
> >+GST_010_DEPS = " \
> >      gstreamer \
> >      gst-plugins-base \
> >      gst-plugins-good \
> >@@ -14,14 +14,27 @@ GSTREAMER = " \
> >      gst-plugins-base-meta \
> >      gst-plugins-good-meta \
> >      gst-plugins-bad-meta \
> >+    gst-ffmpeg \
> >+"
> >+
> >+GST_1X_DEPS = " \
> >+    gstreamer1.0 \
> >+    gstreamer1.0-plugins-base \
> >+    gstreamer1.0-plugins-good \
> >+    gstreamer1.0-plugins-bad \
> >+    gstreamer1.0-plugins-base-meta \
> >+    gstreamer1.0-plugins-good-meta \
> >+    gstreamer1.0-plugins-bad-meta \
> >+    gstreamer1.0-libav \
> >  "
> >+GST_PLUGINS_PREFIX = "${@base_conditional('GST_PROVIDER', '0.10', 'gst-plugins', 'gstreamer1.0-plugins', d)}"
> >+
> >  GSTREAMER_ACCEL_MM = ""
> >-GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-ducati', '', d)}"
> >-GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', ' gst-plugins-vpe', '', d)}"
> >+GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
> >+GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
> >  RDEPENDS_${PN} = "\
> >-    ${GSTREAMER} \
> >+    ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
> >      ${GSTREAMER_ACCEL_MM} \
> >-    gst-ffmpeg \
> >      "
> >diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >index a6b45b8..9236d6d 100644
> >--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> >@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
> >  LICENSE = "BSD"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
> >-DEPENDS = "gstreamer libdrm ti-ipc"
> >+DEPENDS = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer', 'gstreamer1.0', d)} libdrm ti-ipc"
> >  COMPATIBLE_MACHINE = "dra7xx-evm"
> >@@ -14,4 +14,4 @@ inherit autotools pkgconfig
> >  SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
> >  SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
> >-PR = "r1"
> >+PR = "r2"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

