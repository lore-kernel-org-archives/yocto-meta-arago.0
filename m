Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0ADCCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 23:14:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.998.1777677271715716100
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 May 2026 16:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CAAEE409EB;
	Fri,  1 May 2026 23:14:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75rRsKDbvGtw; Fri,  1 May 2026 23:14:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6DDB440021;
	Fri,  1 May 2026 23:14:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B424817CF00; Fri,  1 May 2026 19:14:24 -0400 (EDT)
Date: Fri, 1 May 2026 19:14:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-deshmukh@ti.com
Cc: meta-arago@lists.yoctoproject.org, afd@ti.com, c-shilwant@ti.com,
	denys@ti.com, v-singh1@ti.com
Subject: Re: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file
 packaging for headers and symlinks
Message-ID: <20260501231424.GM4186@denix.org>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
 <20260423075408.1886225-2-p-deshmukh@ti.com>
 <20260427153537.GG4186@denix.org>
 <42b22397-721a-4d7c-a3e0-ab62ab86a537@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <42b22397-721a-4d7c-a3e0-ab62ab86a537@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 May 2026 23:14:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17512

On Wed, Apr 29, 2026 at 02:05:38PM +0530, Pratham Deshmukh via lists.yoct=
oproject.org wrote:
>=20
> On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
> >On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.y=
octoproject.org wrote:
> >>The TensorFlow Lite recipe was missing proper packaging directives fo=
r
> >>development files, causing two issues:
> >>
> >>1. Headers installed to ${includedir} were not being packaged into an=
y
> >>    specific package, resulting in missing headers in the final rootf=
s
> >>    despite being built and installed correctly.
> >>
> >>2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite=
.so)
> >>    were incorrectly placed in the main runtime package instead of th=
e
> >>    development package, triggering QA error [dev-so].
> >>
> >>Add FILES:${PN}-dev to properly assign development files:
> >>    - ${includedir}/* for TensorFlow Lite headers
> >>    - libdir}/lib*.so for unversioned shared library symlinks
> >>
> >>Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> >>---
> >>  .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 ++=
+++
> >>  1 file changed, 5 insertions(+)
> >>
> >>diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tens=
orflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-li=
te/tensorflow-lite_2.20.0.bb
> >>index 559ec5ef..75889b7e 100644
> >>--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite_2.20.0.bb
> >>+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite_2.20.0.bb
> >>@@ -229,6 +229,11 @@ FILES:${PN}-tools =3D " \
> >>      /opt/* \
> >>  "
> >>+FILES:${PN}-dev +=3D " \
> >>+    ${includedir}/* \
> >>+    ${libdir}/lib*.so \
> >These are part of the defaults:
> >https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.=
conf#n356
> >
> >I'm not sure your change even does anything here...
> >
> Hi Denys
>=20
> Thanks for the insights.
> Yes there's no need for these changes as it is already
>=20
> part of defaults.=A0 Also, without these changes the headers are
>=20
> included in the rootfs. So this patch can be ignored/rejected.

This part I did not understand - normally you don't want the header files=
 to=20
be included in the rootfs, only into the SDK...

Can you please double-check this works as expected?


> Thanks & Regards,
> Pratham
>=20
> >>+"
> >>+
> >>  FILES:python3-${PN} =3D " \
> >>      ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
> >>      ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
> >>--=20
> >>2.34.1

