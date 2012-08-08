Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1ACC5529FF
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 22:18:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q78MIsAC026491;
	Wed, 8 Aug 2012 17:18:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q78MIscf001796;
	Wed, 8 Aug 2012 17:18:54 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 8 Aug 2012 17:18:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCHES] Porting sysvinit changes from arago to
	meta-arago
Thread-Index: Ac1wNJO500+KIoe7Qy+fdCut5SXD5QFANCQAAB+C7hA=
Date: Wed, 8 Aug 2012 22:18:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C285FB0@DFLE30.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27EAD2@DFLE30.ent.ti.com>
	<20120808021404.GA32275@denix.org>
In-Reply-To: <20120808021404.GA32275@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCHES] Porting sysvinit changes from arago to meta-arago
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
X-List-Received-Date: Wed, 08 Aug 2012 22:18:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your right. The "add_arago_gettys" can stay and I will probably modify the =
commit to explain why it is needed. What was the exact issue that required =
hwclock to be disabled? RTC is currently supported by all of our platforms =
but I don't know what to really look to make sure this problem still doesn'=
t exist.

-----Original Message-----
From: Denys Dmytriyenko [mailto:denis@denix.org]=20
Sent: Tuesday, August 07, 2012 9:14 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCHES] Porting sysvinit changes from arago to =
meta-arago

Franklin,

As previously mentioned, we should not blindly port all the old fixes and=20
workarounds from Arago to meta-arago. Specifically, in these 2 patches you =
are=20
bringing in setting default gettys for the fake "arago" machine, which you=
=20
don't need or have (although, I'll be porting that soon) as well as disabli=
ng=20
hwclock due to some old issue we used to have. I'd recommend checking the=20
history of such changes before deciding if we still need those in meta-arag=
o:

$ git log recipes/sysvinit/sysvinit/rcS-default

commit 393de1d0a68bd371328c3765b5df0fc32bb3f0be
Author: Denys Dmytriyenko <denis@denix.org>
Date:   Wed Jun 17 21:35:04 2009 -0400

    rcS-default: disable hwclock use due to missing RTC (temporary?)

Do we still have this issue with our current platforms? Is it applicable to=
=20
all out supported platforms?

Denys

