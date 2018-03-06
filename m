Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C158C529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 18:47:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26IkOTY015676
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:46:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520361984;
	bh=+16a3bYUA92xHmYgTXQ18OlHiaBRfaPHRzdBrsnND10=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=J9NHhJi1Z7JRtSnHqtqe+4GkxQpvIWTavK9BltMB0Q5FMm9s26QkA79khGc2kKvIw
	NtLuSYCmDdFIKR3TDXNqH7Jx6HkOpOQYGfvF2GCW2/peajUtl8BxYL5xu/oo86UC11
	lptMNpYxLHczZsDnIXq0yWCY2kNy9cs0rwil5wlM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26IkO78011440
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:46:24 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 12:46:24 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Tue, 6 Mar 2018 12:46:24 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v2]
	video-graphics-test: bump SRCREV to pick up the latest version
Thread-Index: AQHTtWmYsgwSQQ6dy020bscsCU9x46PDiv6A
Date: Tue, 6 Mar 2018 18:46:24 +0000
Message-ID: <6eef9d14ef584ac3b236b62e901873b7@ti.com>
References: <1520354314-8244-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1520354314-8244-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 18:47:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Eric,

I get an error when building this:

Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function qmake5_base_preconfigure
| DEBUG: Shell function qmake5_base_preconfigure finished
| DEBUG: Executing shell function do_configure
| ERROR: Error calling /home/jake/dev/builds/tisdk-morty/build-plsdk/arago-=
armv7a-tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake -makefile -o Makefile  -=
r   /home/jake/dev/builds/tisdk-morty/build-plsdk/arago-armv7a-tmp/work/arm=
v7ahf-neon-linux-gnueabi/video-graphics-test/1.0-r1/git/video_graphics_test=
.pro
| sh: OE_QMAKE_CXX: command not found
| sh: OE_QMAKE_CXXFLAGS: command not found
| Info: creating stash file /home/jake/dev/builds/tisdk-morty/build-plsdk/a=
rago-armv7a-tmp/work/armv7ahf-neon-linux-gnueabi/video-graphics-test/1.0-r1=
/build/.qmake.stash
| Project ERROR: Unknown module(s) in QT: quick
| ERROR: Function failed: do_configure (log file is located at /home/jake/d=
ev/builds/tisdk-morty/build-plsdk/arago-armv7a-tmp/work/armv7ahf-neon-linux=
-gnueabi/video-graphics-test/1.0-r1/temp/log.do_configure.27992)

- Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Tuesday, March 06, 2018 11:39 AM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v2]
> video-graphics-test: bump SRCREV to pick up the latest version
>=20
> - include gc320
> - QPA interface changes
> - dual-screen support
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-multimedia/video-graphics-test/video-graphics-
> test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-
> test_1.0.bb
> index c19af16..ec676e7 100644
> --- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> +++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> @@ -4,12 +4,12 @@ SECTION =3D "multimedia"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f19f52eb5"
>=20
> -DEPENDS +=3D "libdrm"
> +DEPENDS +=3D "libdrm ti-gc320-libs"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  BRANCH =3D "master"
> -SRCREV =3D "3b3007680845d39784146396a2dd2a68aa1a2283"
> +SRCREV =3D "bdfbc4179d8d176feec1df148728b1882fca7416"
>=20
>  SRC_URI =3D "git://git.ti.com/sitara-linux/video-graphics-
> test.git;protocol=3Dgit;branch=3D${BRANCH} \  "
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

