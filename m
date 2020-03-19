Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8B2C2529F2
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2020 22:06:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JM4mBr037974
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2020 17:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584655488;
	bh=T0FkOYp9UYB29WTE6sATD6Lx4/ZPSEqvRMSsBnrkB74=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gBRkLm16eEly268uR0aFCEIOqIHhvpFKjsaT8NSfRFpyr+H9qav97CV1NAPL0P8yz
	FkmWAW8waVRP/zdf3fZh+CRhBWwA4CWiVHzRANcfWurg876TRFm+WeR4v+kEBGBVPD
	En6WqO68J/q3taXK368USCtTIZ4fuc4AzaDIT2Bg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JM4m7l031459
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2020 17:04:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 19 Mar 2020 17:04:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 19 Mar 2020 17:04:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JM4lQY119305;
	Thu, 19 Mar 2020 17:04:47 -0500
Date: Thu, 19 Mar 2020 18:04:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Message-ID: <20200319220447.GO17003@beryl>
References: <20200319205731.4091-1-g-tammana@ti.com>
	<20200319215205.GN17003@beryl>
	<f3618626c0104cffa0c9cda13c7d0740@ti.com>
MIME-Version: 1.0
In-Reply-To: <f3618626c0104cffa0c9cda13c7d0740@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [zeus/master][PATCH] wayland-ivi-extension: Update to 2.2.0 version
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
X-List-Received-Date: Thu, 19 Mar 2020 22:06:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 19, 2020 at 05:54:57PM -0400, Tammana, Gowtham wrote:
> 
> 
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Thursday, March 19, 2020 4:52 PM
> >To: Tammana, Gowtham
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago][zeus/master][PATCH] wayland-ivi-extension: Update to
> >2.2.0 version
> >
> >On Thu, Mar 19, 2020 at 03:57:31PM -0500, Gowtham Tammana wrote:
> >> Update wayland-ivi-extension to 2.2.0 version. 2.2.0 version supports
> >> only upto weston-6.0, picking up few patches that enable support for
> >> weston-7.0.
> >
> >Thanks!
> >
> >
> >> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >> ---
> >>  ...-input-controller-update-to-weston-7.patch | 25 +++++++++++++++++
> >>  ...i-id-agent-update-to-weston-7-header.patch | 27 +++++++++++++++++++
> >>  ...te-dependencies-to-build-on-weston-7.patch | 25 +++++++++++++++++
> >>  ....1.0.bb => wayland-ivi-extension_2.2.0.bb} |  8 +++---
> >> +From efdd2a85519d4990596194af5bf50636d2610f09 Mon Sep 17 00:00:00 2001
> >> +From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +Date: Mon, 6 Jan 2020 06:41:57 -0500
> >> +Subject: [PATCH] ivi-input-controller: update to weston 7 header files
> >> +
> >> +update the header file path.
> >
> >Can you please add Upstream-status here? I'm guessing "backport" here?
> 
> These are picked from a PR on the upstream project. Do you want me to add this to commit message.

If those haven't been accepted upstream yet, then instead of "backport" 
status, it should say "submitted [link]":

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status


