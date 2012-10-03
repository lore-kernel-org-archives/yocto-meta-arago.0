Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 780D9529B9
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2012 00:33:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q930Wx2C019287
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 19:32:59 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q930Wx4e003987
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 19:32:59 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 2 Oct 2012 19:32:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: python-m2crypto-native broken
Thread-Index: Ac2g/pUdxH6fZ5NWReSuHjbniThlRA==
Date: Wed, 3 Oct 2012 00:32:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2F57E0@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: python-m2crypto-native broken
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
X-List-Received-Date: Wed, 03 Oct 2012 00:33:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI commit http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommit;h=3D=
087566d0fefb1d1ccd8b44b964b6ed67720d5527 breaks
python-m2crypto-native. For some reason the two patches from python-m2crypt=
o (install.patch and m2crypto-0.20.2-openssl-1.0.0.patch) fails to apply. R=
emoving the toolchain patch above fixes this problem.

