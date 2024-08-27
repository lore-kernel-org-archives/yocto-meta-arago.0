Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BC4C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 15:35:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.81561.1724772950169803974
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 08:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XERKnTwQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RFZmC9075948;
	Tue, 27 Aug 2024 10:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724772948;
	bh=8t363lfdzdnnMQNyinB/JyvibgYs2Mn6wpxHEr3B4qk=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=XERKnTwQwLDjnuYzpWedLBxjumCAV74if6R0tHu6drF81l+K16/WHpdjsAspVwsdY
	 9v0+8+8nZBW9SPODU/ehiWQWdVVDKIHptCXVcjX7N/NEEAFtCTh+Yu24ZlMEqQDY3V
	 7oJTCC6o5Z4vDMT/IIUH+wjUVgFqyop0P5hlv6+k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RFZmQx020497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 10:35:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 10:35:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 10:35:48 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RFZjcS109897;
	Tue, 27 Aug 2024 10:35:46 -0500
Message-ID: <93324f59-5cc5-4eda-b550-4da12d021961@ti.com>
Date: Tue, 27 Aug 2024 21:05:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][kirkstone][PATCH] conf/images: Add
 ARAGO_IMAGE_SUFFIX to image names
To: <meta-arago@lists.yoctoproject.org>
References: <20240827150010.29408-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240827150010.29408-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 47RFZmC9075948
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Aug 2024 15:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15547


