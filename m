Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD50C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 19:58:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22257.1738180706635229065
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 11:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=WQlkmjYQ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50TJwPSY1372007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 13:58:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738180705;
	bh=h84tVGc7KLYZnGn5iUwDR9YHwQw5P4CVdQi9+MFbOC4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=WQlkmjYQxnmK8fgi487aKC2/hznhAwFBSJefEg69YTft7y+GzBK/0Rbveo+L74isQ
	 bQI//QPplV+FR6ZVODYCXMkdET4SLwgZDi57LJ8/GnH7MhNblCGeCItwkdZLC9t7dn
	 WxyLzWSPabCRZjVR2GbaJAiWh3jRd1YUmGU+8bC0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50TJwPY3056259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jan 2025 13:58:25 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Jan 2025 13:58:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Jan 2025 13:58:25 -0600
Received: from [10.250.32.214] ([10.250.32.214])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50TJwOXi043836;
	Wed, 29 Jan 2025 13:58:25 -0600
Message-ID: <37d24d06-8648-40d8-8e35-eef8b134c235@ti.com>
Date: Wed, 29 Jan 2025 13:58:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] amsdk-av-files: Remove this
 recipe
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117190402.686979-1-afd@ti.com>
 <dc794822-0979-4e4e-ae94-cdbbbc75de34@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <dc794822-0979-4e4e-ae94-cdbbbc75de34@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 50TJwPSY1372007
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jan 2025 19:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15779

On 1/29/25 1:10 PM, Ryan Eatmon wrote:
>=20
> For some reason this patch breaks two of our builds on master...
>=20
> am69-sk - rt
> j784s4-evm - rt
>=20
> It gives the error during tisdk-default-image do_rootfs:
>=20
> ERROR: Unable to install packages. Command '/scratch/jenkins_builds/ara=
go-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk-=
default-image/1.0/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f =
/scratch/jenkins_builds/arago-master-next/build/build/arago-tmp-default/w=
ork/am69_sk-oe-linux/tisdk-default-image/1.0/opkg.conf -t /scratch/jenkin=
s_builds/arago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-=
linux/tisdk-default-image/1.0/temp/ipktemp/ -o /scratch/jenkins_builds/ar=
ago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk=
-default-image/1.0/rootfs =C2=A0--force_postinstall=C2=A0=C2=A0=C2=A0 --a=
dd-ignore-recommends busybox-syslog --add-ignore-recommends coreutils --a=
dd-ignore-recommends coreutils-dev --add-ignore-recommends gdbserver-c6x-=
dev --add-ignore-recommends libulm-dev install build-essential docker dtc=
 git linux-libc-headers-dev opkg packagegroup-arago-base packagegroup-ara=
go-console packagegroup-arago-tisdk-addons=20
> packagegroup-arago-tisdk-addons-extra packagegroup-arago-tisdk-connecti=
vity packagegroup-arago-tisdk-crypto packagegroup-arago-tisdk-graphics pa=
ckagegroup-arago-tisdk-gtk packagegroup-arago-tisdk-hmi packagegroup-arag=
o-tisdk-multimedia packagegroup-arago-tisdk-qte packagegroup-arago-tisdk-=
sysrepo packagegroup-core-boot packagegroup-core-tools-debug pdm-anomaly-=
detection psplash run-postinsts ti-test ti-test-extras' returned -11:
>=20
> DEBUG: Python function do_rootfs finished
>=20
>=20
> Which is annoying because it doesn't say why it failed, just that it fa=
iled...
>=20
> I bisected it down to this patch.
>=20
> All other platform/variant combinations work, and scarthgap works...
>=20

That seems really odd then, maybe some stale sstate for the multimedia
packagegroup those specific platform/variant combos that still has
amsdk-av-files as a dep?

Andrew

>=20
>=20
> On 1/17/2025 1:04 PM, Andrew Davis wrote:
>> These video files were used in a couple demos for multimedia decoders.
>> They add +50MB at minimum to images that include them and ~200MB of
>> git download to build. They are unused now so remove this recipe.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../packagegroup-arago-tisdk-multimedia.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 -
>> =C2=A0 .../amsdk-av-files/amsdk-av-files_1.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 42 -------------------
>> =C2=A0 2 files changed, 43 deletions(-)
>> =C2=A0 delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-a=
v-files/amsdk-av-files_1.4.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-multimedia.bb
>> index c6e39aa1..6a1b25b6 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-multimedia.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-multimedia.bb
>> @@ -7,7 +7,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> =C2=A0 inherit packagegroup
>> =C2=A0 MULTIMEDIA =3D " \
>> -=C2=A0=C2=A0=C2=A0 amsdk-av-files \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ffmpeg \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libcamera \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libcamera-gst \
>> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk=
-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/am=
sdk-av-files_1.4.bb
>> deleted file mode 100644
>> index 7267668b..00000000
>> --- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-fil=
es_1.4.bb
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -DESCRIPTION =3D "AMSDK multimedia support files"
>> -HOMEPAGE =3D "https://git.ti.com/processor-sdk/amsdk-av-files/"
>> -LICENSE =3D "CC-BY-NC-ND-3.0 & CC-BY-3.0"
>> -SECTION =3D "multimedia"
>> -LIC_FILES_CHKSUM =3D "file://Multimedia_Data_Files_Manifest.doc;md5=3D=
fe154d291c69c51495a5bb4a456403b5"
>> -PR =3D "r2"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -
>> -VIDEO_FILES =3D "video_480p "
>> -
>> -VIDEO_FILES:append:ti33x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vid=
eo_wvga \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_wqvga"
>> -VIDEO_FILES:append:ti43x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vid=
eo_wqvga"
>> -VIDEO_FILES:append:dra7xx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "video_wv=
ga \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_1080p \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_720p \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_yuv"
>> -VIDEO_FILES:append:k3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "video_720p"
>> -
>> -BRANCH =3D "master"
>> -
>> -SRC_URI =3D "git://git.ti.com/git/processor-sdk/amsdk-av-files.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
>> -SRCREV =3D "1b73009090265328ebaf1b6c880dfeccae5a8f19"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_compile() {
>> -=C2=A0=C2=A0=C2=A0 :
>> -}
>> -
>> -do_install() {
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${datadir}/ti \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${D}${datadir}/ti/audio \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${D}${datadir}/ti/video
>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/audio/* ${D}${datadir}/ti/aud=
io/
>> -=C2=A0=C2=A0=C2=A0 for file in ${VIDEO_FILES}; do
>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/v=
ideo/
>> -=C2=A0=C2=A0=C2=A0 done
>> -}
>> -
>> -FILES:${PN} +=3D "${datadir}/ti/*"
>=20

