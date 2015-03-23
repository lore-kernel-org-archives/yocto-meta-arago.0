Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8B7C352A60
	for <meta-arago@arago-project.org>;
	Mon, 23 Mar 2015 11:05:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2NB58hq017320
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 06:05:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2NB57Ka022256
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 06:05:07 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 23 Mar 2015 06:05:07 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AQHQYovfAYVpT0KB/kuEWTxVKSDJSp0kuQUAgAB51GCAACdNUIAAWZMA//+ua6CAAFh0gIAASFQAgAABoID//61PIIAAVnyA//+sU2AAACxv0AAPVNqAAHYzQ9A=
Date: Mon, 23 Mar 2015 11:05:06 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141107B8@DFLE09.ent.ti.com>
References: <20150319223632.GH11557@edge>
	<4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
	<3DCCA74A-3656-4D5E-A5F1-F0A0EBC3C43C@ti.com>
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>
	<20150320182307.GI11557@edge>
	<4B26FB5A64EBA14C87266869E037F9581411049F@DFLE09.ent.ti.com>
	<20150320183641.GJ11557@edge>
	<4B26FB5A64EBA14C87266869E037F958141104DD@DFLE09.ent.ti.com>
	<20150320210107.GO11557@edge>
In-Reply-To: <20150320210107.GO11557@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Balagopalakrishnan, Anand" <anandb@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Mon, 23 Mar 2015 11:05:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

These errors occur on clean VMs. It seems that you are getting lucky in you=
r nightlies such that libdrm is not built before you build gst-plugins.

One reason libdrm is being pulled into the filesystem, is because libdrm-te=
sts is pulled into "packagegroup-arago-test" for all machines.


I just checked the coresdk golden tisdk-rootfs image. This does indeed incl=
ude libdrm:

jake@mcsdk-hpc-test:~/proc-sdk_nightlies/coresdk/tisdk-rootfs-image-am335x-=
evm-20150322020246$ find ./var/lib/opkg/info/ -name 'libdrm*'
./var/lib/opkg/info/libdrm-tests.control
./var/lib/opkg/info/libdrm-omap1.postinst
./var/lib/opkg/info/libdrm-tests.list
./var/lib/opkg/info/libdrm2.list
./var/lib/opkg/info/libdrm2.control
./var/lib/opkg/info/libdrm-omap1.control
./var/lib/opkg/info/libdrm2.postinst
./var/lib/opkg/info/libdrm-omap1.list


- Jake

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 20, 2015 5:01 PM
To: Stiffler, Jacob
Cc: Chengalvala, Vivek; Cooper Jr., Franklin; meta-arago@arago-project.org;=
 Balagopalakrishnan, Anand
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink

have you tried bitbake libdrm -c cleansstate?

