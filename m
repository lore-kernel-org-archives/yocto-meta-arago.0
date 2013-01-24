Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2E0F1529AA
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 18:44:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0OIiReD001979;
	Thu, 24 Jan 2013 12:44:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0OIiRb4032612;
	Thu, 24 Jan 2013 12:44:27 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 24 Jan 2013 12:44:27 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 32/47] task-arago-gst: Remove
	gst-plugins-ugly
Thread-Index: AQHN+mDfNGVeg48+HkuXhkOWeGYL2phY0OoN
Date: Thu, 24 Jan 2013 18:44:26 +0000
Message-ID: <441EEFA9-3349-419E-A8BC-45377A53A2B4@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>,
	<20130124182959.GB23977@denix.org>
In-Reply-To: <20130124182959.GB23977@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 32/47] task-arago-gst: Remove	gst-plugins-ugly
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
X-List-Received-Date: Thu, 24 Jan 2013 18:44:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's a new patch set built on top of my previously submitted patches.

I plan on submitting patch sets every so often and I didn't want things to =
start getting confusing by restarting the numbering until you we're caught =
up. I'm fine with doing that going forward or now if you want me to resubmi=
t the patches.

On Jan 24, 2013, at 12:30 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

>=20
> So, what's with the 32/47 numbering? Is it a continuation of the previous=
=20
> series, that ended at 31/31? When properly done, the new series should ha=
ve=20
> been a set of 16 patches from 1/16 to 16/16. Or, you should have re-submi=
tted=20
> both sets in one series of 47 patches, if you wanted...
>=20
> --=20
> Denys
>=20
>=20
> On Thu, Jan 24, 2013 at 08:21:06AM -0600, Franklin S. Cooper Jr wrote:
>> * Remove gst-plugins-ugly due to commercial license restrictions
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../tasks/task-arago-gst-sdk-target.bb             |    3 +--
>> .../recipes-core/tasks/task-arago-gst.bb           |    6 ++----
>> 2 files changed, 3 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-tar=
get.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
>> index 06b7184..3a737b1 100644
>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
>> @@ -1,7 +1,7 @@
>> DESCRIPTION =3D "Task to build and install header and libs in sdk"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>=20
>> inherit task
>>=20
>> @@ -10,5 +10,4 @@ RDEPENDS_${PN} =3D "\
>>     gst-plugins-base-dev \
>>     gst-plugins-good-dev \
>>     gst-plugins-bad-dev \
>> -    gst-plugins-ugly-dev \
>> "
>> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/me=
ta-arago-distro/recipes-core/tasks/task-arago-gst.bb
>> index b1b8f0b..4ff5494 100644
>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
>> @@ -1,7 +1,7 @@
>> DESCRIPTION =3D "Task to add gstreamer and gstreamer plugins"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>=20
>> inherit task
>>=20
>> @@ -10,12 +10,10 @@ GSTREAMER =3D " \
>>     gst-plugins-base \
>>     gst-plugins-good \
>>     gst-plugins-bad \
>> -    gst-plugins-ugly \
>>     gst-plugins-base-meta \
>>     gst-plugins-good-meta \
>>     gst-plugins-bad-meta \
>> -    gst-plugins-ugly-meta \
>> -    "
>> +"
>>=20
>> RDEPENDS_${PN} =3D "\
>>     ${GSTREAMER} \
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

