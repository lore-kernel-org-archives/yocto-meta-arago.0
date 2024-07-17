Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F19C3DA60
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 17:16:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3868.1721236565167849091
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 10:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E58240C67;
	Wed, 17 Jul 2024 17:16:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 313Mv4_lL7FP; Wed, 17 Jul 2024 17:16:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 584EC40A03;
	Wed, 17 Jul 2024 17:16:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14518163FF6; Wed, 17 Jul 2024 13:16:03 -0400 (EDT)
Date: Wed, 17 Jul 2024 13:16:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [master][PATCH] ti-llvm: adopt an LLVM fix for
 buildpaths errors
Message-ID: <20240717171602.GE17572@denix.org>
References: <20240716015013.3051611-1-denis@denix.org>
 <20240716015013.3051611-2-denis@denix.org>
 <17E2D909CD64B7EE.6764@lists.yoctoproject.org>
 <17E2DC4752C1D1A6.6764@lists.yoctoproject.org>
 <1de9d49f-4f0b-4f34-b956-02d0acd98290@ti.com>
 <20240717165638.GD17572@denix.org>
 <c65c9f0a-b038-4abc-9c83-6469ae0bdeb2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c65c9f0a-b038-4abc-9c83-6469ae0bdeb2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Jul 2024 17:16:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15459

On Wed, Jul 17, 2024 at 12:03:57PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 7/17/2024 11:56 AM, Denys Dmytriyenko wrote:
> >On Wed, Jul 17, 2024 at 08:45:58AM -0500, Ryan Eatmon wrote:
> >>
> >>
> >>On 7/16/2024 8:36 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>>
> >>>
> >>>On 7/16/2024 7:37 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>>>
> >>>>
> >>>>On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
> >>>>>From: Denys Dmytriyenko <denys@konsulko.com>
> >>>>>
> >>>>>Make sure llvm-configs doesn't have absolute build paths.
> >>>>>
> >>>>>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>>>>---
> >>>>> =A0 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 +++=
++
> >>>>> =A0 1 file changed, 5 insertions(+)
> >>>>>
> >>>>>diff --git
> >>>>>a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >>>>>b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >>>>>index 4b990b7f..810c603b 100644
> >>>>>--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >>>>>+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >>>>>@@ -62,6 +62,11 @@ EXTRA_OECONF +=3D "
> >>>>>--enable-targets=3D"host,arm,c6000,msp430" \
> >>>>> =A0 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}"
> >>>>>LIBXML2_LIBS=3D"${LIBXML2_LIBS}""
> >>>>>+# patch out build host paths for reproducibility
> >>>>>+do_compile:prepend() {
> >>>>>+=A0=A0=A0=A0=A0=A0=A0 sed -i -e "s,${WORKDIR},,g"
> >>>>>${LLVM_BUILD_DIR}/tools/llvm-config/Release/BuildVariables.inc
> >>>>>+}
> >>>>>+
> >>>>> =A0 do_compile:class-native() {
> >>>>> =A0=A0=A0 cd ${LLVM_BUILD_DIR}
> >>>>
> >>>>I'm getting build errors with this.
> >>>>
> >>>>native:
> >>>>
> >>>>sed: can't read /scratch/jenkins_builds/arago-master-wip/build/buil=
d/arago-tmp-default-glibc/work/x86_64-linux/ti-llvm3.6-native/3.6/llvm-3.=
6.build/tools/llvm-config/Release/BuildVariables.inc:
> >>>>No such file or directory
> >>>>
> >>>>nativesdk:
> >>>>
> >>>>sed: can't read /scratch/jenkins_builds/arago-master-wip/build/buil=
d/arago-tmp-default-glibc/work/x86_64-nativesdk-arago-linux/nativesdk-ti-=
llvm3.6/3.6/llvm-3.6.build/tools/llvm-config/Release/BuildVariables.inc:
> >>>>No such file or directory
> >>>>
> >>>
> >>>I think that during the build it creates this file, but before the
> >>>builds the files does not exist yet.=A0 Maybe you tested this
> >>>against a built directory where the file existed but from a clean
> >>>dir it fails?
> >>>
> >>
> >>Also, it looks the contents of the BuildVariables.inc might be in a
> >>"bad" state with this change.  But I could be wrong as I don't know
> >>how all of this package works.
> >>
> >>#define LLVM_SRC_ROOT "/git"
> >>#define LLVM_OBJ_ROOT "/llvm-3.6.build"
> >>
> >>By just replacing the WORKDIR with "" we are pointing this file to
> >>the root directory where I doubt these things will be living.
> >>Again, without knowing how this package works and uses those two
> >>variables I can't speak as to the correctness of this.  I agree it
> >>fixes the buildpaths issue, but does it break the software package
> >>at that point?
> >
> >This is exactly what OE-Core does with upstream LLVM.
> >
>=20
> Good enough for me then. =3D)

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D55c1cccff5afc1230d3c2287bc0fdaa579bf2743

The only difference is that much newer LLVM 18.1.8 (vs. 3.6 here) apparen=
tly=20
generates BuildVariables.inc file in do_configure() and not in do_compile=
()
so it already exists for the sed command...

--=20
Denys

