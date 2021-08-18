Return-Path: <nir.geller@servotronix.com>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
	by arago-project.org (Postfix) with ESMTP id E77EC52A04
	for <meta-arago@arago-project.org>;
	Wed, 18 Aug 2021 13:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VGaLu4QEJJstijn+g+Hx8RB554K2OwaWqix/qpKQuOX4VDo9Qjk/Ss/yfTh/BRfy5OEEyw8HdhrmJseWIBVYODNdG2XP/o61GX7sIwnSPWMbxG6aUM6s8ugs+CciIOKrYIZ9PtP+MKnFBnCs5n7XieIMGRebAU8dUAcd2+b2rduCglHccRt2s0HfR09WK1Rj5djJ2qPWFdynZlOf/1cmkvYKC9hyujyLhVcrML2Hle1ENShoqHGzWiyYeWzLq/hNP5Hn7VMwfKOGLg40F6uaEfDSD04osuyRudCL3kqLsoPnEYRIqSaFAEQaoUFUSGH1jCarexjtccIeMGcTB8Sg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+fr/I+aK4m2/nIlpFxptjUsOOWF5QVBKO+/I/hK5kRU=;
	b=RtVJyzBt3P6IDql7e0NDC5mnNkbPIgRTeU8R7/DgfLcFdu9B0cE56S1+IySPPxE/9m320WTsqewcl0mtorYdO9zG9ZvyMwpF5QWqyOeWZGc7RM5+SrPws43RlYqPgyB10LkIpvGp8O3gYqknNvzTdxnVBUT9gCxuCD+q8W6qqhF5ugvuPYJT464gUVtRONTQ3lgzqvxuLdlpv5QsXMOxGIeWKEodmpAMSX6r5LMICuKDz96AqrQX5zhyYqLsUervHlHauFlM1zUbTtWnKjudh2kS38Bwb/QxbcBd17r4pZ+n5vQmNiK7BWahAyOHuLyHuQecdlG90P6xdQgD7TZmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=servotronix.com; dmarc=pass action=none
	header.from=servotronix.com; dkim=pass header.d=servotronix.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=servotronix1008982.onmicrosoft.com;
	s=selector2-servotronix1008982-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+fr/I+aK4m2/nIlpFxptjUsOOWF5QVBKO+/I/hK5kRU=;
	b=Ke6nacEfQoSVDwGPqp4/GevrvfXlRWvqKfvGlktYf24zJPgrlCCLpKvNDSglvZsdpP6FL+5suHyXsg8E4Dp7hCxQBQ91dD0Hjc87yQUxfnt5ry3rIXQMzcDd9bgIn3z3fraeGVCzvK96T535teutfV1zalUG8GM6AmU7PEP+Frc=
