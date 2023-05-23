Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60400C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:36:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1539.1684856202413234517
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 08:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AcyXZJFo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34NFadsS053379;
	Tue, 23 May 2023 10:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684856199;
	bh=44DVlteY/YSHiMCUmhyDrEEWKw/GOfp1lG/pmjqve+Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AcyXZJFoGAkSc0vT40y4boIuZZv8zGv5ADgcP4YHui0fKe237XLSyWRAUUA+GLAd/
	 9AnCEdnK+jy74/K3aahHWsTweRzAIlSnrCa1HSk6LqcIi+dQM2up1/trQwl8bk6+Mq
	 jG0FG6tAuGwmQKleuo8wb9go1SlN3o7vD64yv/U4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34NFadsC015240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 10:36:39 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 10:36:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 10:36:38 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34NFacFi029406;
	Tue, 23 May 2023 10:36:38 -0500
Message-ID: <1f00c11f-f413-c015-c2fd-24afb475295b@ti.com>
Date: Tue, 23 May 2023 10:36:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][RESEND PATCH 1/2] v4l-utils: Add recipe for
 v1.23.0
To: Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai
 Sree Kartheek Adivi <s-adivi@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh"
	<vigneshr@ti.com>,
        "Bhatia, Aradhya" <a-bhatia1@ti.com>, "Nori, Sekhar"
	<nsekhar@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>
References: <20230523094422.1633390-1-j-luthra@ti.com>
 <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 15:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14451



On 5/23/2023 6:48 AM, Devarsh Thakkar wrote:
> Hi Jai,
> 
> Thanks for the patch.
> 
> On 23/05/23 15:14, Jai Luthra wrote:
>> An older recipe (v1.22.0) is present in the meta-openembedded/meta-oe
>> layer for kirkstone.
>>
>> TI's 6.1 based kernel has backported multistream routing APIs [1] from
>> upstream kernel, which requires a few patches to v4l-utils [2] that only
>> apply cleanly on top of v1.23.0.
>>
>> Thus we override the recipe in this layer to the latest (v1.23.0) found
>> from meta-oe master.
>>
>> Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ca55d70b41e [1]
>> Link: https://lore.kernel.org/all/20230210115546.199809-1-tomi.valkeinen@ideasonboard.com/ [2]
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> ---
>>   ...-Don-t-install-libmediactl-and-libv4.patch | 44 ++++++++++
>>   ...02-original-patch-mediactl-pkgconfig.patch | 21 +++++
>>   ...iginal-patch-export-mediactl-headers.patch | 24 +++++
>>   .../v4l-utils/0004-Do-not-use-getsubopt.patch | 60 +++++++++++++
>>   .../v4l-utils/v4l-utils_1.23.0.bb             | 87 +++++++++++++++++++
> 
> As per my opinion, not a good idea to bump up package version than default
> package version shipped by kirkstone i.e. 1.22.1
> (meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb)
> 
> As a general rule of thumb, there could be other layers (for e.g. added by
> vendors) having bbappends assuming shipped package version same as in
> kirkstone and also build time and runtime dependencies w.r.t other packages
> are guaranted if all packages stay with same version as shipped by kirkstone
> and with this new recipe I believe we are kind of deviating from that
> protection and so my suggestion is to rebase on top of existing package
> version i.e. 1.22.1

If you were talking about meta-ti then I would 100% agree with you, but 
this is meta-arago.  And as a distribution layer, we are perfectly 
within our purvue to advance to a later version of a tool beyond what 
the other upstream repos are at, or change config files, etc...

Meta-ti as a BSP layer needs to play nice in the sandbox with other 
layers and not change versions without guards.

If you wanted to be extra careful you could include the guards in arago 
as well, but since arago is not a yocto compliant layer it is not 
strictly needed at this time.


