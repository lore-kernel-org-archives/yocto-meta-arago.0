Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3685C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 23:42:07 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2509.1741304517965767792
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 15:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XoJVnVNQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526NfsrT208207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Mar 2025 17:41:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741304514;
	bh=vzXilSLCb8yX83eqG/bhFnJ2iE471RMOrcXDt9Lq0Cg=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=XoJVnVNQha1nMsbvC0ccA/2hZeyJ2D54Srj7bc6HTkRrjHTPzrtnLJ47K9YytKAfq
	 mr3QXLOq+0H0z9RhCx9WYJzcZ0bMf1k1GaUgV/7V8W4TsfeQjL2cwEyRZUKl7i8ubi
	 V6HN/IJ+ceSZ/r2rLBBM1tso/lZPVbMvE2NxlSCc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526NfsHa010321;
	Thu, 6 Mar 2025 17:41:54 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 17:41:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 17:41:54 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526NfsbO045083;
	Thu, 6 Mar 2025 17:41:54 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 6 Mar 2025 17:41:54 -0600
Message-ID: <D89KXMF8XS6G.1LZFZ1KBCUFOG@ti.com>
CC: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        "Ryan
 Eatmon" <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250306000441.408976-1-a-christidis@ti.com>
 <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
 <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
 <84408d91-3248-4366-b440-3d715badf112@ti.com>
 <b643b122-8bfd-42fb-82d8-d67631a477e8@ti.com>
 <c6965134-98fb-4ce6-9086-e7760e2df38f@ti.com>
 <a5f7d349-1af1-40e9-ab75-00a64a81c7e3@ti.com>
 <6c0b1077-e996-41bb-8061-24fee82da4f4@ti.com>
 <ac5f1bdd-15a7-454a-b881-18c129116d4f@ti.com>
 <20250306195343.GO1879@denix.org>
In-Reply-To: <20250306195343.GO1879@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 23:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15959

On Thu Mar 6, 2025 at 1:53 PM CST, Denys Dmytriyenko wrote:
> On Thu, Mar 06, 2025 at 12:50:56PM -0600, Antonios Christidis via lists.y=
octoproject.org wrote:
>>=20
>> On 3/6/25 11:35 AM, Andrew Davis wrote:
>> >On 3/6/25 11:29 AM, Antonios Christidis wrote:
>> >>
>> >>On 3/6/25 11:25 AM, Andrew Davis wrote:
>> >>>On 3/6/25 11:09 AM, Antonios Christidis wrote:
>> >>>>
>> >>>>On 3/6/25 10:57 AM, Andrew Davis wrote:
>> >>>>>On 3/6/25 10:03 AM, Antonios Christidis wrote:
>> >>>>>>
>> >>>>>>On 3/6/25 7:32 AM, Andrew Davis wrote:
>> >>>>>>>On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>> >>>>>>>>From: Antonios Christidis <a-christidis@ti.com>
>> >>>>>>>>
>> >>>>>>>>Include the package ti-gc320-libs-dev as a runtime dependency.
>> >>>>>>>>
>> >>>>>>>>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> >>>>>>>>---
>> >>>>>>>>
>> >>>>>>>>v2:
>> >>>>>>>>- Added dev-deps on INSANE_SKIP
>> >>>>>>>>
>> >>>>>>>>=C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++-
>> >>>>>>>>=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>> >>>>>>>>
>> >>>>>>>>diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/t=
i-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-te=
sts/ti-gc320-tests_5.0.11.p7.bb
>> >>>>>>>>
>> >>>>>>>>index f9b9685f..14278d76 100644
>> >>>>>>>>--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320=
-tests_5.0.11.p7.bb
>> >>>>>>>>+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320=
-tests_5.0.11.p7.bb
>> >>>>>>>>@@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>> >>>>>>>>=C2=A0 LIC_FILES_CHKSUM =3D "file://dra7x-sdk-ti-gc320-tests_man=
ifest.html;md5=3D22a001855467f373c47f45de5330e3c9"
>> >>>>>>>>=C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>> >>>>>>>>+RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>> >>>>>>>
>> >>>>>>>This should be detected and set for you based on DEPENDS. You don=
't
>> >>>>>>>need any change here.
>> >>>>>>>
>> >>>>>>>Andrew
>> >>>>>>>
>> >>>>>>The way DEPENDS is setup it will not include
>> >>>>>>ti-gc320-libs-dev package in the fs.
>> >>>>>>
>> >>>>>>=C2=A0=C2=A0The contents of the -dev package are required at
>> >>>>>>runtime for the gc320 tests.
>> >>>>>>
>> >>>>>
>> >>>>>Why? What is going into the dev package that is needed by the tests=
?
>> >>>>>
>> >>>>>Andrew
>> >>>>>
>> >>>>libGAL.so symb link.
>> >>>
>> >>>If users of this library are meant to dlopen() that file, then
>> >>>add it to the
>> >>>regular ti-gc320-libs package.
>> >>>
>> >>>
>> >>I did that in [1]. However, Denys let me know symb link should
>> >>go in the -dev package.
>> >>
>> >
>> >For header files I'd agree, and usually for .so files. But in this
>> >case if
>> >the users of this need this file (as in it is not just used for
>> >compiling)
>> >then it can go in the base package. We do this for instance with
>> >GStreamer
>> >plugins[0].
>> >
>> I prefer the above option. Ryan, Denys, Randolph what do you think ?
>
> 1. Is libGAL.so a symlink to a versioned libGAL.so.X.Y.Z or libGAL.so.X=
=20
> library?
>
> 2. Does it get linked during compile time, like a regular shared library,=
=20
> or is it meant to be dlopen()-ed?
>
>
> If it's a regular shared library and .so is a symlink to a versioned copy=
,=20
> then .so should go into -dev package and you don't pull that package into=
=20
> a rootfs, unless you want to enable on-target development.
>
> If it's a regular shared library that gets linked at build time, but ther=
e's=20
> no versioned copies produced, as .so is the only output, then the best op=
tion=20
> os to fix your build to produce versioned copies and .so synlink. Alterna=
tive,=20
> but less desirable option, is to put .so library (not synlink) into the m=
ain=20
> package, like Andrew mentioned.
>
> If this .so is meant to be dlopen() at runtime, then it should not be a=
=20
> symlink, first of all, but then you also want to move it into the main=20
> package.

Glad we all agree here. It's my understanding that multiple applications (b=
oth
in and out of our control) have gotten use to dlopen-ing that unversioned s=
o.
It's a borderline requirement to have it now.

Antonios, the package should not produce any "-dev" package variant. Overri=
de
the PACKAGES, FILES, and INSANE_SKIP variables like mesa or the rogue-umlib=
s do
right now to do this correctly.

> Also, you don't pull header files into the main package[1], even if you n=
eed=20
> to enable on-target development - you use -dev package along with other=
=20
> tools. Normally you enable that with "dev-pkgs" in IMAGE_FEATURES or glob=
ally=20
> in EXTRA_IMAGE_FEATURES.
>
> And lastly - you don't ever want to try to pull even a single -dev packag=
e=20
> explicitly via RDEPENDS, because it will trigger a chain reaction for man=
y=20
> other -dev packages, so it will blow up your dependency tree. I already=
=20
> explained it here:
> https://lists.yoctoproject.org/g/meta-arago/message/15696

>> >Another option is to fix up the tests so they link with libGAL the
>> >normal way..
>> >
>> >[0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/reci=
pes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb?h=3Dscarthga=
p#n32
>> >
>> >>[1] =3D https://patchwork.yoctoproject.org/project/ti/patch/2025021220=
1830.2090247-3-a-christidis@ti.com/


