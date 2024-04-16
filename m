Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A86C04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 15:09:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23428.1713280171974410224
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 08:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58CFA40C82;
	Tue, 16 Apr 2024 15:09:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G16YB2XyCm8Y; Tue, 16 Apr 2024 15:09:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F11B40C2A;
	Tue, 16 Apr 2024 15:09:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E82D4163F16; Tue, 16 Apr 2024 11:09:26 -0400 (EDT)
Date: Tue, 16 Apr 2024 11:09:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] meta-arago-extras:
 packagegroups: Fix QA Issue
Message-ID: <20240416150926.GJ28791@denix.org>
References: <17C6AE87F40E31DD.13290@lists.yoctoproject.org>
 <2636a20d-6d1a-40d0-abc4-2d97653764b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2636a20d-6d1a-40d0-abc4-2d97653764b6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 15:09:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15292

On Tue, Apr 16, 2024 at 12:07:33PM +0530, Chirag Shilwant wrote:
> Just a head's up,
>=20
> Note that the reason to send the patch on scarthgap only is to ensure t=
hat
> we don't break compatibility with all the older releases we have listed=
 in
> LAYERSERIES_COMPAT in arago master [1] as "inherit_defer" was added
> in bitbake's latest versions
> and someone using arago master:HEAD & bitbake 2.0 for
> |kirkstone|based buildwill face build issues
> related to inherit_defer.
>=20
> [1]: https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-d=
istro/conf/layer.conf#n11

Ah, thanks for the clarification, I didn't see this reply and just commen=
ted=20
about master for the original patch.

That said, this raises the question whether master should get its=20
compatibility updated to not be compatible with kirkstone any more.


> On 16/04/24 11:53, Chirag Shilwant via lists.yoctoproject.org wrote:
> >- Since packagegroup.=E2=80=8Abbclass is using inherit_defer in oe-cor=
e,
> >some classes are now appearing after nativesdk resulting in
> >following QA errors. ``` QA Issue:
> >nativesdk-packagegroup-arago-tisdk-host: native/nativesdk class is
> >not inherited
> >ZjQcmQRYFpfptBannerStart
> >This message was sent from outside of Texas Instruments.
> >Do not click links or open attachments unless you recognize the
> >source of this email and know the content is safe. If you wish to
> >report this message to IT Security, please forward the message as
> >an attachment to phishing@list.ti.com
> >ZjQcmQRYFpfptBannerEnd
> >- Since packagegroup.bbclass is using inherit_defer in oe-core, some c=
lasses are
> >now appearing after nativesdk resulting in following QA errors.
> >
> >  ```
> >   QA Issue: nativesdk-packagegroup-arago-tisdk-host: native/nativesdk=
 class is not inherited last, this can result in unexpected behaviour. Cl=
asses inherited after native/nativesdk: allarch.bbclass [native-last]
> >   QA Issue: nativesdk-packagegroup-arago-qte-toolchain-host: native/n=
ativesdk class is not inherited last, this can result in unexpected behav=
iour. Classes inherited after native/nativesdk: allarch.bbclass [native-l=
ast]
> >
> >  ```
> >
> >- To fix this issue, use inherit_defer that was added in bitbake recen=
tly [1].
> >
> >[1]:https://urldefense.com/v3/__https://github.com/openembedded/bitbak=
e/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29__;!!G3vK!XlpMRQ0dPBA3Up=
6LIrRyo2n5gEKzSXWswqZ4IyG9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGLw=
0V9We6idkBab_$
> >
> >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >---
> >  .../nativesdk-packagegroup-arago-qte-toolchain-host.bb         | 3 +=
+-
> >  .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 +=
+-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-pa=
ckagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/p=
ackagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> >index 4d2a98ad..23c45abf 100644
> >--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegr=
oup-arago-qte-toolchain-host.bb
> >+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegr=
oup-arago-qte-toolchain-host.bb
> >@@ -2,7 +2,8 @@ DESCRIPTION =3D "Host packages for Qt Embedded SDK"
> >  PR =3D "r10"
> >  LICENSE =3D "MIT"
> >-inherit packagegroup nativesdk
> >+inherit packagegroup
> >+inherit_defer nativesdk
> >  RDEPENDS:${PN} =3D "\
> >      nativesdk-packagegroup-arago-tisdk-host \
> >diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-pa=
ckagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegr=
oups/nativesdk-packagegroup-arago-tisdk-host.bb
> >index 7e77d12f..92a80b6b 100644
> >--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegr=
oup-arago-tisdk-host.bb
> >+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegr=
oup-arago-tisdk-host.bb
> >@@ -2,7 +2,8 @@ SUMMARY =3D "Host packages for a standalone Arago SDK =
with TI tools"
> >  PR =3D "r2"
> >  LICENSE =3D "MIT"
> >-inherit packagegroup nativesdk
> >+inherit packagegroup
> >+inherit_defer nativesdk
> >  PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
> >--=20
> >2.34.1

