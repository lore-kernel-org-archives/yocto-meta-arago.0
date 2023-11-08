Return-Path: <b-liu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92665C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:21:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14870.1699453271325798449
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 06:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=sQ6BOjob;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: b-liu@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8EL8mk004724;
	Wed, 8 Nov 2023 08:21:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699453268;
	bh=TCmOOn644k+GXk17xAfx5ITfQilxXhm8eKbxn2mIfGo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sQ6BOjobv3w8p7qW/sMiHZ0mSZOLH3ZIORODTACpnwDkWPVB8Nz+PGdOx7M1vycCf
	 6x4sPbBoEgVKLItDrV47oIRodIB3oAi5K7Cjb6zNCbPsTE7HI4ryHF0eDa2V4qXFcX
	 d1ZRKu5tgM6XeAfINXxI3YjmKjLbmX1BVHPRIRPc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8EL8Bv084099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 08:21:08 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 08:21:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 08:21:08 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8EL8mx072664;
	Wed, 8 Nov 2023 08:21:08 -0600
Date: Wed, 8 Nov 2023 08:21:08 -0600
From: Bin Liu <b-liu@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add
 code to not fail on tar error
Message-ID: <20231108142108.l7iem63r6af5dfbg@iaqt7>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
 <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
 <20231103211745.GO2408@denix.org>
 <20231107221944.dybbybpqvwj54kl4@iaqt7>
 <bcbfaff6-dafa-4aad-9ae1-a8bbcc3ef610@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <bcbfaff6-dafa-4aad-9ae1-a8bbcc3ef610@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3A8EL8mk004724
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 14:21:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15006

Hi Ryan,

On Wed, Nov 08, 2023 at 08:12:27AM -0600, Ryan Eatmon wrote:
>=20
>=20
> On 11/7/2023 4:19 PM, Bin Liu wrote:
> > Hi,
> >=20
> > On Fri, Nov 03, 2023 at 05:17:45PM -0400, Denys Dmytriyenko wrote:
> > > On Fri, Nov 03, 2023 at 11:18:31AM -0500, Ryan Eatmon via lists.yoc=
toproject.org wrote:
> > > >=20
> > > >=20
> > > > On 11/2/2023 3:37 PM, Bin Liu wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote=
:
> > > > > > Hi Ryan,
> > > > > >=20
> > > > > > On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wro=
te:
> > > > > > >=20
> > > > > > >=20
> > > > > > > On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
> > > > > > > > On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
> > > > > > > > lists.yoctoproject.org wrote:
> > > > > > > > > We want to add an image into the core bundle, but that =
image does not
> > > > > > > > > have any opkg .control files.=A0 tar apparently errors =
out if you ask it
> > > > > > > > > to extract out files but the files are not in the archi=
ve, and the
> > > > > > > > > recipes are setup that if any of the commands in the sh=
ell error out,
> > > > > > > > > then the entire recipe fails.
> > > > > > > > >=20
> > > > > > > > > Simple fix, add an || (or) condition to the tar command=
 to print a
> > > > > > > > > message that there were not any control files instead o=
f erroring out.
> > > > > > > >=20
> > > > > > > > So, simply bypassing tar error due to missing *.control f=
iles still
> > > > > > > > won't
> > > > > > > > enable you to properly generate the SW manifest. As those=
 *.control
> > > > > > > > files
> > > > > > > >from individual packages are parsed to extract the license=
 information.
> > > > > > > > And they are missing because tiny image specifically disa=
bles "package
> > > > > > > > management" to save on space. Therefore tiny image was no=
t included in
> > > > > > > > the bundle, since it doesn't generate the SW manifest.
> > > > > > >=20
> > > > > > > And this is why I sent the patch in rather than just taking=
 it. This
> > > > > > > patch was a response to Chirag running in the above error w=
hen trying to
> > > > > > > add the tiny image into the core bundle in the processor sd=
k.
> > > > > > >=20
> > > > > > > So, why do we want to add tiny to the bundle?
> > > > > >=20
> > > > > >=20
> > > > > > We got a requirement from Bin Liu to add tiny-image in
> > > > > > /board-support/prebuilt-images/ of the SDK bundle.
> > > > > > I'm not sure about the "why do we want it to the bundle" part=
. Adding Bin to
> > > > > > provide more insights on the requirement part.
> > > > >=20
> > > > > The tiny image is very small and uses SysVInit. It has been use=
d in many
> > > > > use cases, initramfs is the most important one as far as I am a=
ware.
> > > >=20
> > > >=20
> > > > All of the images now use systemd.
> > >=20
> > > Correction - all of the images in a single build use the same init =
manager,
> > > which by default is systemd.
> >=20
> > systermd or sysvinit is not a concern, as long as there is a "tiny"
> > image for initramfs use cases.
> >=20
> > >=20
> > > There used to be a hack that would force tiny image to use SysVinit=
, even
> > > when other images use systemd. It was non-standard and problematic,=
 so was
