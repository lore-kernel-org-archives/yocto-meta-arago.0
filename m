Return-Path: <b-liu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7C2C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:25:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.52714.1699021513350533513
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Ojiydtzh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: b-liu@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3EP7pR041036;
	Fri, 3 Nov 2023 09:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699021507;
	bh=9MxU6dfwa5GG3QxX/8RQu0K0yBayftVWSgJlekVREaM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OjiydtzhbpsmihhY+3pXg2d0EvfCdspsu+q9ruZW04mLkz9qQ7tOtKLvsWo5bqFlR
	 bLpfsvCgSYXKIhLKBW/q/zhbXRozDxmc5d890/2on5F1u+GV2ePOtr+5RFjuRwmaVq
	 v3WOBC1WCx8M9g45M/0aXjokhRgSDRWJ01oflMns=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3EP7DE084273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 09:25:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 09:25:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 09:25:07 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3EP7B3023617;
	Fri, 3 Nov 2023 09:25:07 -0500
Date: Fri, 3 Nov 2023 09:25:07 -0500
From: Bin Liu <b-liu@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH 1/2]
 tisdk-sw-manifest: Add code to not fail on tar error
Message-ID: <20231103142507.z6mvejh6ktyx3h6w@iaqt7>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20231102203703.gy4myj7fqayadhgw@iaqt7>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3A3EP7pR041036
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14993

Resend my response after subscribed to the mailinglist.
-Bin.

On Thu, Nov 02, 2023 at 03:37:03PM -0500, Bin Liu wrote:
> Hi,
>=20
> On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote:
> > Hi Ryan,
> >=20
> > On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
> > >=20
> > >=20
> > > On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
> > > > On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
> > > > lists.yoctoproject.org wrote:
> > > > > We want to add an image into the core bundle, but that image do=
es not
> > > > > have any opkg .control files.=A0 tar apparently errors out if y=
ou ask it
> > > > > to extract out files but the files are not in the archive, and =
the
> > > > > recipes are setup that if any of the commands in the shell erro=
r out,
> > > > > then the entire recipe fails.
> > > > >=20
> > > > > Simple fix, add an || (or) condition to the tar command to prin=
t a
> > > > > message that there were not any control files instead of errori=
ng out.
> > > >=20
> > > > So, simply bypassing tar error due to missing *.control files sti=
ll
> > > > won't
> > > > enable you to properly generate the SW manifest. As those *.contr=
ol
> > > > files
> > > > from individual packages are parsed to extract the license inform=
ation.
> > > > And they are missing because tiny image specifically disables "pa=
ckage
> > > > management" to save on space. Therefore tiny image was not includ=
ed in
> > > > the bundle, since it doesn't generate the SW manifest.
> > >=20
> > > And this is why I sent the patch in rather than just taking it. Thi=
s
> > > patch was a response to Chirag running in the above error when tryi=
ng to
> > > add the tiny image into the core bundle in the processor sdk.
> > >=20
> > > So, why do we want to add tiny to the bundle?
> >=20
> >=20
> > We got a requirement from Bin Liu to add tiny-image in
> > /board-support/prebuilt-images/ of the SDK bundle.
> > I'm not sure about the "why do we want it to the bundle" part. Adding=
 Bin to
> > provide more insights on the requirement part.
>=20
> The tiny image is very small and uses SysVInit. It has been used in man=
y
> use cases, initramfs is the most important one as far as I am aware.
>=20
> -Bin.
>=20
> >=20
> > Regards,
> > Chirag
> >=20
> > > =A0 Since tiny should be a subset of the other images, is there any=
thing
> > > not covered in the software manifest that should prevent this patch=
?
> > >=20
> > > >=20
> > > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > > ---
> > > > > =A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++-=
-
> > > > > =A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclas=
s
> > > > > b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > index 14d14f08..b9c63610 100644
> > > > > --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > @@ -405,10 +405,10 @@ sw_manifest_target() {
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 # Only extract tar.gz or tar.bz2 ty=
pes
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> > > > > control files found in ${image}"
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 elif [ -e
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> > > > > ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> > > > > ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> > > > > control files found in ${image}"
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
> > > > > =A0=A0=A0=A0=A0 done
> > > > > =A0 --
> > > > > 2.17.1
> > >=20

