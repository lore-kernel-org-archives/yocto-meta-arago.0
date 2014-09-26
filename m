Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 09BF552007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 18:47:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI006HQUTMXGB0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 13:46:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 303352018E; Fri,
	26 Sep 2014 14:46:34 -0400 (EDT)
Date: Fri, 26 Sep 2014 14:46:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-id: <20140926184634.GK2480@denix.org>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
	<1409928767-11517-2-git-send-email-a0393906@ti.com>
MIME-version: 1.0
In-reply-to: <1409928767-11517-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH v2 1/4] wayland: upgrade to 1.3.0
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
X-List-Received-Date: Fri, 26 Sep 2014 18:47:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 05, 2014 at 08:22:44PM +0530, Karthik Ramanan wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> wayland-scanner now uses pkg-config instead of hard-coding paths, so edit the
> script to use pkg-config-native.
> 
> Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

First of all, you ended up copying all those people above. It is rarelly a 
good idea to use an existing commit for overlaying the recipe locally...


> ---
>  .../recipes-graphics/wayland/wayland_1.3.0.bb      | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> new file mode 100644
> index 0000000..212e08a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Wayland, a protocol between a compositor and clients"
> +DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
> +as well as a C library implementation of that protocol. The compositor can be \
> +a standalone display server running on Linux kernel modesetting and evdev \
> +input devices, an X application, or a wayland client itself. The clients can \
> +be traditional applications, X servers (rootless or fullscreen) or other \
> +display servers."
> +HOMEPAGE = "http://wayland.freedesktop.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
> +                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
> +
> +SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
> +SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
> +
> +SRC_URI_append_class-native = " file://just-scanner.patch"
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
> +# Wayland installs a M4 macro for other projects to use, which uses the target
> +# pkg-config to find files.  Replace pkg-config with pkg-config-native.
> +do_install_append_class-native() {
> +  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
> +      -e 's,$PKG_CONFIG,pkg-config-native,g' \
> +      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
> +}
> -- 
> 2.0.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

