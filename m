Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 278785299E
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 23:23:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2NNdGw031093
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 17:23:39 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2NNdkW012563
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 17:23:39 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 17:23:38 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new udev
	entry
Thread-Index: AQHO55E1uU1O34XSuUC6o8gkz9jX75oyEG6A///C3hCAAKX8gIAPZ+AA//+6xFo=
Date: Mon, 2 Dec 2013 23:23:38 +0000
Message-ID: <3EDB709B-9073-4B52-A2D6-827AFBBF658A@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
	<20131122200029.GT420@bill-the-cat>
	<8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
	<20131123021545.GV420@bill-the-cat>, <20131202213126.GB17528@denix.org>
In-Reply-To: <20131202213126.GB17528@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Rini, Tom" <trini@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Mon, 02 Dec 2013 23:23:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Dec 2, 2013, at 3:31 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
>> On Fri, Nov 22, 2013 at 09:15:45PM -0500, Tom Rini wrote:
>>> On Fri, Nov 22, 2013 at 10:27:06PM +0000, Cooper Jr., Franklin wrote:
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
>>>> Sent: Friday, November 22, 2013 2:00 PM
>>>> To: Cooper Jr., Franklin
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new =
udev
>>>> entry
>>>>=20
>>>>> On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr wrote=
:
>>>>>=20
>>>>> * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev
>>>> entry to
>>>>>  automatically mount sd card partition.
>>>>> * For some reason that udev entry isn't automatically ran.
>>>>> * As a workaround manually trigger udev to run twice (not sure why th=
ats
>>>> needed)
>>>>>  for the udev rule to run correctly.
>>>>>=20
>>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>>>=20
>>>> This issn't right.  Have you added debugging steps to the mount.sh scr=
ipt?
>>>> We're saying, with this change "lets trigger all block devices 3 times=
", and on the
>>>> 3rd attempt we finally do mount things.  I've seen some partitions NOT=
 be auto-
>>>> mounted due to being dirty and needing an fsck prior to mounting them.=
  If we
>>>> need to do this type of change at the end as a "we can't figure out th=
e root
>>>> cause, but we need to release", OK.
>>>> But I don't think we're there yet.  Thanks!
>=20
>>> [Franklin] Just to give an update it looks like fsck is required to be =
ran=20
>>> to fix this problem however it wouldn't be safe to run fsck and let it=
=20
>>> auto fix the problem since that could cause potential issues. So if fsc=
k=20
>>> is really the proper solution then I'm not sure that would work for=20
>>> something that needs to automatically work at bootup.
>>=20
>> Well, dirty cards shouldn't be auto-mounted.  Or there's some option to
>> mount we should be passing to say "no, it's OK".
>=20
> So, what is the agreement here? I don't think forcing fsck for mounting a=
 card=20
> is a good idea. I agree with Tom that if the card is dirty (could be corr=
upted),=20
> then user intervention is required anyway.
>=20
> I'm planning on skipping these 2 patches, if nobody objects.
We need to figure this out but feel free to skip the patches.
>=20
> --=20
> Denys

