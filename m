Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 25B6852AB2
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 19:59:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB4Jxbk7012947
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:59:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4Jxbdr032637
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:59:37 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 4 Dec 2013 13:59:36 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ltp-ddt: add RDEPENDS for linaro-pm-qa-utils
Thread-Index: AQHO8Srf92E3WYz4a0OsL/QGUZ5Iy5pEdFFQ
Date: Wed, 4 Dec 2013 19:59:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159872BB4@DLEE11.ent.ti.com>
References: <1386190787-11630-1-git-send-email-Chase.Maupin@ti.com>
	<20131204195606.GX690@edge>
In-Reply-To: <20131204195606.GX690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ltp-ddt: add RDEPENDS for linaro-pm-qa-utils
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
X-List-Received-Date: Wed, 04 Dec 2013 19:59:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sorry this one sat in my queue for a while :(

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, December 04, 2013 1:56 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] ltp-ddt: add RDEPENDS for
>linaro-pm-qa-utils
>
>Ack.
>
>On Wed, Dec 04, 2013 at 02:59:47PM -0600, Chase Maupin wrote:
>> * The latest ltp-ddt sources have thermal test scripts that
>>   require the utils found in the linaro-pm-qa-utils package.
>> * Add an RDEPENDS to make sure those utilities will be in place.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
>ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-
>ddt/ltp-ddt_0.0.4.bbappend
>> index b9248f8..9fcc92f 100644
>> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
>ddt_0.0.4.bbappend
>> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
>ddt_0.0.4.bbappend
>> @@ -1,4 +1,6 @@
>> -PR_append =3D "-arago2+gitr${SRCPV}"
>> +PR_append =3D "-arago3+gitr${SRCPV}"
>> +
>> +RDEPENDS_${PN} +=3D "linaro-pm-qa-utils"
>>
>>  # Auto rev so we pick up the latest changes
>>  SRCREV =3D "${AUTOREV}"
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

