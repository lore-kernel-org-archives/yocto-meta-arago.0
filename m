Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D64EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 17:56:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.696.1687974972957436051
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 10:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F08BC40A20;
	Wed, 28 Jun 2023 17:56:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdtaEnYf_KYO; Wed, 28 Jun 2023 17:56:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B2756408CD;
	Wed, 28 Jun 2023 17:56:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E4A9163B7B; Wed, 28 Jun 2023 13:56:06 -0400 (EDT)
Date: Wed, 28 Jun 2023 13:56:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Ravi Gunasekaran <r-gunasekaran@ti.com>, Andrew Davis <afd@ti.com>,
	meta-arago@lists.yoctoproject.org, g-gupta@ti.com, praneeth@ti.com
Subject: Re: [master/kirkstone][PATCH v4 5/8] meta-arago-extras: sysrepo:
 Add libredblack needed for sysrepo
Message-ID: <20230628175606.GV1518@denix.org>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-6-r-gunasekaran@ti.com>
 <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
 <14804cd7-d828-3aa5-ea6d-6cac08b4213d@ti.com>
 <bb1fd022-ed27-728d-2db7-59182ae0cbb1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <bb1fd022-ed27-728d-2db7-59182ae0cbb1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 17:56:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14729

On Wed, Jun 28, 2023 at 10:52:26AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 6/27/2023 11:22 PM, Ravi Gunasekaran wrote:
> >Andrew,
> >
> >On 6/27/23 8:32 PM, Andrew Davis wrote:
> >>On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
> >>>libredblack is needed to build sysrepo. Add recipe for libredblack.
> >>>
> >>>The recipe is taken as-is from the commit 09f73e7 ("update for honis=
ter")
> >>>from the public repo [1].
> >>>
> >>>[1] - https://github.com/sartura/meta-sysrepo
> >>>
> >>>Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> >>>---
> >>>
> >>>Changes since v3:
> >>>----------------
> >>>No change
> >>>
> >>>Changes since v2:
> >>>---------------
> >>>Newly introduced in this series
> >>>
> >>> =A0 .../libredblack/libredblack_git.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 21 +++++++++++++++++++
> >>> =A0 1 file changed, 21 insertions(+)
> >>> =A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libredblac=
k/libredblack_git.bb
> >>>
> >>>diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredbla=
ck_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git=
.bb
> >>>new file mode 100644
> >>>index 00000000..ea51b618
> >>>--- /dev/null
> >>>+++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.=
bb
> >>>@@ -0,0 +1,21 @@
> >>>+SUMMARY =3D "Library for handling red-black tree searching algorith=
m"
> >>>+DESCRIPTION =3D "A library to provide the RedBlack balanced tree se=
arching and sorting algorithm."
> >>>+LICENSE =3D "LGPLv2.1"
> >>>+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde174fb5a92cdbe038c88dc4=
c4316f99"
> >>>+
> >>>+SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3Dht=
tps"
> >>>+
> >>>+PV =3D "1.0+git${SRCPV}"
> >>>+SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
> >>>+
> >>>+S =3D "${WORKDIR}/git"
> >>>+
> >>>+# NOTE: if this software is not capable of being built in a separat=
e build directory
> >>>+# from the source, you should replace autotools with autotools-brok=
ensep in the
> >>>+# inherit line
> >>
> >>This comment isn't needed.
> >>
> >>I understand the 1:1 copy from the original repo, but after you shoul=
d have another patch
> >>that comes back and cleans these up. If they are to live in meta-arag=
o they need to be up
> >>to the standards.
> >
> >Understood.
> >I have replied to your comment in [2/8]. If my reply is not satisfacto=
ry, then while sending
> >the next version, I will add another patch in the series to remove thi=
s "Note".
> >Incase the series is acceptable, then I will send out a separate patch=
 to remove the "Note"
>=20
>=20
> What you have is fine for accepting this series.  Just submit a new
> patch that cleans it up.

+1 here. Good enough for merging, please address remaining comments in th=
e=20
follow up patches. Thanks.

--=20
Denys