On 27/08/24 20:30, Ryan Eatmon via lists.yoctoproject.org wrote:
> When attempting to merge the build artifacts from bitbake into a new=20
> release tarball coupled with running multiple bitbake builds for=20
> non-RT and RT kernels, the common naming for the image files poses an=20
> issue that requires a manual rename of
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9mwbauZEn=
NOD_F0WkPSY34J2w--gq2Tv_FBoPy7bvluoPZ5IbBOskKmpadGzABcCWOKBKSvEpxY$>=20
>
> ZjQcmQRYFpfptBannerEnd
> When attempting to merge the build artifacts from bitbake into a new re=
lease
> tarball coupled with running multiple bitbake builds for non-RT and RT =
kernels,
> the common naming for the image files poses an issue that requires a ma=
nual rename
> of the RT image file to make it unique.
>
> This patch adds a new ARAGO_IMAGE_SUFFIX variable that is normally "", =
but for RT
> builds is set to "-rt" so that the image files are different.
>
> Backport from master: 9e10acff265c4dfcd150329641a71a6cd55c6572
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   meta-arago-distro/classes/tisdk-bundle.bbclass            | 4 ++--
>   meta-arago-distro/classes/tisdk-sw-manifest.bbclass       | 8 ++++---=
-
>   meta-arago-distro/conf/distro/arago.conf                  | 2 ++
>   .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb  | 2 +-
>   meta-arago-distro/recipes-core/images/arago-image.inc     | 2 +-
>   meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 2 +-
>   .../recipes-core/images/tisdk-bootstrap-base-image.bb     | 2 +-
>   .../recipes-core/images/tisdk-bootstrap-image.bb          | 2 +-
>   .../recipes-core/images/tisdk-core-bundle.bb              | 2 +-
>   .../recipes-core/images/tisdk-default-image.bb            | 2 +-
>   .../recipes-core/images/tisdk-jailhouse-image.bb          | 2 +-
>   .../recipes-core/images/tisdk-jailhouse-inmate.bb         | 2 +-
>   .../recipes-core/images/tisdk-thinlinux-image.bb          | 2 +-
>   meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 2 +-
>   .../recipes-core/images/tisdk-tiny-initramfs.bb           | 2 +-
>   15 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arag=
o-distro/classes/tisdk-bundle.bbclass
> index 49504089..8050a8ff 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -165,9 +165,9 @@ tisdk_image_build () {
>       do
>           for type in ${TARGET_IMAGE_TYPES}
>           do
> -            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ]
> +            if [ -e ${DEPLOY_DIR_IMAGE}/${image}${ARAGO_IMAGE_SUFFIX}-=
${MACHINE}.${type} ]
>               then
> -                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ${I=
MAGE_ROOTFS}/filesystem/
> +                cp ${DEPLOY_DIR_IMAGE}/${image}${ARAGO_IMAGE_SUFFIX}-$=
{MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
>               fi
>           done
>       done
> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta=
-arago-distro/classes/tisdk-sw-manifest.bbclass
> index 14d14f08..7d8602f4 100644
> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> @@ -403,12 +403,12 @@ sw_manifest_target() {
>       for image in ${TARGET_IMAGES}
>       do
>           # Only extract tar.gz or tar.bz2 types
> -        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz =
]
> +        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUFFI=
X}--${MACHINE}.tar.xz ]
>           then
> -            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar=
.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> -        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.g=
z ]
> +            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_S=
UFFIX}--${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.con=
trol
> +        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUF=
FIX}--${MACHINE}.tar.gz ]
>           then
> -            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar=
.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> +            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_S=
UFFIX}--${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.con=
trol
>           fi
>       done
>  =20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-dist=
ro/conf/distro/arago.conf
> index e46ebd26..5c680d05 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -147,10 +147,12 @@ PERF_FEATURES_ENABLE ?=3D "perf-scripting perf-tu=
i"
>   SKIP_META_GNOME_SANITY_CHECK =3D "1"
>  =20
>   ARAGO_KERNEL_SUFFIX ?=3D ""
> +ARAGO_IMAGE_SUFFIX ?=3D ""
>  =20
>   # Set real-time kernel suffix
>   ARAGO_RT_ENABLE ?=3D "0"
>   ARAGO_KERNEL_SUFFIX:append =3D "${@oe.utils.conditional("ARAGO_RT_ENA=
BLE", "1", "-rt", "", d)}"
> +ARAGO_IMAGE_SUFFIX:append =3D "${@oe.utils.conditional("ARAGO_RT_ENABL=
E", "1", "-rt", "", d)}"
>  =20
>   # Set systest kernel suffix
>   ARAGO_SYSTEST_ENABLE ?=3D "0"
> diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-i=
nitrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-i=
nitrd_1.0.bb
> index 92822dc3..cc0111b6 100644
> --- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1=
.0.bb
> +++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1=
.0.bb
> @@ -14,7 +14,7 @@ TARGET =3D "bootstrap-rootfs-${MACHINE}.cpio"
>  =20
>   do_install() {
>   	install -d ${D}/boot
> -	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio=
 ${D}/boot/${TARGET}
> +	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}${ARAGO_IMAGE_SU=
FFIX}-${MACHINE}.cpio ${D}/boot/${TARGET}
>   }
>  =20
>   FILES:${PN} =3D "/boot"
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/me=
ta-arago-distro/recipes-core/images/arago-image.inc
> index 00308b57..17325619 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -14,7 +14,7 @@ IMAGE_INSTALL =3D " \
>   	${CORE_IMAGE_EXTRA_INSTALL} \
>   "
>  =20
> -export IMAGE_BASENAME =3D "arago-image"
> +export IMAGE_BASENAME =3D "arago-image${ARAGO_IMAGE_SUFFIX}"
>  =20
>   IMAGE_LINGUAS =3D ""
>  =20
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb =
b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> index 83f1899b..f5d5f29b 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> @@ -16,4 +16,4 @@ IMAGE_INSTALL +=3D "\
>       ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
>   "
>  =20
> -export IMAGE_BASENAME =3D "tisdk-base-image"
> +export IMAGE_BASENAME =3D "tisdk-base-image${ARAGO_IMAGE_SUFFIX}"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base=
-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-im=
age.bb
> index 8b7f10c9..ce3b008e 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.=
bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.=
bb
> @@ -19,4 +19,4 @@ IMAGE_INSTALL +=3D " \
>   	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
>   "
>  =20
> -export IMAGE_BASENAME =3D "tisdk-bootstrap-base-image"
> +export IMAGE_BASENAME =3D "tisdk-bootstrap-base-image${ARAGO_IMAGE_SUF=
FIX}"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-imag=
e.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> index b41f09fb..5fe0463d 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> @@ -19,4 +19,4 @@ IMAGE_INSTALL +=3D " \
>   	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
>   "
>  =20
> -export IMAGE_BASENAME =3D "tisdk-bootstrap-image"
> +export IMAGE_BASENAME =3D "tisdk-bootstrap-image${ARAGO_IMAGE_SUFFIX}"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index 9adb4f93..9c2bb015 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -17,4 +17,4 @@ DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65=
x_sr2-gp-evm.itb"
>   DEPLOY_IMAGES_NAME:append:am65xx-hs-evm =3D " sysfw-am65x_sr2-hs-evm.=
itb"
>  =20
>   ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
> -export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}"
> +export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}${ARAGO_IMAGE_SUFFIX}"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.=
bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 9c3446f3..858a10d4 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -33,7 +33,7 @@ IMAGE_INSTALL +=3D "\
>       packagegroup-arago-tisdk-sysrepo \
>   "
>  =20
> -export IMAGE_BASENAME =3D "tisdk-default-image"
> +export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
>  =20
>   # Disable ubi/ubifs as the filesystem requires more space than is
>   # available on the HW.
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-imag=
e.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> index 339e4895..9240e0b9 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> @@ -11,6 +11,6 @@ COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>  =20
>   IMAGE_INSTALL +=3D " jailhouse"
>  =20
> -export IMAGE_BASENAME =3D "tisdk-jailhouse-image"
> +export IMAGE_BASENAME =3D "tisdk-jailhouse-image${ARAGO_IMAGE_SUFFIX}"
>  =20
>   WIC_CREATE_EXTRA_ARGS:append =3D " --no-fstab-update"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inma=
te.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
> index 57efd009..aba5ee13 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
> @@ -13,4 +13,4 @@ IMAGE_FSTYPES +=3D "cpio"
>  =20
>   PACKAGE_INSTALL +=3D "jailhouse-inmate"
>  =20
> -export IMAGE_BASENAME =3D "tisdk-jailhouse-inmate"
> +export IMAGE_BASENAME =3D "tisdk-jailhouse-inmate${ARAGO_IMAGE_SUFFIX}=
"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-imag=
e.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> index 13e86902..34494976 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> @@ -21,7 +21,7 @@ IMAGE_INSTALL +=3D "\
>       ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
>   "
>  =20
> -export IMAGE_BASENAME =3D "tisdk-thinlinux-image"
> +export IMAGE_BASENAME =3D "tisdk-thinlinux-image${ARAGO_IMAGE_SUFFIX}"
>  =20
>   # Disable ubi/ubifs as the filesystem requires more space than is
>   # available on the HW.
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> index c8a584bd..0bb6b798 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> @@ -20,4 +20,4 @@ IMAGE_INSTALL +=3D " \
>  =20
>   DEPENDS +=3D " tisdk-tiny-initramfs"
>  =20
> -export IMAGE_BASENAME =3D "tisdk-tiny-image"
> +export IMAGE_BASENAME =3D "tisdk-tiny-image${ARAGO_IMAGE_SUFFIX}"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs=
.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
> index 551cf67c..b9dc1550 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
> @@ -22,7 +22,7 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>  =20
>   PACKAGE_INSTALL =3D "packagegroup-arago-initramfs"
>  =20
> -export IMAGE_BASENAME =3D "tisdk-tiny-initramfs"
> +export IMAGE_BASENAME =3D "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
>  =20
>   # To further reduce the size of the rootfs, remove the /boot director=
y from
>   # the final image this is usually done by adding RDEPENDS_kernel-base=
 =3D ""
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15546):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15546__;!!G3vK!XoU9Kb9Ztv6MZ_JEQKTaQN=
RNgmcFNut0dFR5o6uKfaNy7SgZAZ8xLW5QR141mck_DoXIqH3BcGODsfha8zy0FWY16i_yV8W=
weQ$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/108124666/7030289__;!!G3vK!XoU9Kb9Ztv6MZ_JEQKTaQNRNgmcFNut0dFR5o6u=
KfaNy7SgZAZ8xLW5QR141mck_DoXIqH3BcGODsfha8zy0FWY16i9SFa2uZQ$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!XoU9Kb9Ztv6MZ_JEQKTaQNRNgmcFNut0dFR5o6uKfaNy7=
SgZAZ8xLW5QR141mck_DoXIqH3BcGODsfha8zy0FWY16i-TXt6AxA$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

