Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 16AB8529D2
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2015 13:19:15 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QDJC4N026169
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 08:19:13 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QDJ922001441
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 18:49:10 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0224.002; Thu, 26 Mar 2015 18:49:08 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AdBmZxvA4eoronxfS0OlBN+wBvipL///qFQA//0u7cA=
Date: Thu, 26 Mar 2015 13:19:08 +0000
Message-ID: <24B88602B5904F49971CAF899152529B34C0EA3C@DBDE04.ent.ti.com>
References: <B0581B5571079145BA1CD78C126DBDE73222D2C4@DLEE08.ent.ti.com>
	<9765E115-77B9-4846-A6D8-816CD7DD32EC@ti.com>
In-Reply-To: <9765E115-77B9-4846-A6D8-816CD7DD32EC@ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 26 Mar 2015 13:19:15 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_24B88602B5904F49971CAF899152529B34C0EA3CDBDE04entticom_"

--_000_24B88602B5904F49971CAF899152529B34C0EA3CDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Atleast for resolving the problem on the am57xx, I think we need to make a =
small change in the ipumm-fw recipe to add a RDEPENDS on libdce.
Additionally another patch for GST plugin Ducati has also been pushed. I ha=
ve asked Vivek's team to verify this on AM57xx.

Please review both these patches, it may address the issues on all the plat=
forms.


meta-ti: http://dflvsu0004.dal.design.ti.com/patch/13146/

meta-arago: http://dflvsu0004.dal.design.ti.com/patch/13147/

Regards
Karthik

From: Cooper Jr., Franklin
Sent: Wednesday, March 25, 2015 1:03 AM
To: Dmytriyenko, Denys
Cc: R, Karthik; Balagopalakrishnan, Anand; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink

Yeah I didn't get ur point until I looked at it more  :)

Jake ur search for libdrm-omap from wat I see is only from looking at the f=
s.

You really need to check the OE am335x build sysroot to see if traces of li=
bdrm_omap is there which will cause configure to enable kms.

It is a bit weird for configure to detect libdrm_omap but then fail when us=
ing it to build.


On Mar 24, 2015, at 2:17 PM, Dmytriyenko, Denys <denys@ti.com<mailto:denys@=
ti.com>> wrote:

That was my point - configure script is supposed to figure the dependency o=
ut.

--
Denys
On Mar 24, 2015 12:08, "Cooper Jr., Franklin" <fcooper@ti.com<mailto:fcoope=
r@ti.com>> wrote:
The buffer pool patch even has a comment that talks about in the future rem=
ove the dependency on libdrm_omap.

It is interesting that from looking at the configure related patches a lot =
of these new features or changes are related to kms which is only enabled w=
hen libdrm_omap is found.






> On Mar 24, 2015, at 2:00 PM, Cooper Jr., Franklin <fcooper@ti.com<mailto:=
fcooper@ti.com>> wrote:
>
> Unless I'm missing something all the patches applied locally to gst 1.0 b=
ad.
>
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-arago-=
extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend=
;h=3Db1cacac6f5d700a5a40318ea8eb73e707578916b;hb=3Drefs/heads/master#l6
>
>
>
>
>> On Mar 24, 2015, at 1:53 PM, Dmytriyenko, Denys <denys@ti.com<mailto:den=
ys@ti.com>> wrote:
>>
>> Could you be more specific - which patches are you talking about?
>>
>>> On Tue, Mar 24, 2015 at 02:47:22PM -0400, Cooper Jr., Franklin wrote:
>>> I would re iterate that omap dss is only meant for devices with dss. Wh=
ich
>>> doesn't include am335x
>>>
>>> So these patches should only be applied to devices with the dss. So I'm=
 not
>>> sure why a simple patch that will do this isn't being done instead of t=
rying
>>> to figure out why these builds are failing
>>>
>>>
>>>> On Mar 24, 2015, at 1:23 PM, Stiffler, Jacob <j-stiffler@ti.com<mailto=
:j-stiffler@ti.com>> wrote:
>>>>
>>>> Karthik,
>>>>
>>>> Is this libdrm_omap an unconditional dependency for all platforms?
>>>>
>>>> Thanks,
>>>> Jake
>>>>
>>>> -----Original Message-----
>>>> From: Balagopalakrishnan, Anand
>>>> Sent: Tuesday, March 24, 2015 12:53 PM
>>>> To: Stiffler, Jacob; Dmytriyenko, Denys; R, Karthik
>>>> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>;=
 Cooper Jr., Franklin
>>>> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPEND=
S on libdrm and libdce due to KMSsink
>>>>
>>>> +Karthik
>>>>
>>>> Jake,
>>>>
>>>> We definitely have a dependency on DRM/DCE for J6/AM5.
>>>>
>>>> Karthik can add more.
>>>>
>>>> Regards,
>>>> Anand
>>>> ________________________________________
>>>> From: Stiffler, Jacob
>>>> Sent: Tuesday, March 24, 2015 8:27 PM
>>>> To: Dmytriyenko, Denys; Balagopalakrishnan, Anand
>>>> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>;=
 Cooper Jr., Franklin
>>>> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPEND=
S on libdrm and libdce due to KMSsink
>>>>
>>>> Anand,
>>>>
>>>> Does gstreamer1.0-plugins-bad have an unconditional dependency on libd=
rm_omap?
>>>>
>>>>
>>>>
>>>> Denys,
>>>>
>>>> By looking at the nightly coresdk build emails, it appears that you ha=
ve not run a clean build in some time. If you run a clean build, you should=
 be able to recreate this issue.
>>>>
>>>> However, in doing a clean build, you may run into issues with gitoriou=
s.org<http://gitorious.org> over https. This requires some certificates in =
the native sysroot which may not be there...
>>>>
>>>>
>>>> - Jake
>>>>
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@a=
rago-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf O=
f Stiffler, Jacob
>>>> Sent: Monday, March 23, 2015 7:05 AM
>>>> To: Dmytriyenko, Denys
>>>> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>;=
 Balagopalakrishnan, Anand; Cooper Jr., Franklin
>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPEND=
S on libdrm and libdce due to KMSsink
>>>>
>>>> Denys,
>>>>
>>>> These errors occur on clean VMs. It seems that you are getting lucky i=
n your nightlies such that libdrm is not built before you build gst-plugins=
.
>>>>
>>>> One reason libdrm is being pulled into the filesystem, is because libd=
rm-tests is pulled into "packagegroup-arago-test" for all machines.
>>>>
>>>>
>>>> I just checked the coresdk golden tisdk-rootfs image. This does indeed=
 include libdrm:
