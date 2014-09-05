Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 19D8F52A9B
	for <meta-arago@arago-project.org>;
	Fri,  5 Sep 2014 14:52:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s85Eqw43032163;
	Fri, 5 Sep 2014 09:52:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85EqwWm017448;
	Fri, 5 Sep 2014 09:52:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 5 Sep 2014 09:52:57 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85EqpBu003986;
	Fri, 5 Sep 2014 09:52:56 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Sep 2014 20:22:45 +0530
Message-ID: <1409928767-11517-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409928767-11517-1-git-send-email-a0393906@ti.com>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>, Ross Burton <ross.burton@intel.com>
Subject: [for master] [PATCH v2 2/4] weston: upgrade to 1.3.0
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
X-List-Received-Date: Fri, 05 Sep 2014 14:52:59 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Remove backported patches that are now integrated.

No need to patch build to install examples with --enable-demo-clients, update
FILES now that all examples are being installed.

Remove cairo-gl option as our cairo doesn't support GL (yet), remove
--disable-android-compositor as it was dropped upstream, and add PACKAGECONFIG
for the VAAPI-based recorder as otherwise it's a floating dependency (libva is
in meta-intel).

Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/wayland/weston_1.3.0.bb       | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
new file mode 100644
index 0000000..eb38ce1
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
@@ -0,0 +1,80 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://weston.png \
+           file://weston.desktop"
+SRC_URI[md5sum] = "29ad994dd5ea07f52d7bffb24c25d9f7"
+SRC_URI[sha256sum] = "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a0"
+
+
+inherit autotools pkgconfig useradd
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland virtual/mesa virtual/egl pango"
+
+EXTRA_OECONF = "--enable-setuid-install \
+                --disable-tablet-shell \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --enable-demo-clients \
+                --disable-simple-egl-clients \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor"
+
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                  "
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+# weston-launch
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
+# VA-API desktop recorder
+PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/weston/*.la
+
+	for feature in ${DISTRO_FEATURES}; do
+		# If X11, ship a desktop file to launch it
+		if [ "$feature" = "x11" ]; then
+			install -d ${D}${datadir}/applications
+			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+			install -d ${D}${datadir}/icons/hicolor/48x48/apps
+			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+                fi
+	done
+}
+
+PACKAGES += "${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
2.0.1


