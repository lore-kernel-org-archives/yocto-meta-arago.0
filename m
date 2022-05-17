Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5E8C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 17:48:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.696.1652809718881940614
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 May 2022 10:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=K8Qfzbrk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24HHmYok052105;
	Tue, 17 May 2022 12:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652809714;
	bh=r5HISOmuleSTBKD+wuX64iyfDQZnPSrEUQQl2y8arYE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K8QfzbrkSVGEF03i20hmVF5O0/rT3frVOuPvejfV5vKfGfpaLPqDyU7Dbd3IdPv71
	 runnlJsH7yTsgh5U1s+ibfDfW1Cw15+BtzWK++VpDEP4YExbKnXq49vTB2z3JggDTj
	 lxzVypjFx/iKAfy6jnCFJaMBoxDi/1Tg7yGRzqaM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24HHmYh5115422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 12:48:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 12:48:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 12:48:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24HHmXaU099974;
	Tue, 17 May 2022 12:48:33 -0500
Date: Tue, 17 May 2022 12:48:33 -0500
From: Nishanth Menon <nm@ti.com>
To: "M, Aparna" <a-m1@ti.com>
CC: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "denis@denix.org" <denis@denix.org>,
        "Thakkar, Devarsh" <devarsht@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add
 ti-sci-firmware binary to prebuilt-images directory of SDK
Message-ID: <20220517174833.hlqllwsrsn7gfr6b@audience>
References: <20220512152846.661-1-a-m1@ti.com>
 <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
 <eb5fe2f387a34ed291b0f862ca078f6f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <eb5fe2f387a34ed291b0f862ca078f6f@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id
 24HHmYok052105
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 May 2022 17:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13865

On 02:57-20220513, M, Aparna wrote:
>=20
> On 12/05/22 21:05, Ryan Eatmon wrote:
> >
> >
> > On 5/12/2022 10:28, Aparna M wrote:
> >> Add ti-sci-firmware binaries required for uboot build to the
> >> prebuilt-images directory of SDK.
> >>
> >> Signed-off-by: Aparna M <a-m1@ti.com>
> >> ---
> >> =A0 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +=
++
> >> =A0 1 file changed, 3 insertions(+)
> >>
> >> This patch is dependent on
> >> https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_patch_ti_sci_=
fw/91058279=20
> >>
>=20
> As per suggestions on previous patch, this is the new patch dependency:
> https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_patch/91076133
>=20
> >>
> >> diff --git=20
> >> a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb=20
> >> b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> >> index 9ebcbb0e..d5a11f36 100644
> >> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> >> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> >> @@ -21,6 +21,9 @@ DEPLOY_IMAGES_NAME_append_j7-evm =3D " sysfw.itb"
> >> =A0 DEPLOY_IMAGES_NAME_append_j7-hs-evm =3D " sysfw.itb"
> >> =A0 DEPLOY_IMAGES_NAME_append_am65xx-evm =3D "=20
> >> ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb=20
> >> sysfw-am65x_sr2-evm.itb"
> >> =A0 DEPLOY_IMAGES_NAME_append_j7-evm =3D " ti-fs-firmware-j721e-gp.b=
in"
> >> +DEPLOY_IMAGES_NAME_append_am64xx-evm =3D " ti-sci-firmware-am64x-gp=
.bin"
> >> +DEPLOY_IMAGES_NAME_append_am64xx-hs-evm =3D "=20
> >> ti-sci-firmware-am64x-hs-cert.bin ti-sci-firmware-am64x-hs-enc.bin=20
> >> fitImage-its.its"
> >> +DEPLOY_IMAGES_NAME_append_am62xx-evm =3D " ti-fs-firmware-am62x-gp.=
bin=20
> >> ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >> =A0 =A0 ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
> >> =A0 export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}"
> >
> >
> > Same as the other patch on meta-ti.=A0 I think the=20
> > ipc_echo_testb_mcu1_0_release_strip.xer5f file needs to not be in thi=
s=20
> > file.=A0 The other changes are fine, but remove that one.
>=20
> The ipc_echo_testb_mcu1_0_release_strip.xer5f file is required in the=20
> SDK for toplevel makefile uboot build for am62xx-evm. So it needs to be=
=20
> packaged in the prebuilt-images folder of the SDK.


I dont understand why are we forcing this dependency? u-boot is built
from source, the firmwares are in linux-firmware repositories. why
are'nt the top level makefiles using the linux-firmware repo to pick
up the correct binaries?

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D

