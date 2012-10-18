Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6402552A5D
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:51:12 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9IFpBdg028652;
	Thu, 18 Oct 2012 10:51:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9IFpB6K031132;
	Thu, 18 Oct 2012 10:51:11 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 18 Oct 2012 10:51:10 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-tisdk-image: Create image that
	builds	Sitara SDK filesystem
Thread-Index: AQHNqIGkH9ghj4Q34Ui58jLqKWAl55e+ajdwgAEgXAD//7Uxug==
Date: Thu, 18 Oct 2012 15:51:09 +0000
Message-ID: <B8A80FED-7C57-4E1C-9CAC-E471CFC4F21E@ti.com>
References: <1350022004-13294-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C450@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306C42@DFLE09.ent.ti.com>,
	<20121018151853.GA4805@edge>
In-Reply-To: <20121018151853.GA4805@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-tisdk-image: Create image that builds	Sitara SDK filesystem
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
X-List-Received-Date: Thu, 18 Oct 2012 15:51:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Oct 18, 2012, at 11:18 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Thu, Oct 18, 2012 at 03:16:39AM +0000, Cooper Jr., Franklin wrote:
>>=20
>>=20
>> -----Original Message-----
>> From: Maupin, Chase=20
>> Sent: Friday, October 12, 2012 9:58 PM
>> To: Franklin S. Cooper Jr; meta-arago@arago-project.org
>> Cc: Cooper Jr., Franklin
>> Subject: RE: [meta-arago] [PATCH] arago-tisdk-image: Create image that b=
uilds Sitara SDK filesystem
>>=20
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
>>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
>>> Sent: Friday, October 12, 2012 1:07 AM
>>> To: meta-arago@arago-project.org
>>> Cc: Cooper Jr., Franklin
>>> Subject: [meta-arago] [PATCH] arago-tisdk-image: Create image that=20
>>> builds Sitara SDK filesystem
>>>=20
>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>> ---
>>> .../recipes-core/images/arago-tisdk-image.bb       |   21
>>> ++++++++++++++++++++
>>> 1 files changed, 21 insertions(+), 0 deletions(-)  create mode 100644=20
>>> meta-arago-distro/recipes-core/images/arago-
>>> tisdk-image.bb
>>>=20
>>> diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-
>>> image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-
>>> image.bb
>>> new file mode 100644
>>> index 0000000..e9e6781
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
>>> @@ -0,0 +1,21 @@
>>> +# Arago TI SDK base image
>>> +# gives you an image with Qt/E and other common packages shared
>>> by all TI SDKs.
>>> +
>>> +require arago-image.inc
>>> +PR_append =3D "-arago0"
>>=20
>> Why are you appending the PR?
>>=20
>> Franklin: Its something that I added a few months when I had a concern a=
bout=20
>> the arago-image.inc file but I never properly addressed.
>> I am going to send an updated patch . Essentially I am going to add INC_=
PR =3D=20
>> "r0" to arago-image.inc and in this recipe replace PR_append with PR =3D=
=20
>> "${INC_PR}.1".
>> http://www.openembedded.org/wiki/Styleguide talks a little bit about thi=
s.
>=20
> That's something I wanted to comment on as well... There are no PV or PR =
for=20
> image recipes, as that doesn't make much sense. Images have special handl=
ing,=20
> they are deployed and not packaged, with a specially defined names. Moreo=
ver,=20
> do_rootfs will always run when you bitbake the image recipe. So, drop any=
 PR,=20
> INC_PR etc. from image recipes.

Makes sense. Will do
>=20
> --=20
> Denys

