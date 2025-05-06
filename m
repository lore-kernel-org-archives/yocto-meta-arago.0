Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E5CC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 18:17:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.83094.1746555420119384185
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 11:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WY5pBanh;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546IGui71151894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 13:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746555416;
	bh=v5Hzrvcjd8SENhX4/vvvYo8Mp2j+hayuJFbeuxyP9Rs=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=WY5pBanhnkpO6XFasr80s6+l49TWMnV2AUqPrqNto5aJZo9cbgFf0f6gzzgp1RGUf
	 pVLOovJ9TYhMJPQu9VhpKF7kIiNSRLDSurd1ZfBseySgCHFPcVcpkdIW2YrTQUWrLr
	 /lVbjD2hvFQRu+cYyytK3QVTL6dIYdAT4ARoUtjg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546IGuh2049302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 13:16:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 13:16:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 13:16:56 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546IGu8B002399;
	Tue, 6 May 2025 13:16:56 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 6 May 2025 13:16:56 -0500
Message-ID: <D9PA81LBQ1HT.1381OFMP39958@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap/master][PATCH] mesa-demos: add a git
 version
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250506002203.1766376-1-rs@ti.com>
 <20250506160822.GA18383@denix.org>
In-Reply-To: <20250506160822.GA18383@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 18:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16181

On Tue May 6, 2025 at 11:08 AM CDT, Denys Dmytriyenko wrote:
> On Mon, May 05, 2025 at 07:22:03PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add a newer git version of this package to fetch modifications that
>> allow us to build the EGL and GLES specific demos without the hard
>> Desktop GL and X11 dependencies.
>>=20
>> These modification have not made it into a tag yet, but this recipe can
>> be removed once oe-core's version of the package passes
>> 02eae079cb0b8186064d5b194ca4cc2995f099ee.
>
> Adding a different version of an upstream recipe potentially causes signa=
ture=20
> change during YP compliance checks.
>
> There are 2 alternatives:
>
> 1. Do a .bbappend that modifies SRC_URI, SRCREV, S and anything else you =
need.=20
> That way you can activate it based on one of the overrides, such as :arag=
o
>
> 2. Set DEFAULT_PREFERENCE =3D "-1" in the recipe and then force preferenc=
e in a=20
> distro conf with PREFERRED_VERSION. And you have to set the correct PV he=
re.
>

2 seems the most applicable here since it's a significant version bump.
Unfortunately it's a git package. No real version to tag. I see the use of
"<rev>+git" is common in oe-core. Any complaints about using that here?

>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  .../recipes-graphics/mesa/mesa-demos_git.bb   | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_g=
it.bb
>>=20
>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b=
/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> new file mode 100644
>> index 00000000..5dd5a8ec
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> @@ -0,0 +1,43 @@
>> +SUMMARY =3D "Mesa demo applications"
>> +DESCRIPTION =3D "This package includes the demonstration application, s=
uch as glxgears. \
>> +These applications can be used for Mesa validation and benchmarking."
>> +HOMEPAGE =3D "http://mesa3d.org"
>> +BUGTRACKER =3D "https://bugs.freedesktop.org"
>> +
>> +LICENSE =3D "MIT & PD"
>> +LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endlin=
e=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
>> +                    file://src/xdemos/glxdemo.c;beginline=3D1;endline=
=3D8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
>> +
>> +SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhtt=
ps;branch=3Dmain"
>> +SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig features_check
>> +# depends on virtual/egl, virtual/libgl ...
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>> +
>> +EXTRA_OEMESON =3D "-Dwith-system-data-files=3Dtrue"
>> +
>> +# Note: wayland is not included as the feature requires libdecor recipe=
,
>> +# which is not currently in core
>> +PACKAGECONFIG ?=3D "drm egl gles1 gles2 \
>> +                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 way=
land', d)}"
>> +
>> +PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Ddisabled,libdrm"
>> +PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
>> +PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/=
libgles1"
>> +PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/=
libgles2"
>> +PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=
=3Ddisabled,freeglut"
>> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>> +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader glslang-native"
>> +PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vi=
rtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
>> +PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11=
 libglu libxkbcommon libxcb"
>> +
>> +do_install:append() {
>> +	# it can be completely empty when all PACKAGECONFIG options are disabl=
ed
>> +	rmdir --ignore-fail-on-non-empty ${D}${bindir}
>> +
>> +	if [ -f ${D}${bindir}/clear ]; then
>> +		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
>> +	fi
>> +}
>> --=20
>> 2.49.0
>>=20


