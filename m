Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83350E87857
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:54:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1150.1770144829452700511
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 10:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A85B540CB7;
	Tue,  3 Feb 2026 18:53:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBc0E1t2bXyV; Tue,  3 Feb 2026 18:53:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6133040B66;
	Tue,  3 Feb 2026 18:53:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B6DB2178449; Tue,  3 Feb 2026 13:53:44 -0500 (EST)
Date: Tue, 3 Feb 2026 13:53:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove
 tisdk name from Arago packagegroups
Message-ID: <20260203185344.GX11121@denix.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-3-afd@ti.com>
 <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 18:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17071

On Tue, Feb 03, 2026 at 12:07:01PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> There are still a few remaining files with tisdk in the name after
> this patch:
> 
> > find . -name "*tisdk*"
> ./meta-arago-distro/recipes-tisdk
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv

I'm open to renaming recipes-tisdk directory to recipes-ti, like in meya-ti
But, the only recipe there is tisdk-uenv, which installs an empty uEnv.txt as 
a stub for downstream layers to bbappend on top with their versions. Should 
this be simply removed completely?


> ./meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> ./meta-arago-distro/classes/tisdk-bundle.bbclass

These are base classes for downstream TI-SDKs to use - since there's no way to 
extend bbclasses, I'd assume they are used as is and specifically by TI-SDKs, 
not Arago.


> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb

Well, there is a base meta-toolchain-arago.bb and the above 3 just extend the 
base with extra stuff that TI-SDKs need - I'm open to renaming, maybe replace 
"tisdk" part in the name with "extras"?


> ./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> ./meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb

These may need some restructuring...


> Are we planning on addressing the above as well at some point?
> 
> 
> 
> On 1/30/2026 4:08 PM, Andrew Davis wrote:
> >These packagegroups are all "arago" packagegroups, the tisdk in the
> >name is a leftover from when the TI Core SDK was generated directly
> >from Arago. Some packagegroups already do not have this in their names
> >but many still do, update the names to be uniformly "arago".
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../recipes-core/images/arago-default-image.bb   | 16 ++++++++--------
> >  .../recipes-core/images/arago-thinlinux-image.bb |  6 +++---
> >  ...b => packagegroup-arago-addons-sdk-target.bb} |  0
> >  ...dk-addons.bb => packagegroup-arago-addons.bb} |  0
> >  ...b => packagegroup-arago-base-server-extra.bb} |  0
> >  ...ackagegroup-arago-connectivity-sdk-target.bb} |  0
> >  ...ity.bb => packagegroup-arago-connectivity.bb} |  0
> >  ...b => packagegroup-arago-crypto-sdk-target.bb} |  0
> >  ...dk-crypto.bb => packagegroup-arago-crypto.bb} |  0
> >  ...=> packagegroup-arago-graphics-sdk-target.bb} |  0
> >  ...raphics.bb => packagegroup-arago-graphics.bb} |  0
> >  ...t.bb => packagegroup-arago-gtk-sdk-target.bb} |  0
> >  ...go-tisdk-gtk.bb => packagegroup-arago-gtk.bb} |  0
> >  ... packagegroup-arago-multimedia-sdk-target.bb} |  0
> >  ...media.bb => packagegroup-arago-multimedia.bb} |  0
> >  ...-sysrepo.bb => packagegroup-arago-sysrepo.bb} |  0
> >  .../packagegroup-arago-toolchain-tisdk-target.bb | 12 ++++++------
> >  .../recipes-core/packagegroups/ti-world.bb       | 16 ++++++++--------
> >  18 files changed, 25 insertions(+), 25 deletions(-)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons-sdk-target.bb => packagegroup-arago-addons-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons.bb => packagegroup-arago-addons.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-base-tisdk-server-extra.bb => packagegroup-arago-base-server-extra.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity-sdk-target.bb => packagegroup-arago-connectivity-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity.bb => packagegroup-arago-connectivity.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto-sdk-target.bb => packagegroup-arago-crypto-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto.bb => packagegroup-arago-crypto.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics-sdk-target.bb => packagegroup-arago-graphics-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics.bb => packagegroup-arago-graphics.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk-sdk-target.bb => packagegroup-arago-gtk-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk.bb => packagegroup-arago-gtk.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia-sdk-target.bb => packagegroup-arago-multimedia-sdk-target.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia.bb => packagegroup-arago-multimedia.bb} (100%)
> >  rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-sysrepo.bb => packagegroup-arago-sysrepo.bb} (100%)
> >
> >diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> >index becd3e9b..7804e7bc 100644
> >--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> >@@ -17,17 +17,17 @@ IMAGE_INSTALL += "\
> >      packagegroup-arago-console \
> >      ti-test \
> >      ti-test-extras \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl','',d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vulkan','',d)} \
> >-    packagegroup-arago-tisdk-connectivity \
> >-    packagegroup-arago-tisdk-crypto \
> >-    packagegroup-arago-tisdk-multimedia \
> >-    packagegroup-arago-tisdk-addons \
> >-    packagegroup-arago-tisdk-addons-extra \
> >+    packagegroup-arago-connectivity \
> >+    packagegroup-arago-crypto \
> >+    packagegroup-arago-multimedia \
> >+    packagegroup-arago-addons \
> >+    packagegroup-arago-addons-extra \
> >      ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> >-    packagegroup-arago-tisdk-sysrepo \
> >+    packagegroup-arago-sysrepo \
> >  "
> >  DEVTOOLS = " \
> >diff --git a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> >index a30acbfb..a7ed2e8d 100644
> >--- a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> >@@ -16,9 +16,9 @@ SYSTEMD_DEFAULT_TARGET = "${@bb.utils.contains('DISTRO_FEATURES','opengl','graph
> >  IMAGE_INSTALL += "\
> >      packagegroup-arago-base \
> >      packagegroup-arago-console \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> >-    packagegroup-arago-tisdk-connectivity \
> >-    packagegroup-arago-tisdk-crypto \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> >+    packagegroup-arago-connectivity \
> >+    packagegroup-arago-crypto \
> >      docker \
> >      ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-server-extra.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-server-extra.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> >rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> >index d3a90595..2baa1045 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> >@@ -8,20 +8,20 @@ inherit packagegroup
> >  TISDK_TOOLCHAIN_BASE_TARGET = "\
> >      packagegroup-arago-standalone-sdk-target \
> >-    packagegroup-arago-tisdk-multimedia-sdk-target \
> >+    packagegroup-arago-multimedia-sdk-target \
> >  "
> >  TISDK_TOOLCHAIN_EXTRA_TARGET = "\
> >-    packagegroup-arago-tisdk-connectivity-sdk-target \
> >-    packagegroup-arago-tisdk-crypto-sdk-target \
> >+    packagegroup-arago-connectivity-sdk-target \
> >+    packagegroup-arago-crypto-sdk-target \
> >  "
> >  TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 = ""
> >  RDEPENDS:${PN} = "\
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk-sdk-target','',d)} \
> >      ${TISDK_TOOLCHAIN_BASE_TARGET} \
> >      ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics-sdk-target','',d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl-sdk-target','',d)} \
> >-    packagegroup-arago-tisdk-addons-sdk-target \
> >+    packagegroup-arago-addons-sdk-target \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >index 25642831..86ba27c2 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >@@ -30,14 +30,14 @@ RDEPENDS:${PN} = "\
> >      packagegroup-arago-base \
> >      packagegroup-arago-console \
> >      ti-test \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
> >-    packagegroup-arago-tisdk-connectivity \
> >-    packagegroup-arago-tisdk-crypto \
> >-    packagegroup-arago-tisdk-multimedia \
> >-    packagegroup-arago-tisdk-addons \
> >-    packagegroup-arago-tisdk-addons-extra \
> >-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
> >+    packagegroup-arago-connectivity \
> >+    packagegroup-arago-crypto \
> >+    packagegroup-arago-multimedia \
> >+    packagegroup-arago-addons \
> >+    packagegroup-arago-addons-extra \
> >+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-server-extra',d)} \
> >      ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
> >      ${DEVTOOLS} \
> >      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \

