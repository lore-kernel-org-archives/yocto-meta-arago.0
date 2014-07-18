Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0939F5296D
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 15:52:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IFqcqM011228
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 10:52:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFqcBv029380
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 10:52:38 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 18 Jul 2014 10:52:38 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] arago: unset ASSUME_PROVIDED for
	git-native
Thread-Index: AQHPoFIu5u+G7jen6U6sOH0XT9X1vJuk1eGAgAEp9tA=
Date: Fri, 18 Jul 2014 15:52:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1543E0@DLEE11.ent.ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-4-git-send-email-Chase.Maupin@ti.com>
	<20140715172820.GF15788@edge> <20140717170547.GR15788@edge>
In-Reply-To: <20140717170547.GR15788@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] arago: unset ASSUME_PROVIDED for git-native
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
X-List-Received-Date: Fri, 18 Jul 2014 15:52:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, July 17, 2014 12:06 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 3/4] arago: unset ASSUME_PROVIDED
>for git-native
>
>On Tue, Jul 15, 2014 at 01:28:22PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Jul 15, 2014 at 06:28:34AM -0500, Chase Maupin wrote:
>> > * To get maximum size reduction use the later version of git
>> >   that is provided by git-native.  This reduces the kernel
>sources
>> >   size from 1002MB to 762MB.
>> > * Older versions of git work but they provide a depth of 1 for
>> >   all branches and tags instead of just for the branch
>requested.
>> > * This was tested with git version 1.7.9.5 and 1.9 as
>comparison
>> >   points.
>> >
>> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> > ---
>> >  meta-arago-distro/conf/distro/arago.conf |    5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
>arago-distro/conf/distro/arago.conf
>> > index b9af13f..1470f22 100644
>> > --- a/meta-arago-distro/conf/distro/arago.conf
>> > +++ b/meta-arago-distro/conf/distro/arago.conf
>> > @@ -50,6 +50,11 @@ require conf/distro/include/arago-prefs.inc
>> >  # Hack out sgx flag for now, as breaking on kernels >=3D 3.14
>> >  MACHINE_FEATURES :=3D
>"${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
>> >
>> > +# Remove the ASSUME_PROVIDED setting for git-native so that
>we can
>> > +# use the latest version for the sourceipk which leads to a
>smaller
>> > +# git history.
>> > +ASSUME_PROVIDED :=3D "${@filter_out('git-
>native','${ASSUME_PROVIDED}',d)}"
>>
>> This now should work:
>>
>> ASSUME_PROVIDED -=3D "git-native"
>
>Correction:
>
>ASSUME_PROVIDED_remove =3D "git-native"

This does not seem to have worked.  I don't see git-native being built when=
 I use this.

>
>
>> >  # Allow branding on top of Arago Distro and Core TI-SDK
>> >  # If ARAGO_BRAND is not set in local.conf, default to core
>> >  ARAGO_BRAND ??=3D "core"
>> > --
>> > 1.7.9.5
>> >
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

