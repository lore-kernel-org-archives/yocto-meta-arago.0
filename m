Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA409C282D1
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 02:15:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2206.1741313750895674546
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 18:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lXdlTM25;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5272FmqC3832624
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Mar 2025 20:15:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741313748;
	bh=JbqzS69bh88x4HF6RVHqnm5kSiSB2bplelZQlleSRKM=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=lXdlTM25o8K6RcmDsgFBedZla2yNiDXU6dOVXpz5AWRFs9s0dCLawiNIQEqZ04aJo
	 LXSS2wupNoSIY6q5awJDtpilucqHBMAZsI7SeYUbf+6aIyOnzKNA5CgqC75AWt3Qr/
	 CbCDaXFqdnRdjLYMXQ0ee8quFdct2lQ/7BXiVdi0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5272FmTQ027312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Mar 2025 20:15:48 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 20:15:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 20:15:47 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5272Flom085883;
	Thu, 6 Mar 2025 20:15:47 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 6 Mar 2025 20:15:47 -0600
Message-ID: <D89O7G90KJEQ.MJN3EER5EMM@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <a-christidis@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
 <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
 <84408d91-3248-4366-b440-3d715badf112@ti.com>
 <b643b122-8bfd-42fb-82d8-d67631a477e8@ti.com>
 <c6965134-98fb-4ce6-9086-e7760e2df38f@ti.com>
 <a5f7d349-1af1-40e9-ab75-00a64a81c7e3@ti.com>
 <6c0b1077-e996-41bb-8061-24fee82da4f4@ti.com>
 <ac5f1bdd-15a7-454a-b881-18c129116d4f@ti.com>
 <20250306195343.GO1879@denix.org> <D89KXMF8XS6G.1LZFZ1KBCUFOG@ti.com>
 <20250307003144.GQ1879@denix.org>
 <182A636105614804.13616@lists.yoctoproject.org>
In-Reply-To: <182A636105614804.13616@lists.yoctoproject.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Mar 2025 02:15:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15962

On Thu Mar 6, 2025 at 8:11 PM CST, Randolph Sapp via lists.yoctoproject.org=
 wrote:
> On Thu Mar 6, 2025 at 6:31 PM CST, Denys Dmytriyenko wrote:
>> On Thu, Mar 06, 2025 at 05:41:54PM -0600, Randolph Sapp wrote:
>>> On Thu Mar 6, 2025 at 1:53 PM CST, Denys Dmytriyenko wrote:
>>> > On Thu, Mar 06, 2025 at 12:50:56PM -0600, Antonios Christidis via lis=
ts.yoctoproject.org wrote:
>>> >>=20
>>> >> On 3/6/25 11:35 AM, Andrew Davis wrote:
>>> >> >On 3/6/25 11:29 AM, Antonios Christidis wrote:
>>> >> >>
>>> >> >>On 3/6/25 11:25 AM, Andrew Davis wrote:
>>> >> >>>On 3/6/25 11:09 AM, Antonios Christidis wrote:
>>> >> >>>>
>>> >> >>>>On 3/6/25 10:57 AM, Andrew Davis wrote:
>>> >> >>>>>On 3/6/25 10:03 AM, Antonios Christidis wrote:
>>> >> >>>>>>
>>> >> >>>>>>On 3/6/25 7:32 AM, Andrew Davis wrote:
>>> >> >>>>>>>On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>>> >> >>>>>>>>From: Antonios Christidis <a-christidis@ti.com>
>>> >> >>>>>>>>
>>> >> >>>>>>>>Include the package ti-gc320-libs-dev as a runtime dependenc=
y.
>>> >> >>>>>>>>
>>> >> >>>>>>>>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> >> >>>>>>>>---
>>> >> >>>>>>>>
>>> >> >>>>>>>>v2:
>>> >> >>>>>>>>- Added dev-deps on INSANE_SKIP
>>> >> >>>>>>>>
>>> >> >>>>>>>>=C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++=
-
>>> >> >>>>>>>>=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>> >> >>>>>>>>
>>> >> >>>>>>>>diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tes=
ts/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc32=
0-tests/ti-gc320-tests_5.0.11.p7.bb
>>> >> >>>>>>>>
>>> >> >>>>>>>>index f9b9685f..14278d76 100644
>>> >> >>>>>>>>--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-g=
c320-tests_5.0.11.p7.bb
>>> >> >>>>>>>>+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-g=
c320-tests_5.0.11.p7.bb
>>> >> >>>>>>>>@@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>>> >> >>>>>>>>=C2=A0 LIC_FILES_CHKSUM =3D "file://dra7x-sdk-ti-gc320-tests=
_manifest.html;md5=3D22a001855467f373c47f45de5330e3c9"
>>> >> >>>>>>>>=C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>>> >> >>>>>>>>+RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>>> >> >>>>>>>
>>> >> >>>>>>>This should be detected and set for you based on DEPENDS. You=
 don't
