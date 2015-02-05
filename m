Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A6CA252ABB
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:38:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FcadK015413
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:38:37 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FcZbc022026
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:38:35 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 09:38:35 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] packagegroup-arago-tisdk-matrix:
	Remove dual camera and image-gallery
Thread-Index: AQHQQOHbzZYLvYQoiEC+TdjC2kPHh5zikB8A//+huE4=
Date: Thu, 5 Feb 2015 15:38:35 +0000
Message-ID: <3CD57D3F-CD45-4A44-94D9-91721C899345@ti.com>
References: <1423099193-20065-1-git-send-email-fcooper@ti.com>
	<1423099193-20065-2-git-send-email-fcooper@ti.com>,
	<20150205151601.GE9943@edge>
In-Reply-To: <20150205151601.GE9943@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] packagegroup-arago-tisdk-matrix: Remove dual camera and image-gallery
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
X-List-Received-Date: Thu, 05 Feb 2015 15:38:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> On Feb 5, 2015, at 9:16 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Wed, Feb 04, 2015 at 07:19:52PM -0600, Franklin S. Cooper Jr wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>=20
>> * Remove image gallery and dual camera since they aren't support on 3.14=
 kernel
>=20
> Do you want to remove it completely or will it be fixed soon?
We are currently working on fixing it but it won't be ready for another mon=
th or so.
>=20
>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-matrix.bb
>> index 0fe7bc5..9e00619 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-matrix.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-matrix.bb
>> @@ -1,6 +1,6 @@
>> DESCRIPTION =3D "Task to include Matrix v2"
>> LICENSE =3D "MIT"
>> -PR =3D "r34"
>> +PR =3D "r35"
>>=20
>> inherit packagegroup
>>=20
>> @@ -77,7 +77,6 @@ MATRIX_APPS_append_ti43x =3D "        \
>>     matrix-multimedia-demo-mpeg4aacdec \
>>     matrix-multimedia-demo-mpeg4dec \
>>                                     \
>> -    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual=
-camera matrix-gui-apps-image-gallery', d)} \
>>                                     \
>>     matrix-gui-generic-pm           \
>>     matrix-gui-pm-demos-suspend     \
>> @@ -85,6 +84,7 @@ MATRIX_APPS_append_ti43x =3D "        \
>>     matrix-gui-pm-demos-governor    \
>>     ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d=
)} \
>> "
>> +# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-c=
amera matrix-gui-apps-image-gallery', d)}
>>=20
>> MATRIX_APPS_append_omap-a15 =3D "     \
>>     matrix-multimedia-demo-aac      \
>> --=20
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

