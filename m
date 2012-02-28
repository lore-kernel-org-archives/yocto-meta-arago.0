Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 34F7C52A5F
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 22:07:28 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SM7RFY011222
	for <meta-arago@arago-project.org>; Tue, 28 Feb 2012 16:07:27 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SM7RUu017156
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 16:07:27 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 28 Feb 2012 16:07:27 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH 0/3] update matrix sources
Thread-Index: AQHM9mLCDBKbYzHso0agC6lR49KGqZZS3coQ
Date: Tue, 28 Feb 2012 22:07:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F04379A@DLEE12.ent.ti.com>
References: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] update matrix sources
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
X-List-Received-Date: Tue, 28 Feb 2012 22:07:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Looks like Denys already got these, so NM

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, February 28, 2012 3:49 PM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH 0/3] update matrix sources
>=20
> The following patches update the matrix sources.
>=20
> Patches 2 and 3 depend on the nbench-byte recipe being added
> into meta-oe first.  The patch has been submitted to the list
> but has not yet been committed.
>=20
> Chase Maupin (3):
>   refresh-screen: update to latest sources
>   matrix-gui-apps-git: update to latest sources
>   matrix-gui-armbenchmarks-demos: update dependencies
>=20
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
>  .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)


