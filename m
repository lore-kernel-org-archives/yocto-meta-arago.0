Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9916C52A77
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 16:56:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TGu07s017419
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2014 10:56:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TGu0It009584
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2014 10:56:00 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 29 Jan 2014 10:56:00 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] php: amend URL with the new location of
	the source tarball
Thread-Index: AQHPHGbB54VyHlmnK0+e9U06ir8d0Zqb7SCg
Date: Wed, 29 Jan 2014 16:55:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159935793@DLEE11.ent.ti.com>
References: <1390871192-3063-1-git-send-email-denis@denix.org>
	<20140128202257.GG6814@edge>
In-Reply-To: <20140128202257.GG6814@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] php: amend URL with the new location of the source tarball
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
X-List-Received-Date: Wed, 29 Jan 2014 16:56:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>Sent: Tuesday, January 28, 2014 2:23 PM
>To: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] php: amend URL with the new
>location of the source tarball
>
>Any comments/questions/objections? Should I take it as silent Ack?
>:)

Ack

>
>
>On Mon, Jan 27, 2014 at 08:06:32PM -0500, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>  meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend | 5
>++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-
>devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-
>devtools/php/php_5.4.14.bbappend
>> index fb1c25d..ebf480c 100644
>> --- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
>> +++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
>> @@ -1,10 +1,13 @@
>>  # look for files in this layer first
>>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>
>> -PR_append =3D "-arago1"
>> +PR_append =3D "-arago2"
>>
>>  SRC_URI_append_virtclass-native =3D " file://0001-php-native-Fix-
>host-contamination-issue.patch"
>>
>> +python __anonymous () {
>> +    d.setVar("SRC_URI",
>d.getVar("SRC_URI").replace('http://www.php.net/distributions/php-
>${PV}.tar.bz2', 'http://museum.php.net/php5/php-${PV}.tar.bz2'))
>> +}
>>
>>  # Work around to address the fact that php-fpm and php-cgi can
>not coexist
>>  # php-cgi is used by Matrix and php-fpm is in beta for this
>version of php.
>> --
>> 1.8.3.2
>>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