>>>>
>>>> jake@mcsdk-hpc-test:~/proc-sdk_nightlies/coresdk/tisdk-rootfs-image-am=
335x-evm-20150322020246$ find ./var/lib/opkg/info/ -name 'libdrm*'
>>>> ./var/lib/opkg/info/libdrm-tests.control
>>>> ./var/lib/opkg/info/libdrm-omap1.postinst
>>>> ./var/lib/opkg/info/libdrm-tests.list
>>>> ./var/lib/opkg/info/libdrm2.list
>>>> ./var/lib/opkg/info/libdrm2.control
>>>> ./var/lib/opkg/info/libdrm-omap1.control
>>>> ./var/lib/opkg/info/libdrm2.postinst
>>>> ./var/lib/opkg/info/libdrm-omap1.list
>>>>
>>>>
>>>> - Jake
>>>>
>>>> -----Original Message-----
>>>> From: Dmytriyenko, Denys
>>>> Sent: Friday, March 20, 2015 5:01 PM
>>>> To: Stiffler, Jacob
>>>> Cc: Chengalvala, Vivek; Cooper Jr., Franklin; meta-arago@arago-project=
.org<mailto:meta-arago@arago-project.org>; Balagopalakrishnan, Anand
>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPEND=
S on libdrm and libdce due to KMSsink
>>>>
>>>> have you tried bitbake libdrm -c cleansstate?
>>>>
>>>>> On Fri, Mar 20, 2015 at 02:43:37PM -0400, Stiffler, Jacob wrote:
>>>>> Sorry, I just double checked the filesystems:
>>>>>
>>>>> jake@mcsdk-hpc-test:~/proc-sdk_rc-builds/01.00.00.00/ti-processor-sdk=
-linux-am335x-evm-01.00.00.00/filesystem/tisdk-rootfs$<mailto:jake@mcsdk-hp=
c-test:~/proc-sdk_rc-builds/01.00.00.00/ti-processor-sdk-linux-am335x-evm-0=
1.00.00.00/filesystem/tisdk-rootfs$> find ./var/lib/opkg/info/ -name '*drm*=
'
>>>>> ./var/lib/opkg/info/libdrm-tests.control
>>>>> ./var/lib/opkg/info/libdrm-tests.list
>>>>> ./var/lib/opkg/info/libdrm2.list
>>>>> ./var/lib/opkg/info/libdrm2.control
>>>>> ./var/lib/opkg/info/libdrm2.postinst
>>>>> jake@mcsdk-hpc-test:~/ti-processor-sdk-linux-am335x-evm-01.00.00.00/f=
i<mailto:jake@mcsdk-hpc-test:~/ti-processor-sdk-linux-am335x-evm-01.00.00.0=
0/fi>
>>>>> lesystem/tisdk-rootfs$ cd
>>>>> ../../../ti-processor-sdk-linux-am437x-evm-01.00.00.00/filesystem/tis=
d
>>>>> k-rootfs/ jake@mcsdk-hpc-test:~
>>>>> /ti-processor-sdk-linux-am437x-evm-01.00.00.00/filesystem/tisdk-rootf=
s$ find ./var/lib/opkg/info/ -name '*drm*'
>>>>> ./var/lib/opkg/info/libdrm-tests.control
>>>>> ./var/lib/opkg/info/libdrm-omap1.postinst
>>>>> ./var/lib/opkg/info/libdrm-tests.list
>>>>> ./var/lib/opkg/info/libdrm2.list
>>>>> ./var/lib/opkg/info/libdrm2.control
>>>>> ./var/lib/opkg/info/libdrm-omap1.control
>>>>> ./var/lib/opkg/info/libdrm2.postinst
>>>>> ./var/lib/opkg/info/libdrm-omap1.list
>>>>>
>>>>>
>>>>>
>>>>> -----Original Message-----
>>>>> From: Stiffler, Jacob
>>>>> Sent: Friday, March 20, 2015 2:39 PM
>>>>> To: Dmytriyenko, Denys
>>>>> Cc: Chengalvala, Vivek; Cooper Jr., Franklin;
>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>; Ba=
lagopalakrishnan, Anand
>>>>> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>
>>>>> No it is not in the tree, hence the header is not found. It succeeds =
on am4 since it is pulled in by one of the packagegroups.
>>>>>
>>>>>
>>>>> -----Original Message-----
>>>>> From: Dmytriyenko, Denys
>>>>> Sent: Friday, March 20, 2015 2:37 PM
>>>>> To: Stiffler, Jacob
>>>>> Cc: Chengalvala, Vivek; Cooper Jr., Franklin;
>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>; Ba=
lagopalakrishnan, Anand
>>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>
>>>>> Jake,
>>>>>
>>>>> libdrm should not be pulled for am3 builds - that was the question fo=
r this patch, which should not be applied... Do you have it in your tree?
>>>>>
>>>>>
>>>>>> On Fri, Mar 20, 2015 at 02:27:17PM -0400, Stiffler, Jacob wrote:
>>>>>> arm-oe-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc
>>>>>> -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3D=
neon
>>>>>> -mtune=3Dcortex-a8
>>>>>> --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp=
-e
>>>>>> xt ernal-linaro-toolchain/sysroots/am335x-evm -std=3Dgnu99
>>>>>> -DHAVE_CONFIG_H -I. -I../../..
>>>>>> -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
>>>>>> -fstack-protector -I../../../gst-libs -I../../../gst-libs -pthread
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
>>>>>> li
>>>>>> naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
>>>>>> li
>>>>>> naro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
>>>>>> li naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
>>>>>> -DGST_USE_UNSTABLE_API -pthread
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
>>>>>> li
>>>>>> naro-toolchain/sysroots/am335x-evm/usr/include/gstreamer-1.0
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_
>>>>>> 1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/includ
>>>>>> e/
>>>>>> glib-2.0
>>>>>> -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-
>>>>>> li naro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
>>>>>> -DGST_USE_UNSTABLE_API -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS
>>>>>> -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla
>>>>>> -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes
>>>>>> -Wredundant-decls -Wwrite-strings -Wformat-security
>>>>>> -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress
>>>>>> -Wno-multichar -Wnested-externs
>>>>>> -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include
>>>>>> -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -c
>>>>>> gstdrmbufferpool.c  -fPIC -DPIC -o
>>>>>> .libs/libgstdrm_1.0_la-gstdrmbufferpool.o
>>>>>> In file included from gstdrmbufferpool.c:42:0:
>>>>>> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or
>>>>>> directory compilation terminated.
>>>>>> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
>>>>>> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs/gst/drm'
>>>>>> make[3]: *** [all-recursive] Error 1
>>>>>> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs/gst'
>>>>>> make[2]: *** [all-recursive] Error 1
>>>>>> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/=
gst-libs'
>>>>>> make[1]: *** [all-recursive] Error 1
>>>>>> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-li=
nux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'
>>>>>> make: *** [all] Error 2
>>>>>> ERROR: oe_runmake failed
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Dmytriyenko, Denys
>>>>>> Sent: Friday, March 20, 2015 2:23 PM
>>>>>> To: Chengalvala, Vivek
>>>>>> Cc: Cooper Jr., Franklin; Stiffler, Jacob;
>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>; B=
alagopalakrishnan, Anand
>>>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>>
>>>>>> AM3 builds fine here...
>>>>>>
>>>>>>
>>>>>>> On Fri, Mar 20, 2015 at 06:17:18PM +0000, Chengalvala, Vivek wrote:
>>>>>>> Karthik, Anand, Denys,
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Upgrade to GST 1.0 (using commit b5747ce8caa13e4528e2d3055fa81cc9ca=
7b48fd on meta-arago) is causing the following problems:
>>>>>>>
>>>>>>> 1.       Broken build for AM3. Not sure how AM4 build succeeds.
>>>>>>>
>>>>>>> 2.       AM4x: Performance drop with ARM only decode of H264 (not s=
ure if it is due to a) base GST upgrade b) ffmpeg_dec --> avdec_h264 or c) =
ffmpeg_color_space --> videoconvert)
>>>>>>>
>>>>>>> 3.       AM57x: playbin pipeline internally triggers arm video deco=
der (e.g., avdec_h264) instead of ducati decoder
>>>>>>>
>>>>>>> 4.       AM57x: cannot run pipeline with video parse + decode, e.g.=
, "gst-launch-1.0 filesrc location=3DHistoryOfTI-480p.264 ! h264parse ! duc=
atih264dec ! fakesink"
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> All the above issues are not present with gst-0.10.
>>>>>>> Please note that Issue #3 is not observed on Vayu with GLSDK EA rel=
ease 7.0.0.4. Issue #4 is also happening on Vayu with GLSDK EA release 7.0.=
0.4.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> In addition to above,
>>>>>>>
>>>>>>> 5.       kmssink is missing from AM57x file system.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> We wanted to do an SDF today for PROCESSOR-SDK on AM3, AM4 and due =
to above failures, we are forced to freeze @ commit #5c2f4eea32afda6e686814=
70be664eb5a46fd984, and not pick up any further changes on meta-arago.
>>>>>>>
>>>>>>> There is another release targeted for next week and we'd like to be=
 get back to the latest of meta-arago as soon as possible. Appreciate your =
