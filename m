Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2485952A88
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 02:35:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q782Zwtv025174;
	Tue, 7 Aug 2012 21:35:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q782ZwAo022257;
	Tue, 7 Aug 2012 21:35:58 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 7 Aug 2012 21:35:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] curl: Disable crypto related features
Thread-Index: Ac1wNriDCQUHClOkS4yrYw2fZfTCYgFAL2qA//+uKCc=
Date: Wed, 8 Aug 2012 02:35:57 +0000
Message-ID: <548F00AB-D972-40EA-828F-45A8D01D7B2B@ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27EB98@DFLE30.ent.ti.com>,
	<20120808022853.GB32275@denix.org>
In-Reply-To: <20120808022853.GB32275@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] curl: Disable crypto related features
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
X-List-Received-Date: Wed, 08 Aug 2012 02:35:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My understanding was that we had export restrictions and need approval per =
software/library. If our current sdk still requires these setting disabled =
then I assume there isn't an exemption for this software package.

On Aug 7, 2012, at 9:28 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> On Wed, Aug 01, 2012 at 10:41:22PM +0000, Cooper Jr., Franklin wrote:
>=20
> It's hard to comment on the patch when it's not inline...
>=20
>> +# Disable all crypt support in curl due to export restrictions
>=20
> We no longer have export restrictions on cryptography, why do we need to=
=20
> disable it completely?
>=20
> --=20
> Denys

