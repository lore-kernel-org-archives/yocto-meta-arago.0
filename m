Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F31EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 17:57:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.718.1687975029446576098
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 10:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C05B340A20;
	Wed, 28 Jun 2023 17:57:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUr1bzV5lmUA; Wed, 28 Jun 2023 17:57:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80F75408CD;
	Wed, 28 Jun 2023 17:57:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BA3F163B7B; Wed, 28 Jun 2023 13:57:03 -0400 (EDT)
Date: Wed, 28 Jun 2023 13:57:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: Andrew Davis <afd@ti.com>, meta-arago@lists.yoctoproject.org,
	reatmon@ti.com, g-gupta@ti.com, praneeth@ti.com
Subject: Re: [master/kirkstone][PATCH v4 2/8] meta-arago-extras: sysrepo:
 Add libssh recipe needed for sysrepo
Message-ID: <20230628175701.GW1518@denix.org>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-3-r-gunasekaran@ti.com>
 <c8e53b03-5d6d-1e74-7d06-880ee1da4f44@ti.com>
 <94160937-cc84-0de4-1e5f-5a4bbed2f376@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <94160937-cc84-0de4-1e5f-5a4bbed2f376@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 17:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14730

On Wed, Jun 28, 2023 at 09:47:36AM +0530, Ravi Gunasekaran wrote:
>=20
>=20
> On 6/27/23 8:26 PM, Andrew Davis wrote:
> > On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
> >> libnetconf2 is needed to build sysrepo. And libnetconf2 depends on
> >> libssh. So add receipe for libssh.
> >>
> >=20
> > What is wrong with the version of libssh already in meta-oe?
>=20
> The recommended version of libssh for libnetconf2 is 0.9. [1]
> While the version of libssh in meta-oe is 0.8
>=20
> [1] - https://github.com/CESNET/libnetconf2

Kirkstone or master?



> >> The recipe is taken as-is from the commit 09f73e7 ("update for honis=
ter")
> >> from the public repo [1].
> >>
> >> [1] - https://github.com/sartura/meta-sysrepo
> >>
> >> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> >> ---
> >>
> >> Changes since v3:
> >> ----------------
> >> No change
> >>
> >> Changes since v2:
> >> ---------------
> >> Newly introduced in this series
> >>
> >> =A0 .../recipes-sysrepo/libssh/libssh_0.9.5.bb=A0=A0=A0 | 35 +++++++=
++++++++++++
> >> =A0 1 file changed, 35 insertions(+)
> >> =A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libs=
sh_0.9.5.bb
> >>
> >> diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.b=
b b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> >> new file mode 100644
> >> index 00000000..43a6827e
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> >> @@ -0,0 +1,35 @@
> >> +SUMMARY =3D "Multiplatform C library implementing the SSHv2 and SSH=
v1 protocol"
> >> +HOMEPAGE =3D "http://www.libssh.org"
> >> +SECTION =3D "libs"
> >> +LICENSE =3D "LGPLv2.1"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed=
8ea255a0"
> >> +
> >> +DEPENDS =3D "zlib openssl"
> >> +
> >> +SRC_URI =3D "git://git.libssh.org/projects/libssh.git;branch=3Dstab=
le-0.9"
> >> +SRCREV =3D "0cceefd49d4d397eb21bd36e314ac87739da51ff"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit cmake
> >> +
> >> +PACKAGECONFIG ??=3D""
> >> +PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, kr=
b5, "
> >> +
> >> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> >> +
> >> +EXTRA_OECMAKE =3D " \
> >> +=A0=A0=A0 -DWITH_GCRYPT=3D0 \
> >> +=A0=A0=A0 -DWITH_PCAP=3D1 \
> >> +=A0=A0=A0 -DWITH_SFTP=3D1 \
> >> +=A0=A0=A0 -DWITH_ZLIB=3D1 \
> >> +=A0=A0=A0 -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')}=
 \
> >> +=A0=A0=A0 "
> >> +
> >> +do_configure:prepend () {
> >> +=A0=A0=A0 # Disable building of examples
> >> +=A0=A0=A0 sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' $=
{S}/CMakeLists.txt \
> >> +=A0=A0=A0=A0=A0=A0=A0 || bbfatal "Failed to disable examples"
> >> +}
> >> +
> >> +TOOLCHAIN =3D "gcc"