help in addressing the above issues.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Vivek
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounce=
s@arago-project.org>
>>>>>>> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Cooper
>>>>>>> Jr., Franklin
>>>>>>> Sent: Friday, March 20, 2015 9:58 AM
>>>>>>> To: Stiffler, Jacob
>>>>>>> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.or=
g>
>>>>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Well that's not good.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>>> On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob <j-stiffler@ti.com<=
mailto:j-stiffler@ti.com><mailto:j-stiffler@ti.com>> wrote:
>>>>>>>>
>>>>>>>> I ran the demo while running "top". It appears that CPU is near 10=
0%. However, this demo was working fine with gstreamer 0.10.
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>
>>>>>>>> From: Cooper Jr., Franklin
>>>>>>>
>>>>>>>> Sent: Friday, March 20, 2015 9:34 AM
>>>>>>>
>>>>>>>> To: Stiffler, Jacob
>>>>>>>
>>>>>>>> Cc: Dmytriyenko, Denys;
>>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org><=
mailto:meta-arago@arago-project.org
>>>>>>>
>>>>>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com<m=
ailto:j-stiffler@ti.com><mailto:j-stiffler@ti.com>> wrote:
>>>>>>>
>>>>>>>
>>>>>>>>> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.
>>>>>>>
>>>>>>>
>>>>>>>>> To get it to work, I had to modify runH264Dec.sh to use the new p=
ipelines. The new command is the following:
>>>>>>>
>>>>>>>
>>>>>>>>> gst-launch-1.0 -v filesrc location=3D$filename ! h264parse !
>>>>>>>>> avdec_h264 ! videoconvert ! fbdevsink device=3D/dev/fb0
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> Once this was done, I was able to run the demo, but the framerate=
 is extremely slow. Is this the correct command? Or is this behavior expect=
ed?
>>>>>>>
>>>>>>>> If slow as in stuttering and choppy then no. If cpu utilization is=
 high then that is expected.
