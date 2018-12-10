Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 817925298A
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 18:40:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAIebLk040011
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:40:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544467237;
	bh=yoTsxJefbskdh13BwCKAeom76Tv+sMFr47cZKhHbI+A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=I0/66aH3rO+tVAUqs16+UqzjjTZcPE/w0O17MTRypCrmgtst6YlP4Lugam94ctmJg
	3dqBK3fnMH5vNOGe003ci4rj4+DiSfEph2eouhAPQFmesW5HthPKfEipw3jSO6/26R
	YLJXcutArKC1P2QsgQSX0fjFvrCanPkWoBlZUN/I=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAIebhR085175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:40:37 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 12:40:36 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1591.008; Mon, 10 Dec 2018 12:40:36 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [EXTERNAL] [PATCH] amsdk-av-files: move the AMSDK
	AV files from gforge.ti.com to git.ti.com
Thread-Index: AQHUkLbRtU352R44eUKIpQyA8FuCQaV4TjUQ
Date: Mon, 10 Dec 2018 18:40:36 +0000
Message-ID: <1dd12e22d1284e4e9e1952db01eecf5c@ti.com>
References: <1544457104-42812-1-git-send-email-e-ruei1@ti.com>
	<8c271475-2091-0cea-b1c5-742fe894950a@ti.com>
	<20181210183316.GB19286@beryl>
In-Reply-To: <20181210183316.GB19286@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [PATCH] amsdk-av-files: move the AMSDK AV files from gforge.ti.com to git.ti.com
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
X-List-Received-Date: Mon, 10 Dec 2018 18:40:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks!

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, December 10, 2018 1:33 PM
To: Stiffler, Jacob
Cc: Ruei, Eric; meta-arago@arago-project.org
Subject: Re: [meta-arago] [EXTERNAL] [PATCH] amsdk-av-files: move the AMSDK=
 AV files from gforge.ti.com to git.ti.com

On Mon, Dec 10, 2018 at 01:28:03PM -0500, Jacob Stiffler wrote:
> ACK
>=20
>=20
> For the license checksum change, entries for the new clips were added to =
the
> manifest.

Thanks. It would be nice to mention this in the commit log.


> On 12/10/2018 10:51 AM, Eric Ruei wrote:
> >- move the AMSDK AV files location
> >- add k3 specific video images
> >
> >Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >---
> >  .../amsdk-av-files/amsdk-av-files_1.4.bb                 | 16 ++++++++=
+-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-a=
v-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-=
av-files_1.4.bb
> >index 9d20b1a..2f570d4 100644
> >--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files=
_1.4.bb
> >+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files=
_1.4.bb
> >@@ -1,9 +1,9 @@
> >  DESCRIPTION =3D "AMSDK multimedia support files"
> >-HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_multimedia/"
> >+HOMEPAGE =3D "https://git.ti.com/processor-sdk/amsdk-av-files/"
> >  LICENSE =3D "CC-BY-NC-ND-3.0 & CC-BY-3.0"
> >  SECTION =3D "multimedia"
> >-LIC_FILES_CHKSUM =3D "file://Multimedia_Data_Files_Manifest.doc;md5=3Dd=
a0727f80b90422138535dfffc36cd1a"
> >-PR =3D "r1"
> >+LIC_FILES_CHKSUM =3D "file://Multimedia_Data_Files_Manifest.doc;md5=3Df=
e154d291c69c51495a5bb4a456403b5"
> >+PR =3D "r2"
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >@@ -19,12 +19,16 @@ VIDEO_FILES_append_dra7xx      =3D "video_wvga \
> >                                    video_1080p \
> >                                    video_720p \
> >                                    video_yuv"
> >+VIDEO_FILES_append_k3          =3D "video_720p"
> >  VIDEO_FILES_keystone =3D "video_720p "
> >-SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/1279/7769/ams=
dk-av-files_${PV}.tar.gz;name=3Davfilestarball"
> >+BRANCH =3D "master"
> >-S =3D "${WORKDIR}/amsdk-av-files"
> >+SRC_URI =3D "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=
=3Dgit;branch=3D${BRANCH}"
> >+SRCREV =3D "1b73009090265328ebaf1b6c880dfeccae5a8f19"
> >+
> >+S =3D "${WORKDIR}/git"
> >  do_compile() {
> >      :
> >@@ -42,5 +46,3 @@ do_install() {
> >  FILES_${PN} +=3D "${datadir}/ti/*"
> >-SRC_URI[avfilestarball.md5sum] =3D "29a2f8b5f41f49e30bbe9cf53eb06c5a"
> >-SRC_URI[avfilestarball.sha256sum] =3D "64dde10d03156d480c6f38494c9503e7=
3878fa0a8d5009182ed43b0e926b5569"
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

