Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 91E8B52A29
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 18:36:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KIahGO017037
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 13:36:43 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KIage9000418
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 13:36:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 13:36:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KIag6o018791;
	Fri, 20 Mar 2015 13:36:42 -0500
Date: Fri, 20 Mar 2015 14:36:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150320183641.GJ11557@edge>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
	<20150319223632.GH11557@edge>
	<4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
	<3DCCA74A-3656-4D5E-A5F1-F0A0EBC3C43C@ti.com>
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>
	<20150320182307.GI11557@edge>
	<4B26FB5A64EBA14C87266869E037F9581411049F@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581411049F@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 20 Mar 2015 18:36:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jake,

libdrm should not be pulled for am3 builds - that was the question for this=
=20
patch, which should not be applied... Do you have it in your tree?


On Fri, Mar 20, 2015 at 02:27:17PM -0400, Stiffler, Jacob wrote:
> arm-oe-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc -march=3D=
armv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dco=
rtex-a8 --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tm=
p-external-linaro-toolchain/sysroots/am335x-evm -std=3Dgnu99 -DHAVE_CONFIG_=
H -I. -I../../.. -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include -f=
stack-protector -I../../../gst-libs -I../../../gst-libs -pthread -I/home/gt=
bldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
sysroots/am335x-evm/usr/include/gstreamer-1.0 -I/home/gtbldadm/ti/oe-layers=
etup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm=
/usr/include/glib-2.0 -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arag=
o-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/includ=
e -DGST_USE_UNSTABLE_API -pthread -I/home/gtbldadm/ti/oe-layersetup/build-C=
ORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include=
/gstreamer-1.0 -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_
> 1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/gli=
b-2.0 -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-l=
inaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include -DGST_USE_UNST=
ABLE_API -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -=
Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarat=
ions -Wmissing-prototypes -Wredundant-decls -Wwrite-strings -Wformat-securi=
ty -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Wno=
-multichar -Wnested-externs -isystem/opt/linaro-2013.03/arm-linux-gnueabihf=
/include -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -c g=
stdrmbufferpool.c  -fPIC -DPIC -o .libs/libgstdrm_1.0_la-gstdrmbufferpool.o
> In file included from gstdrmbufferpool.c:42:0:
> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or direct=
ory
> compilation terminated.
> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_=
1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-g=
nueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-l=
ibs/gst/drm'
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_=
1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-g=
nueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-l=
ibs/gst'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_=
1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-g=
nueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-l=
ibs'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_=
1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-g=
nueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'
> make: *** [all] Error 2
> ERROR: oe_runmake failed
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys=20
> Sent: Friday, March 20, 2015 2:23 PM
> To: Chengalvala, Vivek
> Cc: Cooper Jr., Franklin; Stiffler, Jacob; meta-arago@arago-project.org; =
Balagopalakrishnan, Anand
> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS o=
n libdrm and libdce due to KMSsink
>=20
> AM3 builds fine here...
>=20
>=20
> On Fri, Mar 20, 2015 at 06:17:18PM +0000, Chengalvala, Vivek wrote:
> > Karthik, Anand, Denys,
> >=20
> >=20
> >=20
> > Upgrade to GST 1.0 (using commit b5747ce8caa13e4528e2d3055fa81cc9ca7b48=
fd on meta-arago) is causing the following problems:
> >=20
> > 1.       Broken build for AM3. Not sure how AM4 build succeeds.
> >=20
> > 2.       AM4x: Performance drop with ARM only decode of H264 (not sure =
if it is due to a) base GST upgrade b) ffmpeg_dec --> avdec_h264 or c) ffmp=
eg_color_space --> videoconvert)
> >=20
> > 3.       AM57x: playbin pipeline internally triggers arm video decoder =
(e.g., avdec_h264) instead of ducati decoder
> >=20
> > 4.       AM57x: cannot run pipeline with video parse + decode, e.g., "g=
st-launch-1.0 filesrc location=3DHistoryOfTI-480p.264 ! h264parse ! ducatih=
264dec ! fakesink"
> >=20
> >=20
> >=20
> > All the above issues are not present with gst-0.10.
> > Please note that Issue #3 is not observed on Vayu with GLSDK EA release=
 7.0.0.4. Issue #4 is also happening on Vayu with GLSDK EA release 7.0.0.4.
