Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AF70252972
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2013 14:44:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAIEiXtx014801
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 08:44:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIEiXoe021916
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 08:44:33 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 18 Nov 2013 08:44:33 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] input-utils: fix fetch issue
Thread-Index: AQHO5GyQgZ0wA1vuK0q+NdEFsqauVJorEG/g
Date: Mon, 18 Nov 2013 14:44:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159827996@DLEE11.ent.ti.com>
References: <1384789460-12883-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1384789460-12883-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] input-utils: fix fetch issue
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 14:44:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Maupin, Chase
>Sent: Monday, November 18, 2013 9:44 AM
>To: meta-arago@arago-project.org
>Cc: Maupin, Chase
>Subject: [PATCH] input-utils: fix fetch issue
>
>* Input utils has not been fetchable since the alioth server
>  went down.  So instead of using git pull the 1.0 release from
>  the ftp server.
>* More information on the server issues can be found at:
>  http://lists.debian.org/debian-infrastructure-
>announce/2013/11/msg00001.html
>
>Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>---
> .../{input-utils_git.bb =3D> input-utils_1.0.bb}     |   10 +++++--
>---
> 1 files changed, 5 insertions(+), 5 deletions(-)
> rename meta-arago-extras/recipes-devtools/input-utils/{input-
>utils_git.bb =3D> input-utils_1.0.bb} (71%)
>
>diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-
>utils_git.bb b/meta-arago-extras/recipes-devtools/input-
>utils/input-utils_1.0.bb
>similarity index 71%
>rename from meta-arago-extras/recipes-devtools/input-utils/input-
>utils_git.bb
>rename to meta-arago-extras/recipes-devtools/input-utils/input-
>utils_1.0.bb
>index 30a7454..6fbc8b6 100644
>--- a/meta-arago-extras/recipes-devtools/input-utils/input-
>utils_git.bb
>+++ b/meta-arago-extras/recipes-devtools/input-utils/input-
>utils_1.0.bb
>@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b"
> PV =3D "1.0"
> PR =3D "r0"

Not sure if this needs a PR bump.  Thoughts?

>
>-BRANCH ?=3D "master"
>-SRCREV =3D "230a22bda95ea5616251b43db418f9df445651b6"
>-
>-SRC_URI =3D "git://git.debian.org/collab-maint/input-
>utils.git;protocol=3Dgit;branch=3D${BRANCH}"
>+SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-
>utils/input-utils_1.0.orig.tar.gz"
> SRC_URI_append_arm =3D " file://0001-autoconf-fix-for-cross-
>compilation-for-ARM.patch"
>
>-S =3D "${WORKDIR}/git"
>+SRC_URI[md5sum] =3D "3e58772e8647093b1de2f2c90bfb9ee8"
>+SRC_URI[sha256sum] =3D
>"ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a349b3bff4e3b13"
>+
>+S =3D "${WORKDIR}/input-1.0"
>
> do_compile () {
>     oe_runmake
>--
>1.7.0.4