On Fri, Mar 20, 2015 at 02:43:37PM -0400, Stiffler, Jacob wrote:
> Sorry, I just double checked the filesystems:
>=20
> jake@mcsdk-hpc-test:~/proc-sdk_rc-builds/01.00.00.00/ti-processor-sdk-lin=
ux-am335x-evm-01.00.00.00/filesystem/tisdk-rootfs$ find ./var/lib/opkg/info=
/ -name '*drm*'
> ./var/lib/opkg/info/libdrm-tests.control
> ./var/lib/opkg/info/libdrm-tests.list
> ./var/lib/opkg/info/libdrm2.list
> ./var/lib/opkg/info/libdrm2.control
> ./var/lib/opkg/info/libdrm2.postinst
> jake@mcsdk-hpc-test:~/ti-processor-sdk-linux-am335x-evm-01.00.00.00/fi
> lesystem/tisdk-rootfs$ cd=20
> ../../../ti-processor-sdk-linux-am437x-evm-01.00.00.00/filesystem/tisd
> k-rootfs/ jake@mcsdk-hpc-test:~=20
> /ti-processor-sdk-linux-am437x-evm-01.00.00.00/filesystem/tisdk-rootfs$ f=
ind ./var/lib/opkg/info/ -name '*drm*'
> ./var/lib/opkg/info/libdrm-tests.control
> ./var/lib/opkg/info/libdrm-omap1.postinst
> ./var/lib/opkg/info/libdrm-tests.list
> ./var/lib/opkg/info/libdrm2.list
> ./var/lib/opkg/info/libdrm2.control
> ./var/lib/opkg/info/libdrm-omap1.control
> ./var/lib/opkg/info/libdrm2.postinst
> ./var/lib/opkg/info/libdrm-omap1.list
>=20
>=20
>=20
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Friday, March 20, 2015 2:39 PM
> To: Dmytriyenko, Denys
> Cc: Chengalvala, Vivek; Cooper Jr., Franklin;=20
> meta-arago@arago-project.org; Balagopalakrishnan, Anand
> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> DEPENDS on libdrm and libdce due to KMSsink
>=20
> No it is not in the tree, hence the header is not found. It succeeds on a=
m4 since it is pulled in by one of the packagegroups.
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 20, 2015 2:37 PM
> To: Stiffler, Jacob
> Cc: Chengalvala, Vivek; Cooper Jr., Franklin;=20
> meta-arago@arago-project.org; Balagopalakrishnan, Anand
> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> DEPENDS on libdrm and libdce due to KMSsink
>=20
> Jake,
>=20
> libdrm should not be pulled for am3 builds - that was the question for th=
is patch, which should not be applied... Do you have it in your tree?
>=20
>=20
> On Fri, Mar 20, 2015 at 02:27:17PM -0400, Stiffler, Jacob wrote:
> > arm-oe-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc=20
> > -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneo=
n
> > -mtune=3Dcortex-a8
> > --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-e
> > xt ernal-linaro-toolchain/sysroots/am335x-evm -std=3Dgnu99=20
> > -DHAVE_CONFIG_H -I. -I../../..=20
> > -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
> > -fstack-protector -I../../../gst-libs -I../../../gst-libs -pthread=20
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > naro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
> > -DGST_USE_UNSTABLE_API -pthread
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li
> > naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_
> > 1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/includ
> > e/
> > glib-2.0
> > -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
> > li naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
> > -DGST_USE_UNSTABLE_API -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS=20
> > -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla=20
> > -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes=20
> > -Wredundant-decls -Wwrite-strings -Wformat-security=20
> > -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress=20
> > -Wno-multichar -Wnested-externs=20
> > -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
> > -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -c=20
> > gstdrmbufferpool.c  -fPIC -DPIC -o=20
> > .libs/libgstdrm_1.0_la-gstdrmbufferpool.o
> > In file included from gstdrmbufferpool.c:42:0:
> > gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or=20
> > directory compilation terminated.
> > make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> > make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTE=
X_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux=
-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst=
-libs/gst/drm'
> > make[3]: *** [all-recursive] Error 1
> > make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTE=
X_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux=
-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst=
-libs/gst'
> > make[2]: *** [all-recursive] Error 1
> > make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTE=
X_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux=
-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst=
-libs'
> > make[1]: *** [all-recursive] Error 1
> > make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTE=
X_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux=
-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'
> > make: *** [all] Error 2
> > ERROR: oe_runmake failed
> >=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 20, 2015 2:23 PM
> > To: Chengalvala, Vivek
> > Cc: Cooper Jr., Franklin; Stiffler, Jacob;=20
> > meta-arago@arago-project.org; Balagopalakrishnan, Anand
> > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> > DEPENDS on libdrm and libdce due to KMSsink
> >=20
> > AM3 builds fine here...
> >=20
> >=20
> > On Fri, Mar 20, 2015 at 06:17:18PM +0000, Chengalvala, Vivek wrote:
> > > Karthik, Anand, Denys,
> > >=20
> > >=20
> > >=20
> > > Upgrade to GST 1.0 (using commit b5747ce8caa13e4528e2d3055fa81cc9ca7b=
48fd on meta-arago) is causing the following problems:
> > >=20
> > > 1.       Broken build for AM3. Not sure how AM4 build succeeds.
> > >=20
> > > 2.       AM4x: Performance drop with ARM only decode of H264 (not sur=
e if it is due to a) base GST upgrade b) ffmpeg_dec --> avdec_h264 or c) ff=
mpeg_color_space --> videoconvert)
> > >=20
> > > 3.       AM57x: playbin pipeline internally triggers arm video decode=
r (e.g., avdec_h264) instead of ducati decoder
> > >=20
> > > 4.       AM57x: cannot run pipeline with video parse + decode, e.g., =
"gst-launch-1.0 filesrc location=3DHistoryOfTI-480p.264 ! h264parse ! ducat=
ih264dec ! fakesink"
> > >=20
> > >=20
> > >=20
> > > All the above issues are not present with gst-0.10.
> > > Please note that Issue #3 is not observed on Vayu with GLSDK EA relea=
se 7.0.0.4. Issue #4 is also happening on Vayu with GLSDK EA release 7.0.0.=
4.
> > >=20
> > >=20
> > >=20
> > > In addition to above,
> > >=20
> > > 5.       kmssink is missing from AM57x file system.
> > >=20
> > >=20
> > >=20
> > > We wanted to do an SDF today for PROCESSOR-SDK on AM3, AM4 and due to=
 above failures, we are forced to freeze @ commit #5c2f4eea32afda6e68681470=
