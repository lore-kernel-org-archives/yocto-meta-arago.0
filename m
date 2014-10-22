Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EE49752981
	for <meta-arago@arago-project.org>;
	Wed, 22 Oct 2014 18:26:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9MIQ8Gm003191
	for <meta-arago@arago-project.org>; Wed, 22 Oct 2014 13:26:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MIQ8Uo025354
	for <meta-arago@arago-project.org>; Wed, 22 Oct 2014 13:26:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 13:26:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MIQ7un023588;
	Wed, 22 Oct 2014 13:26:07 -0500
Date: Wed, 22 Oct 2014 14:26:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141022182607.GR25408@edge>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
	<1409844854-17247-4-git-send-email-a0393906@ti.com>
	<20141022181911.GQ25408@edge> <5447F65D.6020905@ti.com>
MIME-Version: 1.0
In-Reply-To: <5447F65D.6020905@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH 3/3] bt-firmware: Override Makefile to handle UNKNOWN platform
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
X-List-Received-Date: Wed, 22 Oct 2014 18:26:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 22, 2014 at 11:54:29PM +0530, Karthik Ramanan wrote:
> On 22-Oct-14 11:49 PM, Denys Dmytriyenko wrote:
> >On Thu, Sep 04, 2014 at 09:04:14PM +0530, Karthik Ramanan wrote:
> >>* By default the Makefile supports only am335x targets
> >>* This is required to support dra7xx and other devices
> >
> >With the updated recipe from Yaniv for version 3.6.1, do you still need this
> >patch?
> 
> Yes, this patch is needed and Yaniv's patch will also be needed.
> But I guess one of the patch needs to be rebased if the other is merged.

I think #2 from your series is not needed, but #1 and #3 can be rebased, 
right?


> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  ...-Remove-platform-check-and-install-defaul.patch | 41 ++++++++++++++++++++++
> >>  .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |  5 +--
> >>  2 files changed, 44 insertions(+), 2 deletions(-)
> >>  create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
> >>
> >>diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
> >>new file mode 100644
> >>index 0000000..4ad457e
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
> >>@@ -0,0 +1,41 @@
> >>+From 40bb43c136ec8001d35f6077e5de5f8ac72f4da0 Mon Sep 17 00:00:00 2001
> >>+From: Roger Monk <r-monk@ti.com>
> >>+Date: Thu, 3 Oct 2013 02:59:54 +0100
> >>+Subject: [PATCH] bt-firmware:  Remove platform check and install default
> >>+ firmware
> >>+
> >>+   * For undefined plaforms, install default firmware
> >>+   * Remove configuration of 'unknown' so that install picks
> >>+     firmware from root directory (default)
> >>+
> >>+Signed-off-by: Roger Monk <r-monk@ti.com>
> >>+---
> >>+ Makefile |    6 +++---
> >>+ 1 file changed, 3 insertions(+), 3 deletions(-)
> >>+
> >>+diff --git a/Makefile b/Makefile
> >>+index bd94881..ca8280a 100644
> >>+--- a/Makefile
> >>++++ b/Makefile
> >>+@@ -5,8 +5,8 @@
> >>+ # If KERNEL_DIR is not set then use the default in Rules.make
> >>+ DEST_DIR ?= ${DESTDIR}
> >>+
> >>+-PLATFORM ?= "unknown"
> >>+-MACHINE_NAME ?= "unknown"
> >>++#PLATFORM ?= "unknown"
> >>++#MACHINE_NAME ?= "unknown"
> >>+
> >>+ ifeq ($(PLATFORM), am335x-evm)
> >>+     MACHINE_NAME := am335x
> >>+@@ -23,6 +23,6 @@ endif
> >>+
> >>+ install:
> >>+ 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
> >>+-	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
> >>++	cp -f ./${MACHINE_NAME}/*.bts $(DEST_DIR)${BASE_LIB_DIR}/firmware
> >>+
> >>+
> >>+--
> >>+1.7.9.5
> >>+
> >>diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> >>index 780519b..aa99686 100644
> >>--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> >>+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> >>@@ -11,13 +11,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>  RCONFLICTS_${PN} = "linux-firmware-wl12xx"
> >>  RREPLACES_${PN}  = "linux-firmware-wl12xx"
> >>
> >>-PR = "r5+gitr${SRCPV}"
> >>+PR = "r6+gitr${SRCPV}"
> >>
> >>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> >>
> >>  SRCREV = "e08f59b41b6145b6baf1cb68bca018233ab5e93a"
> >>  SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
> >>-           file://0001-Makefile-allow-building-within-the-OE.patch"
> >>+           file://0001-Makefile-allow-building-within-the-OE.patch \
> >>+           file://0001-bt-firmware-Remove-platform-check-and-install-defaul.patch"
> >>
> >>  PLATFORM = "unknown"
> >>  PLATFORM_ti33x = "am335x-evm"
> >>--
> >>2.0.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

