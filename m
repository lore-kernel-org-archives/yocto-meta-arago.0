Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D9BCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 17:27:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.25076.1757525248112699914
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 10:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SbJJk71G;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58AHRRxN109605
	for <meta-arago@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757525247;
	bh=XnFmJuQZ4KMxFeMQmDeZ/v/72QF0grg4n3PXiuoXiOg=;
	h=Date:CC:Subject:From:To:References:In-Reply-To:List-Post;
	b=SbJJk71G5omjJeQ/X8+m7qHxwndFrnmdknaDWeEHvVBIdJT0Ag9LJFkIbnb3wJ8LK
	 vqKaOvRFx+ZbvzZ3lAEBlzl4QEP+RkaXjWu3wXIQtYaCs8LH1DvYIEhNl7eM4hk1S0
	 kZ4SijnlcPvFW9aisuIT2A9hezpQ/ky6eHJMihLw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58AHRR7W1320534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:27:27 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 12:27:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 12:27:25 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58AHRPsD540592;
	Wed, 10 Sep 2025 12:27:25 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Sep 2025 12:27:25 -0500
Message-ID: <DCPAPBQCNVXL.1R2WJFQB6JA24@ti.com>
CC: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>
Subject: Re: [meta-arago] [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs:
 Make minimal initrd image
From: Randolph Sapp <rs@ti.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250904124331.1075343-1-m-shah@ti.com>
 <20250904124331.1075343-2-m-shah@ti.com>
 <20250909145655.k4vc5zinnpxxbjgl@bryanbrattlof.com>
 <DCOJZ6EILZ6E.J2M26F6BFYDL@ti.com>
 <20250910114838.62ar3wxtkmtcjfqm@bryanbrattlof.com>
In-Reply-To: <20250910114838.62ar3wxtkmtcjfqm@bryanbrattlof.com>
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 10 Sep 2025 17:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16557

On Wed Sep 10, 2025 at 6:48 AM CDT, Bryan Brattlof wrote:
> On September  9, 2025 thus sayeth Randolph Sapp:
>> On Tue Sep 9, 2025 at 9:56 AM CDT, Bryan Brattlof via lists.yoctoproject=
.org wrote:
>> > On September  4, 2025 thus sayeth Moteen Shah:
>> >> Add recipes to make initramfs image based on systemd.
>> >> The image will package boot essential and other modules
>> >> which will be modprobed by initramfs udev once the inbuilt
>> >> drivers gets probed.
>> >>=20
>> >> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> >> ---
>> >>  .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
>> >>  .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++=
++
>> >>  2 files changed, 54 insertions(+)
>> >>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-=
initramfs.bb
>> >>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramf=
s.bb
>> >>=20
>> >> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initram=
fs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>> >> new file mode 100644
>> >> index 00000000..5d2ff390
>> >> --- /dev/null
>> >> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>> >> @@ -0,0 +1,5 @@
>> >> +SUMMARY =3D "Minimal initramfs for boot requirements"
>> >> +
>> >> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>> >> +
>> >> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>> >> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb b/=
meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>> >> new file mode 100644
>> >> index 00000000..4cebf595
>> >> --- /dev/null
>> >> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>> >> @@ -0,0 +1,49 @@
>> >> +SUMMARY =3D "TI SDK super minimal base image for initramfs"
>> >> +
>> >> +DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intende=
d as\
>> >> + bare system, this image does not package the kernel in the\
>> >> + standard /boot folder in rootfs. Instead, it provides a base\
>> >> + rootfs allowing kernel to be deployed elsewhere\
>> >> + (tftp/separate boot partition/jtag log etc..) and boot\
>> >> + the image.\
>> >> +"
>> >> +
>> >> +LICENSE =3D "MIT"
>> >> +
>> >> +inherit core-image
>> >> +
>> >> +IMAGE_FEATURES:remove =3D "package-management"
>> >> +
>> >> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>> >> +
>> >> +#INITRAMFS_MAXSIZE =3D "65536"
>> >> +#IMAGE_OVERHEAD_FACTOR =3D "1"
>> >> +
>> >> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>> >> +
>> >> +INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-ud=
ev initramfs-module-nfsrootfs"
>> >> +
>> >> +MODULES =3D "\
>> >> +    kernel-module-cdns-pltfrm \
>> >> +    kernel-module-ti-j721e-ufs \
>> >> +    kernel-module-tps6594-i2c \
>> >> +"
>> >
>> > Are these all the modules we'll need? Is everything else build-in the=
=20
>> > default defconfig? or are we expecting this list to expand as more=20
>> > platforms start migrating to this?
>> >
>> > ~Bryan
>>=20
>> Should this instead be defined per machine with
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS?
>>=20
>> https://docs.yoctoproject.org/ref-manual/variables.html#term-MACHINE_ESS=
ENTIAL_EXTRA_RDEPENDS
>
> Yeah, I guess what I'm slowly realizing is we're adding roughly a 140MB=
=20
> binary to the critical path for the bootloaders (so long any boot KPI)=20
> all so we can have a PMIC driver as a builtin.
>
> All the distributions I can think of all modify the ARM64 defconfig in=20
> some way to better suit their distribution. Yocto even has the advantage=
=20
> of knowing what target they are building for. Should we instead carry a=
=20
> fragment, or use some other mechanism, to change the kernel's config so=
=20
> the PMIC driver is a builtin if needed by the target?
>
> ~Bryan

Use of conditional configs is simply reverting back to the schemes we were =
using
3+ years ago. Initramfs is big and slow, but it's standard and can be lever=
aged
across other distros easily as it's already been a production solution for =
them
for quite some time.

That being said, Yocto is *unique*, and what it doesn't do weird itself, it
leaves for the implementer to make weird in their own way. I guess it doesn=
't
really matter if we don't care about having a uniform bootflow across distr=
os,
but that sounds like hell.

- Randolph