> >=20
> >=20
> >=20
> > In addition to above,
> >=20
> > 5.       kmssink is missing from AM57x file system.
> >=20
> >=20
> >=20
> > We wanted to do an SDF today for PROCESSOR-SDK on AM3, AM4 and due to a=
bove failures, we are forced to freeze @ commit #5c2f4eea32afda6e68681470be=
664eb5a46fd984, and not pick up any further changes on meta-arago.
> >=20
> > There is another release targeted for next week and we'd like to be get=
 back to the latest of meta-arago as soon as possible. Appreciate your help=
 in addressing the above issues.
> >=20
> >=20
> >=20
> > Thanks,
> >=20
> > Vivek
> >=20
> >=20
> >=20
> >=20
> >=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@a=
rago-project.org] On Behalf Of Cooper Jr., Franklin
> > Sent: Friday, March 20, 2015 9:58 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS=
 on libdrm and libdce due to KMSsink
> >=20
> >=20
> >=20
> > Well that's not good.
> >=20
> >=20
> >=20
> > > On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob <j-stiffler@ti.com<mailt=
o:j-stiffler@ti.com>> wrote:
> >=20
> > >
> >=20
> > > I ran the demo while running "top". It appears that CPU is near 100%.=
 However, this demo was working fine with gstreamer 0.10.
> >=20
> > >
> >=20
> > > -----Original Message-----
> >=20
> > > From: Cooper Jr., Franklin
> >=20
> > > Sent: Friday, March 20, 2015 9:34 AM
> >=20
> > > To: Stiffler, Jacob
> >=20
> > > Cc: Dmytriyenko, Denys; meta-arago@arago-project.org<mailto:meta-arag=
o@arago-project.org>
> >=20
> > > Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPEN=
DS on libdrm and libdce due to KMSsink
> >=20
> > >
> >=20
> > >
> >=20
> > >
> >=20
> > >
> >=20
> > >> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com<mail=
to:j-stiffler@ti.com>> wrote:
> >=20
> > >>
> >=20
> > >> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.
> >=20
> > >>
> >=20
> > >> To get it to work, I had to modify runH264Dec.sh to use the new pipe=
lines. The new command is the following:
> >=20
> > >>
> >=20
> > >>   gst-launch-1.0 -v filesrc location=3D$filename ! h264parse ! avdec=
_h264 ! videoconvert ! fbdevsink device=3D/dev/fb0
> >=20
> > >>
> >=20
> > >>
> >=20
> > >> Once this was done, I was able to run the demo, but the framerate is=
 extremely slow. Is this the correct command? Or is this behavior expected?
