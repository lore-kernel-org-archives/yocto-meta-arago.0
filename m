Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 91C3752998
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 20:00:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IK0ILL022265
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 15:00:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IK0IJZ005529
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 15:00:18 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 18 Mar 2014 15:00:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 5/5]
	arago-core-tisdk-dylan-puget: update to use new CLI
Thread-Index: AQHPNzl72VKES90Ad0msB767J7UNhprm+vpAgABWSICAAAD7AIAACK/n
Date: Tue, 18 Mar 2014 20:00:18 +0000
Message-ID: <B81900EA-431A-4D4E-9C85-B9A07B51031B@ti.com>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-6-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C66853C@DFLE08.ent.ti.com>
	<20140318142543.GW12929@edge>,<20140318142913.GX12929@edge>
In-Reply-To: <20140318142913.GX12929@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-dylan-puget: update to use new CLI
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
X-List-Received-Date: Tue, 18 Mar 2014 20:00:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Mar 18, 2014, at 9:29 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
>> On Tue, Mar 18, 2014 at 10:25:43AM -0400, Denys Dmytriyenko wrote:
>>> On Tue, Mar 18, 2014 at 02:20:28PM +0000, Cooper Jr., Franklin wrote:
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>>>> Sent: Monday, March 03, 2014 5:36 PM
>>>> To: meta-arago@arago-project.org
>>>> Subject: [meta-arago] [tisdk-build-scripts][PATCH 5/5] arago-core-tisd=
k-dylan-
>>>> puget: update to use new CLI
>>>>=20
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>=20
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>> ---
>>>> configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-=
core-tisdk-
>>>> dylan-puget.txt
>>>> index f4ccb26..e24ab70 100644
>>>> --- a/configs/arago-core-tisdk-dylan-puget.txt
>>>> +++ b/configs/arago-core-tisdk-dylan-puget.txt
>>>> @@ -164,11 +164,11 @@ TEST_LOCAL_IFACE=3D"eth1"
>>>>=20
>>>> # This variable contains the tarball name for the opentest CLI which i=
s  #
>>>> required to do target side testing.
>>>> -OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
>>>> +OPENTEST_CLI=3D"$SCRIPTS_ROOT/linux-devtest.tgz"
>>> [Franklin] Would it make sense to make this update to all the different=
 configs?
>>=20
>> Shouldn't be a problem. At the time of submitting these patches, there w=
ere=20
>> other issues with Opentest and no tests were working out of the box. Hen=
ce I=20
>> only updated my config for further testing. Most of the issues have been=
 fixed=20
>> since then, so we can update other configs as well. But I made the chang=
es to=20
>> be incremental,
>=20
> Let me rephrase this to be more clear:
>=20
>> so it should work with the old Opentest CLI, if you setup=20
>> requires it. Unfortunately, it no longer works with TIGT...
>=20
> If your setup requires the use of the old Opentest CLI, it should still w=
ork.=20
> The old CLI no longer works in TIGT. But I'm fine with updating all confi=
gs to=20
> switch to the new CLI.

Thanks for explaining. I'm not sure of the status of our TEE in Dallas so I=
'm ok with this patch as is. I'll update my team's config if I need to late=
r
>=20
>=20
>>>> # This variable specifies the IP address of the TEE to be used with Op=
enTest  #
>>>> Defaults to 128.247.105.11 if not set -OPENTEST_TEE_IP=3D"10.218.102.1=
42"
>>>> +OPENTEST_TEE_IP=3D"none"
>>>>=20
>>>> # This variable specifies the hardware capabilities to be used with Op=
enTest
>>>> # Capabilities are separated by underscores, some excamples are here:
>>>> --
>>>> 1.7.9.5
>>>>=20
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

