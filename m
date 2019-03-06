Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0969F529C0
	for <meta-arago@arago-project.org>;
	Wed,  6 Mar 2019 00:34:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x260YOPU055855
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 18:34:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551832464;
	bh=sEpPBkGcupB8jKea0FgEMYQYgmZAXJspTnuRbEtnfwc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SXcZEMb5oAO06TatOAQseCBd44b3Fw8Z576nh6YxzX27YjcCps1pHwS/XvxBarK64
	HfWd8QgdBrdbSLz//hC1hl8szrRhTK7eRUZDTuPzh7/50mKTAzjaSpdmztt/0xtsAc
	2JOxbbKKAvsXwqThodMgm2w16EhqKIQHPng2zJpo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x260YOr3122442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 18:34:24 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 18:34:23 -0600
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1591.008; Tue, 5 Mar 2019 18:34:23 -0600
From: "Zhao, Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [EXTERNAL] [PATCH v2] ocl: update version to
	01.01.18.00
Thread-Index: AQHU06orX+3KolglzU6/bZ57yq4WnaX9wVwg
Date: Wed, 6 Mar 2019 00:34:23 +0000
Message-ID: <216C620B-4441-45C7-B43E-F0FD72E60E25@ti.com>
References: <20190305011558.55639-1-yuanzhao@ti.com>
	<e2664c44-0afa-f127-3f35-8a381474868b@ti.com>,
	<20190305232131.GS26081@beryl>
In-Reply-To: <20190305232131.GS26081@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [PATCH v2] ocl: update version to 01.01.18.00
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
X-List-Received-Date: Wed, 06 Mar 2019 00:34:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No negative effects.  1.1.18.00 is based on 1.1.17.02 anyway.  You can appl=
y both update to 1.1.17.02 and update to 1.1.18.00 to rocks.  Thanks!  - Yu=
an


> On Mar 5, 2019, at 5:21 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Tue, Mar 05, 2019 at 06:18:06PM -0500, Jacob Stiffler wrote:
>> Denys,
>>=20
>> Please apply to rocko.
>=20
> Depends on this:
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3D1b77a=
721090738e30d6a297a2892f551e66915bd
> Any negative effects to rocko/gcc7?
>=20
>=20
>>> On 3/4/2019 8:15 PM, Yuan Zhao wrote:
>>> - Runtime support update for TIDL API 01.03.00
>>> - Update OpenCL TIDL firmware to 01.01.18.00
>>>=20
>>> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
>>> ---
>>> meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
>>> meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extr=
as/recipes-ti/ocl/ocl.inc
>>> index be32b0bc..21247177 100644
>>> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
>>> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
>>> @@ -1,5 +1,5 @@
>>> # patch version at the end needs to be in double digits
>>> -PV =3D "1.1.17.02"
>>> +PV =3D "1.1.18.00"
>>> INC_PR =3D "r0"
>>> LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D2e3965a73a8a49c2=
3836467266120dff"
>>> @@ -10,7 +10,7 @@ OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.gi=
t"
>>> OCL_GIT_PROTOCOL =3D "git"
>>> OCL_GIT_BRANCH =3D "master"
>>> -OCL_SRCREV =3D "fef8ff7679dacfac7b208531be07550fa7e3673e"
>>> +OCL_SRCREV =3D "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
>>> BRANCH =3D "${OCL_GIT_BRANCH}"
>>> SRC_URI =3D "${OCL_GIT_URI};protocol=3D${OCL_GIT_PROTOCOL};branch=3D${B=
RANCH}"
>>> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/m=
eta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
>>> index a47d9128..a9ec413a 100644
>>> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
>>> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
>>> @@ -3,7 +3,7 @@ SUMMARY =3D "OpenCL TIDL firmware for AM57xx"
>>> LICENSE =3D "TI-TFL"
>>> LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3D082a028431c455252c1e1d3d1=
021d382"
>>> -PV =3D "01.01.17.01"
>>> +PV =3D "01.01.18.00"
>>> PR =3D "r0"
>>> require recipes-ti/includes/arago-paths.inc
>>> @@ -15,7 +15,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> GIT_URI      =3D "git://git.ti.com/opencl/opencl-firmware.git"
>>> GIT_PROTOCOL =3D "git"
>>> BRANCH       =3D "master"
>>> -SRCREV       =3D "2f1715affab9ef4debf02769cf113dc1922cf75f"
>>> +SRCREV       =3D "3b98f405d98416a66678dec01d8f7ef244f379b6"
>>> SRC_URI      =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRAN=
CH}"
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

