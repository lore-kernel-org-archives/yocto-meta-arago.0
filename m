Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8962652992
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:19:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THJdKK005423
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:19:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THJd5H005017
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:19:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:19:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THJdO0019167;
	Fri, 29 Aug 2014 12:19:39 -0500
Date: Fri, 29 Aug 2014 13:19:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140829171939.GK18620@edge>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<1408713923-25284-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1408713923-25284-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, nikhil.nd@ti.com
Subject: Re: [PATCH 1/2] wayland: add support for version 1.3.0 for drm backend
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
X-List-Received-Date: Fri, 29 Aug 2014 17:19:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same comment as to first overlay the original w/o any changes and make changes 
in a separate patch. Also, please see additional comments below.


On Fri, Aug 22, 2014 at 06:55:22PM +0530, Karthik Ramanan wrote:
> For DRM based devices, it is desired to stick with version 1.3.0
> due to some known issues and limitations with omapdrm and other
> dependent foundation software
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/wayland/just-scanner.patch    |   36 ++++++++++++++++++++
>  .../recipes-graphics/wayland/wayland.inc           |    5 +++
>  .../recipes-graphics/wayland/wayland_1.3.0.bb      |   34 ++++++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/just-scanner.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland.inc
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/just-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/just-scanner.patch
> new file mode 100644
> index 0000000..c72d2d5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/just-scanner.patch
> @@ -0,0 +1,36 @@
> +We only build wayland-native for the scanner, so disable the bits we don't
> +actually need.  This gives us a small speed up but importantly should allow
> +wayland-native to compile on older hosts such as CentOS 5 which currently fails:
> +
> +| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
> +| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
> +| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
> +| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
> +| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 306d7b3..571fe89 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -2,7 +2,7 @@ if BUILD_DOCS
> + doc_subdir = doc
> + endif
> + 
> +-SUBDIRS = src protocol $(doc_subdir) tests cursor
> ++SUBDIRS = src protocol $(doc_subdir)
> + 
> + ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
> + 
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index e1d04ea..702342e 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -1,4 +1,4 @@
> +-lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
> ++#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
> + noinst_LTLIBRARIES = libwayland-util.la
> + 
> + include_HEADERS =		
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland.inc b/meta-arago-extras/recipes-graphics/wayland/wayland.inc
> new file mode 100644
> index 0000000..8eb445d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland.inc
> @@ -0,0 +1,5 @@
> +HOMEPAGE = "http://wayland.freedesktop.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72"
> +
> +inherit autotools pkgconfig
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> new file mode 100644
> index 0000000..54a5a45
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> @@ -0,0 +1,34 @@
> +require wayland.inc
> +
> +inherit autotools pkgconfig
> +
> +# We need wayland-native for the wayland-scanner utility
> +BBCLASSEXTEND = "native"
> +
> +DEPENDS_virtclass-native = "expat-native libffi-native"
> +DEPENDS = "expat libffi wayland-native"
> +
> +EXTRA_OECONF_virtclass-native = "--disable-documentation"
> +EXTRA_OECONF = "--disable-documentation --disable-scanner"
> +
> +DISTRO_FEATURES_append = "wayland x11"

You can't and shouldn't do that in a recipe ^^^

If you want your recipe to require some specific distro features, please list 
them in REQUIRED_DISTRO_FEATURES variable.


> +PR = "r1"
> +
> +SRC_URI = "git://anongit.freedesktop.org/wayland/wayland;protocol=git"
> +SRC_URI_append_class-native = " file://just-scanner.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"
> +
> +SRCREV = "2c3dbb89031f120fb191492634e53a583f99d57d"
> +
> +# Wayland installs a M4 macro for other projects to use, which uses the target
> +# pkg-config to find files.  Replace pkg-config with pkg-config-native.
> +do_install_append_class-native() {
> +  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
> +      -e 's,$PKG_CONFIG,pkg-config-native,g' \
> +      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