> Gowtham
> 
> >
> >> +Signed-off-by: Rajendraprasad K J
> ><KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +---
> >> + .../ivi-input-controller/src/ivi-input-controller.c             | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/ivi-input-modules/ivi-input-controller/src/ivi-input-
> >controller.c b/ivi-input-modules/ivi-input-controller/src/ivi-input-
> >controller.c
> >> +index a0bfc48..257a1dc 100644
> >> +--- a/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
> >> ++++ b/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
> >> +@@ -31,7 +31,7 @@
> >> + #include <fcntl.h>
> >> + #include <unistd.h>
> >> +
> >> +-#include "plugin-registry.h"
> >> ++#include <libweston/plugin-registry.h>
> >> + #include "ilm_types.h"
> >> +
> >> + #include "ivi-input-server-protocol.h"
> >> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension/02-ivi-id-agent-update-to-weston-7-header.patch b/meta-arago-
> >distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-
> >to-weston-7-header.patch
> >> new file mode 100644
> >> index 00000000..43a3c74a
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-
> >ivi-id-agent-update-to-weston-7-header.patch
> >> @@ -0,0 +1,27 @@
> >> +From 5abb2b497e0153210d41ec3685dc0152587625fa Mon Sep 17 00:00:00 2001
> >> +From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +Date: Mon, 6 Jan 2020 06:45:11 -0500
> >> +Subject: [PATCH] ivi-id-agent: update to weston 7 header files
> >> +
> >> +update the header file path.
> >
> >Same here.
> >
> >
> >> +Signed-off-by: Rajendraprasad K J
> ><KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +---
> >> + ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c b/ivi-id-
> >agent-modules/ivi-id-agent/src/ivi-id-agent.c
> >> +index 8f0c199..b80e2a4 100644
> >> +--- a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
> >> ++++ b/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
> >> +@@ -26,8 +26,8 @@
> >> + #include <limits.h>
> >> +
> >> + #include <weston.h>
> >> +-#include <libweston-6/libweston-desktop.h>
> >> +-#include "config-parser.h"
> >> ++#include <libweston-desktop/libweston-desktop.h>
> >> ++#include <libweston/config-parser.h>
> >> + #include <weston/ivi-layout-export.h>
> >> +
> >> + #ifndef INVALID_ID
> >> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> >b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-
> >agent-update-dependencies-to-build-on-weston-7.patch
> >> new file mode 100644
> >> index 00000000..06d41d22
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-
> >ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> >> @@ -0,0 +1,25 @@
> >> +From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
> >> +From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +Date: Mon, 6 Jan 2020 06:45:54 -0500
> >> +Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 7
> >> +
> >> +upgrade libweston-desktop version.
> >
> >And one more here.
> >
> >
> >> +Signed-off-by: Rajendraprasad K J
> ><KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >> +---
> >> + ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt b/ivi-id-
> >agent-modules/ivi-id-agent/CMakeLists.txt
> >> +index 3e604a5..ff47808 100644
> >> +--- a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
> >> ++++ b/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
> >> +@@ -25,7 +25,7 @@ find_package(PkgConfig REQUIRED)
> >> + pkg_check_modules(WAYLAND_SERVER wayland-server REQUIRED)
> >> + pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
> >> + pkg_check_modules(PIXMAN pixman-1 REQUIRED)
> >> +-pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
> >> ++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
> >> +
> >> + find_package(Threads REQUIRED)
> >> +
> >> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.1.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.2.0.bb
> >> similarity index 77%
> >> rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.1.0.bb
> >> rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.2.0.bb
> >> index 7d9faee4..0b20b91b 100644
> >> --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.1.0.bb
> >> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-
> >extension_2.2.0.bb
> >> @@ -5,10 +5,12 @@ BUGTRACKER =
> >"http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Exten
> >>  LICENSE = "Apache-2.0"
> >>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
> >>
> >> -SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
> >> +SRCREV = "e9c2fe4c5034a06b159cfd45dbd485755cbaf4c8"
> >>
> >>  SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
> >> -           file://force-type-conversion.patch \
> >
> >Is this patch no longer needed? Do you want to remove it as well?
> >
> >
> >> +           file://01-ivi-input-controller-update-to-weston-7.patch \
> >> +           file://02-ivi-id-agent-update-to-weston-7-header.patch \
> >> +           file://03-ivi-id-agent-update-dependencies-to-build-on-weston-
> >7.patch \
> >>      "
> >>
> >>  S = "${WORKDIR}/git"
> >> @@ -25,7 +27,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
> >>
> >>  EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
> >>
> >> -PR = "r1"
> >> +PR = "r0"
> >>
> >>  # Need these temporarily to prevent a non-fatal do_package_qa issue
> >>  INSANE_SKIP_${PN} += "dev-deps"
> >> --
> >> 2.17.1
> >>

