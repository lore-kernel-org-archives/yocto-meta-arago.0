Return-Path: <gaurav@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 49A3852985
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2019 18:19:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3OIIdWg052185
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2019 13:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556129919;
	bh=VvNPbm+rGfgPGVxG+yGcIR6llxuD/eOTyzkejVy5n3s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cwYMAN1EvZvU0njVL04NBas9JXY5qXdFEbr9lvhzv5dLDbOuKU0aCYZ/7ZKt4Wr4E
	Gyr09L7eeYewYRolJLRFfXpop82bTbXPzmO50g21cPSuAAKnwyRJgtgLSeYWbK+Bkt
	Ccok6h+S2ggnsIvsaN1Dv4uPjv95wkDnMO6cGkl4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3OIIdCr095906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2019 13:18:39 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Apr 2019 13:18:38 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1713.004; Wed, 24 Apr 2019 13:18:38 -0500
From: "Mitra, Gaurav" <gaurav@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [EXTERNAL]  [PATCH] opencl-monitor,
	opencl-monitor-ipu,
	opencl-monitor-rtos: compile monitor in do_compile phase
	instead of do_install
Thread-Index: AQHU+seG8dvBMrztWUS+hTtvE5F5p6ZLnfRQ
Date: Wed, 24 Apr 2019 18:18:38 +0000
Message-ID: <7aa940831193430c8ffdae367fe7d36c@ti.com>
References: <20190418213339.109836-1-gaurav@ti.com>
	<5a62cfc8-7f55-9db3-0306-0a8ae46787df@ti.com>
	<20190424175954.GG6705@beryl>
In-Reply-To: <20190424175954.GG6705@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.18.176]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [PATCH] opencl-monitor, opencl-monitor-ipu, opencl-monitor-rtos: compile monitor in do_compile phase instead of do_install
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
X-List-Received-Date: Wed, 24 Apr 2019 18:19:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,=20

I mentioned to Jake in a separate thread that we are planning to address th=
is in the next OpenCL release.

In the short term, we need this patch to understand if compiling the monito=
r in do_install was leading to build dependency issues.=20

Thank you,
Gaurav

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, April 24, 2019 1:00 PM
To: Stiffler, Jacob
Cc: Mitra, Gaurav; meta-arago@arago-project.org
Subject: Re: [meta-arago] [EXTERNAL] [PATCH] opencl-monitor, opencl-monitor=
-ipu, opencl-monitor-rtos: compile monitor in do_compile phase instead of d=
o_install

On Mon, Apr 22, 2019 at 08:52:18AM -0400, Jacob Stiffler wrote:
> I was anticipating that the change for this would come from within the
> monitor's cmake files. Instead, the build and install instructions from
> cmake is duplicated here, and thus any future changes will now require tw=
o
> sets of changes.

Ping. Is this being addressed? Should the patch be revered?


