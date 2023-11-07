Return-Path: <b-liu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93971C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 22:19:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.34612.1699395589083660528
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 14:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=dKbtUrfc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: b-liu@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7MJjC7080170;
	Tue, 7 Nov 2023 16:19:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699395585;
	bh=ssbRLtSZhdhMfm9/+CGkN9DaU28VPAHgIwPpoaQstQ0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dKbtUrfc8QZHGa8h2p/EvlDKWVIqueTWVwKwcqXs2kbUEsgv7AzxKCeUaTZNs0GMg
	 tIAZSpid2IntF3gPOWEKZZXe7yu+sJQrEvfl+gaYlvuFcQPACUu93vEl6mxVZEHwUF
	 w1cNqbs4bzJJN/iZQ8CcAzxfB5Rwwe9mUbmuPG8A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7MJjF0005386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 16:19:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 16:19:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 16:19:44 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7MJil5111885;
	Tue, 7 Nov 2023 16:19:44 -0600
Date: Tue, 7 Nov 2023 16:19:44 -0600
From: Bin Liu <b-liu@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add
 code to not fail on tar error
Message-ID: <20231107221944.dybbybpqvwj54kl4@iaqt7>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
 <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
 <20231103211745.GO2408@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20231103211745.GO2408@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3A7MJjC7080170
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Nov 2023 22:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15001

Hi,

On Fri, Nov 03, 2023 at 05:17:45PM -0400, Denys Dmytriyenko wrote:
> On Fri, Nov 03, 2023 at 11:18:31AM -0500, Ryan Eatmon via lists.yoctopr=
oject.org wrote:
> >=20
> >=20
> > On 11/2/2023 3:37 PM, Bin Liu wrote:
> > >Hi,
> > >
> > >On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote:
> > >>Hi Ryan,
> > >>
> > >>On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
> > >>>
> > >>>
> > >>>On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
> > >>>>On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
> > >>>>lists.yoctoproject.org wrote:
> > >>>>>We want to add an image into the core bundle, but that image doe=
s not
> > >>>>>have any opkg .control files.=A0 tar apparently errors out if yo=
u ask it
> > >>>>>to extract out files but the files are not in the archive, and t=
he
> > >>>>>recipes are setup that if any of the commands in the shell error=
 out,
> > >>>>>then the entire recipe fails.
> > >>>>>
> > >>>>>Simple fix, add an || (or) condition to the tar command to print=
 a
> > >>>>>message that there were not any control files instead of errorin=
g out.
> > >>>>
> > >>>>So, simply bypassing tar error due to missing *.control files sti=
ll
> > >>>>won't
> > >>>>enable you to properly generate the SW manifest. As those *.contr=
ol
> > >>>>files
> > >>>>from individual packages are parsed to extract the license inform=
ation.
> > >>>>And they are missing because tiny image specifically disables "pa=
ckage
> > >>>>management" to save on space. Therefore tiny image was not includ=
ed in
> > >>>>the bundle, since it doesn't generate the SW manifest.
> > >>>
> > >>>And this is why I sent the patch in rather than just taking it. Th=
is
> > >>>patch was a response to Chirag running in the above error when try=
ing to
> > >>>add the tiny image into the core bundle in the processor sdk.
> > >>>
> > >>>So, why do we want to add tiny to the bundle?
> > >>
> > >>
> > >>We got a requirement from Bin Liu to add tiny-image in
> > >>/board-support/prebuilt-images/ of the SDK bundle.
> > >>I'm not sure about the "why do we want it to the bundle" part. Addi=
ng Bin to
> > >>provide more insights on the requirement part.
> > >
> > >The tiny image is very small and uses SysVInit. It has been used in =
many
> > >use cases, initramfs is the most important one as far as I am aware.
> >=20
> >=20
> > All of the images now use systemd.
>=20
> Correction - all of the images in a single build use the same init mana=
ger,=20
> which by default is systemd.

systermd or sysvinit is not a concern, as long as there is a "tiny"
image for initramfs use cases.

>=20
> There used to be a hack that would force tiny image to use SysVinit, ev=
en=20
> when other images use systemd. It was non-standard and problematic, so =
was=20
> removed recently.
>=20
> There is still a way to control init manager for all Arago images by se=
tting=20
> ARAGO_SYSVINIT=3D"1" or more directly INIT_MANAGER=3D"sysvinit". But th=
at would=20
> affect all images, not just tiny.
>=20
> And if you really want tiny to use SysVinit and other images to use sys=
temd,=20
> you have to build them separately and you cannot have tiny in tisdk bun=
dle.
>=20
>=20
> > The issue comes down to license compliance.  The core bundle has the
> > requirement to produce a software license manifest for all of the
> > items within the image.  That manifest is generated off of the opkg
> > control files.  But the tiny image does not have opkg installed as
> > it is not needed for the purpose of that image.  So we cannot gather
> > the manifest information from the tiny image.
> >=20
> > So we have an impossible situation here.  We cannot include the tiny
> > image without violation the manifest requirement.  And given that
> > the tiny image is mainly meant for wakeup efforts, I don't see a
> > need to include it in the bundle.  If someone wants the tiny image,

I guess by "wakeup efforts" you meant TI internal consumption? No,
customers often used it for custom board bringup. The importance has no
difference from the "tiny" image to other FS images in the bundle.

-Bin.

> > they can always run bitbake and generate it.  It should not take
> > that much time given that it contains almost no packages within it.
> >=20
> >=20
> > >-Bin.
> > >
> > >>
> > >>Regards,
> > >>Chirag
> > >>
> > >>> =A0 Since tiny should be a subset of the other images, is there a=
nything
> > >>>not covered in the software manifest that should prevent this patc=
h?
> > >>>
> > >>>>
> > >>>>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > >>>>>---
> > >>>>> =A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++-=
-
> > >>>>> =A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>>>
> > >>>>>diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > >>>>>b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > >>>>>index 14d14f08..b9c63610 100644
> > >>>>>--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > >>>>>+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > >>>>>@@ -405,10 +405,10 @@ sw_manifest_target() {
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 # Only extract tar.gz or tar.bz2 ty=
pes
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > >>>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> > >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> > >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> > >>>>>control files found in ${image}"
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 elif [ -e
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > >>>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> > >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> > >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> > >>>>>control files found in ${image}"
> > >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
> > >>>>> =A0=A0=A0=A0=A0 done
> > >>>>> =A0 --
> > >>>>>2.17.1
> > >>>