>>>>>>>
>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>
>>>>>>>>> Jake
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>
>>>>>>>>> From: Stiffler, Jacob
>>>>>>>
>>>>>>>>> Sent: Friday, March 20, 2015 6:56 AM
>>>>>>>
>>>>>>>>> To: Dmytriyenko, Denys;
>>>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>=
<mailto:meta-arago@arago-project.or
>>>>>>>>> g>
>>>>>>>
>>>>>>>>> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>>>
>>>>>>>
>>>>>>>>> It appears I got lucky with a successful am437x-evm build. The pa=
ckage libdrm was installed and libdce was not.
>>>>>>>
>>>>>>>
>>>>>>>>> However, I got a build failure for am335x-evm due to the missing =
libdrm dependency:
>>>>>>>
>>>>>>>
>>>>>>>>> In file included from gstdrmbufferpool.c:42:0:
>>>>>>>
>>>>>>>>> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file o=
r directory compilation terminated.
>>>>>>>
>>>>>>>>> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
>>>>>>>
>>>>>>>>> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build=
-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe=
-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2=
.3/gst-libs/gst/drm'
>>>>>>>
>>>>>>>>> make[3]: *** [all-recursive] Error 1
>>>>>>>
>>>>>>>>> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build=
-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe=
-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2=
.3/gst-libs/gst'
>>>>>>>
>>>>>>>>> make[2]: *** [all-recursive] Error 1
>>>>>>>
>>>>>>>>> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build=
-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe=
-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2=
.3/gst-libs'
>>>>>>>
>>>>>>>>> make[1]: *** [all-recursive] Error 1
>>>>>>>
>>>>>>>>> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build=
-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe=
-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2=
.3'
>>>>>>>
>>>>>>>>> make: *** [all] Error 2
>>>>>>>
>>>>>>>>> ERROR: oe_runmake failed
>>>>>>>
>>>>>>>
>>>>>>>>> - Jake
>>>>>>>
>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>
>>>>>>>>> From:
>>>>>>>>> meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@ar=
ago-project.org><mailto:meta-arago-bounces@
>>>>>>>>> ar ago-project.org<http://ago-project.org>>
>>>>>>>>> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of
>>>>>>>>> Dmytriyenko, Denys
>>>>>>>
>>>>>>>>> Sent: Thursday, March 19, 2015 6:37 PM
>>>>>>>
>>>>>>>>> To:
>>>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>=
<mailto:meta-arago@arago-project.or
>>>>>>>>> g>
>>>>>>>
>>>>>>>>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add
>>>>>>>>> DEPENDS on libdrm and libdce due to KMSsink
>>>>>>>
>>>>>>>
>>>>>>>>> Karthik,
>>>>>>>
>>>>>>>
>>>>>>>>> I had a question - I see that KMSsink in plugins-bad checks for d=
rm and dce headers. I was trying to set the dependency accordingly, but it =
would break non dce platforms. Can you please elaborate on that a bit? Than=
ks.
>>>>>>>
>>>>>>>
>>>>>>>>> --
>>>>>>>
>>>>>>>>> Denys
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrot=
e:
>>>>>>>
>>>>>>>>>> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com><mailt=
o:denys@ti.com>>
>>>>>>>
>>>>>>>
>>>>>>>>>> Signed-off-by: Denys Dmytriyenko
>>>>>>>>>> <denys@ti.com<mailto:denys@ti.com><mailto:denys@ti.com>>
>>>>>>>
>>>>>>>>>> ---
>>>>>>>
>>>>>>>>>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend           =
      | 4 +++-
>>>>>>>
>>>>>>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>
>>>>>>>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>>>>>>>>>> pl
>>>>>>>>>> ugins-
>>>>>>>
>>>>>>>>>> bad_1.2.3.bbappend
>>>>>>>
>>>>>>>>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>>>>>>>>>> pl
>>>>>>>>>> ugins-
>>>>>>>
>>>>>>>>>> bad_1.2.3.bbappend
>>>>>>>
>>>>>>>>>> index b1cacac..bd141a8 100644
>>>>>>>
>>>>>>>>>> ---
>>>>>>>
>>>>>>>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>>>>>>>>>> pl
>>>>>>>>>> ugins-
>>>>>>>
>>>>>>>>>> bad_1.2.3.bbappend
>>>>>>>
>>>>>>>>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.
>>>>>>>>>> +++ 0-plug
>>>>>>>
>>>>>>>>>> +++ ins-bad_1.2.3.bbappend
>>>>>>>
>>>>>>>>>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>>>>>>
>>>>>>>
>>>>>>>>>> PACKAGECONFIG =3D "faad wayland"
>>>>>>>
>>>>>>>
>>>>>>>>>> +DEPENDS +=3D "libdrm libdce"
>>>>>>>
>>>>>>>>>> +
>>>>>>>
>>>>>>>>>> SRC_URI_append =3D " \
>>>>>>>
>>>>>>>>>>
>>>>>>>>>> file://0001-Added-GstDRMBufferPool-support.patch<file:///\\000<%=
20%20>
>>>>>>>>>> 1- Added-GstDRMBufferPool-support.patch> \
>>>>>>>
>>>>>>>>>>
>>>>>>>>>> file://0002-Modified-waylandsink-to-accept-NV12-format.patch<f<%=
20%20>
>>>>>>>>>> il
>>>>>>>>>> e:///\\0002-Modified-waylandsink-to-accept-NV12-format.patch>
>>>>>>>
>>>>>>>>>> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \
>>>>>>>
>>>>>>>>>>
>>>>>>>>>> file://0004-waylandsink-Removed-dependency-on-dri2.patch<file:<%=
20%20>
>>>>>>>>>> // /\\0004-waylandsink-Removed-dependency-on-dri2.patch> \
>>>>>>>
>>>>>>>>>>     file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch<=
file:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch<%20%20>>"
>>>>>>>
>>>>>>>
>>>>>>>>>> -PR_append =3D "-arago0"
>>>>>>>
>>>>>>>>>> +PR_append =3D "-arago1"
>>>>>>>
>>>>>>>>>> --
>>>>>>>
>>>>>>>>>> 2.2.0
>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>
>>>>>>>>> meta-arago mailing list
>>>>>>>
>>>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>=
<mailto:meta-arago@arago-project.or
>>>>>>>>> g>
>>>>>>>
>>>>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>
>>>>>>>>> meta-arago mailing list
>>>>>>>
>>>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>=
<mailto:meta-arago@arago-project.or
>>>>>>>>> g>
>>>>>>>
>>>>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>>
>>>>>>> meta-arago mailing list
>>>>>>>
>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org><m=
ailto:meta-arago@arago-project.org>
>>>>>>>
>>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>>>
>>>>>>> _______________________________________________
>>>>>>> meta-arago mailing list
>>>>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
>>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_24B88602B5904F49971CAF899152529B34C0EA3CDBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Atleast for resolving the=
 problem on the am57xx, I think we need to make a small change in the ipumm=
-fw recipe to add a RDEPENDS on libdce.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Additionally another patc=
h for GST plugin Ducati has also been pushed. I have asked Vivek&#8217;s te=
am to verify this on AM57xx.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Please review both these =
patches, it may address the issues on all the platforms.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoListParagraph" style=3D"margin-left:0in">meta-ti: <a href=3D=
"http://dflvsu0004.dal.design.ti.com/patch/13146/">
http://dflvsu0004.dal.design.ti.com/patch/13146/</a><o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:0in">meta-arago: <a href=
=3D"http://dflvsu0004.dal.design.ti.com/patch/13147/">
http://dflvsu0004.dal.design.ti.com/patch/13147/</a> <o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Karthik<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Wednesday, March 25, 2015 1:03 AM<br>
<b>To:</b> Dmytriyenko, Denys<br>
<b>Cc:</b> R, Karthik; Balagopalakrishnan, Anand; meta-arago@arago-project.=
org<br>
<b>Subject:</b> Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Yeah I didn't get ur point until I looked at it more=
 &nbsp;:)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Jake ur search for libdrm-omap from wat I see is onl=
