Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7C0DC52A4D
	for <meta-arago@arago-project.org>;
	Fri, 10 Feb 2017 18:31:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1AIUtS1017619;
	Fri, 10 Feb 2017 12:30:55 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AIUo4U020398;
	Fri, 10 Feb 2017 12:30:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 12:30:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AIUnV4022762;
	Fri, 10 Feb 2017 12:30:49 -0600
Date: Fri, 10 Feb 2017 13:30:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Cam Mannett <camden.mannett@protonmail.ch>
Message-ID: <20170210183049.GM2612@edge>
References: <qY2s2fvulpmLqhQHeI38feeuadsAEds6sMhNp7QZz1WQyuSmDEpv3iee4LsTYD3_olVpLrtDCYx4oaLnKrzohmqVWHWTE08FnrMB4XpZDFg=@protonmail.ch>
MIME-Version: 1.0
In-Reply-To: <qY2s2fvulpmLqhQHeI38feeuadsAEds6sMhNp7QZz1WQyuSmDEpv3iee4LsTYD3_olVpLrtDCYx4oaLnKrzohmqVWHWTE08FnrMB4XpZDFg=@protonmail.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty] opkg 'Couldn't find anything to satisfy'
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
X-List-Received-Date: Fri, 10 Feb 2017 18:31:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 12:48:18PM -0500, Cam Mannett wrote:
> I'm trying to make to a custom SDK image based on arago-core-tisdk-image.=
inc=20
> for my Beaglebone Green, I have overwritten the TISDK_TOOLCHAIN var with =
a=20
> meta package that looks like this:
>=20
> require recipes-core/meta/meta-toolchain-arago-tisdk.inc
> require recipes-core/meta/meta-toolchain-arago.bb
> TOOLCHAIN_TARGET_TASK =3D " \
> packagegroup-arago-tisdk-addons-sdk-target \
> packagegroup-cmPTP-standalone-sdk-target \
> "

Set TOOLCHAIN_TARGET_TASK before including meta-toolchain-arago*


> My packagegroup file is very simple:
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> inherit packagegroup
> RDEPENDS_${PN} =3D "\
> libgcc \
> libgcc-dev \
> libstdc++-dev \
> ${LIBC_DEPENDENCIES} \
> glibc-staticdev \
> linux-libc-headers-dev \
> gdbserver \
> i2c-tools-dev \
> opkg-dev \
> util-linux-dev \
> ${@base_conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
> boost-dev \
> "
>=20
> During bitbake however I get this error:
>=20
> ERROR: meta-toolchain-cmPTP-tisdk-1.0-r5.0 do_populate_sdk: Unable to ins=
tall packages. Command '/home/cmannett85/workspace/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/sysroots/x86_64-linux/usr/bin/opkg --volatile-cache=
 -f /home/cmannett85/workspace/tisdk/build/arago-tmp-external-linaro-toolch=
ain/work/armv7ahf-neon-linux-gnueabi/meta-toolchain-cmPTP-tisdk/1.0-r5.0/op=
kg.conf -t /home/cmannett85/workspace/tisdk/build/arago-tmp-external-linaro=
-toolchain/work/armv7ahf-neon-linux-gnueabi/meta-toolchain-cmPTP-tisdk/1.0-=
r5.0/temp/ipktemp/ -o /home/cmannett85/workspace/tisdk/build/arago-tmp-exte=
rnal-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/meta-toolchain-cmPTP=
-tisdk/1.0-r5.0/sdk/image/tmp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/yyyyyyyyyyyyyyyyyyyyyyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy/s=
ysroots/armv7ahf-neon-linux-gnueabi --force_postinstall install packagegrou=
p-cmPTP-standalone-sdk-target packagegroup-arago-t
> isdk-addons-sdk-target' returned 255:
> Collected errors:
> * opkg_prepare_url_for_install: Couldn't find anything to satisfy 'packag=
egroup-cmPTP-standalone-sdk-target'.
> * rm_r: Failed to open dir /home/cmannett85/workspace/tisdk/build/arago-t=
mp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/meta-toolchai=
n-cmPTP-tisdk/1.0-r5.0/temp/ipktemp//opkg-iGR9Pa: No such file or directory.
>=20
> There is indeed no packagegroup-cmPTP-standalone-sdk-target IPK file in=
=20
> build/arago-tmp-external-linaro-toolchain/deploy/ipk/cmPTP_bbg - why does=
=20
> Yocto build one for packagegroup-arago-tisdk-addons-sdk-target, but not=
=20
> mine?

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


