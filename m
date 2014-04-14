Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B643A52974
	for <meta-arago@arago-project.org>;
	Mon, 14 Apr 2014 18:41:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3EIf2Le005488
	for <meta-arago@arago-project.org>; Mon, 14 Apr 2014 13:41:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EIf2Mr023419
	for <meta-arago@arago-project.org>; Mon, 14 Apr 2014 13:41:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 14 Apr 2014 13:41:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH]
	bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
Thread-Index: AQHPV/+uBdMr3OsbmEe+Fk3YMC41GpsRciWA
Date: Mon, 14 Apr 2014 18:41:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF92E55@DLEE11.ent.ti.com>
References: <1397247019-15012-1-git-send-email-denis@denix.org>
	<20140414163618.GD12929@edge>
In-Reply-To: <20140414163618.GD12929@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
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
X-List-Received-Date: Mon, 14 Apr 2014 18:41:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>Sent: Monday, April 14, 2014 11:36 AM
>To: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] bitbake-
>test-sdk-image: use tmp/deploy/images/machine/ structure
>
>Any comments?
>
>On Fri, Apr 11, 2014 at 04:10:19PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> From Dora and up, images are deployed into corresponding machine
>subdirs.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>  lib/oesdk/bitbake-test-sdk-image |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/oesdk/bitbake-test-sdk-image
>b/lib/oesdk/bitbake-test-sdk-image
>> index 8df9a5b..cff86e4 100644
>> --- a/lib/oesdk/bitbake-test-sdk-image
>> +++ b/lib/oesdk/bitbake-test-sdk-image
>> @@ -125,6 +125,12 @@ extract_sdk_image() {
>>          return 1
>>      fi
>>
>> +    # prefer sdk_path/m, if exists - Dora and up
>> +    if [ -d $sdk_path/$m ]
>> +    then
>> +        sdk_path=3D"$sdk_path/$m"
>> +    fi
>> +
>>
>##################################################################
>##############
>>  # SDK_FILTER variable is used to specify the SDK image produced
>by the build,
>>  # that includes bootloaders, kernel, rootfs, devkit and host
>tools.
>> --
>> 1.7.9.5
>>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

