Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 83BA952ACB
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2012 19:30:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB6JULTI001765
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 13:30:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB6JULbF020956
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 13:30:21 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 6 Dec 2012 13:30:20 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] Define arago-test-image
Thread-Index: AQHN0yJZ5KZAP+VdR0ekU7tYuHhJI5gMI+SA
Date: Thu, 6 Dec 2012 19:30:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
References: <50BFA673.6040800@ti.com>
In-Reply-To: <50BFA673.6040800@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] Define arago-test-image
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
X-List-Received-Date: Thu, 06 Dec 2012 19:30:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can't task-arago-tisdk-addons be used instead of creating this new task-ara=
go-test-addons recipe? The majority of the content in arago-test-addons is =
provided by task-arago-addons and the remainder is provided by tasks your p=
ulling into the test image recipe. Other than having a slightly bloated fil=
e system with additional tools/libraries is there any reason you can't reus=
e some of the other tasks?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Hernandez, Carlos
> Sent: Wednesday, December 05, 2012 1:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] Define arago-test-image
>=20
> This filesystem image includes test appplications used by Linux validatio=
n team.
>=20
> Please consider it for meta-arago project. Thanks, Carlos
>=20
>=20
>=20


