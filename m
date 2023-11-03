Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F825C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 16:51:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.52448.1699019678988304771
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 06:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eGsQtWnH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: b-liu@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3DsXlb091922;
	Fri, 3 Nov 2023 08:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699019673;
	bh=9MxU6dfwa5GG3QxX/8RQu0K0yBayftVWSgJlekVREaM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eGsQtWnHGa9clkL6dkID+Y9zmk8WUNcvguKJ2NimDKmPnwtibmo0xUDZx6LB9o8FN
	 Jv/heXDwqjpvoXqfHfhA/mG7RTA8CG4HoERjL/9JYngVV9TqPqxv1+DwiqLFSgD9Je
	 26RumqfBsYvqpIk8RTqRFFl9G85UzlrUlmRqZH4Q=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3DsXJE065956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 08:54:33 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 08:54:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 08:54:32 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3DsWw6081524;
	Fri, 3 Nov 2023 08:54:32 -0500
Date: Fri, 3 Nov 2023 08:54:32 -0500
From: Bin Liu <b-liu@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add code to not fail on tar error
Message-ID: <20231103135432.3l3uf3ukwe2o26qt@iaqt7>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
MIME-Version: 1.0
In-Reply-To: <20231102203703.gy4myj7fqayadhgw@iaqt7>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3A3DsXlb091922
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Nov 2023 16:51:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14996

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
> > > > > We want to add an image into the core bundle, but that image does=
 not
> > > > > have any opkg .control files.=A0 tar apparently errors out if you=
 ask it
> > > > > to extract out files but the files are not in the archive, and th=
e
> > > > > recipes are setup that if any of the commands in the shell error =
out,
> > > > > then the entire recipe fails.
> > > > >=20
> > > > > Simple fix, add an || (or) condition to the tar command to print =
a
> > > > > message that there were not any control files instead of erroring=
 out.
> > > >=20
> > > > So, simply bypassing tar error due to missing *.control files still
> > > > won't
> > > > enable you to properly generate the SW manifest. As those *.control
> > > > files
> > > > from individual packages are parsed to extract the license informat=
ion.
> > > > And they are missing because tiny image specifically disables "pack=
age
> > > > management" to save on space. Therefore tiny image was not included=
 in
> > > > the bundle, since it doesn't generate the SW manifest.
> > >=20
> > > And this is why I sent the patch in rather than just taking it. This
> > > patch was a response to Chirag running in the above error when trying=
 to
> > > add the tiny image into the core bundle in the processor sdk.
> > >=20
> > > So, why do we want to add tiny to the bundle?
> >=20
> >=20
> > We got a requirement from Bin Liu to add tiny-image in
> > /board-support/prebuilt-images/ of the SDK bundle.
> > I'm not sure about the "why do we want it to the bundle" part. Adding B=
in to
> > provide more insights on the requirement part.
>=20
> The tiny image is very small and uses SysVInit. It has been used in many
> use cases, initramfs is the most important one as far as I am aware.
>=20
> -Bin.
>=20
> >=20
> > Regards,
> > Chirag
> >=20
> > > =A0 Since tiny should be a subset of the other images, is there anyth=
ing
> > > not covered in the software manifest that should prevent this patch?
> > >=20
> > > >=20
> > > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > > ---
> > > > > =A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
> > > > > =A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > index 14d14f08..b9c63610 100644
> > > > > --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> > > > > @@ -405,10 +405,10 @@ sw_manifest_target() {
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 # Only extract tar.gz or tar.bz2 type=
s
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

