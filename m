Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A88A352A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 15:25:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16FPmdq000376
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:25:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FPm2b015810
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:25:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 09:25:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FPmG3000906;
	Thu, 6 Feb 2014 09:25:48 -0600
Date: Thu, 6 Feb 2014 10:25:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140206152547.GH18784@edge>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED10159950281@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C61D94B@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015995037E@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015995037E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/5] ti-tisdk-makefile: Update U-boot makefile
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 15:25:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 06, 2014 at 02:59:09PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Cooper Jr., Franklin
> >Sent: Thursday, February 06, 2014 9:53 AM
> >To: Maupin, Chase; meta-arago@arago-project.org
> >Subject: RE: [meta-arago] [PATCH 1/5] ti-tisdk-makefile: Update U-
> >boot makefile
> >
> >
> >
> >> -----Original Message-----
> >> From: Maupin, Chase
> >> Sent: Thursday, February 06, 2014 8:28 AM
> >> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> >> Subject: RE: [meta-arago] [PATCH 1/5] ti-tisdk-makefile: Update
> >U-boot
> >> makefile
> >>
> >> >-----Original Message-----
> >> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >> >Sent: Thursday, February 06, 2014 10:35 AM
> >> >To: meta-arago@arago-project.org
> >> >Cc: Cooper Jr., Franklin
> >> >Subject: [meta-arago] [PATCH 1/5] ti-tisdk-makefile: Update U-
> >boot
> >> >makefile
> >> >
> >> >* Add echo statements to make U-boot make,clean,install steps
> >stand
> >> >out.
> >> >* Remove installing of U-boot files since installing them into
> >the file
> >> >system
> >> >  servers no purpose.
> >>
> >> I would argue that this doesn't hurt anything and having them on
> >the file system
> >> allows for people to update the bootloader from Linux itself.
> >[Franklin] I can see your point but I was worried about the
> >confusion it would cause especially since the all the kernel files
> >are now in the /boot directory. Is there a point in copying u-
> >boot.map also?
> 
> Not sure about that one.

I would agree with removing u-boot from rootfs - it's not needed, but rather 
nice to have, plus it takes up space. I know flash storage is getting cheaper 
and we are getting larger partitions, but there were/are/will-be platforms 
with limited storage. And it's not that hard to transfer u-boot to Linux for 
flashing purposes, instead of having it there all the time. Plus, it will 
quickly get stale, as it's safe to assume users would want to flash a more 
recent u-boot image later on, not the one we ship...


> >> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> >---
> >> > .../ti-tisdk-makefile/Makefile_u-boot-spl          |   14
> >> >++++++++++----
> >> > .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> >> > 2 files changed, 11 insertions(+), 5 deletions(-)
> >> >
> >> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> >makefile/ti-
> >> >tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-
> >> >tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
> >> >index 9ce6429..d2de7a9 100644
> >> >--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> >tisdk-
> >> >makefile/Makefile_u-boot-spl
> >> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> >tisdk-
> >> >makefile/Makefile_u-boot-spl
> >> >@@ -4,14 +4,20 @@ u-boot-spl_clean: u-boot_clean
> >> > u-boot-spl_install: u-boot_install
> >> >
> >> > u-boot:
> >> >+	@echo ===================================
> >> >+	@echo    Building U-boot
> >> >+	@echo ===================================
> >> > 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-
> >> >boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
> >> > 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-
> >> >boot-* CROSS_COMPILE=$(CROSS_COMPILE)
> >> >
> >> > u-boot_clean:
> >> >+	@echo ===================================
> >> >+	@echo    Cleaining U-boot
> >> >+	@echo ===================================
> >> > 	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> >> >CROSS_COMPILE=$(CROSS_COMPILE) clean
> >> >
> >> > u-boot_install:
> >> >-	install -d $(DESTDIR)/boot
> >> >-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.img
> >> >$(DESTDIR)/boot
> >> >-	install $(TI_SDK_PATH)/board-support/u-boot-*/MLO
> >> >$(DESTDIR)/boot
> >> >-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map
> >> >$(DESTDIR)/boot
> >> >+	@echo ===================================
> >> >+	@echo    Installing U-boot
> >> >+	@echo ===================================
> >> >+	@echo "Nothing to do"
> >> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> >makefile/ti-
> >> >tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-
> >tisdk-
> >> >makefile/ti-tisdk-makefile_1.0.bb
> >> >index 30c2901..374fa81 100644
> >> >--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> >tisdk-
> >> >makefile_1.0.bb
> >> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> >tisdk-
> >> >makefile_1.0.bb
> >> >@@ -34,7 +34,7 @@ SRC_URI = "\
> >> >     file://Makefile_dual-camera-demo \  "
> >> >
> >> >-PR = "r25"
> >> >+PR = "r26"
> >> >
> >> > MAKEFILES_COMMON = "linux \
> >> >                     matrix-gui \
> >> >--
> >> >1.7.0.4
> >> >
> >> >_______________________________________________
> >> >meta-arago mailing list
> >> >meta-arago@arago-project.org
> >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