y from looking at the fs.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">You really need to check the OE am335x build sysroot=
 to see if traces of libdrm_omap is there which will cause configure to ena=
ble kms.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">It is a bit weird for configure to detect libdrm_oma=
p but then fail when using it to build.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
On Mar 24, 2015, at 2:17 PM, Dmytriyenko, Denys &lt;<a href=3D"mailto:denys=
@ti.com">denys@ti.com</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p>That was my point - configure script is supposed to figure the dependenc=
y out.<o:p></o:p></p>
<p>-- <br>
Denys<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">On Mar 24, 2015 12:08, &quot;Cooper Jr., Franklin&qu=
ot; &lt;<a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>&gt; wrote:<o:p=
></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">The buffer pool patch even has a comment that talks =
about in the future remove the dependency on libdrm_omap.<br>
<br>
It is interesting that from looking at the configure related patches a lot =
of these new features or changes are related to kms which is only enabled w=
hen libdrm_omap is found.<br>
<br>
<br>
<br>
<br>
<br>
<br>
&gt; On Mar 24, 2015, at 2:00 PM, Cooper Jr., Franklin &lt;<a href=3D"mailt=
o:fcooper@ti.com">fcooper@ti.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Unless I'm missing something all the patches applied locally to gst 1.=
0 bad.<br>
&gt; <br>
&gt; <a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=
=3Dmeta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_=
1.2.3.bbappend;h=3Db1cacac6f5d700a5a40318ea8eb73e707578916b;hb=3Drefs/heads=
/master#l6">
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-arago-ex=
tras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend;h=
=3Db1cacac6f5d700a5a40318ea8eb73e707578916b;hb=3Drefs/heads/master#l6</a><b=
r>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; On Mar 24, 2015, at 1:53 PM, Dmytriyenko, Denys &lt;<a href=3D"mai=
lto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; Could you be more specific - which patches are you talking about?<=
br>
&gt;&gt; <br>
&gt;&gt;&gt; On Tue, Mar 24, 2015 at 02:47:22PM -0400, Cooper Jr., Franklin=
 wrote:<br>
&gt;&gt;&gt; I would re iterate that omap dss is only meant for devices wit=
h dss. Which <br>
&gt;&gt;&gt; doesn't include am335x<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; So these patches should only be applied to devices with the ds=
s. So I'm not <br>
&gt;&gt;&gt; sure why a simple patch that will do this isn't being done ins=
tead of trying <br>
&gt;&gt;&gt; to figure out why these builds are failing<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; On Mar 24, 2015, at 1:23 PM, Stiffler, Jacob &lt;<a href=
=3D"mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Karthik,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Is this libdrm_omap an unconditional dependency for all pl=
atforms?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt; Jake <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt; From: Balagopalakrishnan, Anand <br>
&gt;&gt;&gt;&gt; Sent: Tuesday, March 24, 2015 12:53 PM<br>
&gt;&gt;&gt;&gt; To: Stiffler, Jacob; Dmytriyenko, Denys; R, Karthik<br>
&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:meta-arago@arago-project.org">meta-a=
rago@arago-project.org</a>; Cooper Jr., Franklin<br>
&gt;&gt;&gt;&gt; Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad=
: add DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; &#43;Karthik<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Jake,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; We definitely have a dependency on DRM/DCE for J6/AM5. <br=
>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Karthik can add more.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Anand<br>
&gt;&gt;&gt;&gt; ________________________________________<br>
&gt;&gt;&gt;&gt; From: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt; Sent: Tuesday, March 24, 2015 8:27 PM<br>
&gt;&gt;&gt;&gt; To: Dmytriyenko, Denys; Balagopalakrishnan, Anand<br>
&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:meta-arago@arago-project.org">meta-a=
rago@arago-project.org</a>; Cooper Jr., Franklin<br>
&gt;&gt;&gt;&gt; Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad=
: add DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Anand,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Does gstreamer1.0-plugins-bad have an unconditional depend=
ency on libdrm_omap?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Denys,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; By looking at the nightly coresdk build emails, it appears=
 that you have not run a clean build in some time. If you run a clean build=
, you should be able to recreate this issue.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; However, in doing a clean build, you may run into issues w=
ith <a href=3D"http://gitorious.org">
gitorious.org</a> over https. This requires some certificates in the native=
 sysroot which may not be there...<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; - Jake<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt; From: <a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">meta-arago-bounces@arago-project.org</a> [<a href=3D"mailto:meta-arago-=
bounces@arago-project.org">mailto:meta-arago-bounces@arago-project.org</a>]=
 On Behalf Of Stiffler, Jacob<br>
&gt;&gt;&gt;&gt; Sent: Monday, March 23, 2015 7:05 AM<br>
&gt;&gt;&gt;&gt; To: Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:meta-arago@arago-project.org">meta-a=
rago@arago-project.org</a>; Balagopalakrishnan, Anand; Cooper Jr., Franklin=
<br>
&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad=
: add DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Denys,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; These errors occur on clean VMs. It seems that you are get=
ting lucky in your nightlies such that libdrm is not built before you build=
 gst-plugins.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; One reason libdrm is being pulled into the filesystem, is =
because libdrm-tests is pulled into &quot;packagegroup-arago-test&quot; for=
 all machines.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; I just checked the coresdk golden tisdk-rootfs image. This=
 does indeed include libdrm:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; jake@mcsdk-hpc-test:~/proc-sdk_nightlies/coresdk/tisdk-roo=
