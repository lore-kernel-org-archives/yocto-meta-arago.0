Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6E89B52007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 18:49:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8QIn82i029493
	for <meta-arago@arago-project.org>; Fri, 26 Sep 2014 13:49:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QIn8OO011346
	for <meta-arago@arago-project.org>; Fri, 26 Sep 2014 13:49:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 26 Sep 2014 13:49:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QIn8ET023547;
	Fri, 26 Sep 2014 13:49:08 -0500
Date: Fri, 26 Sep 2014 14:49:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140926184907.GE6303@edge>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
	<1409928767-11517-4-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409928767-11517-4-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH v2 3/4] wayland: add support for version 1.3.0 for drm backend
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
X-List-Received-Date: Fri, 26 Sep 2014 18:49:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 05, 2014 at 08:22:46PM +0530, Karthik Ramanan wrote:
> For DRM based devices, it is desired to stick with version 1.3.0
> due to some known issues and limitations with omapdrm and other
> dependent foundation software
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/wayland/wayland.inc           |  5 ++++
>  .../recipes-graphics/wayland/wayland_1.3.0.bb      | 32 ++++++++++------------
>  2 files changed, 20 insertions(+), 17 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland.inc
> 
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
> index 212e08a..f40a98b 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> @@ -1,20 +1,4 @@
> -SUMMARY = "Wayland, a protocol between a compositor and clients"
> -DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
> -as well as a C library implementation of that protocol. The compositor can be \
> -a standalone display server running on Linux kernel modesetting and evdev \
> -input devices, an X application, or a wayland client itself. The clients can \
> -be traditional applications, X servers (rootless or fullscreen) or other \
> -display servers."
> -HOMEPAGE = "http://wayland.freedesktop.org"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
> -                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
> -
> -SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
> -SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
> -
> -SRC_URI_append_class-native = " file://just-scanner.patch"
> +require wayland.inc
>  
>  inherit autotools pkgconfig
>  
> @@ -27,6 +11,19 @@ DEPENDS = "expat libffi wayland-native"
>  EXTRA_OECONF_virtclass-native = "--disable-documentation"
>  EXTRA_OECONF = "--disable-documentation --disable-scanner"
>  
> +PR = "r3"
> +
> +COMPATIBLE_MACHINE = "dra7xx-evm"

So, the only thing you do here is set COMPATIBLE_MACHINE and switch from 
release tarball to a specific git commit. What's the point of creating a .inc 
file, as I don't see it being used outside of this one recipe...


> +SRC_URI = "git://anongit.freedesktop.org/wayland/wayland;protocol=git"
> +SRC_URI_append_class-native = " file://just-scanner.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"
> +
> +SRCREV = "2c3dbb89031f120fb191492634e53a583f99d57d"
> +
>  # Wayland installs a M4 macro for other projects to use, which uses the target
>  # pkg-config to find files.  Replace pkg-config with pkg-config-native.
>  do_install_append_class-native() {
> @@ -34,3 +31,4 @@ do_install_append_class-native() {
>        -e 's,$PKG_CONFIG,pkg-config-native,g' \
>        -i ${D}/${datadir}/aclocal/wayland-scanner.m4
>  }
> +
> -- 
> 2.0.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

