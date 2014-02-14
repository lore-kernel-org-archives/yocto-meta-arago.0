Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6F1D55299C
	for <meta-arago@arago-project.org>;
	Fri, 14 Feb 2014 21:11:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1ELBcY5017745
	for <meta-arago@arago-project.org>; Fri, 14 Feb 2014 15:11:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1ELBcRh018775
	for <meta-arago@arago-project.org>; Fri, 14 Feb 2014 15:11:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 14 Feb 2014 15:11:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1ELBbgH017866;
	Fri, 14 Feb 2014 15:11:37 -0600
Date: Fri, 14 Feb 2014 16:11:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140214211136.GM7138@edge>
References: <1392243289-10398-1-git-send-email-aravindbr@ti.com>
	<7D46E86EC0A8354091174257B2FED1015996BEC8@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015996BEC8@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	Aravind Batni <aravindbr@ti.com>
Subject: Re: [PATCH] ti-rm: provides ti resouce manager recipe for	KeyStone devices
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
X-List-Received-Date: Fri, 14 Feb 2014 21:11:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 13, 2014 at 02:14:56PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Aravind Batni
> >Sent: Wednesday, February 12, 2014 4:15 PM
> >To: meta-arago@arago-project.org
> >Cc: Aravind Batni
> >Subject: [meta-arago] [PATCH] ti-rm: provides ti resouce manager
> >recipe for KeyStone devices
> >
> >- TI Resource Manager Low Level Driver
> >
> >Signed-off-by: Aravind Batni <aravindbr@ti.com>
> >---
> > meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc    |    7 ++++
> > meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   45
> >++++++++++++++++++++++
> > 2 files changed, 52 insertions(+)
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-
> >rm_git.bb
> >
> >diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc b/meta-
> >arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> >new file mode 100644
> >index 0000000..96da467
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> >@@ -0,0 +1,7 @@
> >+LICENSE = "TI BSD"
> >+LIC_FILES_CHKSUM =
> >"file://COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
> >+
> >+BRANCH="master"
> >+SRC_URI = "git://git.ti.com/keystone-rtos/rm-
> >lld.git;protocol=git;branch=${BRANCH}"
> >+# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
> >+SRCREV = "3a73cfe015214ff0401639f85fa5e52ea610e59d"
> 
> If you aren't going to have multiple versions of a recipe the .inc is not 
> required.  If you do plan for multiple versions then the SRCREV at least is 
> probably best left in the version specific recipe and not in the .inc.  
> Looking at this I would think it likely that you could/should just roll this 
> .inc into the regular .bb recipe.
> 
> >diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> 
> Looking at the SRCREV below do you want to call this 02.00.00.08 version of 
> the recipe instead of just _git?
> 
> >b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >new file mode 100644
> >index 0000000..7c8dad0
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >@@ -0,0 +1,45 @@
> >+DESCRIPTION = "TI Resource Manager Low Level Driver"
> >+
> >+COMPATIBLE_MACHINE = "keystone"
> >+
> >+PR = "r0"
> 
> You should probably set PV here if you are not going to change this recipe 
> to a specific version.
> 
> >+DEPENDS="ti-ipc"
> >+LLD-NAME="rm"
> >+
> >+include ti-rm.inc
> >+
> >+S = "${WORKDIR}/git"
> >+LLD-BLD-DIR="${S}/ti/drv"
> >+
> >+PACKAGES =+ "${PN}-test"
> >+
> >+FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
> >+                    ${bindir}/rmLinuxClientTest_*.out \
> >+                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> >+
> >+do_configure () {
> >+#   tweak the directory structure to LLD way
> >+    cd ${S}
> >+    mkdir -p ${LLD-BLD-DIR}
> >+    cd ${LLD-BLD-DIR}
> >+    ln -s ${S} ${LLD-NAME}

Also, please don't use dashes in variable names! Underscores, while not 
recommended, are still acceptable:

LLDBLDDIR - best from Bitbake perspective, not very human-readable
LLD_BLD_DIR - not perfect from Bitbake perspective, but parseable and readable
LLD-BLD-DIR - may cause all kinds of issues


> I'm not sure I understand what you are trying to do here.  It seems like you 
> want ${WORKDIR}/git/ti/drv/rm to be pointed to ${S}?  Looking below it seems 
> like you then want to pass ${S}/ti/drm/rm, which points to ${S} to the make 
> commands.  So can't you just point things to ${S}?
> 
> Are you trying to work around the Makefile maybe looking for other files in 
> the ti/drv directory?  Since you created that directory that doesn't seem 
> likely though.  This seems like an issue best handled by updating the 
> Makefiles to allow you to set paths and have a set of defaults.  i.e. PATHX 
> ?= "default path".  That way you can update PATHX as a parameter you pass.  
> But this seems strange to make new direcory structures that then link back 
> to the base directory you were already in.
> 
> >+}
> >+
> >+do_compile () {
> >+#   Now build the lld in the updated directory
> >+    cd ${LLD-BLD-DIR}/${LLD-NAME}
> >+    make -f makefile_armv7 clean
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME}
> >+    make -f makefile_armv7 lib tests
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME}
> >+    make -f makefile_armv7 lib tests
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=yes
> >+    make -f makefile_armv7 clean
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME}
> >+    make -f makefile_armv7 lib tests
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME}
> >+    make -f makefile_armv7 lib tests
> >PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-
> >BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=yes
> 
> Some thoughts:
> 
> 1. Would this be better done as a for loop iterated of the different DEVICE 
> settings?
> 2. Since you don't seem to be breaking these libraries out per DEVICE and I 
> think you are packaging both static and dynamic libraries would an "all" 
> make target be better than calling each individually?
> 	- I actually wonder if you would prefer to split dynamic vs. static 
> 	libraries.  Why are both packaged?  Or maybe I don't understand what 
> 	you are doing here?
> 3. Should the libraries be packaged per DEVICE? The root of this question is 
> whether this recipe should be machine specific and you build the package for 
> k2k and k2h devices.  It seems like you are making one package that has 
> support for multiple devices.
> 
> >+}
> >+
> >+do_install () {
> >+    install -d ${D}/${includedir}/ti/drv/${LLD-NAME}
> >+    install -d ${D}/${libdir}
> >+    install -d ${D}/${bindir}
> >+    make -f makefile_armv7 install installbin installbin_test
> >INSTALL_INC_BASE_DIR=${D}/${includedir}
> >INSTALL_LIB_BASE_DIR=${D}/${libdir}
> >INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE=k2h
> >+    make -f makefile_armv7 install installbin installbin_test
> >INSTALL_INC_BASE_DIR=${D}/${includedir}
> >INSTALL_LIB_BASE_DIR=${D}/${libdir}
> >INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE=k2k
> >+}
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