tfs-image-am335x-evm-20150322020246$ find ./var/lib/opkg/info/ -name 'libdr=
m*'<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.control<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.postinst<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.list<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.list<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.control<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.control<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.postinst<br>
&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.list<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; - Jake<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt; From: Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 5:01 PM<br>
&gt;&gt;&gt;&gt; To: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt; Cc: Chengalvala, Vivek; Cooper Jr., Franklin; <a href=3D"m=
ailto:meta-arago@arago-project.org">
meta-arago@arago-project.org</a>; Balagopalakrishnan, Anand<br>
&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad=
: add DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; have you tried bitbake libdrm -c cleansstate?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; On Fri, Mar 20, 2015 at 02:43:37PM -0400, Stiffler, Ja=
cob wrote:<br>
&gt;&gt;&gt;&gt;&gt; Sorry, I just double checked the filesystems:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:jake@mcsdk-hpc-test:~/proc-sdk_rc-bu=
ilds/01.00.00.00/ti-processor-sdk-linux-am335x-evm-01.00.00.00/filesystem/t=
isdk-rootfs$">
jake@mcsdk-hpc-test:~/proc-sdk_rc-builds/01.00.00.00/ti-processor-sdk-linux=
-am335x-evm-01.00.00.00/filesystem/tisdk-rootfs$</a> find ./var/lib/opkg/in=
fo/ -name '*drm*'<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.control<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.list<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.list<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.control<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.postinst<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:jake@mcsdk-hpc-test:~/ti-processor-s=
dk-linux-am335x-evm-01.00.00.00/fi">
jake@mcsdk-hpc-test:~/ti-processor-sdk-linux-am335x-evm-01.00.00.00/fi</a><=
br>
&gt;&gt;&gt;&gt;&gt; lesystem/tisdk-rootfs$ cd<br>
&gt;&gt;&gt;&gt;&gt; ../../../ti-processor-sdk-linux-am437x-evm-01.00.00.00=
/filesystem/tisd<br>
&gt;&gt;&gt;&gt;&gt; k-rootfs/ jake@mcsdk-hpc-test:~<br>
&gt;&gt;&gt;&gt;&gt; /ti-processor-sdk-linux-am437x-evm-01.00.00.00/filesys=
tem/tisdk-rootfs$ find ./var/lib/opkg/info/ -name '*drm*'<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.control<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.postinst<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-tests.list<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.list<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.control<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.control<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm2.postinst<br>
&gt;&gt;&gt;&gt;&gt; ./var/lib/opkg/info/libdrm-omap1.list<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt; From: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 2:39 PM<br>
&gt;&gt;&gt;&gt;&gt; To: Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt;&gt; Cc: Chengalvala, Vivek; Cooper Jr., Franklin; <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-a=
rago@arago-project.org</a>; Balagopalakrishnan, Anand<br>
&gt;&gt;&gt;&gt;&gt; Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins=
-bad: add <br>
&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; No it is not in the tree, hence the header is not foun=
d. It succeeds on am4 since it is pulled in by one of the packagegroups.<br=
>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt; From: Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 2:37 PM<br>
&gt;&gt;&gt;&gt;&gt; To: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt;&gt; Cc: Chengalvala, Vivek; Cooper Jr., Franklin; <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-a=
rago@arago-project.org</a>; Balagopalakrishnan, Anand<br>
&gt;&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins=
-bad: add <br>
&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Jake,<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; libdrm should not be pulled for am3 builds - that was =
the question for this patch, which should not be applied... Do you have it =
in your tree?<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; On Fri, Mar 20, 2015 at 02:27:17PM -0400, Stiffler=
, Jacob wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; arm-oe-linux-gnueabi-libtool: compile:&nbsp; arm-l=
inux-gnueabihf-gcc <br>
&gt;&gt;&gt;&gt;&gt;&gt; -march=3Darmv7-a -marm -mthumb-interwork -mfloat-a=
bi=3Dhard -mfpu=3Dneon<br>
&gt;&gt;&gt;&gt;&gt;&gt; -mtune=3Dcortex-a8<br>
&gt;&gt;&gt;&gt;&gt;&gt; --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-=
CORTEX_1/arago-tmp-e<br>
&gt;&gt;&gt;&gt;&gt;&gt; xt ernal-linaro-toolchain/sysroots/am335x-evm -std=
=3Dgnu99 <br>
&gt;&gt;&gt;&gt;&gt;&gt; -DHAVE_CONFIG_H -I. -I../../..<br>
&gt;&gt;&gt;&gt;&gt;&gt; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/in=
clude<br>
&gt;&gt;&gt;&gt;&gt;&gt; -fstack-protector -I../../../gst-libs -I../../../g=
st-libs -pthread<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/a=
rago-tmp-external-<br>
&gt;&gt;&gt;&gt;&gt;&gt; li<br>
&gt;&gt;&gt;&gt;&gt;&gt; naro-toolchain/sysroots/am335x-evm/usr/include/gst=
reamer-1.0<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/a=
rago-tmp-external-<br>
&gt;&gt;&gt;&gt;&gt;&gt; li<br>
&gt;&gt;&gt;&gt;&gt;&gt; naro-toolchain/sysroots/am335x-evm/usr/include/gli=
b-2.0<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/a=
rago-tmp-external-<br>
&gt;&gt;&gt;&gt;&gt;&gt; li naro-toolchain/sysroots/am335x-evm/usr/lib/glib=
-2.0/include<br>
&gt;&gt;&gt;&gt;&gt;&gt; -DGST_USE_UNSTABLE_API -pthread<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/a=
rago-tmp-external-<br>
&gt;&gt;&gt;&gt;&gt;&gt; li<br>
&gt;&gt;&gt;&gt;&gt;&gt; naro-toolchain/sysroots/am335x-evm/usr/include/gst=
reamer-1.0<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_<br=
>
&gt;&gt;&gt;&gt;&gt;&gt; 1/arago-tmp-external-linaro-toolchain/sysroots/am3=
35x-evm/usr/includ<br>
&gt;&gt;&gt;&gt;&gt;&gt; e/<br>
&gt;&gt;&gt;&gt;&gt;&gt; glib-2.0<br>
&gt;&gt;&gt;&gt;&gt;&gt; -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/a=
rago-tmp-external-<br>
&gt;&gt;&gt;&gt;&gt;&gt; li naro-toolchain/sysroots/am335x-evm/usr/lib/glib=
-2.0/include<br>
&gt;&gt;&gt;&gt;&gt;&gt; -DGST_USE_UNSTABLE_API -DG_THREADS_MANDATORY -DG_D=
ISABLE_CAST_CHECKS <br>
&gt;&gt;&gt;&gt;&gt;&gt; -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-state=
ment -Wvla <br>
&gt;&gt;&gt;&gt;&gt;&gt; -Wpointer-arith -Wmissing-declarations -Wmissing-p=
rototypes <br>
&gt;&gt;&gt;&gt;&gt;&gt; -Wredundant-decls -Wwrite-strings -Wformat-securit=
y <br>
&gt;&gt;&gt;&gt;&gt;&gt; -Wold-style-definition -Winit-self -Wmissing-inclu=
de-dirs -Waddress <br>
&gt;&gt;&gt;&gt;&gt;&gt; -Wno-multichar -Wnested-externs <br>
&gt;&gt;&gt;&gt;&gt;&gt; -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/in=
clude<br>
&gt;&gt;&gt;&gt;&gt;&gt; -fstack-protector -O2 -pipe -g -feliminate-unused-=
debug-types -c <br>
&gt;&gt;&gt;&gt;&gt;&gt; gstdrmbufferpool.c&nbsp; -fPIC -DPIC -o <br>
&gt;&gt;&gt;&gt;&gt;&gt; .libs/libgstdrm_1.0_la-gstdrmbufferpool.o<br>
&gt;&gt;&gt;&gt;&gt;&gt; In file included from gstdrmbufferpool.c:42:0:<br>
&gt;&gt;&gt;&gt;&gt;&gt; gstdrmbufferpool.h:42:22: fatal error: omap_drm.h:=
 No such file or <br>
