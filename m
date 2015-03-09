Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6A2DD529AF
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 19:41:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29JfDBo029697
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 14:41:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29JfCoW002302
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 14:41:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 9 Mar 2015 14:41:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3KozFzVQOVEiUyLNWnbwHBn050OolaAgAAAjAD//51xi4AAZyeA//+fIuyABkx8hw==
Date: Mon, 9 Mar 2015 19:41:11 +0000
Message-ID: <6648718D-F6C7-42F8-BD01-0FB69075F7CC@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<20150305185809.GV6052@edge>
	<4B26FB5A64EBA14C87266869E037F958141056AF@DFLE09.ent.ti.com>
	<DC215853-3726-4509-A47D-6EA9F3F1D771@ti.com>,
	<20150305191635.GX6052@edge>,
	<6026593C-9773-46B9-93E9-FEA1C6B9EA3E@ti.com>
In-Reply-To: <6026593C-9773-46B9-93E9-FEA1C6B9EA3E@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Mon, 09 Mar 2015 19:41:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI I know this patch set says RFC but if it looks good then I think it's r=
eady to be committed whenever.


> On Mar 5, 2015, at 1:30 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
>=20
>=20
>=20
>=20
>>> On Mar 5, 2015, at 1:16 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>>>=20
>>> On Thu, Mar 05, 2015 at 02:07:21PM -0500, Cooper Jr., Franklin wrote:
>>>=20
>>>=20
>>>=20
>>>> On Mar 5, 2015, at 1:00 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>>>=20
>>>> This is needed to the dual-camera-demo, though I'm not sure why exactl=
y.=20
>>>>=20
>>>> Franklin can you comment on this?
>>=20
>>> It's not needed for the dual camera demo it is needed since we don't ha=
ve a=20
>>> version of the Graphics SDK for 335x and am437x that works with=20
>>> Wayland/Qtwayland.
>>>=20
>>> Sometime "this year" we will have a graphics package for all devices th=
at=20
>>> supports Wayland.
>>=20
>> Ok, that makes sense. Although there was some experimentation with WSEGL=
=20
>> plugin, but that wasn't very clean and incomplete...
> I agree not my decision....
>>=20
>> So, if this is a temporary workaround, I'd like to be less invasive, if=
=20
>> possible. From a higher level configuration, do you plan to stick to Qt5=
, but=20
>> switch it to eglfs backend, instead of wayland?
> Yes.
>> When GFX for AM3/4 catches up=20
>> and wayland is turned back on, will eglfs stay as an option?
> Yes and No. No one will purposely break it but it won't be tested or apar=
t of any sdk once we get the Wayland support we need.
>=20
> It would be good for your team to stick with Wayland which is why we limi=
ted he change inside of our branding file. We then can still flesh out thos=
e touch issues and insure it's in a good place when we get the proper graph=
ics sdk.
>>=20
>> --=20
>> Denys
>>=20
>>=20
>>>> -----Original Message-----
>>>> From: Dmytriyenko, Denys=20
>>>> Sent: Thursday, March 05, 2015 1:58 PM
>>>> To: Stiffler, Jacob
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: Re: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
>>>>=20
>>>>> On Thu, Mar 05, 2015 at 01:31:39PM -0500, Jacob Stiffler wrote:
>>>>> * This falg may be used to exclude wayland/weston from the file syste=
m.
>>>>> * QT platform will be set based on this value.
>>>>> * Add processor-sdk band to disable wayland for ti33x and ti43x.
>>>>=20
>>>> So, what's the future of wayland in SDKs, then?
>>>>=20
>>>>=20
>>>>> Jacob Stiffler (4):
>>>>> arago-prefs: Add WAYLAND_SUPPORT flag.
>>>>> packagegroups: Implement WAYLAND_SUPPORT flag.
>>>>> qtbase: Set qpa based in WAYLAND_SUPPORT flag.
>>>>> branding-processor-sdk: Add processor-sdk brand.
>>>>>=20
>>>>> .../conf/distro/include/arago-prefs.inc            |    2 ++
>>>>> .../conf/distro/include/branding-processor-sdk.inc |   34 +++++++++++=
+++++++++
>>>>> .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
>>>>> .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
>>>>> .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
>>>>> .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
>>>>> meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>>>>> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
>>>>> 8 files changed, 51 insertions(+), 12 deletions(-)  create mode=20
>>>>> 100644=20
>>>>> meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>>>>>=20
>>>>> --
>>>>> 1.7.9.5
>>>>>=20
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

