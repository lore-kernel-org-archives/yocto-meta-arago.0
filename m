Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F0AC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 21:17:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.65887.1699046273211964965
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 14:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23B2740CDC;
	Fri,  3 Nov 2023 21:17:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 885jA-0L15aU; Fri,  3 Nov 2023 21:17:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6ED0040CDB;
	Fri,  3 Nov 2023 21:17:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A7935163D43; Fri,  3 Nov 2023 17:17:45 -0400 (EDT)
Date: Fri, 3 Nov 2023 17:17:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Bin Liu <b-liu@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest:
 Add code to not fail on tar error
Message-ID: <20231103211745.GO2408@denix.org>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
 <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Nov 2023 21:17:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14997

On Fri, Nov 03, 2023 at 11:18:31AM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 11/2/2023 3:37 PM, Bin Liu wrote:
> >Hi,
> >
> >On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote:
> >>Hi Ryan,
> >>
> >>On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>>
> >>>
> >>>On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
> >>>>On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
> >>>>lists.yoctoproject.org wrote:
> >>>>>We want to add an image into the core bundle, but that image does =
not
> >>>>>have any opkg .control files.=A0 tar apparently errors out if you =
ask it
> >>>>>to extract out files but the files are not in the archive, and the
> >>>>>recipes are setup that if any of the commands in the shell error o=
ut,
> >>>>>then the entire recipe fails.
> >>>>>
> >>>>>Simple fix, add an || (or) condition to the tar command to print a
> >>>>>message that there were not any control files instead of erroring =
out.
> >>>>
> >>>>So, simply bypassing tar error due to missing *.control files still
> >>>>won't
> >>>>enable you to properly generate the SW manifest. As those *.control
> >>>>files
> >>>>from individual packages are parsed to extract the license informat=
ion.
> >>>>And they are missing because tiny image specifically disables "pack=
age
> >>>>management" to save on space. Therefore tiny image was not included=
 in
> >>>>the bundle, since it doesn't generate the SW manifest.
> >>>
> >>>And this is why I sent the patch in rather than just taking it. This
> >>>patch was a response to Chirag running in the above error when tryin=
g to
> >>>add the tiny image into the core bundle in the processor sdk.
> >>>
> >>>So, why do we want to add tiny to the bundle?
> >>
> >>
> >>We got a requirement from Bin Liu to add tiny-image in
> >>/board-support/prebuilt-images/ of the SDK bundle.
> >>I'm not sure about the "why do we want it to the bundle" part. Adding=
 Bin to
> >>provide more insights on the requirement part.
> >
> >The tiny image is very small and uses SysVInit. It has been used in ma=
ny
> >use cases, initramfs is the most important one as far as I am aware.
>=20
>=20
> All of the images now use systemd.

Correction - all of the images in a single build use the same init manage=
r,=20
which by default is systemd.

There used to be a hack that would force tiny image to use SysVinit, even=
=20
when other images use systemd. It was non-standard and problematic, so wa=
s=20
removed recently.

There is still a way to control init manager for all Arago images by sett=
ing=20
ARAGO_SYSVINIT=3D"1" or more directly INIT_MANAGER=3D"sysvinit". But that=
 would=20
affect all images, not just tiny.

And if you really want tiny to use SysVinit and other images to use syste=
md,=20
you have to build them separately and you cannot have tiny in tisdk bundl=
e.


> The issue comes down to license compliance.  The core bundle has the
> requirement to produce a software license manifest for all of the
> items within the image.  That manifest is generated off of the opkg
> control files.  But the tiny image does not have opkg installed as
> it is not needed for the purpose of that image.  So we cannot gather
> the manifest information from the tiny image.
>=20
> So we have an impossible situation here.  We cannot include the tiny
> image without violation the manifest requirement.  And given that
> the tiny image is mainly meant for wakeup efforts, I don't see a
> need to include it in the bundle.  If someone wants the tiny image,
> they can always run bitbake and generate it.  It should not take
> that much time given that it contains almost no packages within it.
>=20
>=20
> >-Bin.
> >
> >>
> >>Regards,
> >>Chirag
> >>
> >>> =A0 Since tiny should be a subset of the other images, is there any=
thing
> >>>not covered in the software manifest that should prevent this patch?
> >>>
> >>>>
> >>>>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>>---
> >>>>> =A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
> >>>>> =A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>>diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> >>>>>b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> >>>>>index 14d14f08..b9c63610 100644
> >>>>>--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> >>>>>+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> >>>>>@@ -405,10 +405,10 @@ sw_manifest_target() {
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 # Only extract tar.gz or tar.bz2 type=
s
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> >>>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xJf
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
> >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> >>>>>control files found in ${image}"
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 elif [ -e
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 then
> >>>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tar xzf
> >>>>>${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
> >>>>>${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
> >>>>>control files found in ${image}"
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
> >>>>> =A0=A0=A0=A0=A0 done
> >>>>> =A0 --
> >>>>>2.17.1
> >>>