> > > removed recently.
> > >=20
> > > There is still a way to control init manager for all Arago images b=
y setting
> > > ARAGO_SYSVINIT=3D"1" or more directly INIT_MANAGER=3D"sysvinit". Bu=
t that would
> > > affect all images, not just tiny.
> > >=20
> > > And if you really want tiny to use SysVinit and other images to use=
 systemd,
> > > you have to build them separately and you cannot have tiny in tisdk=
 bundle.
> > >=20
> > > FS images in the bundle.
> > > > The issue comes down to license compliance.  The core bundle has =
the
> > > > requirement to produce a software license manifest for all of the
> > > > items within the image.  That manifest is generated off of the op=
kg
> > > > control files.  But the tiny image does not have opkg installed a=
s
> > > > it is not needed for the purpose of that image.  So we cannot gat=
her
> > > > the manifest information from the tiny image.
> > > >=20
> > > > So we have an impossible situation here.  We cannot include the t=
iny
> > > > image without violation the manifest requirement.  And given that
> > > > the tiny image is mainly meant for wakeup efforts, I don't see a
> > > > need to include it in the bundle.  If someone wants the tiny imag=
e,
> >=20
> > I guess by "wakeup efforts" you meant TI internal consumption? No,
> > customers often used it for custom board bringup. The importance has =
no
> > difference from the "tiny" image to other
> >=20
> > -Bin.
>=20
> The issue is not if customers find the image useful, the issue is licen=
se
> reporting compliance we have for including the prebuilt image as part o=
f the
> core-bundle.  Since we cannot auto generate the license manifest since =
our
> code uses the opkg framework to extract that info, we cannot generate t=
he
> license manifest for the tiny image.

Understood the challenge. My response was purely for the specific
comments about systemd vs sysvinit, or wakeup efforts, etc...

-Bin.

>=20
> A new system for correctly generating the license manifest would have t=
o be
> devised to support this request.  At this time, we cannot include the t=
iny
> image in the core-bundle.  A must larger effort to revamp the manifest =
code
> would have be done to correctly fulfill this corporate requirement.
>=20
> And there is nothing stopping a customer from setting up a yocto build =
and
> running:
>=20
> MACHINE=3D????? bitbake tisdk-tiny-image
>=20
> We just cannot, currently, do it for them and include it in the prebuil=
t
> bundle.
>=20
>=20
>=20
> > > > they can always run bitbake and generate it.  It should not take
> > > > that much time given that it contains almost no packages within i=
t.
> > > >=20
> > > >=20
> > > > > -Bin.
> > > > >=20
> > > > > >=20
> > > > > > Regards,
> > > > > > Chirag
> > > > > >=20
> > > > > > >  =A0 Since tiny should be a subset of the other images, is =
there anything
> > > > > > > not covered in the software manifest that should prevent th=
is patch?
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > > > > > > ---
> > > > > > > > >  =A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclas=
s | 4 ++--
> > > > > > > > >  =A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > >=20
> > > > > > > > > diff --git a/meta-arago-distro/classes/tisdk-sw-manifes=
t.bbclass
> > > > > > > > > b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > > > > > index 14d14f08..b9c63610 100644
> > > > > > > > > --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbcla=
ss
> > > > > > > > > +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbcla=
ss
> > > > > > > > > @@ -405,10 +405,10 @@ sw_manifest_target() {
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 # Only extract tar.gz or t=
ar.bz2 types
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -=
C
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -=
C
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control || ech=
o "No
> > > > > > > > > control files found in ${image}"
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 elif [ -e
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -=
C
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -=
C
> > > > > > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control || ech=
o "No
> > > > > > > > > control files found in ${image}"
> > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
> > > > > > > > >  =A0=A0=A0=A0=A0 done
> > > > > > > > >  =A0 --
> > > > > > > > > 2.17.1
> > > > > > >=20
>=20
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

