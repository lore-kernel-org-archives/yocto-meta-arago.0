Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 77080529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:58:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15Iw2ku011293
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:58:02 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15Iw2eo032232
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:58:02 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 12:58:02 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 6/6] mmc-utils: add mmc-utils for working
	with eMMC devices
Thread-Index: AQHPIqIqxBHWltOJ5kiMiGaXCiwW0ZqnAxFw
Date: Wed, 5 Feb 2014 18:58:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994C67D@DLEE11.ent.ti.com>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-6-git-send-email-Chase.Maupin@ti.com>
	<20140205184329.GP18784@edge>
In-Reply-To: <20140205184329.GP18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 6/6] mmc-utils: add mmc-utils for working with eMMC devices
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
X-List-Received-Date: Wed, 05 Feb 2014 18:58:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yes.  Haven't gotten there yet :)


>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, February 05, 2014 1:43 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 6/6] mmc-utils: add mmc-utils for
>working with eMMC devices
>
>On Wed, Feb 05, 2014 at 02:04:06PM -0600, Chase Maupin wrote:
>> * These utils make working with eMMC devices as raw devices
>easier
>>   for setting up the boot locations, etc
>> * This is overlayed into meta-arago until picked up in oe-core
>
>Should it be added to one of the packagegroups?
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
>
>PV?
>
>
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