>>> >> >>>>>>>need any change here.
>>> >> >>>>>>>
>>> >> >>>>>>>Andrew
>>> >> >>>>>>>
>>> >> >>>>>>The way DEPENDS is setup it will not include
>>> >> >>>>>>ti-gc320-libs-dev package in the fs.
>>> >> >>>>>>
>>> >> >>>>>>=C2=A0=C2=A0The contents of the -dev package are required at
>>> >> >>>>>>runtime for the gc320 tests.
>>> >> >>>>>>
>>> >> >>>>>
>>> >> >>>>>Why? What is going into the dev package that is needed by the t=
ests?
>>> >> >>>>>
>>> >> >>>>>Andrew
>>> >> >>>>>
>>> >> >>>>libGAL.so symb link.
>>> >> >>>
>>> >> >>>If users of this library are meant to dlopen() that file, then
>>> >> >>>add it to the
>>> >> >>>regular ti-gc320-libs package.
>>> >> >>>
>>> >> >>>
>>> >> >>I did that in [1]. However, Denys let me know symb link should
>>> >> >>go in the -dev package.
>>> >> >>
>>> >> >
>>> >> >For header files I'd agree, and usually for .so files. But in this
>>> >> >case if
>>> >> >the users of this need this file (as in it is not just used for
>>> >> >compiling)
>>> >> >then it can go in the base package. We do this for instance with
>>> >> >GStreamer
>>> >> >plugins[0].
>>> >> >
>>> >> I prefer the above option. Ryan, Denys, Randolph what do you think ?
>>> >
>>> > 1. Is libGAL.so a symlink to a versioned libGAL.so.X.Y.Z or libGAL.so=
.X=20
>>> > library?
>>> >
>>> > 2. Does it get linked during compile time, like a regular shared libr=
ary,=20
>>> > or is it meant to be dlopen()-ed?
>>> >
>>> >
>>> > If it's a regular shared library and .so is a symlink to a versioned =
copy,=20
>>> > then .so should go into -dev package and you don't pull that package =
into=20
>>> > a rootfs, unless you want to enable on-target development.
>>> >
>>> > If it's a regular shared library that gets linked at build time, but =
there's=20
>>> > no versioned copies produced, as .so is the only output, then the bes=
t option=20
>>> > os to fix your build to produce versioned copies and .so synlink. Alt=
ernative,=20
>>> > but less desirable option, is to put .so library (not synlink) into t=
he main=20
>>> > package, like Andrew mentioned.
>>> >
>>> > If this .so is meant to be dlopen() at runtime, then it should not be=
 a=20
>>> > symlink, first of all, but then you also want to move it into the mai=
n=20
>>> > package.
>>>=20
>>> Glad we all agree here. It's my understanding that multiple application=
s (both
>>> in and out of our control) have gotten use to dlopen-ing that unversion=
ed so.
>>> It's a borderline requirement to have it now.
>>>=20
>>> Antonios, the package should not produce any "-dev" package variant. Ov=
erride
>>> the PACKAGES, FILES, and INSANE_SKIP variables like mesa or the rogue-u=
mlibs do
>>> right now to do this correctly.
>>
>> Hold a sec, that was exactly the comment for the first revision of this=
=20
>> patch[1]. There's a default -dev package and it is correct, because besi=
des=20
>> this .so there are also header files being installed, which do belong in=
 the=20
>> corresponding -dev package. All that gets handled automatically. What we=
 are=20
>> saying here is that if the unversioned .so needs to be dlopen()-ed, then=
 it=20
>> can be moved to the main poackage.
>>
>> The proper way to do this:
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphic=
s/spir/spirv-tools_1.3.296.0.bb#n45
>> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-d=
evtools/arm-compute-library/arm-compute-library_24.12.bb#n54
>> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-f=
ramework/onnx/onnx_1.16.1.bb#n103
>>
>>
>> BTW, I don't see umlibs installing any header files, while mesa-pvr buil=
ds=20
>> on top of upstream mesa.inc, which packages different header files into=
=20
>> corresponding -dev packages...
>>
>
> That comment was specifically about the devlink issue. Mesa has a devlink=
 for
> GL/GLES/EGL implementations that hook back into the megadriver. These are=
 in the
> main megadriver package, not a dev package. The rogue-um recipe drops the=
 dev
> package entirely because various tools expect to interact with unversione=
d so's
> for srv components and we don't have any headers to ship.
>
> I was unaware there were also headers being included in this recipe. In t=
hat
> case you are correct. The dev package must still be generated, the devlin=
ks will
> need to be cut out and included in the main package like mesa, though I a=
dmit
> mesa is a more complex example of this.

Well, I stand corrected. They don't ship the devlinks. Not sure what I was
thinking of.

>>> > Also, you don't pull header files into the main package[1], even if y=
ou need=20
>>> > to enable on-target development - you use -dev package along with oth=
er=20
>>> > tools. Normally you enable that with "dev-pkgs" in IMAGE_FEATURES or =
globally=20
>>> > in EXTRA_IMAGE_FEATURES.
>>> >
>>> > And lastly - you don't ever want to try to pull even a single -dev pa=
ckage=20
>>> > explicitly via RDEPENDS, because it will trigger a chain reaction for=
 many=20
>>> > other -dev packages, so it will blow up your dependency tree. I alrea=
dy=20
>>> > explained it here:
>>> > https://lists.yoctoproject.org/g/meta-arago/message/15696
>>>=20
>>> >> >Another option is to fix up the tests so they link with libGAL the
>>> >> >normal way..
>>> >> >
>>> >> >[0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/=
recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb?h=3Dscar=
thgap#n32
>>> >> >
>>> >> >>[1] =3D https://patchwork.yoctoproject.org/project/ti/patch/202502=
12201830.2090247-3-a-christidis@ti.com/
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15961): https://lists.yoctoproject.org/g/meta-arago/m=
essage/15961
> Mute This Topic: https://lists.yoctoproject.org/mt/111539378/7094281
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [rs@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


