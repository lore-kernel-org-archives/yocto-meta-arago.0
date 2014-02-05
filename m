Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C8ED3529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:58:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IwZ9r001622
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:58:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IwZrT032719
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:58:35 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 12:58:34 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 5/6] arago-core-tisdk-image: add support
	for keystone devices
Thread-Index: AQHPIqLJEtkTsCpsNEeWCaqVnFs/KZqnAy1g
Date: Wed, 5 Feb 2014 18:58:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994C6A6@DLEE11.ent.ti.com>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-5-git-send-email-Chase.Maupin@ti.com>
	<20140205184757.GQ18784@edge>
In-Reply-To: <20140205184757.GQ18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/6] arago-core-tisdk-image: add support for keystone devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:58:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, February 05, 2014 1:48 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 5/6] arago-core-tisdk-image: add
>support for keystone devices
>
>On Wed, Feb 05, 2014 at 02:04:05PM -0600, Chase Maupin wrote:
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../recipes-core/images/arago-core-tisdk-image.bb  |    1 +
>>  .../recipes-core/images/arago-core-tisdk-image.inc |    3 ++-
>>  2 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-
>tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-
>tisdk-image.bb
>> index 33bfc11..ccddbc1 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.bb
>> @@ -1,5 +1,6 @@
>>  require arago-core-tisdk-image.inc
>>
>>  DEPLOY_SPL_NAME_omapl138 =3D ""
>> +DEPLOY_SPL_NAME_keystone =3D ""
>>
>>  export IMAGE_BASENAME =3D "arago-core-tisdk-image"
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-
>tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-
>core-tisdk-image.inc
>> index 74c2b87..e3de734 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>> @@ -7,7 +7,7 @@ IMAGE_FSTYPES =3D "tar.gz"
>>
>>  inherit tisdk-image
>>
>> -COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap-a15"
>> +COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap-
>a15|keystone"
>>
>>  # List of packages to remove from the host package.  This is
>usually due to
>>  # licensing issues and unneeded dependencies.
>> @@ -21,6 +21,7 @@ DTB_FILTER_ti33x =3D "am335x"
>>  DTB_FILTER_omap5-evm =3D "omap5"
>>  DTB_FILTER_dra7xx-evm =3D "dra7"
>>  DTB_FILTER_ti43x =3D "am43"
>> +DTB_FILTER_keystone =3D "k2hk"
>>
>>  # List of target side images to build for the SDK
>>  TARGET_IMAGES =3D "arago-base-tisdk-image tisdk-rootfs-image"
>
>Missing here:
>
>TARGET_IMAGES_keystone =3D "arago-base-tisdk-image tisdk-server-
>rootfs-image"

Good point.  I forgot they had the server image.

>
>
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