> >=20
> > > If slow as in stuttering and choppy then no. If cpu utilization is hi=
gh then that is expected.
> >=20
> > >>
> >=20
> > >> Thanks,
> >=20
> > >> Jake
> >=20
> > >>
> >=20
> > >>
> >=20
> > >> -----Original Message-----
> >=20
> > >> From: Stiffler, Jacob
> >=20
> > >> Sent: Friday, March 20, 2015 6:56 AM
> >=20
> > >> To: Dmytriyenko, Denys; meta-arago@arago-project.org<mailto:meta-ara=
go@arago-project.org>
> >=20
> > >> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink
> >=20
> > >>
> >=20
> > >> It appears I got lucky with a successful am437x-evm build. The packa=
ge libdrm was installed and libdce was not.
> >=20
> > >>
> >=20
> > >> However, I got a build failure for am335x-evm due to the missing lib=
drm dependency:
> >=20
> > >>
> >=20
> > >> In file included from gstdrmbufferpool.c:42:0:
> >=20
> > >> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or d=
irectory compilation terminated.
> >=20
> > >> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
> >=20
> > >> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs/gst/drm'
> >=20
> > >> make[3]: *** [all-recursive] Error 1
> >=20
> > >> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs/gst'
> >=20
> > >> make[2]: *** [all-recursive] Error 1
> >=20
> > >> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs'
> >=20
> > >> make[1]: *** [all-recursive] Error 1
> >=20
> > >> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'
> >=20
> > >> make: *** [all] Error 2
> >=20
> > >> ERROR: oe_runmake failed
> >=20
> > >>
> >=20
> > >> - Jake
> >=20
> > >>
> >=20
> > >> -----Original Message-----
> >=20
> > >> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces=
@arago-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf=
 Of Dmytriyenko, Denys
> >=20
> > >> Sent: Thursday, March 19, 2015 6:37 PM
> >=20
> > >> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> >=20
> > >> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink
> >=20
> > >>
> >=20
> > >> Karthik,
> >=20
> > >>
> >=20
> > >> I had a question - I see that KMSsink in plugins-bad checks for drm =
and dce headers. I was trying to set the dependency accordingly, but it wou=
ld break non dce platforms. Can you please elaborate on that a bit? Thanks.
> >=20
> > >>
> >=20
> > >> --
> >=20
> > >> Denys
> >=20
> > >>
> >=20
> > >>
> >=20
> > >>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:
> >=20
> > >>> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> >=20
> > >>>
> >=20
> > >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> >=20
> > >>> ---
> >=20
> > >>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend              =
   | 4 +++-
> >=20
> > >>> 1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > >>>
> >=20
> > >>> diff --git
> >=20
> > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-
> >=20
> > >>> bad_1.2.3.bbappend
> >=20
> > >>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-
> >=20
> > >>> bad_1.2.3.bbappend
> >=20
> > >>> index b1cacac..bd141a8 100644
> >=20
> > >>> ---
> >=20
> > >>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-
> >=20
> > >>> bad_1.2.3.bbappend
> >=20
> > >>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-p=
lug
> >=20
> > >>> +++ ins-bad_1.2.3.bbappend
> >=20
> > >>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >=20
> > >>>
> >=20
> > >>> PACKAGECONFIG =3D "faad wayland"
> >=20
> > >>>
> >=20
> > >>> +DEPENDS +=3D "libdrm libdce"
> >=20
> > >>> +
> >=20
> > >>> SRC_URI_append =3D " \
> >=20
> > >>>        file://0001-Added-GstDRMBufferPool-support.patch<file:///\\0=
001-Added-GstDRMBufferPool-support.patch> \
> >=20
> > >>>        file://0002-Modified-waylandsink-to-accept-NV12-format.patch=
<file:///\\0002-Modified-waylandsink-to-accept-NV12-format.patch>
> >=20
> > >>> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \
> >=20
> > >>>        file://0004-waylandsink-Removed-dependency-on-dri2.patch<fil=
e:///\\0004-waylandsink-Removed-dependency-on-dri2.patch> \
> >=20
> > >>>        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch<=
file:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch>"
> >=20
> > >>>
> >=20
> > >>> -PR_append =3D "-arago0"
> >=20
> > >>> +PR_append =3D "-arago1"
> >=20
> > >>> --
> >=20
> > >>> 2.2.0
> >=20
> > >> _______________________________________________
> >=20
> > >> meta-arago mailing list
> >=20
> > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> >=20
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >=20
> > >> _______________________________________________
> >=20
> > >> meta-arago mailing list
> >=20
> > >> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> >=20
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >=20
> > _______________________________________________
> >=20
> > meta-arago mailing list
> >=20
> > meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> >=20
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

