Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AFF055208C
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 20:15:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LKFRKt004174
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:15:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LKFR6v026823
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:15:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Mar 2014 15:15:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LKFRhI006951	for
	<meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:15:27 -0500
Date: Fri, 21 Mar 2014 16:15:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140321201527.GQ12929@edge>
References: <1392127492-3220-1-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392127492-3220-1-git-send-email-eyalr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] bt-firmware: Add support for am437x
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
X-List-Received-Date: Fri, 21 Mar 2014 20:15:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

Do you need this patch in dylan? It was not picked up for 2013.12.01 release, 
as the corresponding kernel changes were not approved. I pushed it to dora...

-- 
Denys


On Tue, Feb 11, 2014 at 04:04:52PM +0200, Eyal Reizer wrote:
> Modify the recipe to allow installing the bluetooth init script for
> am437x-evm
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  ...001-Makefile-allow-building-within-the-OE.patch |   29 +++++++++++--------
>  .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    9 +++---
>  2 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
> index 49caa85..a8642a9 100644
> --- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
> +++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
> @@ -1,6 +1,6 @@
> -From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
> -From: Chase Maupin <Chase.Maupin@ti.com>
> -Date: Wed, 7 Mar 2012 14:11:42 -0600
> +From 465ffd990e3366732eb5e2271313539b55c4ccb7 Mon Sep 17 00:00:00 2001
> +From: Eyal Reizer <eyalr@ti.com>
> +Date: Tue, 11 Feb 2014 15:17:53 +0200
>  Subject: [PATCH] Makefile: allow building with OE
>  
>  * Use defaults and source values that allow building this
> @@ -10,17 +10,19 @@ Upstread-Status: Pending
>      * Will be accepted into next release
>  
>  Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> +    < adapated for am437x>
> +Signed-off-by: Eyal Reizer <eyalr@ti.com>
>  ---
> - Makefile |   21 +++++++++++++++++++++
> - 1 files changed, 21 insertions(+), 0 deletions(-)
> + Makefile |   23 +++++++++++++++++++++++
> + 1 files changed, 23 insertions(+), 0 deletions(-)
>  
>  diff --git a/Makefile b/Makefile
> -index 9035e40..bd94881 100644
> +index 9035e40..23bc5b6 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -1,5 +1,26 @@
> +@@ -1,5 +1,28 @@
>   # Installs the the Bluetooth firmware files into the root file system
> -
> + 
>  +-include ../../../Rules.make
>  +
>  +# If KERNEL_DIR is not set then use the default in Rules.make
> @@ -41,9 +43,12 @@ index 9035e40..bd94881 100644
>  +ifeq ($(PLATFORM), am37x-evm)
>  +    MACHINE_NAME := omap3evm
>  +endif
> -+
> ++ifeq ($(PLATFORM), am437x-evm)
> ++    MACHINE_NAME := am43xx
> ++endif
>   install:
> -	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
> -	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
> ---
> + 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
> + 	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
> +-- 
>  1.7.0.4
> +
> diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> index d788875..9aff61a 100644
> --- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> +++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Firmware files for Bluetooth"
>  LICENSE = "TI-TSPA"
> -LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=5f67a65df8b40038a3251b2fe5b912df \
> +LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=4b46aed2a87412c84f9363a8db053e1b \
>  "
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -11,16 +11,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  RCONFLICTS_${PN} = "linux-firmware-wl12xx"
>  RREPLACES_${PN}  = "linux-firmware-wl12xx"
>  
> -PR = "r3+gitr${SRCPV}"
> +PR = "r4+gitr${SRCPV}"
>  
> -COMPATIBLE_MACHINE = "ti33x"
> +COMPATIBLE_MACHINE = "ti33x|ti43x"
>  
> -SRCREV = "57a8e569575e742c47dc2452c4932dcfff816442"
> +SRCREV = "7496df8d130f2db85d5d50b1f703213edf0b54fb"
>  SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
>             file://0001-Makefile-allow-building-within-the-OE.patch"
>  
>  PLATFORM = "unknown"
>  PLATFORM_ti33x = "am335x-evm"
> +PLATFORM_ti43x = "am437x-evm"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

