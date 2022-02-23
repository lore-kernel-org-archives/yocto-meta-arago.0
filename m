Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1834.1645578443295021030
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 17:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A165B40BEB;
	Wed, 23 Feb 2022 01:07:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_l1pdd25BlJ; Wed, 23 Feb 2022 01:07:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 588A640951;
	Wed, 23 Feb 2022 01:07:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02E9A17478A; Tue, 22 Feb 2022 20:07:14 -0500 (EST)
Date: Tue, 22 Feb 2022 20:07:14 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: meta-arago@lists.yoctoproject.org, nikhil.nd@ti.com, nsekhar@ti.com,
	vigneshr@ti.com, praneeth@ti.com, Ryan Eatmon <reatmon@ti.com>,
	a-m1@ti.com
Subject: Re: [meta-arago][dunfell][PATCH] external-arm-toolchain: Remove EAT_TOOL_CHAIN symlinks
Message-ID: <20220223010714.GV26229@denix.org>
References: <20220222062027.6390-1-devarsht@ti.com>
 <20220222063656.GP26229@denix.org>
 <4806a249-612a-2cfa-e199-1027d1f9c7b2@ti.com>
MIME-Version: 1.0
In-Reply-To: <4806a249-612a-2cfa-e199-1027d1f9c7b2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 01:23:19PM +0530, Devarsh Thakkar wrote:
>=20
> On 22/02/22 12:06, Denys Dmytriyenko wrote:
> > NAK.
>=20
> Could you please share more context for the NAK and any suggestions for
> alternate solutions ?
>=20
> The build is broken at the dunfell HEAD and this patch fixes below erro=
r :
>=20
> =A0INSTALL
> <build_path>/arago-tmp-external-arm-glibc/work/aarch64-linux/external-a=
rm-toolchain/2019.12-r0/external-arm-toolcha
> in-2019.12/usr/include
> mv: cannot stat
> '<build_path>/build/arago-tmp-external-arm-glibc/work/aarch64-linux/ext=
ernal-arm-toolchain/2019.12-r0/image/usr/lib
> /gcc/aarch64-none-linux-gnu': No such file or directory

I believe it is incomplete - it addresses just a single of several issues=
.=20

Have you tried building an SDK with this change?

Have you tried using the resulting SDK to cross-compile anything for the=20
target?

Also, have you tried using a native gcc compiler on the target?

meta-arago used to work with meta-arm-toolchain in the early Dunfell days=
,=20
until some incompatible changes were backported from master. At which poi=
nt=20
meta-arm had to be pinned down to a commit before that backport:
https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/arago-du=
nfell-config.txt#n12

Unbreaking this requires tons of testing and ensuring all the use cases s=
till=20
work, not just getting the image to build...


> > On Tue, Feb 22, 2022 at 11:50:27AM +0530, Devarsh Thakkar via lists.y=
octoproject.org wrote:
> >> As per below commit in https://git.yoctoproject.org/meta-arm/log/?h=3D=
dunfell,
> >>
> >> "1644922 external-arm-toolchain: Align glibc packaging to OE TARGET_=
SYS"
> >>
> >> the upstream recipe external-arm-toolchain.bb doesn't use EAT_TARGET=
_SYS for
> >> installing toolchain anymore and the recipe is directly using TARGET=
_SYS
> >> for copying.
> >>
> >> So remove EAT_TARGET_SYS symlinks as they are not required anymore a=
nd instead
> >> copy directly to ORIG_TARGET_SYS.
> >>
> >> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >> ---
> >>  .../recipes-core/meta/external-arm-toolchain.bbappend     | 8 +----=
---
> >>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolch=
ain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain=
.bbappend
> >> index 5a51aaa0..ea4df2ff 100644
> >> --- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bba=
ppend
> >> +++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bba=
ppend
> >> @@ -6,12 +6,6 @@ do_install_append() {
> >>  	install -d ${D}${sysconfdir}
> >>  	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
> >> =20
> >> -	if [ ${EAT_TARGET_SYS} !=3D ${ORIG_TARGET_SYS} ]; then
> >> -		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
> >> -		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${O=
RIG_TARGET_SYS}
> >> -		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_T=
ARGET_SYS}
> >> -		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
> >> -	fi
> >> =20
> >>  	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
> >>  	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
> >> @@ -22,7 +16,7 @@ do_install_append() {
> >>  	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
> >>  	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
> >> =20
> >> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EA=
T_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> >> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EA=
T_VER_GCC}/libgcc* ${D}${libdir}/${ORIG_TARGET_SYS}/${EAT_VER_GCC}/
> >>  }
> >> =20
> >>  # Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS =
move in ${libdir}/gcc
> >> --=20
> >> 2.17.1
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
