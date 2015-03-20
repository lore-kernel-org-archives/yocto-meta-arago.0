Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4BAD652093
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 13:42:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KDglhv031032
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 08:42:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KDgkOW003753
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 08:42:46 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 20 Mar 2015 08:42:46 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AQHQYovfAYVpT0KB/kuEWTxVKSDJSp0kuQUAgAB51GCAACdNUIAAWZMA//+ua6A=
Date: Fri, 20 Mar 2015 13:42:46 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
	<20150319223632.GH11557@edge>
	,<4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>
In-Reply-To: <2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Fri, 20 Mar 2015 13:42:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I ran the demo while running "top". It appears that CPU is near 100%. Howev=
er, this demo was working fine with gstreamer 0.10.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, March 20, 2015 9:34 AM
To: Stiffler, Jacob
Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink




> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.=20
>=20
> To get it to work, I had to modify runH264Dec.sh to use the new pipelines=
. The new command is the following:
>=20
>    gst-launch-1.0 -v filesrc location=3D$filename ! h264parse ! avdec_h26=
4 ! videoconvert ! fbdevsink device=3D/dev/fb0
>=20
>=20
> Once this was done, I was able to run the demo, but the framerate is extr=
emely slow. Is this the correct command? Or is this behavior expected?
If slow as in stuttering and choppy then no. If cpu utilization is high the=
n that is expected.
>=20
> Thanks,
> Jake=20
>=20
>=20
> -----Original Message-----
> From: Stiffler, Jacob=20
> Sent: Friday, March 20, 2015 6:56 AM
> To: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS o=
n libdrm and libdce due to KMSsink
>=20
> It appears I got lucky with a successful am437x-evm build. The package li=
bdrm was installed and libdce was not.
>=20
> However, I got a build failure for am335x-evm due to the missing libdrm d=
ependency:
>=20
> In file included from gstdrmbufferpool.c:42:0:
> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or direct=
ory compilation terminated.
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
> - Jake
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@ara=
go-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, March 19, 2015 6:37 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS o=
n libdrm and libdce due to KMSsink
>=20
> Karthik,
>=20
> I had a question - I see that KMSsink in plugins-bad checks for drm and d=
ce headers. I was trying to set the dependency accordingly, but it would br=
eak non dce platforms. Can you please elaborate on that a bit? Thanks.
>=20
> --
> Denys
>=20
>=20
>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>=20
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | =
4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad_1.2.3.bbappend=20
>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad_1.2.3.bbappend
>> index b1cacac..bd141a8 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad_1.2.3.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
>> +++ ins-bad_1.2.3.bbappend
>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>=20
>> PACKAGECONFIG =3D "faad wayland"
>>=20
>> +DEPENDS +=3D "libdrm libdce"
>> +
>> SRC_URI_append =3D " \
>>         file://0001-Added-GstDRMBufferPool-support.patch \
>>         file://0002-Modified-waylandsink-to-accept-NV12-format.patch=20
>> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \
>>         file://0004-waylandsink-Removed-dependency-on-dri2.patch \
>>         file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
>>=20
>> -PR_append =3D "-arago0"
>> +PR_append =3D "-arago1"
>> --
>> 2.2.0
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