> Regards
> Devarsh
> 
>>   5 files changed, 236 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.patch
>>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-not-use-getsubopt.patch
>>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
> 
> 
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>> new file mode 100644
>> index 00000000..8ac8fbe1
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>> @@ -0,0 +1,44 @@
>> +From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 27 Feb 2015 21:55:36 +0000
>> +Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
>> +
>> + libv4l2subdev"
>> +
>> +This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Conflicts:
>> +	utils/media-ctl/Makefile.am
>> +
>> +---
>> + utils/media-ctl/Makefile.am | 10 +++-------
>> + 1 file changed, 3 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
>> +index c48c8d6..e255e16 100644
>> +--- a/utils/media-ctl/Makefile.am
>> ++++ b/utils/media-ctl/Makefile.am
>> +@@ -1,8 +1,7 @@
>> +-noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
>> +-
>> ++lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
>> + libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
>> +-libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
>> +-libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
>> ++libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
>> ++libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
>> +
>> + media-bus-format-names.h: ../../include/linux/media-bus-format.h
>> + 	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
>> +@@ -18,9 +17,6 @@ CLEANFILES = $(BUILT_SOURCES)
>> + nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
>> + libv4l2subdev_la_SOURCES = libv4l2subdev.c
>> + libv4l2subdev_la_LIBADD = libmediactl.la
>> +-libv4l2subdev_la_CFLAGS = -static
>> +-libv4l2subdev_la_LDFLAGS = -static
>> +-
>> + mediactl_includedir=$(includedir)/mediactl
>> + noinst_HEADERS = mediactl.h v4l2subdev.h
>> +
>> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>> new file mode 100644
>> index 00000000..52fc2d7a
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>> @@ -0,0 +1,21 @@
>> +From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 1 Mar 2015 22:25:07 +0000
>> +Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
>> +
>> +---
>> + utils/media-ctl/Makefile.am | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
>> +index e255e16..ff7b417 100644
>> +--- a/utils/media-ctl/Makefile.am
>> ++++ b/utils/media-ctl/Makefile.am
>> +@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
>> + mediactl_includedir=$(includedir)/mediactl
>> + noinst_HEADERS = mediactl.h v4l2subdev.h
>> +
>> ++pkgconfig_DATA = libmediactl.pc
>> + bin_PROGRAMS = media-ctl
>> + media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
>> + media_ctl_LDADD = libmediactl.la libv4l2subdev.la
>> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.patch b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.patch
>> new file mode 100644
>> index 00000000..39dc3383
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.patch
>> @@ -0,0 +1,24 @@
>> +From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 1 Mar 2015 22:25:07 +0000
>> +Subject: [PATCH] %% original patch: export-mediactl-headers.patch
>> +
>> +---
>> + utils/media-ctl/Makefile.am | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
>> +index ff7b417..6ce656f 100644
>> +--- a/utils/media-ctl/Makefile.am
>> ++++ b/utils/media-ctl/Makefile.am
>> +@@ -17,8 +17,8 @@ CLEANFILES = $(BUILT_SOURCES)
>> + nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
>> + libv4l2subdev_la_SOURCES = libv4l2subdev.c
>> + libv4l2subdev_la_LIBADD = libmediactl.la
>> +-mediactl_includedir=$(includedir)/mediactl
>> +-noinst_HEADERS = mediactl.h v4l2subdev.h
>> ++otherincludedir = $(includedir)/mediactl
>> ++otherinclude_HEADERS = mediactl.h v4l2subdev.h
>> +
>> + pkgconfig_DATA = libmediactl.pc
>> + bin_PROGRAMS = media-ctl
>> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-not-use-getsubopt.patch b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-not-use-getsubopt.patch
>> new file mode 100644
>> index 00000000..fb844acb
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-not-use-getsubopt.patch
>> @@ -0,0 +1,60 @@
>> +From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 30 Nov 2019 18:50:34 -0800
>> +Subject: [PATCH] Do not use getsubopt
>> +
>> +POSIX says that behavior when subopts list is empty is undefined.
>> +musl libs will set value to NULL which leads to crash.
>> +
>> +Simply avoid getsubopt, since we cannot rely on it.
>> +
>> +Imported from Alpine Linux
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Adapt patch to 1.23.0.
>> +
>> +(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
>> +
>> +%% original patch: 0007-Do-not-use-getsubopt.patch
>> +
>> +Signed-off-by: Daniel Gomez <daniel@qtec.com>
>> +---
>> + utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
>> + 1 file changed, 10 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> +index d77f7104..838c297d 100644
>> +--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> ++++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> +@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
>> +
>> + static bool parse_next_subopt(char **subs, char **value)
>> + {
>> +-	static char *const subopts[] = {
>> +-	    nullptr
>> +-	};
>> +-	int opt = v4l_getsubopt(subs, subopts, value);
>> ++	char *p = *subs;
>> ++	*value = *subs;
>> +
>> +-	if (opt < 0 || *value)
>> +-		return false;
>> +-	fprintf(stderr, "Missing suboption value\n");
>> +-	return true;
>> ++	while (*p && *p != ',')
>> ++		p++;
>> ++
>> ++	if (*p)
>> ++		*p++ = '\0';
>> ++
>> ++	*subs = p;
>> ++	return false;
>> + }
>> +
>> + void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
>> +--
>> +2.35.1
>> +
>> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
>> new file mode 100644
>> index 00000000..21a08022
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
>> @@ -0,0 +1,87 @@
>> +SUMMARY = "v4l2 and IR applications"
>> +LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
>> +                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
>> +PROVIDES = "libv4l media-ctl"
>> +
>> +DEPENDS = "jpeg \
>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
>> +           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
>> +
>> +DEPENDS:append:libc-musl = " argp-standalone"
>> +DEPENDS:append:class-target = " udev"
>> +LDFLAGS:append = " -pthread"
>> +# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
>> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
>> +# Needs further investigation
>> +GLIBC_64BIT_TIME_FLAGS = ""
>> +
>> +inherit autotools gettext pkgconfig
>> +
>> +PACKAGECONFIG ??= "media-ctl"
>> +PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
>> +PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
>> +PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
>> +
>> +SRC_URI = "\
>> +    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=master \
>> +    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
>> +    file://0002-original-patch-mediactl-pkgconfig.patch \
>> +    file://0003-original-patch-export-mediactl-headers.patch \
>> +    file://0004-Do-not-use-getsubopt.patch \
>> +"
>> +
>> +SRCREV = "9431e4b26b4842d1401e80ada9f14593dca3a94c"
>> +
>> +PV .= "+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_configure:prepend() {
>> +    cd ${S}; ./bootstrap.sh; cd -
>> +}
>> +
>> +EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
>> +                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
>> +
>> +VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
>> +
>> +PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
>> +
>> +RPROVIDES:${PN}-dbg += "libv4l-dbg"
>> +
>> +FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
>> +FILES:qv4l2 = "\
>> +    ${bindir}/qv4l2 \
>> +    ${datadir}/applications/qv4l2.desktop \
>> +    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
>> +"
>> +FILES:qvidcap = "\
>> +    ${bindir}/qvidcap \
>> +    ${datadir}/applications/qvidcap.desktop \
>> +    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
>> +"
>> +
>> +FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
>> +RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
>> +RDEPENDS:qv4l2 += "\
>> +    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
>> +RDEPENDS:qvidcap += "\
>> +    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
>> +
>> +FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
>> +
>> +FILES:${PN} = "${bindir} ${sbindir}"
>> +
>> +FILES:libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
>> +                 ${libdir}/libdvbv5*${SOLIBS} \
>> +                 ${libdir}/libv4l/*-decomp"
>> +
>> +FILES:libv4l-dev += "${includedir} ${libdir}/pkgconfig \
>> +                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
>> +                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
>> +
>> +PARALLEL_MAKE:class-native = ""
>> +BBCLASSEXTEND = "native"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