be664eb5a46fd984, and not pick up any further changes on meta-arago.
> > >=20
> > > There is another release targeted for next week and we'd like to be g=
et back to the latest of meta-arago as soon as possible. Appreciate your he=
lp in addressing the above issues.
> > >=20
> > >=20
> > >=20
> > > Thanks,
> > >=20
> > > Vivek
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org
> > > [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Cooper=20
> > > Jr., Franklin
> > > Sent: Friday, March 20, 2015 9:58 AM
> > > To: Stiffler, Jacob
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> > > DEPENDS on libdrm and libdce due to KMSsink
> > >=20
> > >=20
> > >=20
> > > Well that's not good.
> > >=20
> > >=20
> > >=20
> > > > On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob <j-stiffler@ti.com<mai=
lto:j-stiffler@ti.com>> wrote:
> > >=20
> > > >
> > >=20
> > > > I ran the demo while running "top". It appears that CPU is near 100=
%. However, this demo was working fine with gstreamer 0.10.
> > >=20
> > > >
> > >=20
> > > > -----Original Message-----
> > >=20
> > > > From: Cooper Jr., Franklin
> > >=20
> > > > Sent: Friday, March 20, 2015 9:34 AM
> > >=20
> > > > To: Stiffler, Jacob
> > >=20
> > > > Cc: Dmytriyenko, Denys;
> > > > meta-arago@arago-project.org<mailto:meta-arago@arago-project.org
> > > > >
> > >=20
> > > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> > > > DEPENDS on libdrm and libdce due to KMSsink
> > >=20
> > > >
> > >=20
> > > >
> > >=20
> > > >
> > >=20
> > > >
> > >=20
> > > >> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com<ma=
ilto:j-stiffler@ti.com>> wrote:
> > >=20
> > > >>
> > >=20
> > > >> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.
> > >=20
> > > >>
> > >=20
> > > >> To get it to work, I had to modify runH264Dec.sh to use the new pi=
pelines. The new command is the following:
> > >=20
> > > >>
> > >=20
> > > >>   gst-launch-1.0 -v filesrc location=3D$filename ! h264parse !=20
> > > >> avdec_h264 ! videoconvert ! fbdevsink device=3D/dev/fb0
> > >=20
> > > >>
> > >=20
> > > >>
> > >=20
> > > >> Once this was done, I was able to run the demo, but the framerate =
is extremely slow. Is this the correct command? Or is this behavior expecte=
d?
> > >=20
> > > > If slow as in stuttering and choppy then no. If cpu utilization is =
high then that is expected.
> > >=20
> > > >>
> > >=20
> > > >> Thanks,
> > >=20
> > > >> Jake
> > >=20
> > > >>
> > >=20
> > > >>
> > >=20
> > > >> -----Original Message-----
> > >=20
> > > >> From: Stiffler, Jacob
> > >=20
> > > >> Sent: Friday, March 20, 2015 6:56 AM
> > >=20
> > > >> To: Dmytriyenko, Denys;
> > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.or
> > > >> g>
> > >=20
> > > >> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> > > >> DEPENDS on libdrm and libdce due to KMSsink
> > >=20
> > > >>
> > >=20
> > > >> It appears I got lucky with a successful am437x-evm build. The pac=
kage libdrm was installed and libdce was not.
> > >=20
> > > >>
> > >=20
> > > >> However, I got a build failure for am335x-evm due to the missing l=
ibdrm dependency:
> > >=20
> > > >>
> > >=20
> > > >> In file included from gstdrmbufferpool.c:42:0:
> > >=20
> > > >> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or=
 directory compilation terminated.
> > >=20
> > > >> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> > >=20
> > > >> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-=
CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.=
3/gst-libs/gst/drm'
> > >=20
> > > >> make[3]: *** [all-recursive] Error 1
> > >=20
> > > >> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-=
CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.=
3/gst-libs/gst'
> > >=20
> > > >> make[2]: *** [all-recursive] Error 1
> > >=20
> > > >> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-=
CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.=
3/gst-libs'
> > >=20
> > > >> make[1]: *** [all-recursive] Error 1
> > >=20
> > > >> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-=
CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.=
3'
> > >=20
> > > >> make: *** [all] Error 2
> > >=20
> > > >> ERROR: oe_runmake failed
> > >=20
> > > >>
> > >=20
> > > >> - Jake
> > >=20
> > > >>
> > >=20
> > > >> -----Original Message-----
> > >=20
> > > >> From:=20
> > > >> meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@
> > > >> ar ago-project.org>=20
> > > >> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of=20
> > > >> Dmytriyenko, Denys
> > >=20
> > > >> Sent: Thursday, March 19, 2015 6:37 PM
> > >=20
> > > >> To:=20
> > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.or
> > > >> g>
> > >=20
> > > >> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add=20
> > > >> DEPENDS on libdrm and libdce due to KMSsink
> > >=20
> > > >>
> > >=20
> > > >> Karthik,
> > >=20
> > > >>
> > >=20
> > > >> I had a question - I see that KMSsink in plugins-bad checks for dr=
m and dce headers. I was trying to set the dependency accordingly, but it w=
ould break non dce platforms. Can you please elaborate on that a bit? Thank=
s.
> > >=20
> > > >>
> > >=20
> > > >> --
> > >=20
> > > >> Denys
> > >=20
> > > >>
> > >=20
> > > >>
> > >=20
> > > >>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote=
:
> > >=20
> > > >>> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> > >=20
> > > >>>
> > >=20
> > > >>> Signed-off-by: Denys Dmytriyenko=20
> > > >>> <denys@ti.com<mailto:denys@ti.com>>
> > >=20
> > > >>> ---
> > >=20
> > > >>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend            =
     | 4 +++-
> > >=20
> > > >>> 1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > >>>
> > >=20
> > > >>> diff --git
> > >=20
> > > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > > >>> pl
> > > >>> ugins-
> > >=20
> > > >>> bad_1.2.3.bbappend
> > >=20
> > > >>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > > >>> pl
> > > >>> ugins-
> > >=20
> > > >>> bad_1.2.3.bbappend
> > >=20
> > > >>> index b1cacac..bd141a8 100644
> > >=20
> > > >>> ---
> > >=20
> > > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> > > >>> pl
> > > >>> ugins-
> > >=20
> > > >>> bad_1.2.3.bbappend
> > >=20
> > > >>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.
> > > >>> +++ 0-plug
> > >=20
> > > >>> +++ ins-bad_1.2.3.bbappend
> > >=20
> > > >>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > >=20
> > > >>>
> > >=20
> > > >>> PACKAGECONFIG =3D "faad wayland"
> > >=20
> > > >>>
> > >=20
> > > >>> +DEPENDS +=3D "libdrm libdce"
> > >=20
> > > >>> +
> > >=20
> > > >>> SRC_URI_append =3D " \
> > >=20
> > > >>>       =20
> > > >>> file://0001-Added-GstDRMBufferPool-support.patch<file:///\\000
> > > >>> 1- Added-GstDRMBufferPool-support.patch> \
> > >=20
> > > >>>       =20
> > > >>> file://0002-Modified-waylandsink-to-accept-NV12-format.patch<f
> > > >>> il=20
> > > >>> e:///\\0002-Modified-waylandsink-to-accept-NV12-format.patch>
> > >=20
> > > >>> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \
> > >=20
> > > >>>       =20
> > > >>> file://0004-waylandsink-Removed-dependency-on-dri2.patch<file:
> > > >>> // /\\0004-waylandsink-Removed-dependency-on-dri2.patch> \
> > >=20
> > > >>>        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patc=
h<file:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch>"
> > >=20
> > > >>>
> > >=20
> > > >>> -PR_append =3D "-arago0"
> > >=20
> > > >>> +PR_append =3D "-arago1"
> > >=20
> > > >>> --
> > >=20
> > > >>> 2.2.0
> > >=20
> > > >> _______________________________________________
> > >=20
> > > >> meta-arago mailing list
> > >=20
> > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.or
> > > >> g>
> > >=20
> > > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >=20
> > > >> _______________________________________________
> > >=20
> > > >> meta-arago mailing list
> > >=20
> > > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.or
> > > >> g>
> > >=20
> > > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >=20
> > > _______________________________________________
> > >=20
> > > meta-arago mailing list
> > >=20
> > > meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> > >=20
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >=20
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >=20

