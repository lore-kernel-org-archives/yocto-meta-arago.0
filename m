Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 966E952A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 15:25:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16FPKjB000332
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:25:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FPJTF015542
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:25:20 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 6 Feb 2014 09:25:19 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] mmc-utils: add mmc-utils for working
	with eMMC devices
Thread-Index: AQHPI07UagHwnyfbtEmYev3GEU8JwJqoWIgA
Date: Thu, 6 Feb 2014 15:25:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159950474@DLEE11.ent.ti.com>
References: <1391697602-1599-1-git-send-email-Chase.Maupin@ti.com>
	<1391697602-1599-3-git-send-email-Chase.Maupin@ti.com>
	<20140206151928.GF18784@edge>
In-Reply-To: <20140206151928.GF18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] mmc-utils: add mmc-utils for working with eMMC devices
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
X-List-Received-Date: Thu, 06 Feb 2014 15:25:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, February 06, 2014 10:19 AM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 3/4] mmc-utils: add mmc-utils for
>working with eMMC devices
>
>On Thu, Feb 06, 2014 at 08:40:01AM -0600, Chase Maupin wrote:
>> * These utils make working with eMMC devices as raw devices
>easier
>>   for setting up the boot locations, etc
>> * This is overlayed into meta-arago until picked up in oe-core
>
>Still no PV? It will default to 0.0, but maybe we want to set it
>explicitly?

I missed that comment.  There was no PV that I noticed for this project :( =
=20

I can set 1.0 though.

>
>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../recipes-devtools/mmc/mmc-utils_git.bb          |   17
>+++++++++++++++++
>>  1 files changed, 17 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-arago-extras/recipes-devtools/mmc/mmc-
>utils_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/mmc/mmc-
>utils_git.bb b/meta-arago-extras/recipes-devtools/mmc/mmc-
>utils_git.bb
>> new file mode 100644
>> index 0000000..fe9a3fa
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION =3D "Userspace tools for MMC/SD devices"
>> +HOMEPAGE =3D
>"http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D
>"file://mmc.c;beginline=3D1;endline=3D17;md5=3Dd7747fc87f1eb22b946ef8199
>69503f0"
>> +
>> +BRANCH ?=3D "master"
>> +SRCREV =3D "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
>> +
>> +SRC_URI =3D
>"git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-
>utils.git;protocol=3Dgit;branch=3D${BRANCH}"
>> +
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 mmc ${D}${bindir}
>> +}
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

