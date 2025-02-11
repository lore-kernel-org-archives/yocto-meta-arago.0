Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA1EC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:51:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4547.1739307080175079921
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 12:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 76DD340CC3;
	Tue, 11 Feb 2025 20:51:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5vhAMxIPlZf; Tue, 11 Feb 2025 20:51:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A64B40C6C;
	Tue, 11 Feb 2025 20:51:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CA3C816423C; Tue, 11 Feb 2025 15:51:11 -0500 (EST)
Date: Tue, 11 Feb 2025 15:51:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: y-abhilashchandra@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, devarsht@ti.com,
	vaishnav.a@ti.com, u-kumar1@ti.com, r-donadkar@ti.com,
	a-limaye@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
Message-ID: <20250211205111.GU21608@denix.org>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211075813.970579-1-y-abhilashchandra@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15839

On Tue, Feb 11, 2025 at 01:28:13PM +0530, Yemike Abhilash Chandra via lists.yoctoproject.org wrote:
> An older recipe of v4l-utils (v1.26.1) is present in the meta-oe layer
> for scarthgap.
> 
> TI's 6.12 based kernel has backported multistream routing APIs from
> upstream kernel, which requires v4l-utils to be the latest released
> version (v1.28.1).
> 
> Thus we override the recipe in this layer to the latest release of
> v4l-utils.

There are few issues with this...

Do you really need to override the entire recipe? The old .bbappend was 
applying a patch already - can you add a new patch to that and bump SRCREV?

If you do need to override the entire recipe, then you first need to clearly 
articulate your reason in the commit log - wanting a newer commit isn't such 
a reason

Then you need to do it in 2 steps/patches - first you copy over the existing 
recipe verbatim w/o any modifications, and in a separate step make your 
modifications

Also, having own copy of an upstream recipe requires special attention to not 
violate the Yocto Project Compatible guidelines. I've explained this recently 
in another thread here on the list

-- 
Denys


> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Single camera setup logs: http://serenity.dal.design.ti.com:7777/ohidowecig.yaml
> Multi camera setup logs: http://serenity.dal.design.ti.com:7777/oqowimumeh.yaml
> 
>  ...l-media-ctl-header-and-library-files.patch | 78 +++++++++++++++++
>  ...add-support-for-RGBIr-bayer-formats.patch} |  0
>  .../v4l2apps/v4l-utils_%.bbappend             |  7 --
>  .../v4l2apps/v4l-utils_1.28.1.bb              | 86 +++++++++++++++++++
>  4 files changed, 164 insertions(+), 7 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
>  rename meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/{0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch => 0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch} (100%)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
> new file mode 100644
> index 00000000..6c946d8c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
> @@ -0,0 +1,78 @@
> +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 2001
> +From: Neel Gandhi <neel.gandhi@amd.com>
> +Date: Wed, 5 Jun 2024 13:51:36 +0530
> +Subject: [PATCH] media-ctl: Install media-ctl header and library files
> +
> +Install mediactl and v4l2subdev header and library
> +files, which may be required by 3rd party applications
> +to populate and control v4l2subdev device node tree
> +
> +Install of these files was removed in upstream commit
> +0911dce53b08b0df3066be2c75f67e8a314d8729.
> +
> +Upstream-Status: Denied
> +
> +v4l-utils maintainers do not promise a stable API for this library, and
> +do not currently have the time to do so. So exporting the API in this
> +way is fine, as long as we understand that it will change and users of
> +the API will need to adapt over time.
> +
> +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> + 1 file changed, 21 insertions(+), 7 deletions(-)
> +
> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> +index 3a7b0c9a..40669b4c 100644
> +--- a/utils/media-ctl/meson.build
> ++++ b/utils/media-ctl/meson.build
> +@@ -3,14 +3,24 @@ libmediactl_sources = files(
> +     'mediactl-priv.h',
> + )
> + 
> ++libmediactl_api = files(
> ++    'mediactl.h',
> ++    'v4l2subdev.h',
> ++)
> ++
> ++install_headers(libmediactl_api, subdir: 'mediactl')
> ++
> + libmediactl_deps = [
> +     dep_libudev,
> + ]
> + 
> +-libmediactl = static_library('mediactl',
> +-                             libmediactl_sources,
> +-                             dependencies : libmediactl_deps,
> +-                             include_directories : v4l2_utils_incdir)
> ++libmediactl = library('mediactl',
> ++                      libmediactl_sources,
> ++                      soversion: '0',
> ++                      version: '0.0.0',
> ++                      install : true,
> ++                      dependencies : libmediactl_deps,
> ++                      include_directories : v4l2_utils_incdir)
> + 
> + dep_libmediactl = declare_dependency(link_with : libmediactl)
> + 
> +@@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
> + libv4l2subdev_sources += media_bus_format_names_h
> + libv4l2subdev_sources += media_bus_format_codes_h
> + 
> +-libv4l2subdev = static_library('v4l2subdev',
> +-                               libv4l2subdev_sources,
> +-                               include_directories : v4l2_utils_incdir)
> ++libv4l2subdev = library('v4l2subdev',
> ++                        libv4l2subdev_sources,
> ++                        soversion: '0',
> ++                        version: '0.0.0',
> ++                        install : true,
> ++                        dependencies : dep_libmediactl,
> ++                        include_directories : v4l2_utils_incdir)
> + 
> + dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch
> similarity index 100%
> rename from meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
> rename to meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
> deleted file mode 100644
> index 9b74dc7c..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI:append = " \
> -    file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
> -"
> -
> -PR:append = ".arago0"
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> new file mode 100644
> index 00000000..6f5707da
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> @@ -0,0 +1,86 @@
> +SUMMARY = "v4l2 and IR applications"
> +LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
> +                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
> +PROVIDES = "libv4l media-ctl"
> +
> +DEPENDS = "jpeg \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
> +           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
> +
> +DEPENDS:append:libc-musl = " argp-standalone"
> +DEPENDS:append:class-target = " udev"
> +LDFLAGS:append = " -pthread"
> +# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
> +# Needs further investigation
> +GLIBC_64BIT_TIME_FLAGS = ""
> +
> +inherit meson gettext pkgconfig
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
> +PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
> +PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
> +
> +SRC_URI = "\
> +    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
> +    file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
> +    file://0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
> +"
> +
> +SRCREV = "757acdaec187d51803c2957d36df3d717a3529da"
> +
> +PV .= "+git"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
> +
> +# Disable the erroneous installation of gconv-modules that would break glib
> +# like it is done in Debian and ArchLinux.
> +EXTRA_OEMESON += "-Dgconv=disabled"
> +
> +VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
> +
> +PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
> +
> +RPROVIDES:${PN}-dbg += "libv4l-dbg"
> +
> +FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
> +FILES:qv4l2 = "\
> +    ${bindir}/qv4l2 \
> +    ${datadir}/applications/qv4l2.desktop \
> +    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
> +"
> +FILES:qvidcap = "\
> +    ${bindir}/qvidcap \
> +    ${datadir}/applications/qvidcap.desktop \
> +    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
> +"
> +
> +FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
> +RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
> +RDEPENDS:qv4l2 += "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
> +RDEPENDS:qvidcap += "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
> +
> +FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> +
> +FILES:${PN} = "${bindir} ${sbindir}"
> +
> +FILES:libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
> +                 ${libdir}/libdvbv5*${SOLIBS} \
> +                 ${libdir}/libv4l/*-decomp \
> +                 ${libdir}/libv4l2tracer.so \
> +"
> +
> +FILES:libv4l-dev += "${includedir} ${libdir}/pkgconfig \
> +                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
> +                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
> +
> +PARALLEL_MAKE:class-native = ""
> +BBCLASSEXTEND = "native"
> -- 
> 2.34.1

