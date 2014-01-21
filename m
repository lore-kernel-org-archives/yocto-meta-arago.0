Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D707752986
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 17:11:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LHBism017590
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 11:11:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LHBiUq030029
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 11:11:44 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 21 Jan 2014 11:11:43 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] package-group-tisdk-matrix: add
	ts-calibrate-init
Thread-Index: AQHPFsE1vaR98+MYw0O6TthICBTm8pqPahLA
Date: Tue, 21 Jan 2014 17:11:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101599159B5@DLEE11.ent.ti.com>
References: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
	<1390324458-29919-2-git-send-email-Chase.Maupin@ti.com>
	<20140121155529.GA30525@edge>
In-Reply-To: <20140121155529.GA30525@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] package-group-tisdk-matrix: add ts-calibrate-init
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
X-List-Received-Date: Tue, 21 Jan 2014 17:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, January 21, 2014 9:55 AM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 2/3] package-group-tisdk-matrix:
>add ts-calibrate-init
>
>On Tue, Jan 21, 2014 at 11:14:17AM -0600, Chase Maupin wrote:
>> * Add the ts-calibrate-init package for everything except dra7xx
>>   which does not require calibration for its touchscreen.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../packagegroup-arago-tisdk-matrix.bb             |   10
>++++++++--
>>  1 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>matrix.bb
>> index 220d77f..8a717ba 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>> @@ -1,6 +1,6 @@
>>  DESCRIPTION =3D "Task to include Matrix v2"
>>  LICENSE =3D "MIT"
>> -PR =3D "r26"
>> +PR =3D "r27"
>>
>>  inherit packagegroup
>>
>> @@ -49,6 +49,7 @@ MATRIX_APPS_append_omap3 =3D "        \
>>      matrix-multimedia-demo-h264dec      \
>>      matrix-multimedia-demo-mpeg4aacdec   \
>>      matrix-multimedia-demo-mpeg4dec     \
>> +    ts-calibrate-init \
>>  "
>>
>>  MATRIX_APPS_append_ti33x =3D "        \
>> @@ -65,6 +66,7 @@ MATRIX_APPS_append_ti33x =3D "        \
>>      matrix-gui-clocks               \
>>                                      \
>>      matrix-gui-wifi-demos           \
>> +    ts-calibrate-init \
>>  "
>>
>>  MATRIX_APPS_append_ti43x =3D "        \
>> @@ -78,8 +80,12 @@ MATRIX_APPS_append_ti43x =3D "        \
>>      matrix-gui-generic-pm           \
>>      matrix-gui-pm-demos-suspend     \
>>      matrix-gui-clocks               \
>> -                                    \
>>      matrix-gui-wifi-demos           \
>> +    ts-calibrate-init \
>> +"
>> +
>> +MATRIX_APPS_append_omap5-evm =3D "     \
>> +    ts-calibrate-init \
>
>OMAP5 uEVM doesn't have touchscreen, does it?

No it doesn't.  Another one for me to fix :)

>
>
>>  "
>>
>>  MATRIX_APPS_append_omap-a15 =3D "     \
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

