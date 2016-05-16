Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 623FE529EF
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 16:27:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4GGRShY001489;
	Mon, 16 May 2016 11:27:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GGRS9P008677;
	Mon, 16 May 2016 11:27:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 May 2016 11:27:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GGRRB1022835;
	Mon, 16 May 2016 11:27:27 -0500
Date: Mon, 16 May 2016 12:27:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20160516162711.GJ16188@edge>
References: <1463173367-22643-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1463173367-22643-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] recipes: replace old-style dashes in PRs with dots globally
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
X-List-Received-Date: Mon, 16 May 2016 16:27:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any comments or concerns?


On Fri, May 13, 2016 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Note: this will fail the next build with PR service, but is necessary to align
> with versioning policy and to break the old habit of using dashes in PRs.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend          | 2 +-
>  meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend          | 2 +-
>  meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend            | 2 +-
>  meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend            | 2 +-
>  meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend      | 2 +-
>  meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend         | 2 +-
>  meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend        | 2 +-
>  meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend       | 2 +-
>  meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2d.bbappend  | 2 +-
>  meta-arago-distro/recipes-core/base-files/base-files_%.bbappend         | 2 +-
>  meta-arago-distro/recipes-core/busybox/busybox_%.bbappend               | 2 +-
>  meta-arago-distro/recipes-core/dbus/dbus_%.bbappend                     | 2 +-
>  meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend             | 2 +-
>  meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend   | 2 +-
>  meta-arago-distro/recipes-core/psplash/psplash_git.bbappend             | 2 +-
>  meta-arago-distro/recipes-core/systemd/systemd_%.bbappend               | 2 +-
>  meta-arago-distro/recipes-core/udev/eudev_%.bbappend                    | 2 +-
>  meta-arago-distro/recipes-devtools/php/php_%.bbappend                   | 2 +-
>  meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend               | 2 +-
>  meta-arago-distro/recipes-extended/bash/bash_%.bbappend                 | 2 +-
>  meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend   | 2 +-
>  meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend    | 2 +-
>  meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend             | 2 +-
>  meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend                | 2 +-
>  meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend         | 2 +-
>  meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend               | 2 +-
>  meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend         | 2 +-
>  meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend        | 2 +-
>  meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend  | 2 +-
>  meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend   | 2 +-
>  .../recipes-kernel/linux/linux-ti-staging-systest_%.bbappend            | 2 +-
>  meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend      | 2 +-
>  meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend           | 2 +-
>  meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend          | 2 +-
>  meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend            | 2 +-
>  meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend                      | 2 +-
>  meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend                    | 2 +-
>  meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend              | 2 +-
>  meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend    | 2 +-
>  meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend           | 2 +-
>  meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend      | 2 +-
>  meta-arago-extras/recipes-core/llvm/llvm-common.bbappend                | 2 +-
>  meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend  | 2 +-
>  .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                   | 2 +-
>  .../gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend                  | 2 +-
>  .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend                  | 2 +-
>  meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend        | 2 +-
>  47 files changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend
> index bdd9124..e0b3ebe 100644
> --- a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend
> +++ b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  SRCIPK_SRC_DIR = "${S}/${PLATFORM_ARCH}"
> diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
> index 9685f42..1f6cd80 100644
> --- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
> +++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  INSANE_SKIP_${PN} += "ldflags"
>  
> -PR_append = "-arago2"
> +PR_append = ".arago2"
>  
>  SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
>  
> diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
> index 6418ff4..57c5d68 100644
> --- a/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
> +++ b/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
> @@ -1,7 +1,7 @@
>  INSANE_SKIP_${PN} += "ldflags"
>  INSANE_SKIP_${PN}-openmp += "ldflags"
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
>  
>  BRANCH = "sdk"
>  SRCREV = "96156d407d9a4e5fac4513f3d3f60a414b3355cd"
> diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> index 25a9778..c5a35b7 100644
> --- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> +++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> index d111425..8cb5cfb 100644
> --- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago1"
> +PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> diff --git a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
> index 468489f..5af0b4c 100644
> --- a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago2"
> +PR_append = ".arago2"
>  
>  # Add apps/obex_test for testing
>  do_configure_prepend() {
> diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
> index 820e00f..89a77d5 100644
> --- a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago1"
> +PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
> index b3cb26c..597d6da 100644
> --- a/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
> @@ -10,4 +10,4 @@
>  # openssh-6.1p1
>  # openssh-6.2p2
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2d.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2d.bbappend
> index 486f106..96d6263 100644
> --- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2d.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2d.bbappend
> @@ -10,7 +10,7 @@
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  DEPENDS += "cryptodev-linux"
>  RDEPENDS_${PN}_class-target += "cryptodev-module"
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> index 956a057..c5f25f6 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago4"
> +PR_append = ".arago4"
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> index e70f579..709ebda 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago20"
> +PR_append = ".arago20"
> diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> index 0617da6..6e5d14c 100644
> --- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> +++ b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago1"
> +PR_append = ".arago1"
>  
>  LICENSE = "GPLv2+"
> diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
> index e7868e2..e8ffa4a 100644
> --- a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
> +++ b/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
> @@ -11,4 +11,4 @@
>  # This package requires TSU exemption. Any update to the version of dropbear being
>  # appended must be double checked to see if a new TSU exemption must be made.
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
> diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> index 997adf2..129dd96 100644
> --- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> +++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> index d354a93..1880460 100644
> --- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> +++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago3"
> +PR_append = ".arago3"
>  
>  # Update which portion of the psplash.h file to use as a checksum. This tweak
>  # has already been done in oe-core master
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index 05c8e34..5556eea 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  do_install_append() {
>      install -d ${D}/${base_libdir}
> diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
> index 4080723..7d0a496 100644
> --- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
> +++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
> @@ -5,7 +5,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago5"
> +PR_append = ".arago5"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/meta-arago-distro/recipes-devtools/php/php_%.bbappend b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
> index 9ed88ef..ab402f7 100644
> --- a/meta-arago-distro/recipes-devtools/php/php_%.bbappend
> +++ b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
>  
>  SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
>  
> diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
> index c2d6b49..833d29a 100644
> --- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
> +++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
> @@ -7,4 +7,4 @@ SRC_URI += " \
>  	file://0001-Return-non-zero-value-on-test-failure.patch \
>  	file://0002-cpuidle-Avoid-relative-paths.patch"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
> diff --git a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
> index 28a429c..01e4c85 100644
> --- a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
> +++ b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  EXTRA_OECONF += " --disable-command-timing"
> diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> index 0f997ad..b8f981c 100644
> --- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> +++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  do_install_append () {
>      # Allow telnet sessions to login as root
> diff --git a/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend b/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
> index 63b72ca..ae2c32f 100644
> --- a/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
> +++ b/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
> @@ -5,4 +5,4 @@ TAG = "bab595e38295dcafcfc17a011d3d51f2df1618e6"
>  # Set the PV to 4.0.6 plus the commit id
>  PV = "4.0.6+gitr${SRCPV}"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
> diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend b/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
> index c0ab069..d66b008 100644
> --- a/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
> +++ b/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> index f593fb9..0ef183e 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> @@ -2,4 +2,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  SRC_URI += "file://0001-Add-option-to-run-a-test-indefinitely.patch"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
> diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
> index 6641cb5..f99ac3c 100644
> --- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
> +++ b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  LICENSE = "GPLv2+"
> diff --git a/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend b/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
> index e3b3b38..f9aec68 100644
> --- a/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
> +++ b/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> index 4c41f19..78a839f 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago6"
> +PR_append = ".arago6"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> index 14c5942..dd8f8cb 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = "-arago5"
> +PR_append = ".arago5"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> index 99b426c..f8a35cd 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  KERNEL_MODULE_AUTOLOAD += "cryptodev"
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> index b93b610..7c90ac5 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = "-arago0"
> +MACHINE_KERNEL_PR_append = ".arago0"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> index b93b610..7c90ac5 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = "-arago0"
> +MACHINE_KERNEL_PR_append = ".arago0"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> index fc92ed9..4c50655 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = "-arago4"
> +MACHINE_KERNEL_PR_append = ".arago4"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> index 551ffcd..8284e9d 100644
> --- a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  PACKAGECONFIG_remove = "x264"
>  LICENSE_FLAGS = ""
> diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> index 926d753..dc8977a 100644
> --- a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  PACKAGECONFIG := "${@oe_filter_out('x264','${PACKAGECONFIG}', d)}"
>  LICENSE_FLAGS = ""
> diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
> index 10fc5ff..429a40c 100644
> --- a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  # Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
>  DEPENDS_remove = "xz"
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> index f40d978..5d6f5e4 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> @@ -4,7 +4,7 @@ GLES_EXTRA_DEPS = "libdrm wayland"
>  
>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
>  
> -PR_append = "-arago12"
> +PR_append = ".arago12"
>  
>  QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
>  
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> index 26bda41..a9289e8 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> @@ -7,4 +7,4 @@ SRC_URI += " \
>  	file://WebCore.pri.patch \
>  "
>  
> -PR_append = "-arago4"
> +PR_append = ".arago4"
> diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> index fa73dd0..456982c 100644
> --- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> +++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
>  # version of gettext.
> diff --git a/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend b/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
> index 1386a89..b4cee8f 100644
> --- a/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
> +++ b/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
> index 4885c7d..db716cc 100644
> --- a/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
> +++ b/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  do_install_append() {
>  #   Install private files to allow libnl extensions
> diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
> index aecaf1f..de6f282 100644
> --- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
> +++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago3"
> +PR_append = ".arago3"
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  
>  DEPENDS_remove = "gmp"
> diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend b/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
> index 65de0d8..27c27f5 100644
> --- a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
> +++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
>  
> diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> index c5c460b..def3aec 100644
> --- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> @@ -6,7 +6,7 @@ ALLOW_EMPTY_ldd = "1"
>  ALLOW_EMPTY_libstdc++ = "1"
>  ALLOW_EMPTY_libgomp = "1"
>  
> -PR_append = "-arago30"
> +PR_append = ".arago30"
>  
>  PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
>  PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index 6518c7a..3580bde 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -39,4 +39,4 @@ SRCREV = "3a7dce1011d2ad002f9341c8f0be2e409d73ea7b"
>  SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
>  SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
>  
> -PR_append = "-arago10"
> +PR_append = ".arago10"
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
> index 58af98a..ca675bd 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
> @@ -5,4 +5,4 @@ SRC_URI_append = " \
>          file://0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch \
>  "
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> index 6b8df1d..90ba547 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> @@ -4,4 +4,4 @@ SRC_URI_append = " \
>          file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch \
>          file://0002-gstv4l2src-Optimize-delay-in-capture.patch"
>  
> -PR_append = "-arago1"
> +PR_append = ".arago1"
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend
> index cb0f413..f8cb6b8 100644
> --- a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend
> @@ -5,7 +5,7 @@
>  
>  SRCREV = "7e9f28bedc1ed3205fb5164f686aea96f27a0de2"
>  
> -PR_append = "-arago0"
> +PR_append = ".arago0"
>  
>  CFLAGS += "-I${S}/include"
>  
> -- 
> 2.2.0
> 

