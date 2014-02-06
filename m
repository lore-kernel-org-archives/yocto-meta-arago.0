Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 76AB252A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 12:46:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16Ck0kW012850
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 06:46:00 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16Ck0Ex022892
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 06:46:00 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 6 Feb 2014 06:46:00 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/6] arago-base-tisdk-image: add keystone
	support
Thread-Index: AQHPIs5vesNwsKGg+0WhS6SGEbVybJqoLQQg
Date: Thu, 6 Feb 2014 12:45:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994FE9D@DLEE11.ent.ti.com>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-4-git-send-email-Chase.Maupin@ti.com>
	<20140206000015.GC22890@denix.org>
In-Reply-To: <20140206000015.GC22890@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/6] arago-base-tisdk-image: add keystone support
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
X-List-Received-Date: Thu, 06 Feb 2014 12:46:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, February 05, 2014 7:00 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 4/6] arago-base-tisdk-image: add
>keystone support
>
>On Wed, Feb 05, 2014 at 02:04:04PM -0600, Chase Maupin wrote:
>> * Add support to this image for keystone devices
>
>And the server image doesn't use arago-base-tisdk-image directly.

But the arago-core-tisdk-image does right?  So I still need this support ad=
ded.

>
>So, I'll push the first 3 patches from the series.
>
>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-base-
>tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-
>tisdk-image.bb
>> index 2c0e217..ef47dc0 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
>image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-
>image.bb
>> @@ -4,7 +4,7 @@
>>  require arago-image.inc
>>  inherit remove-net-rules
>>
>> -COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap4|omap-
>a15"
>> +COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap4|omap-
>a15|keystone"
>>
>>  IMAGE_INSTALL +=3D "\
>>      packagegroup-arago-base \
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>