Received: from VI1PR0702MB3695.eurprd07.prod.outlook.com (2603:10a6:803:7::12)
	by VI1PR07MB3295.eurprd07.prod.outlook.com (2603:10a6:802:22::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.17;
	Wed, 18 Aug 2021 13:21:11 +0000
Received: from VI1PR0702MB3695.eurprd07.prod.outlook.com
	([fe80::24ea:3eb1:7096:60c7]) by
	VI1PR0702MB3695.eurprd07.prod.outlook.com
	([fe80::24ea:3eb1:7096:60c7%5]) with mapi id 15.20.4436.018;
	Wed, 18 Aug 2021 13:21:10 +0000
From: "Geller, Nir" <nir.geller@servotronix.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: multilib32: libtool-cross_2.4.6.bb configure failure
Thread-Index: AdeUMm21UCtYVOgBQvGSeHrB5bfFHA==
Date: Wed, 18 Aug 2021 13:21:10 +0000
Message-ID: <VI1PR0702MB3695F27BBD624AB67DFE5D0F90FF9@VI1PR0702MB3695.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arago-project.org; dkim=none (message not signed)
	header.d=none;arago-project.org; dmarc=none action=none
	header.from=servotronix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e90cdc9-dbb7-45dd-6312-08d9624b0bc6
x-ms-traffictypediagnostic: VI1PR07MB3295:
x-microsoft-antispam-prvs: <VI1PR07MB3295A8DCDD192A33C1FAACBF90FF9@VI1PR07MB3295.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tOjP8QLYxq27dIiaHq40KdtQ4Q7O4c65Vk+YCul8spJyQr0Zf+NTiQrTOCCULSiRvM8ehAI1v7P3A067NhQ+eimez0OzoGDZH3hw7IBn3dS9xyJJ9qZquSjkdX2yfrnbatfKPqS59lX/HxVruTibbKfrFExCh350ds3MOvnIvIHudM7fSgb98XnuYJdd8DBoK/+bC0VQL0kZqEoaQ2U89+bSjjsbV4VT8b3Daacz1RXSk6M3NyvhqRxJOrUlpflP+c9St7pdjTeIbWcbxkuRAe+37RyV04lxBO1ltiKlqYod+ePw55Oh8CkSBeEKDGGiArgen5dYQ0ahkQwC6FhIUopWnFtPiuD6eIfT1ou/S9MHr6aN6/YHjguWIOkDcfZ+syrNXQLHjSeHhyM9uR+dDngrwfm9WAtp7II3pZxuvMcJVdX7pipHRVMK5xVBKbQ9iEtV2IHmu4HF5P9PuDEAKsnG3N4h38AXtzL2W35Pu8yUgQmpyLSnxYqXPcqxUcr79LxDaKynb+g3mhjx76ZX/3sAewgQx96Zc3QOuwT8yAC/g1q4unK2j9KbRf8tTfGfQziIhy5yuj6kCIO3B6aql7wBmPSHSAa4v1Q4SRZsUp5O18aNy8/A+9X3jM4OXek8iIfao/jjiH139YZ6E55H6nWJYPR4ZRguPK/VmGYLGQTkxsK50lnzW6YI6zQGYyNlTjnbCgmHME2MXneYzQPrryWY2JuP9SQr8g9KATtoXJgnI8WhNVCrEL1qffMwNavwC7P4O1pV4zzA2cMEqMewnsnPZSxIjmvGXLczwPVF0vn4a6vPZVOGaFTKK4Ukt8Fh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:VI1PR0702MB3695.eurprd07.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(346002)(38100700002)(38070700005)(33656002)(21615005)(66556008)(30864003)(9686003)(26005)(122000001)(2906002)(186003)(5660300002)(8676002)(6916009)(966005)(76116006)(64756008)(83380400001)(71200400001)(508600001)(66946007)(66476007)(86362001)(52536014)(7696005)(8936002)(316002)(66446008)(55016002)(9326002)(166002)(6506007)(2004002)(579004)(559001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Da0QBkCNvdtchaW9Zdvec0srSbi0lPWe9qElzC5kfet6oTODOeZ/hQQbANBd?=
	=?us-ascii?Q?IGHHXS+hl17wkl/WSQ5cxoWf3upn7ZQk/lwS8+iAMpqUvd0v+/5ncII+KOuB?=
	=?us-ascii?Q?w5S86wrjwes5KubMlC4Xw46wbg6MxXnzMQ5eNwGqUjtwRbNJEQAcnpNySXRa?=
	=?us-ascii?Q?souQcrxQmdEf71Mexo3G1O7LXnrbRhII/DJZ2XKF+HfrOQeSHYakiDjoesTC?=
	=?us-ascii?Q?xtvWDW4mqhA2IOSEmb3bns0wW6yHutaPD+OIpCgGGjHj544GNTPkP7TlY4GS?=
	=?us-ascii?Q?rE7zk7QYCWi1680f0qrmA2pr2Jrxi5DceSNUMbEez4h81qJM3ZRFyG3Rty3U?=
	=?us-ascii?Q?O2PXYICUKUwo65XwV460R4ulOcosKr+Qn9FC0BT+td6JQjhZ9dm3r76wy7aw?=
	=?us-ascii?Q?BqtrSwurGSzaaE42NUe2d8GN0hdMoLGqrc/vrkw930C15apURLbmpHpiCU8a?=
	=?us-ascii?Q?pXUlrbhZVAaOKCPiWwLp7FJJ4uP+v3NvXC/S8+f9l/wRVHAN9tOoeFnovILr?=
	=?us-ascii?Q?2M5maEGaqP1r32yFLPf+k9WlW09iFAad0QEGKZ6eRBp9E01VmPJ6FNWIIX8z?=
	=?us-ascii?Q?iWPD0S3lTdzjtQF/+UOriSLchuG57bvsBUeyaxAUYAxbzE51UlvmOQkSbvDH?=
	=?us-ascii?Q?yZ7A4CmtFwBwGrUvvsxSK44X9pv0Q5Q9Bad2IR8A8pvB4uRTpDELbmxUmaAs?=
	=?us-ascii?Q?RXPt5LSUiNi0GDFGXJ3oPIAgeFMdfUojBW16nOHubqWTxt0nu9u/4LSMEyfw?=
	=?us-ascii?Q?uI5LUQ6f8tscwluvYvTPvZ51bCiM6jdSkNoJujNd3dC90cemNVa0j/fwgdTZ?=
	=?us-ascii?Q?xEbFknQq2DPVAChzNOGPAzIXPP/1vIMO1LL0nCPb8cO7+4joYtsIE53F4mmD?=
	=?us-ascii?Q?NsU/ZhlxD7Q+i/Yqoef43stcfaZPHYPwusH1yQ2v4tZqIhRsQBzbIETt9NpF?=
	=?us-ascii?Q?KPJfZbunh87xTTZilP3fRiRanbUD5uT5sPUzHP7Xc+kQepsG7N1nHtokGQaq?=
	=?us-ascii?Q?Pb4vyeAOPiVLUodEqV9XMV9Kzqd9OsylAvRhGr3uTKXz8QcWuxjqZ/zgoWje?=
	=?us-ascii?Q?G316C2VMiC4sVTtLpXo2MiVjYOzvmg2rgT2Hj1H7eoUPEgXgs15V+XIsoZIG?=
	=?us-ascii?Q?+JxnmbjtYKe5xFSBEYfl/MFS62rs1PqdWTURD4NTERxnv9uNatMiMik1RKMj?=
	=?us-ascii?Q?tErwTMrGDhJ1k9rLi5fva1+pculJHYrsDGFyxNd9Nr9DPiA4iKau2/lRnDAs?=
	=?us-ascii?Q?wtglkguFkz8ek+kAFwR4jeoKg4kg0PDRbQSASl+CmCIuzV2DwsC1pE8NxuxV?=
	=?us-ascii?Q?4c1ya8Cgnqzx1qZijIScOrX+?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: servotronix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0702MB3695.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e90cdc9-dbb7-45dd-6312-08d9624b0bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 13:21:10.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c4bfc7d-fde6-4201-a2d6-2a396cc790f7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GSRX+OXTze1YPgff05Q004nyHkqNjRs7QuVpIyA8Ua7GPKqyjhvOpe8e6EY4XPzZpkbPWCD3swGMBt75YuRBy+5J6qtamET6kQYRD5pLkBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB3295
X-Mailman-Approved-At: Mon, 30 Aug 2021 18:17:05 +0000
Subject: multilib32: libtool-cross_2.4.6.bb configure failure
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
X-List-Received-Date: Wed, 18 Aug 2021 13:20:53 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0702MB3695F27BBD624AB67DFE5D0F90FF9VI1PR0702MB3695_"

--_000_VI1PR0702MB3695F27BBD624AB67DFE5D0F90FF9VI1PR0702MB3695_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi There,

Following the instruction from TI

https://software-dl.ti.com/processor-sdk-linux-rt/esd/AM64X/latest/exports/=
docs/linux/Overview_Building_the_SDK.html

I've successfully set up a yocto project for the AM64x.

Toolchain used is 9.2-2019.12

Now I need to add support for multilib32 because I have some software that =
can be compiled only 32 bit.

I added the following lines to conf/local.conf

# Define multilib target
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7athf-neon"

And I am able to build a few packages with lib32- successfully, however, li=
b32-libtool-cross fails at the configure stage:

--host is set to the value armmllib32-linux-gnueabi

ERROR: lib32-libtool-cross-2.4.6-r0 do_configure: configure failed
ERROR: lib32-libtool-cross-2.4.6-r0 do_configure: Execution of '/home/build=
/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux=
-gnueabi/lib32-libtool-cross/2.4.6-r0/temp/run.do_configure.29261' failed w=
ith exit code 1:
automake (GNU automake) 1.16.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.=
0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@...<mailto:tromey@...>>
       and Alexandre Duret-Lutz <adl@...<mailto:adl@...>>.
AUTOV is 1.16
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --system-acdir=3D/home/build/tisdk/build/arago=
-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-lib=
tool-cross/2.4.6-r0/lib32-recipe-sysroot/home/build/tisdk/build/arago-tmp-e=
xternal-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-c=
ross/2.4.6-r0/lib32-recipe-sysroot/usr/share/aclocal/ --automake-acdir=3D/h=
ome/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmlli=
b32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/sh=
are/aclocal-1.16 -I /home/build/tisdk/build/arago-tmp-external-arm-glibc/wo=
rk/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtoo=
l-2.4.6/m4/ -I /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/ar=
mv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2.4=
.6/tests/ -I /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv=
7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroo=
t-native/usr/share/aclocal/ --force --warnings=3Dcross -I m4
aclocal: warning: unknown warning category 'cross'
autoreconf: configure.ac: tracing
autoreconf: running: /home/build/tisdk/build/arago-tmp-external-arm-glibc/w=
ork/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recip=
e-sysroot-native/usr/bin/autoconf --include=3D/home/build/tisdk/build/arago=
-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-lib=
tool-cross/2.4.6-r0/libtool-2.4.6/m4/ --include=3D/home/build/tisdk/build/a=
rago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32=
-libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ --include=3D/home/build/tisdk/=
build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueab=
i/lib32-libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/share/aclocal/ --f=
orce --warnings=3Dcross
autoreconf: running: /home/build/tisdk/build/arago-tmp-external-arm-glibc/w=
ork/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recip=
e-sysroot-native/usr/bin/autoheader --include=3D/home/build/tisdk/build/ara=
go-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-l=
ibtool-cross/2.4.6-r0/libtool-2.4.6/m4/ --include=3D/home/build/tisdk/build=
/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib=
32-libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ --include=3D/home/build/tisd=
k/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnue=
abi/lib32-libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/share/aclocal/ -=
-force --warnings=3Dcross
autoreconf: running: automake --add-missing --copy --force-missing --warnin=
gs=3Dcross
automake: warning: unknown warning category 'cross'
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
| NOTE: Running ../libtool-2.4.6/configure  --build=3Dx86_64-linux         =
                        --host=3Darmmllib32-linux-gnueabi                  =
 --target=3Darmmllib32-linux-gnueabi                         --prefix=3D/us=
r           --exec_prefix=3D/usr                          --bindir=3D/usr/b=
in                             --sbindir=3D/usr/sbin                       =
       --libexecdir=3D/usr/libexec                             --datadir=3D=
/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonml=
lib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/lib32-recipe-sysroot/usr/s=
hare                      --sysconfdir=3D/etc                            --=
sharedstatedir=3D/com                                 --localstatedir=3D/va=
r                             --libdir=3D/usr/lib                          =
     --includedir=3D/usr/include                                 --oldinclu=
dedir=3D/usr/include                      --infodir=3D/home/build/tisdk/bui=
ld/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/l=
ib32-libtool-cross/2.4.6-r0/lib32-recipe-sysroot/usr/share/info            =
                     --mandir=3D/home/build/tisdk/build/arago-tmp-external-=
arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4=
.6-r0/lib32-recipe-sysroot/usr/share/man                   --disable-silent=
-rules                      --disable-dependency-tracking                  =
              --with-libtool-sysroot=3D/home/build/tisdk/build/arago-tmp-ex=
ternal-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cr=
oss/2.4.6-r0/lib32-recipe-sysroot
configure: loading site script /home/build/tisdk/sources/meta-openembedded/=
meta-networking/site/endian-little
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
endian-little
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
arm-common
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
arm-32
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
common-linux
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
common-glibc
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
arm-linux
configure: loading site script /home/build/tisdk/sources/oe-core/meta/site/=
common
## ------------------------- ##
## Configuring libtool 2.4.6 ##
## ------------------------- ##

checking for GNU M4 that supports accurate traces... /home/build/tisdk/buil=
d/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/li=
b32-libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/m4
checking whether /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/=
armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sy=
sroot-native/usr/bin/m4 accepts --gnu... yes
checking how m4 supports trace files... --debugfile
checking for a BSD-compatible install... /home/build/tisdk/build/arago-tmp-=
external-arm-glibc/hosttools/install -c
checking whether build environment is sane... yes
checking for armmllib32-linux-gnueabi-strip... arm-none-linux-gnueabihf-str=
ip
checking for a thread-safe mkdir -p... /home/build/tisdk/build/arago-tmp-ex=
ternal-arm-glibc/hosttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether make supports nested variables... (cached) yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... Invalid configuration `armmllib32-linux-gnueab=
i': machine `armmllib32-unknown' not recognized
configure: error: /bin/bash ../libtool-2.4.6/build-aux/config.sub armmllib3=
2-linux-gnueabi failed
WARNING: /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2=
hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/temp/run.do_confi=
gure.29261:1 exit 1 from 'exit 1'

ERROR: Logfile of failure stored in: /home/build/tisdk/build/arago-tmp-exte=
rnal-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cros=
s/2.4.6-r0/temp/log.do_configure.29261





Investigating run.do_configure suggests that in the configure stage oe_runc=
onf() is set with what seems to be wrong -host and -target values:
 --host=3Darmmllib32-linux-gnueabi   --target=3Darmmllib32-linux-gnueabi


Executing
bitbake lib32-libtool-cross -e
Yields, among many others,

18513 # $TARGET_VENDOR [3 operations]
18514 #   set /home/build/tisdk/sources/oe-core/meta/conf/bitbake.conf:132
18515 #     "-oe"
18516 #   set /home/build/tisdk/sources/meta-arago/meta-arago-distro/conf/d=
istro/include/toolchain-arm.inc:15
18517 #     ""
18518 #   override[virtclass-multilib-lib32]:set multilib_global.bbclass:15=
9 [multilib_virtclass_handler_vendor]
18519 #     "mllib32"
18520 # pre-expansion value:
18521 #   "mllib32"
18522 TARGET_VENDOR=3D"mllib32"

Later, HOST_VENDOR  =3D "${TARGET_VENDOR}",
And HOST_SYS =3D "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"

So the variable SYS_HOST is expanded to armmllib32-linux-gnueabi which seem=
s to be wrong for lib32-libtool-cross.

Manually running the configure command with -host=3Darm-none-linux-gnueabih=
f is working properly.

Following suggestion by Richard Purdie
https://lists.yoctoproject.org/g/poky/message/12535


Adding

TARGET_VENDOR =3D "-oe"

To conf/local.conf didn't do the trick.



So I modified

sources/meta-arago/meta-arago-distro/conf/distro/include/toolchain-arm.inc

-TARGET_VENDOR =3D ""

+TARGET_VENDOR =3D "-oe"



And then

bitbake lib32-libtool-cross

finished successfully, but when trying to build the entire image libtool-cr=
oss failed with



## ------------------------- ##

## Configuring libtool 2.4.6 ##

## ------------------------- ##



checking for GNU M4 that supports accurate traces... /home/build/tisdk/buil=
d/arago-tmp-external-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0=
/recipe-sysroot-native/usr/bin/m4

checking whether /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/=
aarch64-oe-linux/libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/m4 ac=
cepts --gnu... yes checking how m4 supports trace files... --debugfile chec=
king for a BSD-compatible install... /home/build/tisdk/build/arago-tmp-exte=
rnal-arm-glibc/hosttools/install -c checking whether build environment is s=
ane... yes checking for aarch64-oe-linux-strip... aarch64-none-linux-gnu-st=
rip checking for a thread-safe mkdir -p... /home/build/tisdk/build/arago-tm=
p-external-arm-glibc/hosttools/mkdir -p checking for gawk... gawk checking =
whether make sets $(MAKE)... yes checking whether make supports nested vari=
ables... yes checking whether make supports nested variables... (cached) ye=
s checking build system type... x86_64-pc-linux-gnu checking host system ty=
pe... aarch64-oe-linux-gnu

configure: autobuild project... GNU Libtool

configure: autobuild revision... 2.4.6

configure: autobuild hostname... osboxes

configure: autobuild mode... default

configure: autobuild timestamp... 20210818T123141Z checking for aarch64-oe-=
linux-gcc... aarch64-none-linux-gnu-gcc  --sysroot=3D/home/build/tisdk/buil=
d/arago-tmp-external-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0=
/recipe-sysroot

checking whether the C compiler works... no

configure: error: in `/home/build/tisdk/build/arago-tmp-external-arm-glibc/=
work/aarch64-oe-linux/libtool-cross/2.4.6-r0/build':

configure: error: C compiler cannot create executables See `config.log' for=
 more details

WARNING: /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-=
oe-linux/libtool-cross/2.4.6-r0/temp/run.do_configure.1778:1 exit 1 from 'e=
xit 1'



ERROR: Logfile of failure stored in: /home/build/tisdk/build/arago-tmp-exte=
rnal-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0/temp/log.do_con=
figure.1778



Can you please suggest how to fix this issue?
I suspect it will come up in other packages as well.


Thanks a lot,

Nir.


--_000_VI1PR0702MB3695F27BBD624AB67DFE5D0F90FF9VI1PR0702MB3695_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Hi There=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Following the instruction from TI<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><a href=3D"https://software-dl.ti.com/processor-sdk-linux-=
rt/esd/AM64X/latest/exports/docs/linux/Overview_Building_the_SDK.html" targ=
et=3D"_blank"><span style=3D"color:#337AB7;text-decoration:none">https://so=
ftware-dl.ti.com/processor-sdk-linux-rt/esd/AM64X/latest/exports/docs/linux=
/Overview_Building_the_SDK.html</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">I&#8217;ve successfully set up a yocto project for the AM6=
4x.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Toolchain used is 9.2-2019.12<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Now I need to add support for multilib32 because I have so=
me software that can be compiled only 32 bit.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">I added the following lines to conf/local.conf<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"># Define multilib target<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">require conf/multilib.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">MULTILIBS =3D &quot;multilib:lib32&quot;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;armv7athf-n=
eon&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">And I am able to build a few packages with lib32- successf=
ully, however, lib32-libtool-cross fails at the configure stage:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">--host is set to the value armmllib32-linux-gnueabi<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">ERROR: lib32-libtool-cross-2.4.6-r0 do_configure: configur=
e failed<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">ERROR: lib32-libtool-cross-2.4.6-r0 do_configure: Executio=
n of '/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-=
neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/temp/run.do_configur=
e.29261'
 failed with exit code 1:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">automake (GNU automake) 1.16.1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Copyright (C) 2018 Free Software Foundation, Inc.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">License GPLv2+: GNU GPL version 2 or later &lt;<a href=3D"=
https://gnu.org/licenses/gpl-2.0.html" target=3D"_blank"><span style=3D"col=
or:#337AB7;text-decoration:none">https://gnu.org/licenses/gpl-2.0.html</spa=
n></a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">This is free software: you are free to change and redistri=
bute it.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">There is NO WARRANTY, to the extent permitted by law.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Written by Tom Tromey &lt;<a href=3D"mailto:tromey@..." ta=
rget=3D"_blank"><span style=3D"color:#337AB7;text-decoration:none">tromey@.=
..</span></a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and Alexandre Duret-L=
utz &lt;<a href=3D"mailto:adl@..." target=3D"_blank"><span style=3D"color:#=
337AB7;text-decoration:none">adl@...</span></a>&gt;.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">AUTOV is 1.16<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: Entering directory `.'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: configure.ac: not using Gettext<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: running: aclocal --system-acdir=3D/home/build/=
tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-=
gnueabi/lib32-libtool-cross/2.4.6-r0/lib32-recipe-sysroot/home/build/tisdk/=
build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueab=
i/lib32-libtool-cross/2.4.6-r0/lib32-recipe-sysroot/usr/share/aclocal/
 --automake-acdir=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/wo=
rk/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe=
-sysroot-native/usr/share/aclocal-1.16 -I /home/build/tisdk/build/arago-tmp=
-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool=
-cross/2.4.6-r0/libtool-2.4.6/m4/
 -I /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-ne=
onmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ -=
I /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon=
mllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroot-native/us=
r/share/aclocal/
 --force --warnings=3Dcross -I m4<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">aclocal: warning: unknown warning category 'cross'<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: configure.ac: tracing<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: running: /home/build/tisdk/build/arago-tmp-ext=
ernal-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cro=
ss/2.4.6-r0/recipe-sysroot-native/usr/bin/autoconf
 --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv=
7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2.4.6=
/m4/ --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/=
armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2=
.4.6/tests/
 --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv=
7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroo=
t-native/usr/share/aclocal/ --force --warnings=3Dcross<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: running: /home/build/tisdk/build/arago-tmp-ext=
ernal-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cro=
ss/2.4.6-r0/recipe-sysroot-native/usr/bin/autoheader
 --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv=
7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2.4.6=
/m4/ --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/=
armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/libtool-2=
.4.6/tests/
 --include=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv=
7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroo=
t-native/usr/share/aclocal/ --force --warnings=3Dcross<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: running: automake --add-missing --copy --force=
-missing --warnings=3Dcross<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">automake: warning: unknown warning category 'cross'<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: running: gnu-configize<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">autoreconf: Leaving directory `.'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">| NOTE: Running ../libtool-2.4.6/configure&nbsp; --build=
=3Dx86_64-linux &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--host=3Darmmllib32-li=
nux-gnueabi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--target=3Darmmllib32-linux-gnueabi
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--prefix=
=3D/usr &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--exec_prefi=
x=3D/usr &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;--bindir=3D/usr/bin &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--sbindir=3D/usr/sbin &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;--libexecdir=3D/usr/libexec &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--datadir=3D/home/build/tisdk/b=
uild/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi=
/lib32-libtool-cross/2.4.6-r0/lib32-recipe-sysroot/usr/share
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--sysconfdir=3D/etc &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--shar=
edstatedir=3D/com &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--localstatedir=3D/v=
ar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;--libdir=3D/usr/lib &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;--includedir=
=3D/usr/include &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;--oldincludedir=3D/usr/include &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;--infodir=3D/home/build/tisdk/build/arago-tmp-external-arm-g=
libc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0=
/lib32-recipe-sysroot/usr/share/info &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;-=
-mandir=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at=
2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/lib32-recipe-sys=
root/usr/share/man
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;--disable-silent-rules &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;--disable-dependency-tracking &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;--with-libtool-sysroot=3D/home/build/tisdk/build/arago-tmp-externa=
l-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2=
.4.6-r0/lib32-recipe-sysroot<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/m=
eta-openembedded/meta-networking/site/endian-little<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/endian-little<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/arm-common<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/arm-32<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/common-linux<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/common-glibc<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/arm-linux<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: loading site script /home/build/tisdk/sources/o=
e-core/meta/site/common<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">## ------------------------- ##<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">## Configuring libtool 2.4.6 ##<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">## ------------------------- ##<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking for GNU M4 that supports accurate traces... /home=
/build/tisdk/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32=
-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/m=
4<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking whether /home/build/tisdk/build/arago-tmp-externa=
l-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2=
.4.6-r0/recipe-sysroot-native/usr/bin/m4 accepts
 --gnu... yes<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking how m4 supports trace files... --debugfile<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking for a BSD-compatible install... /home/build/tisdk=
/build/arago-tmp-external-arm-glibc/hosttools/install -c<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking whether build environment is sane... yes<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking for armmllib32-linux-gnueabi-strip... arm-none-li=
nux-gnueabihf-strip<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking for a thread-safe mkdir -p... /home/build/tisdk/b=
uild/arago-tmp-external-arm-glibc/hosttools/mkdir -p<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking for gawk... gawk<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking whether make sets $(MAKE)... yes<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking whether make supports nested variables... yes<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking whether make supports nested variables... (cached=
) yes<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking build system type... x86_64-pc-linux-gnu<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">checking host system type... Invalid configuration `armmll=
ib32-linux-gnueabi': machine `armmllib32-unknown' not recognized<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">configure: error: /bin/bash ../libtool-2.4.6/build-aux/con=
fig.sub armmllib32-linux-gnueabi failed<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">WARNING: /home/build/tisdk/build/arago-tmp-external-arm-gl=
ibc/work/armv7at2hf-neonmllib32-linux-gnueabi/lib32-libtool-cross/2.4.6-r0/=
temp/run.do_configure.29261:1 exit 1 from 'exit
 1'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">ERROR: Logfile of failure stored in: /home/build/tisdk/bui=
ld/arago-tmp-external-arm-glibc/work/armv7at2hf-neonmllib32-linux-gnueabi/l=
ib32-libtool-cross/2.4.6-r0/temp/log.do_configure.29261<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Investig=
ating run.do_configure suggests that in the configure stage oe_runconf() is=
 set with what seems to be wrong &#8211;host and &#8211;target
 values:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">&nbsp;--=
host=3Darmmllib32-linux-gnueabi &nbsp;&nbsp;--target=3Darmmllib32-linux-gnu=
eabi<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Executin=
g<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">bitbake =
lib32-libtool-cross -e<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Yields, =
among many others,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">&nbsp;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18513 # =
$TARGET_VENDOR [3 operations]<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18514 #&=
nbsp;&nbsp; set /home/build/tisdk/sources/oe-core/meta/conf/bitbake.conf:13=
2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18515 #&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;-oe&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18516 #&=
nbsp;&nbsp; set /home/build/tisdk/sources/meta-arago/meta-arago-distro/conf=
/distro/include/toolchain-arm.inc:15<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18517 #&=
nbsp; &nbsp;&nbsp;&nbsp;&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18518 #&=
nbsp;&nbsp; override[virtclass-multilib-lib32]:set multilib_global.bbclass:=
159 [multilib_virtclass_handler_vendor]<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18519 #&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;mllib32&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18520 # =
pre-expansion value:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18521 #&=
nbsp;&nbsp; &quot;mllib32&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">18522 TA=
RGET_VENDOR=3D&quot;mllib32&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">&nbsp;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Later, H=
OST_VENDOR &nbsp;=3D &quot;${TARGET_VENDOR}&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">And HOST=
_SYS =3D &quot;${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}&quot;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">So t<spa=
n style=3D"background:white">he variable SYS_HOST is expanded to armmllib32=
-linux-gnueabi which seems to be wrong for lib32-libtool-cross.</span><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Manually running the configure command with &#8211;host=3D=
arm-none-linux-gnueabihf is working properly.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Followin=
g suggestion by Richard Purdie<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">https://=
lists.yoctoproject.org/g/poky/message/12535<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoPlainText">Adding<o:p></o:p></p>
<p class=3D"MsoPlainText">TARGET_VENDOR =3D &quot;-oe&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">To conf/local.conf didn't do the trick.<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">So I modified<o:p></o:p></p>
<p class=3D"MsoPlainText">sources/meta-arago/meta-arago-distro/conf/distro/=
include/toolchain-arm.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">-TARGET_VENDOR =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">+TARGET_VENDOR =3D &quot;-oe&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">And then<o:p></o:p></p>
<p class=3D"MsoPlainText">bitbake lib32-libtool-cross<o:p></o:p></p>
<p class=3D"MsoPlainText">finished successfully, but when trying to build t=
he entire image libtool-cross failed with<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">## ------------------------- ##<o:p></o:p></p>
<p class=3D"MsoPlainText">## Configuring libtool 2.4.6 ##<o:p></o:p></p>
<p class=3D"MsoPlainText">## ------------------------- ##<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">checking for GNU M4 that supports accurate traces=
... /home/build/tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-oe-li=
nux/libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/m4<o:p></o:p></p>
<p class=3D"MsoPlainText">checking whether /home/build/tisdk/build/arago-tm=
p-external-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0/recipe-sy=
sroot-native/usr/bin/m4 accepts --gnu... yes checking how m4 supports trace=
 files... --debugfile checking for
 a BSD-compatible install... /home/build/tisdk/build/arago-tmp-external-arm=
-glibc/hosttools/install -c checking whether build environment is sane... y=
es checking for aarch64-oe-linux-strip... aarch64-none-linux-gnu-strip chec=
king for a thread-safe mkdir -p...
 /home/build/tisdk/build/arago-tmp-external-arm-glibc/hosttools/mkdir -p ch=
ecking for gawk... gawk checking whether make sets $(MAKE)... yes checking =
whether make supports nested variables... yes checking whether make support=
s nested variables... (cached) yes
 checking build system type... x86_64-pc-linux-gnu checking host system typ=
e... aarch64-oe-linux-gnu<o:p></o:p></p>
<p class=3D"MsoPlainText">configure: autobuild project... GNU Libtool<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">configure: autobuild revision... 2.4.6<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">configure: autobuild hostname... osboxes<o:p></o:=
p></p>
<p class=3D"MsoPlainText">configure: autobuild mode... default<o:p></o:p></=
p>
<p class=3D"MsoPlainText">configure: autobuild timestamp... 20210818T123141=
Z checking for aarch64-oe-linux-gcc... aarch64-none-linux-gnu-gcc&nbsp; --s=
ysroot=3D/home/build/tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-=
oe-linux/libtool-cross/2.4.6-r0/recipe-sysroot<o:p></o:p></p>
<p class=3D"MsoPlainText">checking whether the C compiler works... no<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">configure: error: in `/home/build/tisdk/build/ara=
go-tmp-external-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0/buil=
d':<o:p></o:p></p>
<p class=3D"MsoPlainText">configure: error: C compiler cannot create execut=
ables See `config.log' for more details<o:p></o:p></p>
<p class=3D"MsoPlainText">WARNING: /home/build/tisdk/build/arago-tmp-extern=
al-arm-glibc/work/aarch64-oe-linux/libtool-cross/2.4.6-r0/temp/run.do_confi=
gure.1778:1 exit 1 from 'exit 1'<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">ERROR: Logfile of failure stored in: /home/build/=
tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-oe-linux/libtool-cros=
s/2.4.6-r0/temp/log.do_configure.1778<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">Can you =
please suggest how to fix this issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">I suspec=
t it will come up in other packages as well.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333"><o:p>&nb=
sp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">&nbsp;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Thanks a lot,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white;box-sizing: border-box;fon=
t-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align=
:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: =
initial;text-decoration-style: initial;text-decoration-color: initial;word-=
spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Nir.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0702MB3695F27BBD624AB67DFE5D0F90FF9VI1PR0702MB3695_--
