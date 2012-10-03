Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 51AE5529AA
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2012 01:11:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q931B8lO022019
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 20:11:08 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q931B8tf005778
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 20:11:08 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 2 Oct 2012 20:11:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] python-m2crypto-native broken
Thread-Index: Ac2g/pUdxH6fZ5NWReSuHjbniThlRAALa/GAAAp1N6A=
Date: Wed, 3 Oct 2012 01:11:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2F589A@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2F57E0@DFLE09.ent.ti.com>
	<20121003005937.GC32243@edge>
In-Reply-To: <20121003005937.GC32243@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: python-m2crypto-native broken
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
X-List-Received-Date: Wed, 03 Oct 2012 01:11:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried doing a cleanall on python-m2crypto-native and python-m2crypto sinc=
e I figured that might be the potential issue. That did not solve the issue=
. The weird part is that it isn't a actually compile error it is a patch er=
ror. Is there something else I can try instead of deleting my entire temp d=
irectory?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, October 02, 2012 8:00 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] python-m2crypto-native broken

On Wed, Oct 03, 2012 at 12:32:58AM +0000, Cooper Jr., Franklin wrote:
> FYI commit=20
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommit;h=3D087566d0f=
efb
> 1d1ccd8b44b964b6ed67720d5527 breaks python-m2crypto-native. For some=20
> reason the two patches from python-m2crypto (install.patch and=20
> m2crypto-0.20.2-openssl-1.0.0.patch)
> fails to apply. Removing the toolchain patch above fixes this problem.

Please do a clean build - the temp directory got changed.

--
Denys

