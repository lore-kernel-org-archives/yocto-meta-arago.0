Return-Path: <sajesh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0DC4352099
	for <meta-arago@arago-project.org>;
	Wed, 28 Aug 2013 23:47:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7SNlJ6x027651
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2013 18:47:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7SNlJ56016262
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2013 18:47:19 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 28 Aug 2013 18:47:19 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] Turning off optimization from recipe
Thread-Index: Ac6kQGkTN6cOfrUBQsGhCxjhmj3FfwALa8kA//+1qx0=
Date: Wed, 28 Aug 2013 23:47:18 +0000
Message-ID: <CBBD797D-6A9A-4D41-9B77-DD34DE0FF2D3@ti.com>
References: <8EAE6244CE843044A42356038645C85515756934@DFLE12.ent.ti.com>,
	<20130828231319.GB5880@edge>
In-Reply-To: <20130828231319.GB5880@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Turning off optimization from recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 23:47:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is nice. Thanks.

Regards,
Sajesh

On Aug 28, 2013, at 7:13 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Aug 28, 2013 at 10:45:58PM +0000, Saran, Sajesh Kumar wrote:
>> Hi,
>>=20
>> I have a autotool based project. I need to turn off its optimization fro=
m its bitbake recipe.
>> Yocto/some root config is adding -O2 by default and I need to change it =
to -O0 for a particular recipe.
>> Is there any bitbake flag to change optimization option from recipe?
>=20
> SELECTED_OPTIMIZATION :=3D "${@d.getVar("SELECTED_OPTIMIZATION", True).re=
place("-O2", "-O0")}"
>=20
> --=20
> Denys

