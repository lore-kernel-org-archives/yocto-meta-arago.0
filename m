Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AE7D8529D0
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 17:38:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KHcTqW003858
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 12:38:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KHcTSM010693
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 12:38:29 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 12:38:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master & danny][PATCH 1/7] linux-libc-headers:
	Add linux-libc-headers version 2.6.33
Thread-Index: AQHOjksTMZ6NklZMBUWHD07FPNQsDpmdf3yA///+XL+AATykgP//sy2ggABc5ID//7EFvw==
Date: Tue, 20 Aug 2013 17:38:28 +0000
Message-ID: <4044911E-C108-4FC2-8B32-6992C7AC06AD@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<20130819213613.GF32524@denix.org>
	<FC0CCC2B-AE0D-4AA7-B553-3379ED7A62F0@ti.com>
	<20130820162339.GB8481@edge>
	<8F29D6B095ED194EA1980491A5E029710C5264FB@DFLE08.ent.ti.com>,
	<20130820172108.GE8481@edge>
In-Reply-To: <20130820172108.GE8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Tue, 20 Aug 2013 17:38:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Aug 20, 2013, at 12:21 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Tue, Aug 20, 2013 at 12:54:11PM -0400, Cooper Jr., Franklin wrote:
>>=20
>>=20
>>> -----Original Message-----
>>> From: Dmytriyenko, Denys
>>> Sent: Tuesday, August 20, 2013 11:24 AM
>>> To: Cooper Jr., Franklin
>>> Cc: meta-arago@arago-project.org
>>> Subject: Re: [meta-arago] [master & danny][PATCH 1/7] linux-libc-header=
s: Add
>>> linux-libc-headers version 2.6.33
>>>=20
>>> On Mon, Aug 19, 2013 at 10:30:20PM -0400, Cooper Jr., Franklin wrote:
>>>>=20
>>>>=20
>>>> On Aug 19, 2013, at 4:36 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote=
:
>>>>=20
>>>>> On Wed, Jul 31, 2013 at 07:31:46PM -0500, Franklin S. Cooper Jr wrote=
:
>>>>>> * This is the version that was originally being using in
>>>>>> arago/oe-classic based  SDK.
>>>>>=20
>>>>> Why do we need 2.6.33? All our old kernels are at least 2.6.37 now
>>>>> and there is corresponding linux-libc-headers available...
>>>=20
>>>> It's been awhile but I believe am18x still didn't like the 2.6.37
>>>> headers for some crazy reason.
>>>=20
>>> Do you have any more details? I'm testing it right now and it seems to =
be
>>> building fine so far against 2.6.37.2...
>>=20
>> [Franklin] I believe it's a runtime issue with tslib. The am18 kernel=20
>> conflicted with the 2.6.33 version of linux-libc-headers that was used t=
o=20
>> build tslib.
>=20
> But otherwise libnl-3.2.21 doesn't seem to build against 2.6.33 headers..=
.
>=20
I need to submit patches to enable wilink 6 for am18 and am37 anyway by add=
ing older versions of various recipes which would fix this problem.

> --=20
> Denys