&gt;&gt;&gt;&gt;&gt;&gt; directory compilation terminated.<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo=
] Error 1<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[4]: Leaving directory `/home/gtbldadm/ti/oe-l=
ayersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t=
2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-=
plugins-bad-1.2.3/gst-libs/gst/drm'<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[3]: *** [all-recursive] Error 1<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[3]: Leaving directory `/home/gtbldadm/ti/oe-l=
ayersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t=
2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-=
plugins-bad-1.2.3/gst-libs/gst'<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[2]: *** [all-recursive] Error 1<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[2]: Leaving directory `/home/gtbldadm/ti/oe-l=
ayersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t=
2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-=
plugins-bad-1.2.3/gst-libs'<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[1]: *** [all-recursive] Error 1<br>
&gt;&gt;&gt;&gt;&gt;&gt; make[1]: Leaving directory `/home/gtbldadm/ti/oe-l=
ayersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cortexa8t=
2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-=
plugins-bad-1.2.3'<br>
&gt;&gt;&gt;&gt;&gt;&gt; make: *** [all] Error 2<br>
&gt;&gt;&gt;&gt;&gt;&gt; ERROR: oe_runmake failed<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt;&gt; From: Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 2:23 PM<br>
&gt;&gt;&gt;&gt;&gt;&gt; To: Chengalvala, Vivek<br>
&gt;&gt;&gt;&gt;&gt;&gt; Cc: Cooper Jr., Franklin; Stiffler, Jacob; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org">me=
ta-arago@arago-project.org</a>; Balagopalakrishnan, Anand<br>
&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plu=
gins-bad: add <br>
&gt;&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KMSsink<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; AM3 builds fine here...<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Fri, Mar 20, 2015 at 06:17:18PM &#43;0000, =
Chengalvala, Vivek wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Karthik, Anand, Denys,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Upgrade to GST 1.0 (using commit b5747ce8caa13=
e4528e2d3055fa81cc9ca7b48fd on meta-arago) is causing the following problem=
s:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Broken =
build for AM3. Not sure how AM4 build succeeds.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM4x: P=
erformance drop with ARM only decode of H264 (not sure if it is due to a) b=
ase GST upgrade b) ffmpeg_dec --&gt; avdec_h264 or c) ffmpeg_color_space --=
&gt; videoconvert)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM57x: =
playbin pipeline internally triggers arm video decoder (e.g., avdec_h264) i=
nstead of ducati decoder<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM57x: =
cannot run pipeline with video parse &#43; decode, e.g., &quot;gst-launch-1=
.0 filesrc location=3DHistoryOfTI-480p.264 ! h264parse ! ducatih264dec ! fa=
kesink&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; All the above issues are not present with gst-=
0.10.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Please note that Issue #3 is not observed on V=
ayu with GLSDK EA release 7.0.0.4. Issue #4 is also happening on Vayu with =
GLSDK EA release 7.0.0.4.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; In addition to above,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmssink=
 is missing from AM57x file system.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; We wanted to do an SDF today for PROCESSOR-SDK=
 on AM3, AM4 and due to above failures, we are forced to freeze @ commit #5=
c2f4eea32afda6e68681470be664eb5a46fd984, and not pick up any further change=
s on meta-arago.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; There is another release targeted for next wee=
k and we'd like to be get back to the latest of meta-arago as soon as possi=
ble. Appreciate your help in addressing the above issues.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Vivek<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: <a href=3D"mailto:meta-arago-bounces@ara=
go-project.org">meta-arago-bounces@arago-project.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; [<a href=3D"mailto:meta-arago-bounces@arago-pr=
oject.org">mailto:meta-arago-bounces@arago-project.org</a>] On Behalf Of Co=
oper
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Jr., Franklin<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 9:58 AM<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:meta-arago@arago-project=
.org">meta-arago@arago-project.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1.0=
-plugins-bad: add <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KMSsink<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Well that's not good.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mar 20, 2015, at 8:42 AM, Stiff=
ler, Jacob &lt;<a href=3D"mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>&l=
t;<a href=3D"mailto:j-stiffler@ti.com">mailto:j-stiffler@ti.com</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I ran the demo while running &quot;top&quo=
t;. It appears that CPU is near 100%. However, this demo was working fine w=
ith gstreamer 0.10.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Cooper Jr., Franklin<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 9:34 AM<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: Dmytriyenko, Denys;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project=
.org">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@arag=
o-project.org">mailto:meta-arago@arago-project.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstreame=
r1.0-plugins-bad: add <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KMSsin=
k<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mar 20, 2015, at 8:17 AM, Stiffler,=
 Jacob &lt;<a href=3D"mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>&lt;<a=
 href=3D"mailto:j-stiffler@ti.com">mailto:j-stiffler@ti.com</a>&gt;&gt; wro=
te:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I tried the matrix h264 decode demo on=
 am437x with gstreamer 1.0.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To get it to work, I had to modify run=
H264Dec.sh to use the new pipelines. The new command is the following:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; gst-launch-1.0 -v filesrc location=3D$=
filename ! h264parse !<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; avdec_h264 ! videoconvert ! fbdevsink =
device=3D/dev/fb0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Once this was done, I was able to run =
the demo, but the framerate is extremely slow. Is this the correct command?=
 Or is this behavior expected?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; If slow as in stuttering and choppy then n=
o. If cpu utilization is high then that is expected.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Jake<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Stiffler, Jacob<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, March 20, 2015 6:56 AM<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Dmytriyenko, Denys;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-pro=
ject.org">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@=
arago-project.or">mailto:meta-arago@arago-project.or</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; g&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: RE: [meta-arago] [PATCH] gstr=
eamer1.0-plugins-bad: add <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KM=
Ssink<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It appears I got lucky with a successf=
ul am437x-evm build. The package libdrm was installed and libdce was not.<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; However, I got a build failure for am3=
35x-evm due to the missing libdrm dependency:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; In file included from gstdrmbufferpool=
.c:42:0:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; gstdrmbufferpool.h:42:22: fatal error:=
 omap_drm.h: No such file or directory compilation terminated.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[4]: *** [libgstdrm_1.0_la-gstdrmb=
ufferpool.lo] Error 1<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[4]: Leaving directory `/home/gtbl=
dadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/wo=
rk/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0=
-arago0/gst-plugins-bad-1.2.3/gst-libs/gst/drm'<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[3]: *** [all-recursive] Error 1<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[3]: Leaving directory `/home/gtbl=
dadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/wo=
rk/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0=
-arago0/gst-plugins-bad-1.2.3/gst-libs/gst'<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[2]: *** [all-recursive] Error 1<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[2]: Leaving directory `/home/gtbl=
dadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/wo=
rk/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0=
-arago0/gst-plugins-bad-1.2.3/gst-libs'<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[1]: *** [all-recursive] Error 1<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make[1]: Leaving directory `/home/gtbl=
dadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/wo=
rk/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0=
-arago0/gst-plugins-bad-1.2.3'<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make: *** [all] Error 2<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ERROR: oe_runmake failed<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; - Jake<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago-bounces@a=
rago-project.org">meta-arago-bounces@arago-project.org</a>&lt;mailto:meta-a=
rago-bounces@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ar <a href=3D"http://ago-project.org">=
ago-project.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; [<a href=3D"mailto:meta-arago-bounces@=
arago-project.org">mailto:meta-arago-bounces@arago-project.org</a>] On Beha=
lf Of
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Dmytriyenko, Denys<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Thursday, March 19, 2015 6:37 PM=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-pro=
ject.org">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@=
arago-project.or">mailto:meta-arago@arago-project.or</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; g&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstr=
eamer1.0-plugins-bad: add <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; DEPENDS on libdrm and libdce due to KM=
Ssink<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Karthik,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I had a question - I see that KMSsink =
in plugins-bad checks for drm and dce headers. I was trying to set the depe=
ndency accordingly, but it would break non dce platforms. Can you please el=
aborate on that a bit? Thanks.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Denys<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Thu, Mar 19, 2015 at 05:29:38PM=
 -0400, Denys Dmytriyenko wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a hre=
f=3D"mailto:denys@ti.com">denys@ti.com</a>&lt;<a href=3D"mailto:denys@ti.co=
m">mailto:denys@ti.com</a>&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Denys Dmytriyenko <=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:denys@ti.com=
">denys@ti.com</a>&lt;<a href=3D"mailto:denys@ti.com">mailto:denys@ti.com</=
a>&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; .../gstreamer/gstreamer1.0-plugins=
-bad_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;&#43;-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1 file changed, 3 insertions(&#43;=
), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a/meta-arago-extras/recipes-multim=
edia/gstreamer/gstreamer1.0-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pl<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ugins-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; bad_1.2.3.bbappend<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-arago-extras/recipes-multim=
edia/gstreamer/gstreamer1.0-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pl<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ugins-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; bad_1.2.3.bbappend<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index b1cacac..bd141a8 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a/meta-arago-extras/recipes-multim=
edia/gstreamer/gstreamer1.0-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pl<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ugins-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; bad_1.2.3.bbappend<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&#43;&#43; b/meta-arago-extra=
s/recipes-multimedia/gstreamer/gstreamer1.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&#43;&#43; 0-plug<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&#43;&#43; ins-bad_1.2.3.bbap=
pend<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -2,6 &#43;2,8 @@ FILESEXTRAPATH=
S_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; PACKAGECONFIG =3D &quot;faad wayla=
nd&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;DEPENDS &#43;=3D &quot;libdrm=
 libdce&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; SRC_URI_append =3D &quot; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"%20%20">file://0001-Add=