> On 4/18/2019 5:33 PM, Gaurav Mitra wrote:
> >     - The cmake build of opencl-monitor, opencl-monitor-ipu and
> >       opencl-monitor-rtos performs compilation as well as installation =
of
> >       artifacts in the do_install phase
> >     - Separate the compilation and installation of the monitor in do_co=
mpile
> >       and do_install phases respectively using make instead of cmake
> >
> >Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> >---
> >  .../recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb | 32 +++++++-----
> >  .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       | 24 ++++++---
> >  .../recipes-ti/ocl/opencl-monitor_git.bb           | 57 ++++++++++++++=
++++----
> >  3 files changed, 85 insertions(+), 28 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_g=
it.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
> >index b0e70165..637b427c 100644
> >--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
> >+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
> >@@ -7,8 +7,6 @@ require recipes-ti/includes/arago-paths.inc
> >  PR =3D "${INC_PR}.0"
> >-inherit cmake
> >-
> >  DEPENDS =3D " ti-llvm3.6-native \
> >              common-csl-ip-rtos \
> >              ti-xdctools-native \
> >@@ -33,14 +31,6 @@ BUILD_TARGET_omap-a15   =3D "ARM_AM57"
> >  RELEASE_TARGET =3D ""
> >  RELEASE_TARGET_omap-a15 =3D "am57xx"
> >-EXTRA_OECMAKE +=3D " -DCROSS_COMPILE=3DTRUE \
> >-                   -DOCL_MONITOR_DIR=3D${S} \
> >-                   -DBUILD_OUTPUT=3Dall \
> >-                   -DSHARE_PATH=3D${datadir}/ti \
> >-                   -DBUILD_TARGET=3D${BUILD_TARGET} \
> >-                   -DBUILD_OS=3DSYS_BIOS \
> >-"
> >-
> >  export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"
> >  export PDK_DIR =3D "${PDK_INSTALL_DIR}"
> >  export IPC_DIR =3D "${IPC_INSTALL_DIR}"
> >@@ -57,9 +47,29 @@ export AET_DIR =3D "${STAGING_DIR_TARGET}/usr/share/t=
i/ctoolslib/aet"
> >  export X86_LLVM_DIR =3D "${STAGING_DIR_NATIVE}/usr"
> >  export XDCPATH =3D "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${ED=
MA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
> >  export DESTDIR=3D"${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${=
RELEASE_TARGET}-${PV}/packages/ti/opencl"
> >+export OCL_FPERMS =3D "664"
> >+export OCL_DPERMS =3D "775"
> >+export SHARE_PATH=3D"${DESTDIR}${datadir}/ti/opencl"
> >+
> >+EXTRA_OEMAKE +=3D " BUILD_OS=3DSYS_BIOS \
> >+                  WORKING_DIRECTORY=3D${S} \
> >+                  BUILD_TARGET=3D${BUILD_TARGET} \
> >+"
> >+
> >+do_compile() {
> >+  oe_runmake -f Makefile
> >+}
> >  do_install() {
> >-    oe_runmake install
> >+    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms ${SHARE_PATH}=
/dsp.syms
> >+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms.obj ${SHARE_P=
ATH}/dsp_syms.obj
> >+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.out ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp1.out ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} libDSPMonitor.ae66 ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} ../builtins/dsp.lib ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} ../libm/libm.lib ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} cmds/monitor.am57x_rtos.cmd ${SHARE_PATH}
> >  }
> >  FILES_${PN} +=3D "${OCL_RTOS_INSTALL_DIR_RECIPE}"
> >diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb =
b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> >index 72855665..c2552416 100644
> >--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> >+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> >@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
> >  PR =3D "${INC_PR}.0"
> >-inherit cmake update-alternatives
> >+inherit update-alternatives
> >  DEPENDS =3D " common-csl-ip-rtos \
> >              pm-lld-rtos \
> >@@ -25,13 +25,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  S =3D "${WORKDIR}/git/monitor_ipu"
> >-BUILD_TARGET =3D "ARM_AM57"
> >-
> >-EXTRA_OECMAKE +=3D " -DCROSS_COMPILE=3DTRUE \
> >-                   -DOCL_MONITOR_IPU_DIR=3D${S} \
> >-                   -DBUILD_OUTPUT=3Dall \
> >-"
> >-
> >  export IPC_DIR =3D "${IPC_INSTALL_DIR}"
> >  export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
> >  export PDK_DIR =3D "${PDK_INSTALL_DIR}"
> >@@ -40,6 +33,21 @@ export TI_OCL_M4_CGT_INSTALL =3D "${STAGING_DIR_NATIV=
E}/usr/share/ti/ti-cgt-arm"
> >  export CSL_LIB_M4 =3D "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/releas=
e/ti.csl.aem4"
> >  export PM_HAL_LIB_M4 =3D "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/=
release/pm_hal.aem4"
> >  export OCL_TIDL_FW_DIR =3D "${OCL_TIDL_FW_INSTALL_DIR}"
> >+export OCL_FPERMS =3D "664"
> >+export OCL_DPERMS =3D "775"
> >+
> >+EXTRA_OEMAKE +=3D " BUILD_AM57=3D1 \
> >+                  WORKING_DIRECTORY=3D${S} \
> >+"
> >+
> >+do_compile() {
> >+  oe_runmake -f Makefile
> >+}
> >+
> >+do_install() {
> >+    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
> >+    install -m ${OCL_FPERMS} bin/release/server_ipu1.xem4 ${D}${base_li=
bdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor
> >+}
> >  ALTERNATIVE_${PN} =3D "dra7-ipu1-fw.xem4"
> >  ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] =3D "${base_libdir}/firmware/=
dra7-ipu1-fw.xem4"
> >diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> >index 3cc6572b..0ab21a1a 100644
> >--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> >+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> >@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
> >  PR =3D "${INC_PR}.0"
> >-inherit cmake update-alternatives
> >+inherit update-alternatives
> >  DEPENDS =3D " ti-llvm3.6-native \
> >              common-csl-ip-rtos \
> >@@ -56,13 +56,6 @@ BUILD_TARGET_k2l =3D "ARM_K2L"
> >  BUILD_TARGET_k2e =3D "ARM_K2E"
> >  BUILD_TARGET_k2g =3D "ARM_K2G"
> >-EXTRA_OECMAKE +=3D " -DCROSS_COMPILE=3DTRUE \
> >-                   -DOCL_MONITOR_DIR=3D${S} \
> >-                   -DBUILD_OUTPUT=3Dall \
> >-                   -DSHARE_PATH=3D${datadir}/ti \
> >-                   -DBUILD_TARGET=3D${BUILD_TARGET} \
> >-"
> >-
> >  export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"
> >  export PDK_DIR =3D "${PDK_INSTALL_DIR}"
> >  export IPC_DIR =3D "${IPC_INSTALL_DIR}"
> >@@ -79,9 +72,55 @@ export AET_DIR =3D "${STAGING_DIR_TARGET}/usr/share/t=
i/ctoolslib/aet"
> >  export X86_LLVM_DIR =3D "${STAGING_DIR_NATIVE}/usr"
> >  export XDCPATH =3D "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${ED=
MA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
> >  export OCL_TIDL_FW_DIR =3D "${OCL_TIDL_FW_INSTALL_DIR}"
> >+export OCL_FPERMS =3D "664"
> >+export OCL_DPERMS =3D "775"
> >+export SHARE_PATH=3D"${D}${datadir}/ti/opencl"
> >+
> >+EXTRA_OEMAKE +=3D " BUILD_OS=3Dlinux \
> >+                  WORKING_DIRECTORY=3D${S} \
> >+                  BUILD_TARGET=3D${BUILD_TARGET} \
> >+"
> >+do_compile() {
> >+  oe_runmake -f Makefile
> >+}
> >+
> >+do_install() {
> >+    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
> >+}
> >+
> >+install_dsp_objs() {
> >+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.out ${SHARE_PATH}/dsp.ou=
t
> >+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms.obj ${SHARE_PATH}/d=
sp_syms.obj
> >+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms ${SHARE_PATH}/dsp.s=
yms
> >+}
> >  do_install_append_dra7xx() {
> >-	for i in 1 2; do mv ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66 ${D=
}${base_libdir}/firmware/dra7-dsp$i-fw.xe66.${BPN}; done
> >+    install_dsp_objs am57x
> >+    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
> >+    install -m ${OCL_FPERMS} monitor_am57x/dsp0.out ${D}${base_libdir}/=
firmware/dra7-dsp1-fw.xe66.${BPN}
> >+    install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/=
firmware/dra7-dsp2-fw.xe66.${BPN}
> >+}
> >+
> >+do_install_append_k2hk() {
> >+    for i in {0..7}; do install -m ${OCL_FPERMS} monitor_evmk2h/dsp${i}=
.out ${SHARE_PATH}; done
> >+    install_dsp_objs evmk2h
> >+}
> >+
> >+do_install_append_k2l() {
> >+    for i in {0..3}; do install -m ${OCL_FPERMS} monitor_evmk2l/dsp${i}=
.out ${SHARE_PATH}; done
> >+    install_dsp_objs evmk2l
> >+}
> >+
> >+do_install_append_k2e() {
> >+    install -m ${OCL_FPERMS} monitor_evmk2e/dsp0.out ${SHARE_PATH}
> >+    install_dsp_objs evmk2e
> >+}
> >+
> >+do_install_append_k2g() {
> >+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}/dsp.=
out
> >+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp.syms ${SHARE_PATH}
> >+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp_syms.obj ${SHARE_PATH}
> >  }
> >  ALTERNATIVE_${PN}_dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

