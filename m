Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 466F052990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 16:11:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QGBr6N024783
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 11:11:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QGBrEE000794
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 11:11:53 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 26 Jun 2013 11:11:53 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Heroor, Siddharth"
	<heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] glsdk: add the initial GLSDK	branding
	policy
Thread-Index: AQHOclzLqxcUkxy4/U+TBBBUs/LnyplIGuYggAAP8fA=
Date: Wed, 26 Jun 2013 16:11:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159618630@DLEE11.ent.ti.com>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
	<1372244597-11600-3-git-send-email-heroor@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4DE84B@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C4DE84B@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] glsdk: add the initial GLSDK	branding	policy
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
X-List-Received-Date: Wed, 26 Jun 2013 16:11:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Wednesday, June 26, 2013 10:31 AM
>To: Heroor, Siddharth; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 2/2] glsdk: add the initial GLSDK
>branding policy
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>> Sent: Wednesday, June 26, 2013 6:03 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 2/2] glsdk: add the initial GLSDK
>branding policy
>>
>> * Choose ti-linux-glsdk as the preferred provider
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> ---
>>  .../conf/distro/include/branding-glsdk.inc         |    4 ++++
>>  1 files changed, 4 insertions(+), 0 deletions(-)  create mode
>100644 meta-
>> arago-distro/conf/distro/include/branding-glsdk.inc
>>
>> diff --git a/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc b/meta-
>> arago-distro/conf/distro/include/branding-glsdk.inc
>> new file mode 100644
>> index 0000000..d1c30f3
>> --- /dev/null
>> +++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
>> @@ -0,0 +1,4 @@
>> +# GLSDK branding configuration
>> +
>> +# Use the SDK supported kernel and kernel version
>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"
>
>I am not familiar with the GLSDK but I am not sure why you need
>your own branding include file. This patch shows you want to
>change the kernel but this really should be done in meta-ti within
>each of the machine configuration files. I will let Denys comment
>but if you really can't put this within meta-ti then you should at
>least make this statement machine or at least SOC specific.
>
>Branding-amsdk.inc only exist due to the mainline effort for
>am335x. Currently the Sitara team supports am335x on the 3.2
>kernel while the kernel team is working on getting am335x in
>mainline. So satisfy both kernels the branding include file was
>created.

Another example would be if you want to use QT5 instead of QT4 to set prefe=
rred versions and providers for your SDK.

>
>Unless your team's work falls in a similar situation there isn't a
>need to create this file. I personally don't like the branding
>include file and plan on getting rid of the amsdk file once we
>release a mainline am335x SDK.
>
>Also I don't see a recipe for linux-ti-glsdk within meta-ti.
>
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

