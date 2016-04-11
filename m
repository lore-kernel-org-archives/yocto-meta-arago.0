Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 84D6152090
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 17:43:35 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H00BHUD7VHT30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Apr 2016 12:43:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=HihYlcsHAAAA:8 a=sozttTNsAAAA:8
	a=j4OUQLWZIjNQWfBUSsIA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 6e0c1c22; Mon, 11 Apr 2016 17:43:08 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 48C7F161F8C; Mon,
	11 Apr 2016 13:43:07 -0400 (EDT)
Date: Mon, 11 Apr 2016 13:43:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-id: <20160411174307.GQ16135@denix.org>
References: <1460057326-25068-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F958142623F7@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <4B26FB5A64EBA14C87266869E037F958142623F7@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] HACK: packagegroup*: disable opencl and openmp for now due to llvm build issues
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
X-List-Received-Date: Mon, 11 Apr 2016 17:43:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Jake,

I believe it is the same issue - none of the LLVM libraries can be found. 
Affects clocl native and nativesdk variants.

-- 
Denys


On Mon, Apr 11, 2016 at 02:10:26PM +0000, Stiffler, Jacob wrote:
> Denys,
> 
> What issue do you see with building llvm? I am able to build ti-llvm3.6, 
> however, the "llvm-config" is broken for the native variant.
> 
> Is this the issue that you see? 
> 
> Thank you,
> Jake
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Thursday, April 07, 2016 3:29 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] HACK: packagegroup*: disable opencl and
> > openmp for now due to llvm build issues
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 18 ++++++------
> >  .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 21 +++++++------
> >  .../packagegroup-arago-tisdk-addons.bb             | 34 +++++++++++-----------
> >  .../packagegroup-arago-tisdk-matrix.bb             | 20 ++++++-------
> >  ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  4 +--  ...ckagegroup-
> > arago-tisdk-multimedia-sdk-target.bb |  4 +--
> >  .../packagegroup-arago-tisdk-multimedia.bb         |  4 +--
> >  7 files changed, 54 insertions(+), 51 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> > index 0306c1b..46e9271 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-addons-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-addons-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install sources for additional utilities/demos for
> > SDKs"
> >  LICENSE = "MIT"
> > -PR = "r20"
> > +PR = "r21"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -31,25 +31,25 @@ UTILS_append_ti43x = " \
> >      pru-icss-src \
> >  "
> > 
> > +#    opencl-examples-src
> > +#    openmpacc-examples-src
> >  UTILS_append_dra7xx = " \
> > -    opencl-examples-src \
> > -    openmpacc-examples-src \
> >  "
> > 
> > +#    opencl-examples-src
> > +#    openmpacc-examples-src
> >  UTILS_append_k2hk-evm = " \
> > -    opencl-examples-src \
> > -    openmpacc-examples-src \
> >      linalg-examples-src \
> >  "
> > 
> > +#    opencl-examples-src
> > +#    openmpacc-examples-src
> >  UTILS_append_k2l-evm = " \
> > -    opencl-examples-src \
> > -    openmpacc-examples-src \
> >  "
> > 
> > +#    opencl-examples-src
> > +#    openmpacc-examples-src
> >  UTILS_append_k2e-evm = " \
> > -    opencl-examples-src \
> > -    openmpacc-examples-src \
> >  "
> > 
> >  EXTRA_LIBS = ""
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> > index 062e8ce..a5b4828 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-addons-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-addons-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install headers and libraries related to addons into
> > the SDK"
> >  LICENSE = "MIT"
> > -PR = "r25"
> > +PR = "r26"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -119,21 +119,24 @@ EXTRA_LIBS_append_k2e-evm = "\
> >  UTILS_append_omap3 = " canutils-dev"
> >  UTILS_append_ti33x = " canutils-dev"
> >  UTILS_append_ti43x = " canutils-dev"
> > +#                        opencl-staticdev
> > +#                        openmpacc-dev
> >  UTILS_append_dra7xx = " canutils-dev \
> > -                        opencl-staticdev \
> >                          elfutils-dev \
> >                          elfutils-staticdev \
> > -                        openmpacc-dev \
> >  "
> > -UTILS_append_k2hk-evm = " opencl-staticdev \
> > -                          openmpacc-dev \
> > +#opencl-staticdev
> > +#                          openmpacc-dev
> > +UTILS_append_k2hk-evm = " \
> >                            linalg-dev \
> >  "
> > -UTILS_append_k2l-evm = " opencl-staticdev \
> > -                         openmpacc-dev \
> > +#opencl-staticdev
> > +#                         openmpacc-dev
> > +UTILS_append_k2l-evm = " \
> >  "
> > -UTILS_append_k2e-evm = " opencl-staticdev \
> > -                         openmpacc-dev \
> > +#opencl-staticdev
> > +#                         openmpacc-dev
> > +UTILS_append_k2e-evm = " \
> >  "
> >  UTILS_append_k2g-evm = " canutils-dev"
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 2894f74..517f6a6 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> >  LICENSE = "MIT"
> > -PR = "r44"
> > +PR = "r45"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -58,31 +58,31 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
> > 
> >  UTILS_append_omap3 = " canutils"
> > 
> > +#                        opencl-examples
> >  UTILS_append_dra7xx = " canutils \
> >                          dsptop \
> >                          gdbc6x \
> >                          glsdk-example-apps \
> > -                        opencl-examples \
> >  "
> > 
> >  UTILS_append_keystone = " \
> >      ti-ipc-rtos-fw \
> >  "
> > 
> > +#    opencl-examples
> >  UTILS_append_k2hk-evm = " \
> > -    opencl-examples \
> >      gdbc6x \
> >      dsptop \
> >  "
> > 
> > +#    opencl-examples
> >  UTILS_append_k2l-evm = " \
> > -    opencl-examples \
> >      gdbc6x \
> >      dsptop \
> >  "
> > 
> > +#    opencl-examples
> >  UTILS_append_k2e-evm = " \
> > -    opencl-examples \
> >      gdbc6x \
> >      dsptop \
> >  "
> > @@ -103,26 +103,26 @@ EXTRA_PACKAGES = " \
> >      nodejs-npm \
> >      protobuf \
> >  "
> > +#    opencl-staticdev
> > +#    opencl-examples-dev
> > +#    openmpacc-examples-dev
> >  EXTRA_PACKAGES_append_dra7xx = " \
> > -    opencl-staticdev \
> > -    opencl-examples-dev \
> > -    openmpacc-examples-dev \
> >  "
> > +#    opencl-staticdev
> > +#    opencl-examples-dev
> > +#    openmpacc-examples-dev
> >  EXTRA_PACKAGES_append_k2hk-evm = " \
> > -    opencl-staticdev \
> > -    opencl-examples-dev \
> > -    openmpacc-examples-dev \
> >      linalg-examples \
> >  "
> > +#    opencl-staticdev
> > +#    opencl-examples-dev
> > +#    openmpacc-examples-dev
> >  EXTRA_PACKAGES_append_k2l-evm = " \
> > -    opencl-staticdev \
> > -    opencl-examples-dev \
> > -    openmpacc-examples-dev \
> >  "
> > +#    opencl-staticdev
> > +#    opencl-examples-dev
> > +#    openmpacc-examples-dev
> >  EXTRA_PACKAGES_append_k2e-evm = " \
> > -    opencl-staticdev \
> > -    opencl-examples-dev \
> > -    openmpacc-examples-dev \
> >  "
> > 
> >  RDEPENDS_${PN} = "\
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > index 11ff899..9bb68f4 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-matrix.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-matrix.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to include Matrix v2"
> >  LICENSE = "MIT"
> > -PR = "r51"
> > +PR = "r52"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -129,10 +129,10 @@ MATRIX_APPS_append_omap-a15 = "     \
> >      matrix-gui-pm-demos-governor    \
> >  "
> > 
> > +#    matrix-opencl-demo-floatcompute
> > +#    matrix-opencl-demo-vecadd
> > +#    matrix-video-analytics-opencv-opencl-opengl-demo
> >  MATRIX_APPS_append_dra7xx = "        \
> > -    matrix-opencl-demo-floatcompute  \
> > -    matrix-opencl-demo-vecadd        \
> > -    matrix-video-analytics-opencv-opencl-opengl-demo \
> >  "
> > 
> >  MATRIX_APPS_append_beagleboard = "  \
> > @@ -171,19 +171,19 @@ MATRIX_APPS_append_keystone = " \
> >      matrix-mc-demo-ipc          \
> >  "
> > 
> > +#    matrix-opencl-demo-floatcompute
> > +#    matrix-opencl-demo-vecadd
> >  MATRIX_APPS_append_k2hk-evm = "      \
> > -    matrix-opencl-demo-floatcompute  \
> > -    matrix-opencl-demo-vecadd        \
> >  "
> > 
> > +#    matrix-opencl-demo-floatcompute
> > +#    matrix-opencl-demo-vecadd
> >  MATRIX_APPS_append_k2l-evm = "       \
> > -    matrix-opencl-demo-floatcompute  \
> > -    matrix-opencl-demo-vecadd        \
> >  "
> > 
> > +#    matrix-opencl-demo-floatcompute
> > +#    matrix-opencl-demo-vecadd
> >  MATRIX_APPS_append_k2e-evm = "       \
> > -    matrix-opencl-demo-floatcompute  \
> > -    matrix-opencl-demo-vecadd        \
> >  "
> > 
> >  RDEPENDS_${PN} = "        \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> > index e83a01c..ddf1148 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-multimedia-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-multimedia-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to add multimedia related sources into the SDK"
> >  LICENSE = "MIT"
> > -PR = "r9"
> > +PR = "r10"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -21,8 +21,8 @@ MULTIMEDIA_append_ti43x = " \
> >      image-gallery-src \
> >  "
> > 
> > +#    qt-opencv-opencl-opengl-multithreaded-src
> >  MULTIMEDIA_append_dra7xx = " \
> > -    qt-opencv-opencl-opengl-multithreaded-src \
> >  "
> > 
> >  #Demo doesn't work on 3.14
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> > index 93b6664..991d29f 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-multimedia-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-multimedia-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to build and install header and libs into sdk"
> >  LICENSE = "MIT"
> > -PR = "r6"
> > +PR = "r7"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -8,10 +8,10 @@ inherit packagegroup
> > 
> >  MULTIMEDIA = ""
> > 
> > +#    qt-opencv-opencl-opengl-multithreaded-dev
> >  MULTIMEDIA_append_dra7xx = " \
> >      hevc-arm-decoder-dev \
> >      hevc-arm-decoder-staticdev \
> > -    qt-opencv-opencl-opengl-multithreaded-dev \
> >  "
> > 
> >  RDEPENDS_${PN} = "\
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > index f5f2a25..4423827 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-multimedia.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > ti
> > +++ sdk-multimedia.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to add multimedia related packages"
> >  LICENSE = "MIT"
> > -PR = "r16"
> > +PR = "r17"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > @@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 = " \
> >      amsdk-av-files \
> >  "
> > 
> > +#    qt-opencv-opencl-opengl-multithreaded-dev
> >  MULTIMEDIA_append_dra7xx = " \
> >      hevc-arm-decoder \
> > -    qt-opencv-opencl-opengl-multithreaded-dev \
> >  "
> > 
> >  MULTIMEDIA_append_am37x-evm = " \
> > --
> > 2.2.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

