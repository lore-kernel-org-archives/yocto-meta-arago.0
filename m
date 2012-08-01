Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A6C0452A5D
	for <meta-arago@arago-project.org>;
	Wed,  1 Aug 2012 16:31:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71GVKv3000342;
	Wed, 1 Aug 2012 11:31:20 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71GVKe9027255;
	Wed, 1 Aug 2012 11:31:20 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 1 Aug 2012 11:31:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCHES] Porting Busybox from arago to meta-arago
Thread-Index: Ac1sLgkXm9uyUMjGSC2gxcA4VrninACoM7qAAE0ET1A=
Date: Wed, 1 Aug 2012 16:31:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27E5CC@DFLE30.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27A517@DFLE30.ent.ti.com>
	<20120730224453.GC11175@denix.org>
In-Reply-To: <20120730224453.GC11175@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCHES] Porting Busybox from arago to meta-arago
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
X-List-Received-Date: Wed, 01 Aug 2012 16:31:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore both patches. I need to make a small tweak and resubmit.=20

-----Original Message-----
From: Denys Dmytriyenko [mailto:denis@denix.org]=20
Sent: Monday, July 30, 2012 5:45 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCHES] Porting Busybox from arago to meta-arag=
o

On Fri, Jul 27, 2012 at 07:28:44PM +0000, Cooper Jr., Franklin wrote:
> The attached patches are for porting the amended recipe and file from ara=
go=20
> to meta-arago.
>=20
> The patch 0002-busybox-Port-defconfig-changes-from-oe-classic takes the=20
> default defconfig (http://goo.gl/L9dcd) in oe-core and tries to reapply t=
he=20
> configuration options that were in the old version (http://goo.gl/WFbNw) =
=20
> located in the arago repository. Most of the effort was to ensure that=20
> configuration options that were enabled previous were also enabled in thi=
s=20
> updated defconfig file.
>=20
> There were several options in the old defconfig that I couldn't find a=20
> comparable option for in the new defconfig or I was simply unsure if they=
=20
> were really equal:
>=20
> Couldn't find in latest defconfig file in oe-core:
> CONFIG_FEATURE_DIFF_BINARY
> CONFIG_FEATURE_DIFF_MINIMAL
> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP
> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_WITH_MIME_TYPES
> CONFIG_ASH_READ_NCHARS
>=20
> Similar configuration names but not quite sure if they are indeed the sam=
e:
> CONFIG_ASH_READ_TIMEOUT - arago might be the same as CONFIG_ASH_IDLE_TIME=
OUT=20
> - oe-core
>=20
> Are the above discrepancies ok to leave out or does anyone have suggestio=
ns=20
> on how what to do with them?

Franklin,

The patches look fine, but do we need to port all the configuration options=
=20
from Classic OE? We may only need few of them - should we instead identify =
the=20
list of what is required and leave the rest of the descrepancy alone?

--=20
Denys