ed-GstDRMBufferPool-support.patch&lt;file:///\\000</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1- Added-GstDRMBufferPool-support.=
patch&gt; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"%20%20">file://0002-Mod=
ified-waylandsink-to-accept-NV12-format.patch&lt;f</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; il<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; e:///\\0002-Modified-waylandsink-t=
o-accept-NV12-format.patch&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; \ @@ -9,4 &#43;11,4 @@ SRC_URI_app=
end =3D &quot; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"%20%20">file://0004-way=
landsink-Removed-dependency-on-dri2.patch&lt;file:</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; // /\\0004-waylandsink-Removed-dep=
endency-on-dri2.patch&gt; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"%20%20">file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch&lt;fil=
e:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch</a>&gt;&quot;<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -PR_append =3D &quot;-arago0&quot;=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;PR_append =3D &quot;-arago1&q=
uot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.2.0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________=
_________<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-pro=
ject.org">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@=
arago-project.or">mailto:meta-arago@arago-project.or</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; g&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://arago-project.org/cg=
i-bin/mailman/listinfo/meta-arago">
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________=
_________<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-pro=
ject.org">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@=
arago-project.or">mailto:meta-arago@arago-project.or</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; g&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://arago-project.org/cg=
i-bin/mailman/listinfo/meta-arago">
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________________=
_<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org=
">meta-arago@arago-project.org</a>&lt;<a href=3D"mailto:meta-arago@arago-pr=
oject.org">mailto:meta-arago@arago-project.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinf=
o/meta-arago</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________________=
_<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org=
">meta-arago@arago-project.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinf=
o/meta-arago</a><br>
&gt;&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago=
@arago-project.org</a><br>
&gt;&gt;&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listin=
fo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=
</a><br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><o:p></o=
:p></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</body>
</html>

--_000_24B88602B5904F49971CAF899152529B34C0EA3CDBDE04entticom_--
