Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B393852993
	for <meta-arago@arago-project.org>;
	Sat, 23 Aug 2014 13:27:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7NDRWap002175
	for <meta-arago@arago-project.org>; Sat, 23 Aug 2014 08:27:33 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7NDRWAr011995
	for <meta-arago@arago-project.org>; Sat, 23 Aug 2014 08:27:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Sat, 23 Aug 2014 08:27:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
	backends
Thread-Index: AQHPvgz8fbpOPycfTU6KzRU6D9cdkJvcnoowgABXYAD//67ksIAAV/IA//+v1OCAATLbAIAAAlkAgAADrACAAAj/AIAAQW9p
Date: Sat, 23 Aug 2014 13:27:32 +0000
Message-ID: <450F72E6-62F3-45D0-A20F-30A24F47701E@ti.com>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
	<24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702056@DFLE08.ent.ti.com>
	<53F74ED0.3010403@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7020AA@DFLE08.ent.ti.com>
	<20140823033936.GB23523@edge> <53F80EF0.1070602@ti.com>
	<20140823040107.GD23523@edge>,<53F81990.6080407@ti.com>
In-Reply-To: <53F81990.6080407@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Devshatwar,
	Nikhil" <nikhil.nd@ti.com>
Subject: Re: [PATCH 0/2] Adding support for Wayland for DRM backends
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
X-List-Received-Date: Sat, 23 Aug 2014 13:27:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With all the below being said I think we should limit these changes to dra7=
xx since all of these patches and dependencies as of now are only meant for=
 the dra7 soc family.

Eventually they may end up supporting 335z and am47x but that support isn't=
 currently there.

Also the requirement in terms of Wayland and Weston for am57 is really to e=
nable using it with Qt 5. So for now as long as a preferred version patch i=
sn't sent that will force am57 to use an old version of Wayland/Weston then=
 I'm ok.

Changing the preferred version only for dra7xx-evm in a future patch is the=
 only part I really care about. So if Denys is ok with this patch set then =
I can live with it.

> On Aug 22, 2014, at 11:33 PM, "R, Karthik" <karthik.ramanan@ti.com> wrote=
:
>=20
>> On 23-Aug-14 9:31 AM, Denys Dmytriyenko wrote:
>>> On Sat, Aug 23, 2014 at 09:18:00AM +0530, Karthik Ramanan wrote:
>>>> On 23-Aug-14 9:09 AM, Denys Dmytriyenko wrote:
>>>>> On Fri, Aug 22, 2014 at 02:24:20PM +0000, Cooper Jr., Franklin wrote:
>>>>>=20
>>>>>=20
>>>>>> -----Original Message-----
>>>>>> From: R, Karthik
>>>>>> Sent: Friday, August 22, 2014 9:08 AM
>>>>>> To: Cooper Jr., Franklin
>>>>>> Cc: R, Karthik; meta-arago@arago-project.org; Devshatwar, Nikhil
>>>>>> Subject: Re: [meta-arago] [PATCH 0/2] Adding support for Wayland for=
 DRM
>>>>>> backends
>>>>>>=20
>>>>>>> On 22-Aug-14 7:34 PM, Cooper Jr., Franklin wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>>> -----Original Message-----
>>>>>>>> From: R, Karthik
>>>>>>>> Sent: Friday, August 22, 2014 8:44 AM
>>>>>>>> To: Cooper Jr., Franklin; meta-arago@arago-project.org
>>>>>>>> Cc: Devshatwar, Nikhil
>>>>>>>> Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland f=
or
>>>>>>>> DRM backends
>>>>>>>>=20
>>>>>>>> * This is good to go into the master branch
>>>>>>>> * Would be nice if this can be back ported onto dora.
>>>>>>> [Franklin] I'm assuming you really need this in dora correct? The r=
eason I
>>>>>> say this is currently your patches as is won't do anything for you s=
ince newer
>>>>>> versions of the wayland recipes exist which means those newer versio=
ns will
>>>>>> be used not this older version. If you really need this in master th=
en I would
>>>>>> suggest updating these patches against Wayland 1.4/1.5. I have pendi=
ng
>>>>>> patches for Wayland 1.5 so if it is accepted I would rebase those pa=
tches off
>>>>>> of that version.
>>>>>>=20
>>>>>> I actually meant daisy and not dora.
>>>>>> Yes, I agree but when its intended to be used I was thinking about s=
etting the
>>>>>> PREFERRED_PROVIDER.
>>>>=20
>>>>> [Franklin] Due to issues with Qt 5 we need Wayland 1.5 so going back =
to 1.3
>>>>> won't be an option in master atleast for am57x. So unless you absolut=
ely
>>>>> must use Wayland 1.3 I would recommend at least in Arago master updat=
ing to
>>>>> the newer version of wayland so we can stay on the same version.
>>>>=20
>>>> Franklin,
>>>>=20
>>>> My understanding is that GLSDK team has done extensive testing and val=
idation
>>>> of the patches against 1.3 and up-porting them now to either 1.4 or 1.=
5 is out
>>>> of the question due to time constraints.
>>>>=20
>>>> But I would agree that from maintenance point of view it would be much=
 more
>>>> desirable to have a single version used by all our products.
>>>=20
>>> To add, migrating from one version of Wayland to another also has a
>>> lot of underlying dependencies especially when you consider hardware
>>> accelerated graphics via DRM. So there are lot of other components
>>> that we have to add support for and you cannot consider
>>> Wayland/Weston as a lone component. GLSDK was earlier on Wayland
>>> 1.0.6 and then moved to 1.3.0, there are dependencies such as SGX
>>> DDK and DRM (both userspace and kernel) that have to move together.
>>>=20
>>> If you are only considering minimal wayland support - that is fbdev,
>>> and not using multiple display/desktop sharing and support for EGL
>>> etc. then migration is kind of easier.
>>>=20
>>> This will be useful for those customers who are interested in these
>>> other features and using DRM.
>>=20
>> Thanks, Karthik,
>>=20
>> Even though fbdev is still the main engine on other platforms, like am33=
5 and
>> am43x, we are slowly moving towards DRM support. And EGL/SGX is a bigger=
 gap
>> for sure.
>>=20
>> Anyway, what are your plans on migrating to Wayland 1.4 or 1.5 with all =
the
>> corresponding dependencies?
>=20
> Its mostly requirements driven. The move to Wayland 1.3 was more of a req=
uirement from Genivi and the extended desktop support from several customer=
s. We do have plans to move to Wayland 1.4 or later but that will happen ne=
ar future. Can't comment on the timelines now.
>=20
> While Kevin and Chase were here this week, we discussed the gaps that exi=
st in the current LCPD kernel/core SDK that prevents us from getting to the=
se newer versions. These points have been taken note of and we will start w=
orking towards addressing those gaps. It should happen in a matter of time.=
 Like you said, this is a big gap and effort and we will work towards it.
>=20
> And also with regard to the EGL/SGX, there are things that exist in the m=
eta-glsdk layer (we discussed about this a month ago) and as the drivers an=
d kernel divergence reduces these will be made available in the meta-ti/met=
a-arago.
>=20
> And we will also keep pushing things from meta-glsdk into meta-ti/arago a=
fter the GLSDK releases. These will be good points to sync.

