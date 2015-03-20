Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 847AF5297F
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 18:52:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KIqvxG016687
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 13:52:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KIqtet000309
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 13:52:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 13:52:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KIqt4d015000;
	Fri, 20 Mar 2015 13:52:55 -0500
Date: Fri, 20 Mar 2015 14:52:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150320185254.GK11557@edge>
References: <4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
	<3DCCA74A-3656-4D5E-A5F1-F0A0EBC3C43C@ti.com>
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>
	<20150320182307.GI11557@edge>
	<4B26FB5A64EBA14C87266869E037F9581411049F@DFLE09.ent.ti.com>
	<20150320183641.GJ11557@edge>
	<4B26FB5A64EBA14C87266869E037F958141104DD@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C84E86C@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C84E86C@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Balagopalakrishnan, Anand" <anandb@ti.com>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink
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
X-List-Received-Date: Fri, 20 Mar 2015 18:52:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Correct. Hence the patch at the beginning of this thread is not correct! 
Please make sure it's not applied. W/o it all my nightlies were built 
successfully.


On Fri, Mar 20, 2015 at 02:49:28PM -0400, Cooper Jr., Franklin wrote:
> I would think that AM335x shouldn't need omap-drm since it doesn't have a 
> DSS. Maybe some of the patches being applied should be limited to machines 
> with DSS (am437x, x15, dra7, etc). I'm assuming standard gstreamer 1.0 
> wouldn't have these failures.
> 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 20, 2015 1:44 PM
> > To: Dmytriyenko, Denys
> > Cc: Chengalvala, Vivek; Cooper Jr., Franklin; meta-arago@arago-project.org;
> > Balagopalakrishnan, Anand
> > Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS
> > on libdrm and libdce due to KMSsink
> > 
> > Sorry, I just double checked the filesystems:
> > 
> > jake@mcsdk-hpc-test:~/proc-sdk_rc-builds/01.00.00.00/ti-processor-sdk-
> > linux-am335x-evm-01.00.00.00/filesystem/tisdk-rootfs$ find
> > ./var/lib/opkg/info/ -name '*drm*'
> > ./var/lib/opkg/info/libdrm-tests.control
> > ./var/lib/opkg/info/libdrm-tests.list
> > ./var/lib/opkg/info/libdrm2.list
> > ./var/lib/opkg/info/libdrm2.control
> > ./var/lib/opkg/info/libdrm2.postinst
> > jake@mcsdk-hpc-test:~/ti-processor-sdk-linux-am335x-evm-
> > 01.00.00.00/filesystem/tisdk-rootfs$ cd ../../../ti-processor-sdk-linux-
> > am437x-evm-01.00.00.00/filesystem/tisdk-rootfs/
> > jake@mcsdk-hpc-test:~ /ti-processor-sdk-linux-am437x-evm-
> > 01.00.00.00/filesystem/tisdk-rootfs$ find ./var/lib/opkg/info/ -name '*drm*'
> > ./var/lib/opkg/info/libdrm-tests.control
> > ./var/lib/opkg/info/libdrm-omap1.postinst
> > ./var/lib/opkg/info/libdrm-tests.list
> > ./var/lib/opkg/info/libdrm2.list
> > ./var/lib/opkg/info/libdrm2.control
> > ./var/lib/opkg/info/libdrm-omap1.control
> > ./var/lib/opkg/info/libdrm2.postinst
> > ./var/lib/opkg/info/libdrm-omap1.list
> > 
> > 
> > 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 20, 2015 2:39 PM
> > To: Dmytriyenko, Denys
> > Cc: Chengalvala, Vivek; Cooper Jr., Franklin; meta-arago@arago-project.org;
> > Balagopalakrishnan, Anand
> > Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS
> > on libdrm and libdce due to KMSsink
> > 
> > No it is not in the tree, hence the header is not found. It succeeds on am4
> > since it is pulled in by one of the packagegroups.
> > 
> > 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 20, 2015 2:37 PM
> > To: Stiffler, Jacob
> > Cc: Chengalvala, Vivek; Cooper Jr., Franklin; meta-arago@arago-project.org;
> > Balagopalakrishnan, Anand
> > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS
> > on libdrm and libdce due to KMSsink
> > 
> > Jake,
> > 
> > libdrm should not be pulled for am3 builds - that was the question for this
> > patch, which should not be applied... Do you have it in your tree?
> > 
> > 
> > On Fri, Mar 20, 2015 at 02:27:17PM -0400, Stiffler, Jacob wrote:
> > > arm-oe-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc
> > > -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> > > -mtune=cortex-a8
> > > --sysroot=/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-
> > ext
> > > ernal-linaro-toolchain/sysroots/am335x-evm -std=gnu99 -
> > DHAVE_CONFIG_H
> > > -I. -I../../.. -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
> > > -fstack-protector -I../../../gst-libs -I../../../gst-libs -pthread
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > > naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > > naro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > > naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
> > > -DGST_USE_UNSTABLE_API -pthread
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > > naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_
> > > 1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/
> > > glib-2.0
> > > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > > naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
> > > -DGST_USE_UNSTABLE_API -DG_THREADS_MANDATORY -
> > DG_DISABLE_CAST_CHECKS
> > > -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla
> > > -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes
> > > -Wredundant-decls -Wwrite-strings -Wformat-security
> > > -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress
> > > -Wno-multichar -Wnested-externs
> > > -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
> > > -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -c
> > > gstdrmbufferpool.c  -fPIC -DPIC -o
> > > .libs/libgstdrm_1.0_la-gstdrmbufferpool.o
> > > In file included from gstdrmbufferpool.c:42:0:
> > > gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or
> > > directory compilation terminated.
> > > make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> > > make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs/gst/drm'
> > > make[3]: *** [all-recursive] Error 1
> > > make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs/gst'
> > > make[2]: *** [all-recursive] Error 1
> > > make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs'
> > > make[1]: *** [all-recursive] Error 1
> > > make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3'
> > > make: *** [all] Error 2
> > > ERROR: oe_runmake failed
> > >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, March 20, 2015 2:23 PM
> > > To: Chengalvala, Vivek
> > > Cc: Cooper Jr., Franklin; Stiffler, Jacob;
> > > meta-arago@arago-project.org; Balagopalakrishnan, Anand
> > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
> > > DEPENDS on libdrm and libdce due to KMSsink
> > >
> > > AM3 builds fine here...
> > >
> > >
> > > On Fri, Mar 20, 2015 at 06:17:18PM +0000, Chengalvala, Vivek wrote:
> > > > Karthik, Anand, Denys,
> > > >
> > > >
> > > >
> > > > Upgrade to GST 1.0 (using commit
> > b5747ce8caa13e4528e2d3055fa81cc9ca7b48fd on meta-arago) is causing the
> > following problems:
> > > >
> > > > 1.       Broken build for AM3. Not sure how AM4 build succeeds.
> > > >
> > > > 2.       AM4x: Performance drop with ARM only decode of H264 (not sure if
> > it is due to a) base GST upgrade b) ffmpeg_dec --> avdec_h264 or c)
> > ffmpeg_color_space --> videoconvert)
> > > >
> > > > 3.       AM57x: playbin pipeline internally triggers arm video decoder (e.g.,
> > avdec_h264) instead of ducati decoder
> > > >
> > > > 4.       AM57x: cannot run pipeline with video parse + decode, e.g., "gst-
> > launch-1.0 filesrc location=HistoryOfTI-480p.264 ! h264parse ! ducatih264dec !
> > fakesink"
> > > >
> > > >
> > > >
> > > > All the above issues are not present with gst-0.10.
> > > > Please note that Issue #3 is not observed on Vayu with GLSDK EA release
> > 7.0.0.4. Issue #4 is also happening on Vayu with GLSDK EA release 7.0.0.4.
> > > >
> > > >
> > > >
> > > > In addition to above,
> > > >
> > > > 5.       kmssink is missing from AM57x file system.
> > > >
> > > >
> > > >
> > > > We wanted to do an SDF today for PROCESSOR-SDK on AM3, AM4 and
> > due to above failures, we are forced to freeze @ commit
> > #5c2f4eea32afda6e68681470be664eb5a46fd984, and not pick up any further
> > changes on meta-arago.
> > > >
> > > > There is another release targeted for next week and we'd like to be get
> > back to the latest of meta-arago as soon as possible. Appreciate your help in
> > addressing the above issues.
> > > >
> > > >
> > > >
> > > > Thanks,
> > > >
> > > > Vivek
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org
> > > > [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Cooper
> > > > Jr., Franklin
> > > > Sent: Friday, March 20, 2015 9:58 AM
> > > > To: Stiffler, Jacob
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
> > > > DEPENDS on libdrm and libdce due to KMSsink
> > > >
> > > >
> > > >
> > > > Well that's not good.
> > > >
> > > >
> > > >
> > > > > On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob <j-stiffler@ti.com<mailto:j-
> > stiffler@ti.com>> wrote:
> > > >
> > > > >
> > > >
> > > > > I ran the demo while running "top". It appears that CPU is near 100%.
> > However, this demo was working fine with gstreamer 0.10.
> > > >
> > > > >
> > > >
> > > > > -----Original Message-----
> > > >
> > > > > From: Cooper Jr., Franklin
> > > >
> > > > > Sent: Friday, March 20, 2015 9:34 AM
> > > >
> > > > > To: Stiffler, Jacob
> > > >
> > > > > Cc: Dmytriyenko, Denys;
> > > > > meta-arago@arago-project.org<mailto:meta-arago@arago-
> > project.org>
> > > >
> > > > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
> > > > > DEPENDS on libdrm and libdce due to KMSsink
> > > >
> > > > >
> > > >
> > > > >
> > > >
> > > > >
> > > >
> > > > >
> > > >
> > > > >> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com<mailto:j-
> > stiffler@ti.com>> wrote:
> > > >
> > > > >>
> > > >
> > > > >> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.
> > > >
> > > > >>
> > > >
> > > > >> To get it to work, I had to modify runH264Dec.sh to use the new
> > pipelines. The new command is the following:
> > > >
> > > > >>
> > > >
> > > > >>   gst-launch-1.0 -v filesrc location=$filename ! h264parse !
> > > > >> avdec_h264 ! videoconvert ! fbdevsink device=/dev/fb0
> > > >
> > > > >>
> > > >
> > > > >>
> > > >
> > > > >> Once this was done, I was able to run the demo, but the framerate is
> > extremely slow. Is this the correct command? Or is this behavior expected?
> > > >
> > > > > If slow as in stuttering and choppy then no. If cpu utilization is high then
> > that is expected.
> > > >
> > > > >>
> > > >
> > > > >> Thanks,
> > > >
> > > > >> Jake
> > > >
> > > > >>
> > > >
> > > > >>
> > > >
> > > > >> -----Original Message-----
> > > >
> > > > >> From: Stiffler, Jacob
> > > >
> > > > >> Sent: Friday, March 20, 2015 6:56 AM
> > > >
> > > > >> To: Dmytriyenko, Denys;
> > > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-
> > project.org>
> > > >
> > > > >> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
> > > > >> DEPENDS on libdrm and libdce due to KMSsink
> > > >
> > > > >>
> > > >
> > > > >> It appears I got lucky with a successful am437x-evm build. The package
> > libdrm was installed and libdce was not.
> > > >
> > > > >>
> > > >
> > > > >> However, I got a build failure for am335x-evm due to the missing
> > libdrm dependency:
> > > >
> > > > >>
> > > >
> > > > >> In file included from gstdrmbufferpool.c:42:0:
> > > >
> > > > >> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or
> > directory compilation terminated.
> > > >
> > > > >> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> > > >
> > > > >> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs/gst/drm'
> > > >
> > > > >> make[3]: *** [all-recursive] Error 1
> > > >
> > > > >> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs/gst'
> > > >
> > > > >> make[2]: *** [all-recursive] Error 1
> > > >
> > > > >> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3/gst-libs'
> > > >
> > > > >> make[1]: *** [all-recursive] Error 1
> > > >
> > > > >> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-
> > neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-
> > plugins-bad-1.2.3'
> > > >
> > > > >> make: *** [all] Error 2
> > > >
> > > > >> ERROR: oe_runmake failed
> > > >
> > > > >>
> > > >
> > > > >> - Jake
> > > >
> > > > >>
> > > >
> > > > >> -----Original Message-----
> > > >
> > > > >> From:
> > > > >> meta-arago-bounces@arago-project.org<mailto:meta-arago-
> > bounces@ar
> > > > >> ago-project.org> [mailto:meta-arago-bounces@arago-project.org] On
> > > > >> Behalf Of Dmytriyenko, Denys
> > > >
> > > > >> Sent: Thursday, March 19, 2015 6:37 PM
> > > >
> > > > >> To:
> > > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-
> > project.org>
> > > >
> > > > >> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
> > > > >> DEPENDS on libdrm and libdce due to KMSsink
> > > >
> > > > >>
> > > >
> > > > >> Karthik,
> > > >
> > > > >>
> > > >
> > > > >> I had a question - I see that KMSsink in plugins-bad checks for drm and
> > dce headers. I was trying to set the dependency accordingly, but it would
> > break non dce platforms. Can you please elaborate on that a bit? Thanks.
> > > >
> > > > >>
> > > >
> > > > >> --
> > > >
> > > > >> Denys
> > > >
> > > > >>
> > > >
> > > > >>
> > > >
> > > > >>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko
> > wrote:
> > > >
> > > > >>> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> > > >
> > > > >>>
> > > >
> > > > >>> Signed-off-by: Denys Dmytriyenko
> > > > >>> <denys@ti.com<mailto:denys@ti.com>>
> > > >
> > > > >>> ---
> > > >
> > > > >>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | 4
> > +++-
> > > >
> > > > >>> 1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > >>>
> > > >
> > > > >>> diff --git
> > > >
> > > > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > pl
> > > > >>> ugins-
> > > >
> > > > >>> bad_1.2.3.bbappend
> > > >
> > > > >>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > pl
> > > > >>> ugins-
> > > >
> > > > >>> bad_1.2.3.bbappend
> > > >
> > > > >>> index b1cacac..bd141a8 100644
> > > >
> > > > >>> ---
> > > >
> > > > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > pl
> > > > >>> ugins-
> > > >
> > > > >>> bad_1.2.3.bbappend
> > > >
> > > > >>> +++ b/meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.
> > > > >>> +++ 0-plug
> > > >
> > > > >>> +++ ins-bad_1.2.3.bbappend
> > > >
> > > > >>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=
> > "${THISDIR}/${PN}:"
> > > >
> > > > >>>
> > > >
> > > > >>> PACKAGECONFIG = "faad wayland"
> > > >
> > > > >>>
> > > >
> > > > >>> +DEPENDS += "libdrm libdce"
> > > >
> > > > >>> +
> > > >
> > > > >>> SRC_URI_append = " \
> > > >
> > > > >>>
> > > > >>> file://0001-Added-GstDRMBufferPool-support.patch<file:///\\0001-
> > > > >>> Added-GstDRMBufferPool-support.patch> \
> > > >
> > > > >>>
> > > > >>> file://0002-Modified-waylandsink-to-accept-NV12-format.patch<fil
> > > > >>> e:///\\0002-Modified-waylandsink-to-accept-NV12-format.patch>
> > > >
> > > > >>> \ @@ -9,4 +11,4 @@ SRC_URI_append = " \
> > > >
> > > > >>>
> > > > >>> file://0004-waylandsink-Removed-dependency-on-dri2.patch<file://
> > > > >>> /\\0004-waylandsink-Removed-dependency-on-dri2.patch> \
> > > >
> > > > >>>        file://0005-vc1parse-and-jpegparse-Fixes-plugin-
> > ranks.patch<file:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-
> > ranks.patch>"
> > > >
> > > > >>>
> > > >
> > > > >>> -PR_append = "-arago0"
> > > >
> > > > >>> +PR_append = "-arago1"
> > > >
> > > > >>> --
> > > >
> > > > >>> 2.2.0
> > > >
> > > > >> _______________________________________________
> > > >
> > > > >> meta-arago mailing list
> > > >
> > > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-
> > project.org>
> > > >
> > > > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >
> > > > >> _______________________________________________
> > > >
> > > > >> meta-arago mailing list
> > > >
> > > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-
> > project.org>
> > > >
> > > > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >
> > > > _______________________________________________
> > > >
> > > > meta-arago mailing list
> > > >
> > > > meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> > > >
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >

