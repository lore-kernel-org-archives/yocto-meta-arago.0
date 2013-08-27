Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5B25D529C9
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 16:23:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RGNT8Q001247
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 11:23:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RGNTqH010688
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 11:23:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 27 Aug 2013 11:23:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] configs: Lock down the GLSDK release
	6.02.00.01
Thread-Index: AQHOouYHEM3qvG2HmkmAqtj5JBnrVZmos9FwgABzsiCAAFsZgP//uvDA
Date: Tue, 27 Aug 2013 16:23:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596EBECC@DLEE11.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D54454A4@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596EBBAB@DLEE11.ent.ti.com>
	<20130827153001.GL2339@edge>
In-Reply-To: <20130827153001.GL2339@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] configs: Lock down the GLSDK release 6.02.00.01
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
X-List-Received-Date: Tue, 27 Aug 2013 16:23:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, August 27, 2013 10:30 AM
>To: Maupin, Chase
>Cc: Hingolikar, Mrinmayee; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] configs: Lock down the GLSDK
>release 6.02.00.01
>
>On Tue, Aug 27, 2013 at 03:04:13PM +0000, Maupin, Chase wrote:
>> Acked-by: Chase Maupin <chase.maupin@ti.com>
>
>Ack? Why?

I didn't notice the line split.  I just saw them changing their TAG and I w=
as OK with that.

>
>
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>> >Sent: Tuesday, August 27, 2013 3:11 AM
>> >To: meta-arago@arago-project.org
>> >Subject: [meta-arago] [PATCH] configs: Lock down the GLSDK
>release
>> >6.02.00.01
>> >
>> >
>> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> >---
>> > ....01.00-config.txt =3D> glsdk-06.02.00-config.txt} |    4 ++--
>> > 1 files changed, 2 insertions(+), 2 deletions(-)  copy
>> >configs/glsdk/{glsdk-06.01.00-config.txt =3D> glsdk-06.02.00-
>> >config.txt} (89%)
>> >
>> >diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>> >b/configs/glsdk/glsdk-06.02.00-config.txt
>> >similarity index 89%
>> >copy from configs/glsdk/glsdk-06.01.00-config.txt
>> >copy to configs/glsdk/glsdk-06.02.00-config.txt
>> >index 5708106..969bf55 100644
>> >--- a/configs/glsdk/glsdk-06.01.00-config.txt
>> >+++ b/configs/glsdk/glsdk-06.02.00-config.txt
>> >@@ -2,9 +2,9 @@
>> > # repo name,repo uri,repo branch,repo
>> >commit[,layers=3Dlayer1:layer2...:layern]
>> >
>> >
>bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=3D
>> >-meta-arago,git://arago-project.org/git/projects/meta-arago-
>> >glsdk.git,danny,DEV_SDK_06_01_00_01,layers=3Dmeta-arago-
>distro:meta-
>> >arago-extras
>> >+meta-arago,git://arago-project.org/git/projects/meta-arago-
>> >glsdk.git,da
>> >+nny,DEV_SDK_06_02_00_01,layers=3Dmeta-arago-distro:meta-arago-
>> >extras
>> > meta-openembedded,git://git.openembedded.org/meta-
>>
>>openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layer
>s
>> >=3Dtoolchain-layer:meta-oe
>> >-meta-ti,git://arago-project.org/git/projects/meta-ti-
>> >glsdk.git,danny,DEV_SDK_06_01_00_01,layers=3D
>> >+meta-ti,git://arago-project.org/git/projects/meta-ti-
>> >glsdk.git,danny,DE
>> >+V_SDK_06_02_00_01,layers=3D
>> > meta-linaro,git://git.linaro.org/openembedded/meta-
>>
>>linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=3D
>> > oe-core,git://git.openembedded.org/openembedded-
>> >core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=3Dmeta
>> > OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> >--
>> >1.7.0.4
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

