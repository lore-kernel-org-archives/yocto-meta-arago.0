Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D64DF529D1
	for <meta-arago@arago-project.org>;
	Tue, 30 Sep 2014 21:41:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8ULfwZX016898
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:41:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULfw8f016086
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:41:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Sep 2014 16:41:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULfvdg018998;
	Tue, 30 Sep 2014 16:41:57 -0500
Date: Tue, 30 Sep 2014 17:41:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140930214156.GV6303@edge>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
	<1409928767-11517-2-git-send-email-a0393906@ti.com>
	<20140926184634.GK2480@denix.org> <542A9137.3030802@ti.com>
MIME-Version: 1.0
In-Reply-To: <542A9137.3030802@ti.com>
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
X-List-Received-Date: Tue, 30 Sep 2014 21:41:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 30, 2014 at 04:47:11PM +0530, Karthik Ramanan wrote:
> On 27-Sep-14 12:16 AM, Denys Dmytriyenko wrote:
> >On Fri, Sep 05, 2014 at 08:22:44PM +0530, Karthik Ramanan wrote:
> >>From: Ross Burton <ross.burton@intel.com>
> >>
> >>wayland-scanner now uses pkg-config instead of hard-coding paths, so edit the
> >>script to use pkg-config-native.
> >>
> >>Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.
> >>
> >>Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> >First of all, you ended up copying all those people above. It is rarelly a
> >good idea to use an existing commit for overlaying the recipe locally...
> 
> Denys,
> 
> On the kernel tree, atleast in the past, when we pulled in patches
> from other branch it was encouraged to preserve authorship and try
> to bring in the patch as it is.
> 
> So if I understand correctly and also look at some recently
> submitted patches, like the wayland/weston 1.5.0 submission it seems
> like we can simply copy the patch and not worry about the
> authorship. So I will take care of this from the next time.
> 
> Sorry about the fact that there was a deviation, I was not aware of
> that the simpler approach of simply copying the files was allowed.

Well, it's not as simple as it seems. In this case we are overlaying an old 
recipe into our own layer. Yes, meta-arago is publicly available, although 
somewhat specific to our products, but the recipe is almost a year old. And 
even with the kernel, I believe I've heard that kernel maintainers won't care 
much for any company forks and vendor trees...

If you want to preserve authorship, you can add a description along the lines 
of "overlayed from oe-core/dora" and/or provide a name. But git would spam 
everyone mentioned in SOB line by default.


> Would you be merging this if its acceptable to you?

I think #4 will need some attenton...


> >>---
> >>  .../recipes-graphics/wayland/wayland_1.3.0.bb      | 36 ++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> >>
> >>diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> >>new file mode 100644
> >>index 0000000..212e08a
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> >>@@ -0,0 +1,36 @@
> >>+SUMMARY = "Wayland, a protocol between a compositor and clients"
> >>+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
> >>+as well as a C library implementation of that protocol. The compositor can be \
> >>+a standalone display server running on Linux kernel modesetting and evdev \
> >>+input devices, an X application, or a wayland client itself. The clients can \
> >>+be traditional applications, X servers (rootless or fullscreen) or other \
> >>+display servers."
> >>+HOMEPAGE = "http://wayland.freedesktop.org"
> >>+LICENSE = "MIT"
> >>+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
> >>+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
> >>+
> >>+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> >>+SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
> >>+SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
> >>+
> >>+SRC_URI_append_class-native = " file://just-scanner.patch"
> >>+
> >>+inherit autotools pkgconfig
> >>+
> >>+# We need wayland-native for the wayland-scanner utility
> >>+BBCLASSEXTEND = "native"
> >>+
> >>+DEPENDS_virtclass-native = "expat-native libffi-native"
> >>+DEPENDS = "expat libffi wayland-native"
> >>+
> >>+EXTRA_OECONF_virtclass-native = "--disable-documentation"
> >>+EXTRA_OECONF = "--disable-documentation --disable-scanner"
> >>+
> >>+# Wayland installs a M4 macro for other projects to use, which uses the target
> >>+# pkg-config to find files.  Replace pkg-config with pkg-config-native.
> >>+do_install_append_class-native() {
> >>+  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
> >>+      -e 's,$PKG_CONFIG,pkg-config-native,g' \
> >>+      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
> >>+}
> >>--
> >>2.0.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>
> 

